#tag Class
Protected Class Asteroid
	#tag Method, Flags = &h0
		Sub AddTargetAtAngle(Angle As Double, Victim As Asteroid)
		  If Not Targets.HasKey(Angle) Then
		    Targets.Value(Angle) = Victim
		    Return
		  End If
		  
		  Var CurrentTarget As Asteroid = Targets.Value(Angle)
		  If Position.DistanceTo(CurrentTarget.Position) > Position.DistanceTo(Victim.Position) Then
		    Targets.Value(Angle) = Victim
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AngleTo(Other As Asteroid) As Double
		  Var PointToOther As New Point
		  PointToOther.X = Other.Position.X - Position.X
		  PointToOther.Y = Other.Position.Y - Position.Y
		  
		  Return Atan2(PointToOther.Y, PointToOther.X)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(X As Integer, Y As Integer)
		  Targets = New Dictionary
		  Position = New Point
		  Position.X = X
		  Position.Y = Y
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Position As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Targets As Dictionary
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
