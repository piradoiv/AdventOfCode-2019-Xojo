#tag Window
Begin ContainerControl HullContainerControl
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
   Begin Canvas HullCanvas
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
   End
   Begin PushButton ExecuteProgramPushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Execute Program"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   156
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
      Width           =   124
   End
   Begin HullPaintingRobot Robot
      CurrentOutputType=   "OutputType.Paint"
      Heading         =   "Headings.North"
      Index           =   -2147483648
      LockedInPosition=   False
      Program         =   ""
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Painted = New Dictionary
		  PaintedAtLeastOnce = New Dictionary
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ExecuteProgram()
		  Painted.RemoveAll
		  Robot.Heading = HullPaintingRobot.Headings.North
		  Robot.Position.X = 0
		  Robot.Position.Y = 0
		  Painted.Value(GetKeyForPosition(Robot.Position)) = New Point
		  Robot.Run Program
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


	#tag Property, Flags = &h0
		Painted As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		PaintedAtLeastOnce As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Program As String
	#tag EndProperty


#tag EndWindowCode

#tag Events HullCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawingColor = Color.Black
		  g.FillRectangle 0, 0, g.Width, g.Height
		  
		  Const PixelSize = 6
		  Const Offset = 15
		  For Each Entry As DictionaryEntry In Painted
		    Var p As Point = Entry.Value
		    g.DrawingColor = Color.White
		    Var X, Y As Integer
		    X = p.X + Offset
		    Y = p.Y + Offset
		    g.FillRectangle X * PixelSize, Y * PixelSize, PixelSize, PixelSize
		  Next
		  
		  g.DrawingColor = Color.Red
		  g.FillRectangle (Robot.Position.X + Offset) * PixelSize, (Robot.Position.Y + Offset) * PixelSize, PixelSize, PixelSize
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ExecuteProgramPushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.ShowModalWithin Self.Window
		  Program = d.Csv
		  ExecuteProgram
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Robot
	#tag Event
		Function WhatIsTheColorInMyPosition(RobotPosition As Point) As Integer
		  Var Result As Integer = 0
		  If Painted.HasKey(GetKeyForPosition(RobotPosition)) Then
		    Result = 1
		  End If
		  
		  Return Result
		End Function
	#tag EndEvent
	#tag Event
		Sub RobotHasMoved()
		  HullCanvas.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(PaintPosition As Point, PaintColor As Integer)
		  Var PaintRow As New Point
		  PaintRow.X = PaintPosition.X
		  PaintRow.Y = PaintPosition.Y
		  
		  Var Key As String = GetKeyForPosition(PaintPosition)
		  PaintedAtLeastOnce.Value(Key) = PaintPosition
		  
		  If PaintColor = 1 And Not Painted.HasKey(Key) Then
		    Painted.Value(Key) = PaintPosition
		  End If
		  
		  If PaintColor = 0 And Painted.HasKey(Key) Then
		    Painted.Remove(Key)
		  End If
		  
		  HullCanvas.Invalidate
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
		Name="Program"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
