#tag Class
Protected Class IntCodeComputer
	#tag Method, Flags = &h0
		Function GetIntCode(OpCode As Integer) As String()
		  Var Result() As String = OpCode.ToString.LeftPad("0", 5).ToArray("")
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Multiply(Noun As Integer, Verb As Integer, ResultAddress As Integer)
		  Memory(ResultAddress) = Noun * Verb
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintOutput()
		  Var OutputMessage As Integer = Memory(Memory(InstructionPointer + 1))
		  Output(OutputMessage)
		  InstructionPointer = InstructionPointer + 2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadInput()
		  
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
		  Reset
		  
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
		      Var Input As Integer = InputRequired
		      Memory(ResultAddress) = Input
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
		      Terminate
		    Else
		      Var E As New RuntimeException
		      E.Message = "OpCode (" + OpCode.ToString + ") is not valid"
		      Raise E
		    End Select
		  Loop Until Terminated Or InstructionPointer >= Memory.Count
		  
		  Finished
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sum(Noun As Integer, Verb As Integer, ResultAddress As Integer)
		  Memory(ResultAddress) = Noun + Verb
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Terminate()
		  Terminated = True
		  InstructionPointer = InstructionPointer + 1
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Finished()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event InputRequired() As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Output(Message As Integer)
	#tag EndHook


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
		#tag Note
			
			o
		#tag EndNote
		Terminated As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Verb As Integer = 0
	#tag EndProperty


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
			Name="Terminated"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
