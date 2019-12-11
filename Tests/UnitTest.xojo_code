#tag Class
Protected Class UnitTest
	#tag Method, Flags = &h0
		Sub AssertEquals(Expected As Variant, Actual As Variant)
		  If Expected <> Actual Then ThrowException("Failed asserting Expected is equals to Actual")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertFalse(Actual As Boolean)
		  If Actual <> False Then ThrowException("Failed asserting is false")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertNotEquals(A As Variant, B As Variant)
		  If A = B Then ThrowException("Elements were expected to be different")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertTrue(Actual As Boolean)
		  If Actual <> True Then ThrowException("Failed to assert that the actual element is True")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunTests()
		  For Each Test As TestMethod In Tests
		    Setup
		    Test.Invoke
		    TearDown
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TearDown()
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub TestMethod()
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Sub ThrowException(Message As String)
		  Var E As New InvalidArgumentException
		  E.Message = Message
		  Raise E
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Tests() As TestMethod
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
