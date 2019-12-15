#tag Class
Protected Class RepairDroidComputer
Inherits IntCodeComputer
	#tag Event
		Sub Finished()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Output(Message As Integer)
		  Select Case Message
		  Case 0
		    Report(False, True, False)
		  Case 1
		    Report(True, False, False)
		  Case 2
		    Report(True, False, True)
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub MoveTo(d As Directions)
		  Select Case d
		  Case Directions.North
		    AddInput 1
		  Case Directions.South
		    AddInput 2
		  Case Directions.West
		    AddInput 3
		  Case Directions.East
		    AddInput 4
		  End Select
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Report(Moved As Boolean, HitWall As Boolean, FoundOxygen As Boolean)
	#tag EndHook


	#tag Property, Flags = &h0
		Heading As Directions = Directions.North
	#tag EndProperty


	#tag Enum, Name = Directions, Type = Integer, Flags = &h0
		North
		  South
		  West
		East
	#tag EndEnum


	#tag ViewBehavior
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
			Name="InstructionPointer"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Noun"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OpCode"
			Visible=false
			Group="Behavior"
			InitialValue="99"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ResultAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Verb"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Status"
			Visible=false
			Group="Behavior"
			InitialValue="Statuses.Idle"
			Type="Statuses"
			EditorType="Enum"
			#tag EnumValues
				"0 - Idle"
				"1 - WaitingForInput"
				"2 - Running"
				"3 - Terminated"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="RelativeBase"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Heading"
			Visible=false
			Group="Behavior"
			InitialValue="Directions.North"
			Type="Directions"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
