#tag Window
Begin ContainerControl ArcadeCabinetContainerControl
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
   Begin Canvas CabinetScreenCanvas
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   300
      Begin Label ScoreLabel
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
         InitialParent   =   "CabinetScreenCanvas"
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
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "2"
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   260
         Transparent     =   False
         Underline       =   False
         Value           =   "Score: 0"
         Visible         =   True
         Width           =   260
      End
   End
   Begin IntCodeComputer Computer
      Enabled         =   True
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
   Begin PushButton LoadGamePushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load Game"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   177
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
      Width           =   103
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Tiles = New Dictionary
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub FlushBuffer()
		  Var X, Y, Z As Integer
		  X = OutputBuffer(0)
		  Y = OutputBuffer(1)
		  Z = OutputBuffer(2)
		  OutputBuffer.RemoveAllRows
		  
		  If X = -1 And Y = 0 Then
		    Score = Z
		  Else
		    Var Key As String = X.ToString + "," + Y.ToString
		    Tiles.Value(Key) = New GameTile(X, Y, GameTile.TileTypeFromInteger(Z))
		    If Z = 4 Then BallX = X
		    If Z = 3 Then PlayerX = X
		  End If
		  
		  CabinetScreenCanvas.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDrawingColorForTile(Tile As GameTile) As Color
		  Select Case Tile.Type
		  Case GameTile.Types.Block
		    Return Color.Green
		  Case GameTile.Types.Wall
		    Return Color.Gray
		  Case GameTile.Types.HorizontalPaddle
		    Return Color.Orange
		  Case GameTile.Types.Ball
		    Return Color.Red
		  Else
		    Return Color.Black
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BallX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		GameCartdrige As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputBuffer() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PlayerX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Score As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Tiles As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events CabinetScreenCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Const PixelSize = 10
		  
		  g.DrawingColor = Color.Black
		  g.FillRectangle 0, 0, g.Width, g.Height
		  
		  For Each Entry As DictionaryEntry In Tiles
		    Var Tile As GameTile = Entry.Value
		    If Tile.Type = GameTile.Types.Empty Then Continue
		    g.DrawPicture Tile.Tile, Tile.Position.X * PixelSize, Tile.Position.Y * PixelSize, PixelSize, PixelSize, 0, 0, Tile.Tile.Width, Tile.Tile.Height
		  Next
		  
		  ScoreLabel.Value = "Score: " + Score.ToString
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Computer
	#tag Event
		Sub Finished()
		  LoadGamePushButton.Visible = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub Output(Message As Integer)
		  OutputBuffer.AddRow Message
		  If OutputBuffer.Count = 3 Then FlushBuffer
		End Sub
	#tag EndEvent
	#tag Event
		Sub InputRequired()
		  Var Result As Integer = 0
		  If BallX < PlayerX Then Result = -1
		  If BallX > PlayerX Then Result = 1
		  Computer.AddInput Result
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadGamePushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.Title = "Enter your game cartdrige program"
		  d.Csv = GameCartdrige
		  d.ShowModalWithin Self.Window
		  If d.Csv = "" Then Return
		  
		  Me.Visible = False
		  Score = 0
		  Tiles.RemoveAll
		  GameCartdrige = d.Csv
		  Computer.LoadProgram GameCartdrige
		  Computer.Run
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
		Name="GameCartdrige"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Score"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BallX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PlayerX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
