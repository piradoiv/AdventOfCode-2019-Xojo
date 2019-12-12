#tag Class
Protected Class HullPaintingRobot
	#tag Method, Flags = &h0
		Sub Constructor()
		  Position = New Point
		  Position.X = 0
		  Position.Y = 0
		  Computer = New IntCodeComputer
		  AddHandler Computer.InputRequired, WeakAddressOf InputRequiredHandler
		  AddHandler Computer.Output, WeakAddressOf OutputHandler
		  AddHandler Computer.Finished, WeakAddressOf FinishedHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishedHandler(Sender As IntCodeComputer)
		  Finished
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InputRequiredHandler(Sender As IntCodeComputer)
		  Var Result As Integer = WhatIsTheColorInMyPosition(Position)
		  Computer.AddInput Result
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OutputHandler(Sender As IntCodeComputer, Message As Integer)
		  Var OutputPosition As New Point
		  OutputPosition.X = Position.X
		  OutputPosition.Y = Position.Y
		  
		  If CurrentOutputType = OutputType.Paint Then
		    CurrentOutputType = OutputType.Move
		    Paint(OutputPosition, Message)
		  Else
		    CurrentOutputType = OutputType.Paint
		    Select Case Heading
		    Case Headings.North
		      Position.X = Position.X + If(Message = 0, -1, 1)
		      Heading = If(Message = 0, Headings.West, Headings.East)
		    Case Headings.East
		      Position.Y = Position.Y + If(Message = 0, -1, 1)
		      Heading = If(Message = 0, Headings.North, Headings.South)
		    Case Headings.South
		      Position.X = Position.X + If(Message = 0, 1, -1)
		      Heading = If(Message = 0, Headings.East, Headings.West)
		    Case Headings.West
		      Position.Y = Position.Y + If(Message = 0, 1, -1)
		      Heading = If(Message = 0, Headings.South, Headings.North)
		    End Select
		    
		    RobotHasMoved
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(Program As String)
		  Computer.LoadProgram Program
		  Computer.Run
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Finished()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(PaintPosition As Point, PaintColor As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event RobotHasMoved()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WhatIsTheColorInMyPosition(RobotPosition As Point) As Integer
	#tag EndHook


	#tag Property, Flags = &h0
		Computer As IntCodeComputer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentOutputType As OutputType = OutputType.Paint
	#tag EndProperty

	#tag Property, Flags = &h0
		Heading As Headings = Headings.North
	#tag EndProperty

	#tag Property, Flags = &h0
		Position As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Program As String
	#tag EndProperty


	#tag Enum, Name = Headings, Type = Integer, Flags = &h0
		North
		  East
		  South
		West
	#tag EndEnum

	#tag Enum, Name = OutputType, Type = Integer, Flags = &h0
		Paint
		Move
	#tag EndEnum


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
			Name="Heading"
			Visible=false
			Group="Behavior"
			InitialValue="Headings.North"
			Type="Headings"
			EditorType="Enum"
			#tag EnumValues
				"0 - North"
				"1 - East"
				"2 - South"
				"3 - West"
			#tag EndEnumValues
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
			Name="CurrentOutputType"
			Visible=false
			Group="Behavior"
			InitialValue="OutputType.Paint"
			Type="OutputType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Paint"
				"1 - Move"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
