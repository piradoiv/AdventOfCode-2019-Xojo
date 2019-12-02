#tag Class
Protected Class IntCodeComputer
	#tag Method, Flags = &h0
		Sub Multiply()
		  Noun = Memory(Memory(InstructionPointer + 1))
		  Verb = Memory(Memory(InstructionPointer + 2))
		  ResultAddress = Memory(InstructionPointer + 3)
		  Memory(ResultAddress) = Noun * Verb
		  InstructionPointer = InstructionPointer + 4
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
		    Select Case OpCode
		    Case 1
		      Sum
		    Case 2
		      Multiply
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
		Sub Sum()
		  Noun = Memory(Memory(InstructionPointer + 1))
		  Verb = Memory(Memory(InstructionPointer + 2))
		  ResultAddress = Memory(InstructionPointer + 3)
		  Memory(ResultAddress) = Noun + Verb
		  InstructionPointer = InstructionPointer + 4
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
