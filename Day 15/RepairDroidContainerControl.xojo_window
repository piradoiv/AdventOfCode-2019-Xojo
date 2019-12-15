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
   End
   Begin RepairDroidComputer RepairDroid
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
		Sub ResetWorld()
		  DroidPosition = New Point
		  World = New Dictionary
		  VisitedBlocks = New Dictionary
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DroidPosition As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		LastMovement As RepairDroidComputer.Directions
	#tag EndProperty

	#tag Property, Flags = &h0
		VisitedBlocks As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		World As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events WorldCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Const PixelSize = 12
		  Var OffsetX As Double = 24
		  Var OffsetY As Double = 12
		  
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
		  Var Movements() As RepairDroidComputer.Directions = Array(RepairDroidComputer.Directions.North, _
		  RepairDroidComputer.Directions.South, RepairDroidComputer.Directions.West, RepairDroidComputer.Directions.East)
		  
		  Movements.Shuffle
		  LastMovement = Movements(0)
		  Me.MoveTo LastMovement
		End Sub
	#tag EndEvent
	#tag Event
		Sub Report(Moved As Boolean, HitWall As Boolean, FoundOxygen As Boolean)
		  Var NextPosition As New Point(DroidPosition.X, DroidPosition.Y)
		  Select Case LastMovement
		  Case RepairDroidComputer.Directions.North
		    NextPosition.Y = NextPosition.Y - 1
		  Case RepairDroidComputer.Directions.South
		    NextPosition.Y = NextPosition.Y + 1
		  Case RepairDroidComputer.Directions.West
		    NextPosition.X = NextPosition.X - 1
		  Case RepairDroidComputer.Directions.East
		    NextPosition.X = NextPosition.X + 1
		  End Select
		  
		  Var X, Y As Integer
		  X = NextPosition.X
		  Y = NextPosition.Y
		  Var Key As String = X.ToString + "," + Y.ToString
		  
		  If Moved Then
		    DroidPosition = NextPosition
		  End If
		  
		  Var BlockType As WorldTile.Types = WorldTile.Types.Nothing
		  
		  If HitWall Then
		    BlockType = WorldTile.Types.Wall
		  End If
		  
		  If FoundOxygen Then
		    BlockType = WorldTile.Types.OxygenSystem
		  End If
		  
		  World.Value(Key) = New WorldTile(NextPosition, BlockType)
		  
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
#tag EndViewBehavior
