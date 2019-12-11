#tag Class
Protected Class IntCode
	#tag Method, Flags = &h0
		Shared Function FromCode(Code As Integer) As IntCode
		  Var Result As New IntCode
		  Var Codes() As String = Code.ToString.LeftPad("0", 5).ToArray("")
		  
		  Var CodeStr As String = Codes(Codes.LastRowIndex - 1) + Codes(Codes.LastRowIndex)
		  Result.Code = CodeStr.ToInteger
		  
		  Result.ParamModes.ResizeTo(Codes.LastRowIndex - 2)
		  For I As Integer = 0 To Result.ParamModes.LastRowIndex
		    Result.ParamModes(I) = Codes(Codes.LastRowIndex - I - 2).ToInteger
		  Next
		  
		  Return Result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParameter(Mode As Integer, ParameterAddress As Integer) As Integer
		  If ParameterAddress > Memory.LastRowIndex Then
		    Memory.ResizeTo(ParameterAddress)
		  End If
		  
		  Select Case ParamModes(Mode)
		  Case ModePosition
		    Var Index As Integer = Memory(ParameterAddress)
		    Return Memory(Index)
		    
		  Case ModeInstant
		    Return Memory(ParameterAddress)
		    
		  Case ModeRelative
		    Var Index As Integer = Memory(ParameterAddress) + RelativeBase
		    Return Memory(Index)
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Code As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Memory() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ParamModes() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RelativeBase As Integer = 0
	#tag EndProperty


	#tag Constant, Name = ModeInstant, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ModePosition, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ModeRelative, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


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
		#tag ViewProperty
			Name="RelativeBase"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
