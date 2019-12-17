#tag Class
Protected Class FlawedFrequencyTransmission
	#tag Method, Flags = &h0
		Sub CalculatePhase()
		  Var NewInput As String = Input
		  Var Characters() As String = Input.Split("")
		  Var NewInputChars() As String = Input.Split("")
		  
		  For I As Integer = 0 To Characters.LastRowIndex
		    Var CharResult As Integer
		    Var SequenceForPosition() As Integer = PrepareSequenceForPosition(I)
		    For Index As Integer = 0 To Characters.LastRowIndex
		      Var SequenceIndex As Integer = (Index + 1) Mod SequenceForPosition.Count
		      Var Noun As Integer = Characters(Index).ToInteger
		      Var Verb As Integer = SequenceForPosition(SequenceIndex)
		      CharResult = CharResult + Noun * Verb
		    Next
		    
		    CharResult = Abs(CharResult)
		    Var CharString As String = CharResult.ToString
		    NewInputChars(I) = CharString.Right(1)
		  Next
		  
		  NewInput = String.FromArray(NewInputChars, "")
		  Input = NewInput
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Input As String)
		  Self.Input = Input
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepareSequenceForPosition(Position As Integer) As Integer()
		  Var Result() As Integer
		  For Each Current As Integer In Sequence
		    For I As Integer = 0 To Position
		      Result.AddRow Current
		    Next
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunPhase(AmountOfPhases As Integer = 1)
		  For I As Integer = 1 To AmountOfPhases
		    CalculatePhase
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
