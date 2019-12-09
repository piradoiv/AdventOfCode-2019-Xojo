#tag Class
Protected Class ThrusterCalibrator
	#tag Method, Flags = &h0
		Sub Calibrate(Thrusters As Integer)
		  Controller = New AmplifierController
		  AddHandler Controller.ResultAvailable, WeakAddressOf ResultAvailableHandler
		  CurrentPermutation.RemoveAllRows
		  HighestOutput = 0
		  Permutations.RemoveAllRows
		  BestPermutation.RemoveAllRows
		  Self.Thrusters = Thrusters
		  Var Items() As Integer
		  For I As Integer = 0 To Thrusters - 1
		    Items.AddRow I + If(FeedbackLoopEnabled, 5, 0)
		  Next
		  GeneratePermutations Thrusters, Items
		  Permutations.AddRow Array(9,8,7,6,5)
		  Permutations.AddRow Array(9,7,8,5,6)
		  CheckNextPermutation
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckNextPermutation()
		  If Permutations.Count = 0 Then
		    ResultAvailable BestPermutation, HighestOutput
		    Return
		  End If
		  
		  CurrentPermutation = Permutations(0)
		  Permutations.RemoveRowAt(0)
		  Controller.ExecuteSequence Program, CurrentPermutation, FeedbackLoopEnabled
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GeneratePermutations(n As Integer, Items() As Integer)
		  Var ItemsCopy() As Integer = GetArrayCopy(Items)
		  If n = 1 Then
		    Permutations.AddRow ItemsCopy
		  Else
		    For I As Integer = 0 To n - 1
		      GeneratePermutations(n - 1, ItemsCopy)
		      Var Temp As Integer
		      If n Mod 2 = 0 Then
		        Temp = ItemsCopy(0)
		        ItemsCopy(0) = ItemsCopy(n - 1)
		        ItemsCopy(n - 1) = Temp
		      Else
		        Temp = ItemsCopy(I)
		        ItemsCopy(I) = ItemsCopy(n - 1)
		        ItemsCopy(n - 1) = Temp
		      End If
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetArrayCopy(Items() As Integer) As Integer()
		  Var Result() As Integer
		  For Each Element As Integer In Items
		    Result.AddRow Element
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProgram(Program As String)
		  Self.Program = Program
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResultAvailableHandler(Sender As AmplifierController, Result As Integer)
		  If Result > HighestOutput Then
		    HighestOutput = Result
		    BestPermutation = CurrentPermutation
		  End If
		  
		  CheckNextPermutation
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ResultAvailable(Sequence() As Integer, Output As Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		BestPermutation() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Controller As AmplifierController
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentPermutation() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FeedbackLoopEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		HighestOutput As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Permutations() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Program As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Thrusters As Integer
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
			Name="Thrusters"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Program"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HighestOutput"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FeedbackLoopEnabled"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
