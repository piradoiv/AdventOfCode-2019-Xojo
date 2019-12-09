#tag Class
Protected Class Amplifier
	#tag Method, Flags = &h0
		Sub AddInput(Input As Integer)
		  Computer.AddInput Input
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Program As String, Phase As Integer)
		  Self.Phase = Phase
		  Computer = New IntCodeComputer
		  AddHandler Computer.Output, WeakAddressOf OutputHandler
		  AddHandler Computer.Finished, WeakAddressOf FinishedHandler
		  Computer.LoadProgram Program
		  Computer.AddInput Phase
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Execute()
		  Computer.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishedHandler(Sender As IntCodeComputer)
		  Finished
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OutputHandler(Sender As IntCodeComputer, Message As Integer)
		  ResultAvailable Message
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Finished()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResultAvailable(Result As Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		Computer As IntCodeComputer
	#tag EndProperty

	#tag Property, Flags = &h0
		Phase As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PhaseSent As Boolean = False
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
