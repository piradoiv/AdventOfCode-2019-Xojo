#tag Class
Protected Class FuelCalculator
	#tag Method, Flags = &h0
		Function CalculateFuelForModule(Mass As Integer) As Integer
		  Var Result As Integer
		  Var Fuel As Integer = Mass
		  
		  Do
		    Fuel = Max(Floor(Fuel / 3) - 2, 0)
		    Result = Result + Fuel
		  Loop Until Fuel = 0
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateFuelNeededForAllModules(Modules() As Integer) As Integer
		  Var Result As Integer
		  For Each CurrentModule As Integer In Modules
		    Result = Result + CalculateFuelForModule(CurrentModule)
		  Next
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetModulesFromRawString(RawString As String) As Integer()
		  Var Result() As Integer
		  For Each Line As String In RawString.Split(EndOfLine)
		    Result.AddRow Line.Val
		  Next
		  
		  Return Result
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
End Class
#tag EndClass
