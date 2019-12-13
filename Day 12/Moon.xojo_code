#tag Class
Protected Class Moon
	#tag Method, Flags = &h0
		Sub ApplyGravity(OtherPosition As Vector)
		  Speed.ApplyGravity(Position, OtherPosition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(X As Double, Y As Double, Z As Double)
		  Position = New Vector(X, Y, Z)
		  Speed = New Vector(0, 0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  Position.Add(Speed)
		  Pot = Position.GetEnergy
		  Kin = Speed.GetEnergy
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Kin As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Position As Vector
	#tag EndProperty

	#tag Property, Flags = &h0
		Pot As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Speed As Vector
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
			Name="Position"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
