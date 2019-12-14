#tag Class
Protected Class Material
	#tag Method, Flags = &h0
		Sub AddRequirement(RequiredMaterial As Material, Amount As Integer)
		  Requires.Value(RequiredMaterial) = Amount
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name As String, MinimumProduction As Integer = 1)
		  Requires = New Dictionary
		  Self.Name = Name
		  Self.MinimumProduction = MinimumProduction
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MinimumProduction As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Requires As Dictionary
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
			Name="MinimumProduction"
			Visible=false
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
