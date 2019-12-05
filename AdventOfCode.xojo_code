#tag Module
Protected Module AdventOfCode
	#tag Method, Flags = &h0
		Function LeftPad(Extends value As String, DefaultCharacter As String, Amount As Integer) As String
		  Var OriginalChars() As String = value.ToArray("")
		  If OriginalChars.Count >= Amount Then Return value
		  
		  Var Chars() As String
		  For Index As Integer = 0 To OriginalChars.LastRowIndex
		    Chars.AddRow OriginalChars(OriginalChars.LastRowIndex - Index)
		  Next
		  Chars.ResizeTo(Amount - 1)
		  
		  Var Result() As String
		  For Index As Integer = 0 To Chars.LastRowIndex
		    Result.AddRow Chars(Chars.LastRowIndex - Index)
		    If Result(Result.LastRowIndex) = "" Then Result(Index) = DefaultCharacter
		  Next
		  
		  Return String.FromArray(Result, "")
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
