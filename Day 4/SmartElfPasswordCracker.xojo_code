#tag Class
Protected Class SmartElfPasswordCracker
Inherits BruteforcePasswordCracker
	#tag Method, Flags = &h0
		Function GetNextPasswordCandidate(CurrentPassword As Integer) As Integer
		  CurrentPassword = CurrentPassword + 1
		  If FirstLoop Then
		    CurrentPassword = CurrentPassword - 10000
		    FirstLoop = False
		  End If
		  
		  Var PasswordChars() As String = CurrentPassword.ToString.Split("")
		  Var Previous, Current As Integer
		  
		  For I As Integer = 1 To PasswordChars.Count - 1
		    Previous = PasswordChars(I - 1).Val
		    Current = Max(Previous, PasswordChars(I).Val)
		    PasswordChars(I) = Current.ToString
		  Next
		  
		  Return String.FromArray(PasswordChars, "").Val
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		FirstLoop As Boolean = True
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AdditionalRules"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
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
			InitialValue=""
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Start"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Finish"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FirstLoop"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
