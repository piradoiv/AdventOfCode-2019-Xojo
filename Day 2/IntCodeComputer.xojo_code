#tag Class
Protected Class IntCodeComputer
	#tag Method, Flags = &h0
		Sub AddInput(Input As Integer)
		  Self.Input.AddRow Input
		End Sub
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
		Function Read(Address As Integer) As Integer
		  If Address < 0 Then
		    Return 0
		  End If
		  If Address > Memory.LastRowIndex Then Memory.ResizeTo(Address)
		  Return Memory(Address)
		End Function
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
		    IntCode.Memory = Memory
		    IntCode.RelativeBase = RelativeBase
		    Var Noun, Verb, ResultAddress As Integer
		    Noun = IntCode.GetParameter(0, InstructionPointer + 1)
		    Verb = IntCode.GetParameter(1, InstructionPointer + 2)
		    
		    Select Case IntCode.Code
		    Case 1
		      ' Sum
		      ResultAddress = Read(InstructionPointer + 3)
		      If IntCode.ParamModes(2) = IntCode.ModeRelative Then ResultAddress = ResultAddress + RelativeBase
		      Write(ResultAddress, Noun + Verb)
		      InstructionPointer = InstructionPointer + 4
		      
		    Case 2
		      ' Multiply
		      ResultAddress = Read(InstructionPointer + 3)
		      If IntCode.ParamModes(2) = IntCode.ModeRelative Then ResultAddress = ResultAddress + RelativeBase
		      Write(ResultAddress, Noun * Verb)
		      InstructionPointer = InstructionPointer + 4
		      
		    Case 3
		      ' Input required
		      If Input.Count = 0 Then
		        Status = Statuses.WaitingForInput
		        InputRequired
		        WakeUpTimer = New Timer
		        AddHandler WakeUpTimer.Action, WeakAddressOf WakeUpActionHandler
		        WakeUpTimer.Period = 5
		        WakeUpTimer.RunMode = Timer.RunModes.Multiple
		        Return
		      End If
		      
		      ResultAddress = Read(InstructionPointer + 1)
		      If IntCode.ParamModes(0) = IntCode.ModeRelative Then ResultAddress = ResultAddress + RelativeBase
		      Var NextInput As Integer = Input(0)
		      Input.RemoveRowAt(0)
		      Write(ResultAddress, NextInput)
		      InstructionPointer = InstructionPointer + 2
		      
		    Case 4
		      Output(Noun)
		      InstructionPointer = InstructionPointer + 2
		      
		    Case 5
		      ' jump-if-true: if the first parameter is non-zero, it sets the instruction pointer
		      ' to the value from the second parameter. Otherwise, it does nothing.
		      InstructionPointer = If(Noun <> 0, Verb, InstructionPointer + 3)
		      
		    Case 6
		      ' jump-if-false: if the first parameter is zero, it sets the instruction pointer
		      ' to the value from the second parameter. Otherwise, it does nothing.
		      InstructionPointer = If(Noun = 0, Verb, InstructionPointer + 3)
		      
		    Case 7
		      ' less than: if the first parameter is less than the second parameter, it stores 1 in
		      ' the position given by the third parameter. Otherwise, it stores 0.
		      ResultAddress = Read(InstructionPointer + 3)
		      If IntCode.ParamModes(2) = IntCode.ModeRelative Then ResultAddress = ResultAddress + RelativeBase
		      Write(ResultAddress, If(Noun < Verb, 1, 0))
		      InstructionPointer = InstructionPointer + 4
		      
		    Case 8
		      ' equals: if the first parameter is equal to the second parameter, it stores 1 in the
		      ' position given by the third parameter. Otherwise, it stores 0.
		      ResultAddress = Read(InstructionPointer + 3)
		      If IntCode.ParamModes(2) = IntCode.ModeRelative Then ResultAddress = ResultAddress + RelativeBase
		      Write(ResultAddress, If(Noun = Verb, 1, 0))
		      InstructionPointer = InstructionPointer + 4
		      
		    Case 9
		      RelativeBase = RelativeBase + Noun
		      InstructionPointer = InstructionPointer + 2
		      
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

	#tag Method, Flags = &h0
		Sub WakeUpActionHandler(Sender As Timer)
		  If Status = Statuses.WaitingForInput And Input.Count > 0 Then
		    Sender.RunMode = Timer.RunModes.Off
		    Status = Statuses.Running
		    Run
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(Address As Integer, Value As Integer)
		  If Address < 0 Then
		    Return
		  End If
		  If Address > Memory.LastRowIndex Then Memory.ResizeTo(Address)
		  Memory(Address) = Value
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
		RelativeBase As Integer = 0
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

	#tag Property, Flags = &h0
		WakeUpTimer As Timer
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
		#tag ViewProperty
			Name="RelativeBase"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
