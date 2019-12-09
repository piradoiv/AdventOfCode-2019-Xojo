#tag Class
Protected Class AmplifierController
	#tag Method, Flags = &h0
		Sub ExecuteSequence(Program As String, Sequence() As Integer, EnableFeedbackLoop As Boolean)
		  Self.FeedbackLoop = EnableFeedbackLoop
		  Self.Sequence.RemoveAllRows
		  Self.Amplifiers.RemoveAllRows
		  For Each Phase As Integer In Sequence
		    Self.Sequence.AddRow Phase
		    Var Amplifier As New Amplifier(Program, Phase)
		    AddHandler Amplifier.ResultAvailable, WeakAddressOf ResultAvailableHandler
		    AddHandler Amplifier.Finished, WeakAddressOf FinishedHandler
		    Amplifiers.AddRow(Amplifier)
		    Amplifier.Execute
		  Next
		  
		  Amplifiers(0).AddInput(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishedHandler(Sender As Amplifier)
		  If Sequence.IndexOf(Sender.Phase) = Amplifiers.LastRowIndex Then
		    ResultAvailable LatestOutput
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResultAvailableHandler(Sender As Amplifier, Result As Integer)
		  Var Index As Integer = Sequence.IndexOf(Sender.Phase)
		  Var NextThruster As Integer = Index + 1
		  If NextThruster > Amplifiers.LastRowIndex Then
		    If FeedbackLoop Then
		      NextThruster = 0
		    Else
		      ResultAvailable Result
		      Return
		    End If
		  End If
		  
		  If Index = Amplifiers.LastRowIndex Then
		    LatestOutput = Result
		  End If
		  
		  Amplifiers(NextThruster).AddInput Result
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ResultAvailable(Result As Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		Amplifiers() As Amplifier
	#tag EndProperty

	#tag Property, Flags = &h0
		FeedbackLoop As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LatestOutput As Integer
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
	#tag EndViewBehavior
End Class
#tag EndClass
