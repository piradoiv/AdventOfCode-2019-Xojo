#tag Class
Protected Class Moon
	#tag Method, Flags = &h0
		Sub ApplyGravity(OtherPosition As Vector)
		  If Position.X <> OtherPosition.X Then
		    Speed.X = Speed.X + If(Position.X < OtherPosition.X, 1, -1)
		  End If
		  
		  If Position.Y <> OtherPosition.Y Then
		    Speed.Y = Speed.Y + If(Position.Y < OtherPosition.Y, 1, -1)
		  End If
		  
		  If Position.Z <> OtherPosition.Z Then
		    Speed.Z = Speed.Z + If(Position.Z < OtherPosition.Z, 1, -1)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(X As Double, Y As Double, Z As Double)
		  Position = New Vector(X, Y, Z)
		  Speed = New Vector(0, 0, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetKin() As Integer
		  Return Speed.GetEnergy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPot() As Integer
		  Return Position.GetEnergy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  Position.Add(Speed)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Position As Vector
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
	#tag EndViewBehavior
End Class
#tag EndClass
