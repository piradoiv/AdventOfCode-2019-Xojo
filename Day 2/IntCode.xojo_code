#tag Class
Protected Class IntCode
	#tag Method, Flags = &h0
		Shared Function FromCode(Code As Integer) As IntCode
		  Const DefaultCharacter = "0"
		  Const IntCodeDefaultLength = 5
		  
		  Var Result As New IntCode
		  Var CodeStr As String = Code.ToString
		  While CodeStr.Length < IntCodeDefaultLength
		    CodeStr = DefaultCharacter + CodeStr
		  Wend
		  
		  Var Codes() As String = CodeStr.ToArray("")
		  Result.Code = CodeStr.Right(2).ToInteger
		  
		  Result.ParamModes.ResizeTo(Codes.LastRowIndex - 2)
		  For I As Integer = 0 To Result.ParamModes.LastRowIndex
		    Result.ParamModes(I) = Codes(Codes.LastRowIndex - I - 2).ToInteger
		  Next
		  
		  Return Result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetParameter(Mode As Integer, ParameterAddress As Integer) As Integer
		  Var ParamMode As Integer = ParamModes(Mode)
		  Var Index As Integer = If(ParameterAddress <= Memory.LastRowIndex, Memory(ParameterAddress), 0)
		  
		  If ParamMode = ModeInstant Then Return Index
		  
		  If ParamMode = ModeRelative Then Index = Index + RelativeBase
		  If Index < 0 Or Index > Memory.LastRowIndex Then Return 0
		  Return Memory(Index)
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
