#tag Class
Protected Class FlawedFrequencyTransmission
	#tag Method, Flags = &h0
		Sub Constructor(Input As String)
		  Self.Input = Input
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunPhase(AmountOfPhases As Integer = 1)
		  For Iteration As Integer = 1 To AmountOfPhases
		    Var NewInput As String = Input
		    Var Characters() As String = Input.Split("")
		    Var NewInputChars() As String = Input.Split("")
		    
		    For I As Integer = 0 To Characters.LastRowIndex
		      Var CharResult As Integer
		      Var SequenceForPosition() As Integer
		      For Each Current As Integer In Sequence
		        For J As Integer = 0 To I
		          SequenceForPosition.AddRow Current
		        Next
		      Next
		      
		      Var SequenceIndex, Noun, Verb As Integer
		      For Index As Integer = 0 To Characters.LastRowIndex
		        SequenceIndex = (Index + 1) Mod SequenceForPosition.Count
		        Noun = Characters(Index).ToInteger
		        Verb = SequenceForPosition(SequenceIndex)
		        CharResult = CharResult + Noun * Verb
		      Next
		      
		      CharResult = Abs(CharResult)
		      NewInputChars(I) = CharResult.ToString.Right(1)
		    Next
		    
		    NewInput = String.FromArray(NewInputChars, "")
		    Input = NewInput
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Input As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Sequence() As Integer
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
			Name="Input"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
