#tag Class
Protected Class BruteforcePasswordCracker
Inherits Thread
	#tag Event
		Sub Run()
		  Var Result() As Integer
		  Var Password As Integer = Start
		  Var LastUpdateSent As Double = 0
		  Do
		    Password = GetNextPasswordCandidate(Password)
		    If IsValidPassword(Password) Then
		      Result.AddRow(Password)
		    End If
		    
		    Var Now As Double = DateTime.Now.SecondsFrom1970
		    If Now - LastUpdateSent > RefreshRate Then
		      LastUpdateSent = Now
		      SendPasswordsUpdate Result, Password
		      Result.RemoveAllRows
		    End If
		  Loop Until Password >= Finish
		  
		  SendPasswordsUpdate Result, Finish
		  Var d As New Dictionary
		  d.Value("type") = "finish"
		  AddUserInterfaceUpdate d
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetNextPasswordCandidate(CurrentPassword As Integer) As Integer
		  Return CurrentPassword + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPasswordsCopy(Passwords() As Integer) As Integer()
		  Var Result() As Integer
		  For Each Password As Integer In Passwords
		    Result.AddRow Password
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetValidPasswordsWithinRange(Start As Integer, Finish As Integer)
		  Self.Start = Start
		  Self.Finish = Finish
		  Self.Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsValidPassword(Password As Integer) As Boolean
		  ' Password length validator
		  If Password.ToString.Length <> 6 Then Return False
		  
		  ' Within range
		  If Password < Start Or Password > Finish Then Return False
		  
		  ' Adjacents validator
		  Var Adjacents As New Dictionary
		  For Each Char As String In Password.ToString.Split("")
		    Adjacents.Value(Char) = Adjacents.Lookup(Char, 0) + 1
		  Next
		  
		  Var IsThereAnyValidAdjacent As Boolean = False
		  For Each AdjacentsEntry As DictionaryEntry In Adjacents
		    If AdjacentsEntry.Value <> 2 Then Continue
		    IsThereAnyValidAdjacent = True
		    Exit For
		  Next
		  
		  If IsThereAnyValidAdjacent = False Then Return False
		  
		  ' Password never decrease validator
		  Var MaxDigit As Integer = 0
		  For Each Char As String In Password.ToString.Split("")
		    Var CharValue As Integer = Char.Val
		    If CharValue < MaxDigit Then Return False
		    MaxDigit = CharValue
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendPasswordsUpdate(NewPasswords() As Integer, Progress As Integer)
		  Var d As New Dictionary
		  d.Value("type") = "update"
		  d.Value("progress") = Progress
		  d.Value("new_passwords") = GetPasswordsCopy(NewPasswords)
		  AddUserInterfaceUpdate d
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Finish As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Start As Integer
	#tag EndProperty


	#tag Constant, Name = RefreshRate, Type = Double, Dynamic = False, Default = \"0.15", Scope = Public
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
	#tag EndViewBehavior
End Class
#tag EndClass
