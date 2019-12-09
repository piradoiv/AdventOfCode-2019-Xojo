#tag Class
Protected Class IntCodeComputer
	#tag Method, Flags = &h0
		Sub AddInput(Input As Integer)
		  Self.Input.AddRow Input
		  If Status = Statuses.WaitingForInput Then
		    Status = Statuses.Running
		    Run
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetIntCode(OpCode As Integer) As String()
		  Var Result() As String = OpCode.ToString.LeftPad("0", 5).ToArray("")
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProgram(Program As String)
		  Memory.RemoveAllRows
		  For Each Line As String In Program.Split(",")
		    Memory.AddRow Line.Val
		  Next
		  
		  Reset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  InstructionPointer = 0
		  OpCode = 99
		  Noun = 0
		  Verb = 0
		  ResultAddress = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  If Status = Statuses.Idle Or Status = Statuses.Terminated Then Status = Statuses.Running
		  
		  Do
		    OpCode = Memory(InstructionPointer)
		    Var IntCode As IntCode = IntCode.FromCode(OpCode)
		    Var Noun, Verb, ResultAddress As Integer
		    
		    Select Case IntCode.Code
		    Case 1
		      ' Sum
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Verb = IntCode.GetParameter(1, InstructionPointer + 2, Memory)
		      ResultAddress = Memory(InstructionPointer + 3)
		      Memory(ResultAddress) = Noun + Verb
		      InstructionPointer = InstructionPointer + 4
		    Case 2
		      ' Multiply
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Verb = IntCode.GetParameter(1, InstructionPointer + 2, Memory)
		      ResultAddress = Memory(InstructionPointer + 3)
		      Memory(ResultAddress) = Noun * Verb
		      InstructionPointer = InstructionPointer + 4
		    Case 3
		      ' Input required
		      ResultAddress = Memory(InstructionPointer + 1)
		      If Input.Count = 0 Then
		        Status = Statuses.WaitingForInput
		        InputRequired
		        Return
		      End If
		      
		      Var NextInput As Integer = Input(0)
		      Input.RemoveRowAt(0)
		      Memory(ResultAddress) = NextInput
		      InstructionPointer = InstructionPointer + 2
		    Case 4
		      ' Output
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Var OutputMessage As Integer = Noun
		      Output(OutputMessage)
		      InstructionPointer = InstructionPointer + 2
		    Case 5
		      ' jump-if-true: if the first parameter is non-zero, it sets the instruction pointer
		      ' to the value from the second parameter. Otherwise, it does nothing.
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Verb = IntCode.GetParameter(1, InstructionPointer + 2, Memory)
		      InstructionPointer = If(Noun <> 0, Verb, InstructionPointer + 3)
		    Case 6
		      ' jump-if-false: if the first parameter is zero, it sets the instruction pointer
		      ' to the value from the second parameter. Otherwise, it does nothing.
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Verb = IntCode.GetParameter(1, InstructionPointer + 2, Memory)
		      InstructionPointer = If(Noun = 0, Verb, InstructionPointer + 3)
		    Case 7
		      ' less than: if the first parameter is less than the second parameter, it stores 1 in
		      ' the position given by the third parameter. Otherwise, it stores 0.
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Verb = IntCode.GetParameter(1, InstructionPointer + 2, Memory)
		      ResultAddress = Memory(InstructionPointer + 3)
		      Memory(ResultAddress) = If(Noun < Verb, 1, 0)
		      InstructionPointer = InstructionPointer + 4
		    Case 8
		      ' equals: if the first parameter is equal to the second parameter, it stores 1 in the
		      ' position given by the third parameter. Otherwise, it stores 0.
		      Noun = IntCode.GetParameter(0, InstructionPointer + 1, Memory)
		      Verb = IntCode.GetParameter(1, InstructionPointer + 2, Memory)
		      ResultAddress = Memory(InstructionPointer + 3)
		      Memory(ResultAddress) = If(Noun = Verb, 1, 0)
		      InstructionPointer = InstructionPointer + 4
		    Case 99
		      Status = Statuses.Terminated
		      InstructionPointer = InstructionPointer + 1
		      Finished
		    Else
		      Var E As New RuntimeException
		      E.Message = "OpCode (" + OpCode.ToString + ") is not valid"
		      Raise E
		    End Select
		  Loop Until Status = Statuses.Terminated
		  
		  Finished
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Finished()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event InputRequired()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Output(Message As Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		Input() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		InstructionPointer As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Memory() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Noun As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		OpCode As Integer = 99
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultAddress As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Status As Statuses = Statuses.Idle
	#tag EndProperty

	#tag Property, Flags = &h0
		Verb As Integer = 0
	#tag EndProperty


	#tag Enum, Name = Statuses, Type = Integer, Flags = &h0
		Idle
		  WaitingForInput
		  Running
		Terminated
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InstructionPointer"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Noun"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OpCode"
			Visible=false
			Group="Behavior"
			InitialValue="99"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResultAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Verb"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Status"
			Visible=false
			Group="Behavior"
			InitialValue="Statuses.Idle"
			Type="Statuses"
			EditorType="Enum"
			#tag EnumValues
				"0 - Idle"
				"1 - WaitingForInput"
				"2 - Running"
				"3 - Terminated"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
