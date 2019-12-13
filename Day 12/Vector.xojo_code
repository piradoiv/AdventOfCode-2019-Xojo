#tag Class
Protected Class Vector
	#tag Method, Flags = &h0
		Sub Add(Other As Vector)
		  X = X + Other.X
		  Y = Y + Other.Y
		  Z = Z + Other.Z
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(X As Double, Y As Double, Z As Double)
		  Self.X = X
		  Self.Y = Y
		  Self.Z = Z
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEnergy() As Integer
		  Return Abs(X) + Abs(Y) + Abs(Z)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		X As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Y As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Z As Double
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
			Name="X"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
