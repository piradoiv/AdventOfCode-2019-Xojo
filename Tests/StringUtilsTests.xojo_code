#tag Class
Protected Class StringUtilsTests
Inherits UnitTest
	#tag Method, Flags = &h0
		Sub Constructor()
		  Tests.AddRow WeakAddressOf TestLeftPadFillsTheStringWithZeroes
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestLeftPadFillsTheStringWithZeroes()
		  Var Input As String
		  
		  Input = "0"
		  AssertEquals("0000", Input.LeftPad("0", 4))
		  
		  Input = "010"
		  AssertEquals("0010", Input.LeftPad("0", 4))
		  
		  Input = "10"
		  AssertEquals("0010", Input.LeftPad("0", 4))
		End Sub
	#tag EndMethod


End Class
#tag EndClass
