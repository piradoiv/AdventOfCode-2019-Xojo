#tag Class
Protected Class IntCode
	#tag Method, Flags = &h0
		Shared Function FromCode(Code As Integer) As IntCode
		  Var Result As New IntCode
		  Var Codes() As String = Code.ToString.LeftPad("0", 5).ToArray("")
		  
		  Var CodeStr As String = Codes(Codes.LastRowIndex - 1) + Codes(Codes.LastRowIndex)
		  Result.Code = CodeStr.ToInteger
		  
		  Result.Modes.ResizeTo(Codes.LastRowIndex - 2)
		  For I As Integer = 0 To Result.Modes.LastRowIndex
		    Result.Modes(I) = Codes(Codes.LastRowIndex - I - 2).ToInteger
		  Next
		  
		  Return Result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParameter(ModePosition As Integer, ParameterAddress As Integer, Memory() As Integer) As Integer
		  Select Case Modes(ModePosition)
		  Case 0
		    Var Index As Integer = Memory(ParameterAddress)
		    Return Memory(Index)
		  Case 1
		    Return Memory(ParameterAddress)
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Code As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Modes() As Integer
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
			Name="Code"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
