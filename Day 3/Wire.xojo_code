#tag Class
Protected Class Wire
	#tag Method, Flags = &h0
		Sub Constructor()
		  PointSteps = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCoordinates(CsvCoordinates As String)
		  LoadCoordinatesIntoPoints
		  LoadCoordinatesIntoLines
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCoordinatesIntoLines()
		  Var NewCoordinates() As Coordinate
		  Var Parts() As String = StepsCsv.Split(",")
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

	#tag Method, Flags = &h0
		Sub LoadCoordinatesIntoPoints()
		  Var StepKey As String
		  Var Position As New Coordinate
		  Bounds.RemoveAllRows
		  Bounds.AddRow New Coordinate
		  Bounds.AddRow New Coordinate
		  
		  For Each Command As String In StepsCsv.Split(",")
		    For Amount As Integer = 1 To Command.Right(Command.Length - 1).Val
		      Select Case Command.Left(1)
		      Case "U"
		        Position.Y = Position.Y - 1
		      Case "D"
		        Position.Y = Position.Y + 1
		      Case "L"
		        Position.X = Position.X - 1
		      Case "R"
		        Position.X = Position.X + 1
		      End Select
		      
		      If Position.X < Bounds(0).X Then Bounds(0).X = Position.X
		      If Position.Y < Bounds(0).Y Then Bounds(0).Y = Position.Y
		      If Position.X > Bounds(1).X Then Bounds(1).X = Position.X
		      If Position.Y > Bounds(1).Y Then Bounds(1).Y = Position.Y
		      
		      Traveled = Traveled + 1
		      StepKey = Position.X.ToString + "x" + Position.Y.ToString
		      If PointSteps.HasKey(StepKey) Then Continue
		      PointSteps.Value(StepKey) = Traveled
		    Next
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Bounds() As Coordinate
	#tag EndProperty

	#tag Property, Flags = &h0
		LinearCoordinates() As Coordinate
	#tag EndProperty

	#tag Property, Flags = &h0
		PointSteps As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		StepsCsv As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Traveled As Integer
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
			Name="StepsCsv"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Traveled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
