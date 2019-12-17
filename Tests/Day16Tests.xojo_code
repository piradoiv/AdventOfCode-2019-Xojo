#tag Class
Protected Class Day16Tests
Inherits UnitTest
	#tag Method, Flags = &h0
		Sub Constructor()
		  Tests.AddRow WeakAddressOf TestDay16ExamplesArePassing
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestDay16ExamplesArePassing()
		  Var FTT As New FlawedFrequencyTransmission("12345678")
		  AssertEquals("12345678", FTT.Input)
		  FTT.Sequence = Array(0, 1, 0, -1)
		  FTT.RunPhase
		  AssertEquals("48226158", FTT.Input)
		  FTT.RunPhase(3)
		  AssertEquals("01029498", FTT.Input)
		  
		  FTT.Input = "80871224585914546619083218645595"
		  FTT.RunPhase(100)
		  AssertEquals("24176176", FTT.Input.Left(8))
		  
		  FTT.Input = "19617804207202209144916044189917"
		  FTT.RunPhase(100)
		  AssertEquals("73745418", FTT.Input.Left(8))
		  
		  FTT.Input = "69317163492948606335995924319873"
		  FTT.RunPhase(100)
		  AssertEquals("52432133", FTT.Input.Left(8))
		End Sub
	#tag EndMethod


End Class
#tag EndClass
