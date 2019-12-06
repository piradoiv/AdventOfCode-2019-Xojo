#tag Class
Protected Class SpaceObject
	#tag Method, Flags = &h0
		Sub Constructor(Name As String)
		  Self.Name = Name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountChilds() As Integer
		  If Childs.Count = 0 Then Return 0
		  Var Result As Integer
		  For Each Child As SpaceObject In Childs
		    Result = Result + 1 + Child.CountChilds
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllParents() As SpaceObject()
		  Var Result() As SpaceObject
		  If Parent = Nil Then Return Result
		  
		  Result.AddRow Parent
		  For Each ParentParent As SpaceObject In Parent.GetAllParents
		    Result.AddRow ParentParent
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Childs() As SpaceObject
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Parent As SpaceObject
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
			Name="Parent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
