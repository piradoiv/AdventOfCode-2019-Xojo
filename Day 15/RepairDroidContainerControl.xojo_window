#tag Window
Begin ContainerControl RepairDroidContainerControl
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   300
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   300
   Begin Canvas WorldCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   300
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   300
      Begin PushButton LoadProgramPushButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Load Program"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "WorldCanvas"
         Italic          =   False
         Left            =   168
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   20
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   112
      End
      Begin Label BestSolutionLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "WorldCanvas"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "3"
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   272
         Transparent     =   False
         Underline       =   False
         Value           =   ""
         Visible         =   True
         Width           =   260
      End
   End
   Begin RepairDroidComputer RepairDroid
      Heading         =   "Directions.North"
      Index           =   -2147483648
      InstructionPointer=   0
      LockedInPosition=   False
      Noun            =   0
      OpCode          =   99
      RelativeBase    =   0
      ResultAddress   =   0
      Scope           =   0
      Status          =   "Statuses.Idle"
      TabPanelIndex   =   0
      Verb            =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  ResetWorld
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CleanBestPathPosition(Position As Point, Heading As RepairDroidComputer.Directions, Path As Dictionary)
		  Var North, South, East, West As Point
		  North = New Point(Position.X, Position.Y - 1)
		  South = New Point(Position.X, Position.Y + 1)
		  West = New Point(Position.X - 1, Position.Y)
		  East = New Point(Position.X + 1, Position.Y)
		  
		  If Path.HasKey(GetKeyForPosition(Position)) Then Path.Remove(GetKeyForPosition(Position))
		  If Path.HasKey(GetKeyForPosition(North)) And Heading <> RepairDroidComputer.Directions.North Then Path.Remove(GetKeyForPosition(North))
		  If Path.HasKey(GetKeyForPosition(South)) And Heading <> RepairDroidComputer.Directions.South Then Path.Remove(GetKeyForPosition(South))
		  If Path.HasKey(GetKeyForPosition(West)) And Heading <> RepairDroidComputer.Directions.West Then Path.Remove(GetKeyForPosition(West))
		  If Path.HasKey(GetKeyForPosition(East)) And Heading <> RepairDroidComputer.Directions.East Then Path.Remove(GetKeyForPosition(East))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetKeyForPosition(Position As Point) As String
		  Var X, Y As Integer
		  X = Position.X
		  Y = Position.Y
		  Return X.ToString + "," + Y.ToString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLeftHandBasedOnHeading(Heading As RepairDroidComputer.Directions) As RepairDroidComputer.Directions
		  Var Result As RepairDroidComputer.Directions
		  Select Case RepairDroid.Heading
		  Case RepairDroidComputer.Directions.North
		    Result = RepairDroidComputer.Directions.West
		  Case RepairDroidComputer.Directions.South
		    Result = RepairDroidComputer.Directions.East
		  Case RepairDroidComputer.Directions.West
		    Result = RepairDroidComputer.Directions.South
		  Case RepairDroidComputer.Directions.East
		    Result = RepairDroidComputer.Directions.North
		  End Select
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOppositeHeading(Heading As RepairDroidComputer.Directions) As RepairDroidComputer.Directions
		  Var Result As RepairDroidComputer.Directions = GetLeftHandBasedOnHeading(Heading)
		  Return GetLeftHandBasedOnHeading(Result)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRightHandBasedOnHeading(Heading As RepairDroidComputer.Directions) As RepairDroidComputer.Directions
		  Var Result As RepairDroidComputer.Directions
		  Select Case RepairDroid.Heading
		  Case RepairDroidComputer.Directions.North
		    Result = RepairDroidComputer.Directions.East
		  Case RepairDroidComputer.Directions.South
		    Result = RepairDroidComputer.Directions.West
		  Case RepairDroidComputer.Directions.West
		    Result = RepairDroidComputer.Directions.North
		  Case RepairDroidComputer.Directions.East
		    Result = RepairDroidComputer.Directions.South
		  End Select
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetWorld()
		  AlreadyFoundOxygen = False
		  DroidPosition = New Point
		  World = New Dictionary
		  World.Value("0,0") = New WorldTile(New Point, WorldTile.Types.Nothing)
		  BestPathRight = New Dictionary
		  BestPathRight.Value(GetKeyForPosition(DroidPosition)) = True
		  BestPathLeft = New Dictionary
		  BestPathLeft.Value(GetKeyForPosition(DroidPosition)) = True
		  Winner = BestPathRight
		  
		  TopLeft = New Point
		  BottomRight = New Point
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AlreadyFoundOxygen As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		BestPathLeft As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		BestPathRight As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		BottomRight As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		DroidPosition As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		LastMovement As RepairDroidComputer.Directions
	#tag EndProperty

	#tag Property, Flags = &h0
		TopLeft As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		VisitedBlocks As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Winner As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		World As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events WorldCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Var GridWidth As Integer = Abs(TopLeft.X) + BottomRight.X
		  Var GridHeight As Integer = Abs(TopLeft.Y) + BottomRight.Y
		  Var MaxPixelWidth As Double = (g.Width - 10) / GridWidth
		  Var MaxPixelHeight As Double = (g.Height - 10) / GridHeight
		  
		  Var PixelSize As Double = Min(MaxPixelWidth, MaxPixelHeight)
		  Var OffsetX As Double = GridWidth - BottomRight.X
		  Var OffsetY As Double = GridHeight - BottomRight.Y
		  
		  g.DrawingColor = Color.Black
		  g.FillRectangle 0, 0, g.Width, g.Height
		  
		  For Each Entry As DictionaryEntry In World
		    Var Tile As WorldTile = Entry.Value
		    Var Sprite As Picture
		    Select Case Tile.Type
		    Case WorldTile.Types.OxygenSystem
		      Sprite = ballBlue
		    Case WorldTile.Types.Wall
		      Sprite = blockRed
		    Case WorldTile.Types.Nothing
		      Sprite = blockGrey
		    End Select
		    
		    If Winner.HasKey(GetKeyForPosition(Tile.Position)) And Tile.Type <> WorldTile.Types.OxygenSystem Then
		      'Sprite = blockGreen
		    End If
		    
		    g.DrawPicture Sprite, (OffsetX + Tile.Position.X) * PixelSize, (OffsetY + Tile.Position.Y) * PixelSize, _
		    PixelSize, PixelSize, 0, 0, Sprite.Width, Sprite.Height
		  Next
		  
		  Var DroidSprite As Picture = blockYellow
		  g.DrawPicture DroidSprite, (OffsetX + DroidPosition.X) * PixelSize, (OffsetY + DroidPosition.Y) * PixelSize, _
		  PixelSize, PixelSize, 0, 0, DroidSprite.Width, DroidSprite.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadProgramPushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.Title = "Load program"
		  d.ShowModalWithin Self.Window
		  If d.Csv = "" Then Return
		  
		  ResetWorld
		  RepairDroid.LoadProgram d.Csv
		  RepairDroid.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RepairDroid
	#tag Event
		Sub InputRequired()
		  RepairDroid.Heading = GetRightHandBasedOnHeading(RepairDroid.Heading)
		  LastMovement = RepairDroid.Heading
		  Me.MoveTo LastMovement
		End Sub
	#tag EndEvent
	#tag Event
		Sub Report(Moved As Boolean, HitWall As Boolean, FoundOxygen As Boolean)
		  Var BlockType As WorldTile.Types = WorldTile.Types.Nothing
		  Var NewPosition As New Point(DroidPosition.X, DroidPosition.Y)
		  Select Case LastMovement
		  Case RepairDroidComputer.Directions.North
		    NewPosition.Y = NewPosition.Y - 1
		  Case RepairDroidComputer.Directions.South
		    NewPosition.Y = NewPosition.Y + 1
		  Case RepairDroidComputer.Directions.West
		    NewPosition.X = NewPosition.X - 1
		  Case RepairDroidComputer.Directions.East
		    NewPosition.X = NewPosition.X + 1
		  End Select
		  
		  TopLeft.X = Min(TopLeft.X, NewPosition.X)
		  TopLeft.Y = Min(TopLeft.Y, NewPosition.Y)
		  BottomRight.X = Max(BottomRight.X, NewPosition.X)
		  BottomRight.Y = Max(BottomRight.Y, NewPosition.Y)
		  Var CurrentPath As Dictionary = If(AlreadyFoundOxygen, BestPathLeft, BestPathRight)
		  
		  If Moved Then
		    Var Key As String = GetKeyForPosition(DroidPosition)
		    If CurrentPath.HasKey(Key) And Key <> "0,0" Then
		      CleanBestPathPosition(DroidPosition, Me.Heading, CurrentPath)
		    Else
		      CurrentPath.Value(Key) = True
		    End If
		    
		    DroidPosition = NewPosition
		    If Key = "0,0" And AlreadyFoundOxygen Then
		      Me.Stop
		      Winner = BestPathRight
		      If BestPathLeft.KeyCount < BestPathRight.KeyCount Then Winner = BestPathLeft
		    End If
		    
		    BestSolutionLabel.Value = "Best solution: " + Winner.KeyCount.ToString + " steps"
		  End If
		  
		  If HitWall Then
		    BlockType = WorldTile.Types.Wall
		    Me.Heading = GetLeftHandBasedOnHeading(Me.Heading)
		    Me.Heading = GetLeftHandBasedOnHeading(Me.Heading)
		  End If
		  
		  If FoundOxygen Then
		    BlockType = WorldTile.Types.OxygenSystem
		    AlreadyFoundOxygen = True
		  End If
		  
		  World.Value(GetKeyForPosition(NewPosition)) = New WorldTile(NewPosition, BlockType)
		  WorldCanvas.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastMovement"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="RepairDroidComputer.Directions"
		EditorType="Enum"
		#tag EnumValues
			"0 - North"
			"1 - South"
			"2 - West"
			"3 - East"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="AlreadyFoundOxygen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
