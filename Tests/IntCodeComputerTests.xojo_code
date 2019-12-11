#tag Class
Protected Class IntCodeComputerTests
Inherits UnitTest
	#tag Method, Flags = &h0
		Sub Constructor()
		  Tests.AddRow WeakAddressOf TestCanAddTwoNumbersInPositionMode
		  Tests.AddRow WeakAddressOf TestCanAddTwoNumbersInInstantMode
		  Tests.AddRow WeakAddressOf TestCanAddTwoNumbersInRelativeMode
		  Tests.AddRow WeakAddressOf TestCanReadInputInRelativeMode
		  Tests.AddRow WeakAddressOf TestCanMultiplyTwoNumbersInInstantMode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup()
		  Computer = New IntCodeComputer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCanAddTwoNumbersInInstantMode()
		  Computer.Memory = Array(1101, 2, 2, 5, 99, 0)
		  Computer.Run
		  AssertEquals 4, Computer.Memory(5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCanAddTwoNumbersInPositionMode()
		  Computer.Memory = Array(1, 0, 0, 5, 99, 0)
		  Computer.Run
		  AssertEquals 2, Computer.Memory(5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCanAddTwoNumbersInRelativeMode()
		  Computer.Memory = Array(109, 5, 201, 0, 0, 7, 99, 0)
		  Computer.Run
		  AssertEquals 116, Computer.Memory(7)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCanMultiplyTwoNumbersInInstantMode()
		  Computer.Memory = Array(1102, 2, 4, 5, 99, 0)
		  Computer.Run
		  AssertEquals 8, Computer.Memory(5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCanReadInputInRelativeMode()
		  Computer.Memory = Array(109,50,203,-7,99)
		  Computer.AddInput 42
		  Computer.Run
		  AssertEquals 42, Computer.Memory(43)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Computer As IntCodeComputer
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
