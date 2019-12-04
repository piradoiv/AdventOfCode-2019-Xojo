#tag Class
Protected Class Wire
	#tag Method, Flags = &h0
		Function GetCoordinateForStep(Steps As Integer) As Coordinate
		  Var Result As New Coordinate
		  Var ConsumedSteps As Integer = 0
		  
		  Var Parts() As String = StepsCsv.Split(",")
		  For Each Segment As String In Parts
		    Var CurrentChar As String = Segment.Left(1)
		    Var Amount As Integer = Segment.Right(Segment.Length - 1).Val
		    
		    For I As Integer = 0 To Amount - 1
		      If ConsumedSteps > Steps Then Exit For Segment
		      ConsumedSteps = ConsumedSteps + 1
		      
		      Select Case CurrentChar
		      Case "D"
		        Result.Y = Result.Y + 1
		      Case "U"
		        Result.Y = Result.Y - 1
		      Case "R"
		        Result.X = Result.X + 1
		      Case "L"
		        Result.X = Result.X - 1
		      End Select
		    Next
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCoordinates(CsvCoordinates As String)
		  Var NewCoordinates() As Coordinate
		  Var Parts() As String = CsvCoordinates.Split(",")
		  Var PreviousCoord As New Coordinate
		  For Each Segment As String In Parts
		    Var CurrentChar As String = Segment.Left(1)
		    Var Amount As Integer = Segment.Right(Segment.Length - 1).Val
		    
		    Var c As New Coordinate
		    c.X = PreviousCoord.X
		    c.Y = PreviousCoord.Y
		    
		    Select Case CurrentChar
		    Case "D"
		      c.Y = c.Y + Amount
		    Case "U"
		      c.Y = c.Y - Amount
		    Case "R"
		      c.X = c.X + Amount
		    Case "L"
		      c.X = c.X - Amount
		    End Select
		    
		    NewCoordinates.AddRow c
		    PreviousCoord.X = c.X
		    PreviousCoord.Y = c.Y
		  Next
		  
		  LinearCoordinates = NewCoordinates
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DrawingColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		LinearCoordinates() As Coordinate
	#tag EndProperty

	#tag Property, Flags = &h0
		StepsCsv As String
	#tag EndProperty

	#tag Property, Flags = &h0
		VisitedCoordinates() As Coordinate
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
			Name="DrawingColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StepsCsv"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
