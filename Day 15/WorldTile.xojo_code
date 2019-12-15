#tag Class
Protected Class WorldTile
	#tag Method, Flags = &h0
		Sub Constructor(Position As Point, Type As WorldTile.Types)
		  Self.Position = Position
		  Self.Type = Type
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Position As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As Types
	#tag EndProperty


	#tag Enum, Name = Types, Type = Integer, Flags = &h0
		Nothing
		  Wall
		OxygenSystem
	#tag EndEnum


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
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Types"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
