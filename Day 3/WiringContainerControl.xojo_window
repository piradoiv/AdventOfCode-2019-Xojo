#tag Window
Begin ContainerControl WiringContainerControl
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
   Height          =   442
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
   Width           =   528
   Begin Canvas WiringCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   322
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
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
      Top             =   52
      Transparent     =   True
      Visible         =   True
      Width           =   299
   End
   Begin PushButton LoadFromCsvPushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load from CSV"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
   Begin Label GridSizeLabel
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   397
      Transparent     =   False
      Underline       =   False
      Value           =   "Zoom level:"
      Visible         =   True
      Width           =   79
   End
   Begin Slider GridSizeSlider
      AllowAutoDeactivate=   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   23
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   111
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MaximumValue    =   20
      MinimumValue    =   1
      PageStep        =   20
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TickMarkStyle   =   "0"
      Tooltip         =   ""
      Top             =   399
      Transparent     =   False
      Value           =   6
      Visible         =   True
      Width           =   100
   End
   Begin ScrollBar VerticalScrollBar
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   322
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   318
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   5000
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Value           =   2500
      Visible         =   True
      Width           =   15
   End
   Begin ScrollBar HorizontalScrollBar
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   15
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumValue    =   5000
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   372
      Transparent     =   False
      Value           =   2500
      Visible         =   True
      Width           =   299
   End
   Begin Listbox CrossedWiresListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   "0"
      GridLinesVerticalStyle=   "0"
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   298
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Distance	Steps"
      Italic          =   False
      Left            =   345
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   163
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label CrossedWiresLabel
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   345
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Value           =   "Crossed wires:"
      Visible         =   True
      Width           =   161
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  GridSize = GridSizeSlider.Value
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  InvalidateGrid
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  InvalidateGrid
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CalculateIntersections()
		  Var Result() As Intersection
		  
		  For Each WireSteps As String In PreviousCsv.Split(EndOfLine)
		    Var Parts() As String = WireSteps.Split(",")
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
		      
		      'Result.AddRow c
		      PreviousCoord.X = c.X
		      PreviousCoord.Y = c.Y
		    Next
		  Next
		  
		  'LinearCoordinates = NewCoordinates
		  
		  Intersections = Result
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateMaximumSteps(Csv As String) As Integer
		  Var MaxSteps As Integer = 0
		  For Each Line As String In Csv.Split(EndOfLine)
		    Var Parts() As String = Line.Split(",")
		    Var WireSteps As Integer = 0
		    For Each Segment As String In Parts
		      Var Amount As Integer = Segment.Right(Segment.Length - 1).Val
		      WireSteps = WireSteps + Amount
		    Next
		    
		    MaxSteps = Max(MaxSteps, WireSteps)
		  Next
		  
		  Return MaxSteps
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDistanceFromCenter() As Integer
		  Var OffsetScrollbarX As Double = HorizontalScrollBar.MaximumValue / 2 - HorizontalScrollBar.Value
		  Var OffsetScrollbarY As Double = VerticalScrollBar.MaximumValue / 2 - VerticalScrollBar.Value
		  Return 0 'Abs(MousePos.X - OffsetScrollbarX) + Abs(MousePos.Y - OffsetScrollbarY)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridPicture() As Picture
		  If CachedGridPicture <> Nil Then
		    Return CachedGridPicture
		  End If
		  
		  Var NewPicture As New Picture(WiringCanvas.Width, WiringCanvas.Height)
		  Var g As Graphics = NewPicture.Graphics
		  
		  Var Cols As Double = g.Width / GridSize
		  Var Rows As Double = g.Height / GridSize
		  Var OffsetX As Integer = (Cols / 2) + (HorizontalScrollBar.MaximumValue / 2 - HorizontalScrollBar.Value)
		  Var OffsetY As Integer = (Rows / 2) + (VerticalScrollBar.MaximumValue / 2 - VerticalScrollBar.Value)
		  
		  g.DrawingColor = Color.RGB(25, 25, 25)
		  g.FillRectangle 0, 0, g.Width, g.Height
		  g.DrawingColor = Color.Blue
		  g.FillRectangle OffsetX * GridSize, OffsetY * GridSize, GridSize, GridSize
		  
		  For I As Integer = 0 To Wires.Count - 1
		    Var c As Wire = Wires(I)
		    Var PreviousCoord As New Coordinate
		    
		    For J As Integer = 0 To c.LinearCoordinates.Count - 1
		      Var coord As Coordinate = c.LinearCoordinates(J)
		      g.DrawingColor = Color.HSV((I * 15 Mod 100) / 100, 1, 1, J * 4)
		      g.PenSize = GridSize
		      g.DrawLine (PreviousCoord.X + OffsetX) * GridSize, (PreviousCoord.Y + OffsetY) * GridSize, _
		      (coord.X + OffsetX) * GridSize, (coord.Y + OffsetY) * GridSize
		      PreviousCoord.X = coord.X
		      PreviousCoord.Y = coord.Y
		    Next
		  Next
		  
		  CachedGridPicture = NewPicture
		  Return CachedGridPicture
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateGrid()
		  CachedGridPicture = Nil
		  WiringCanvas.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadWiresFromCsv(Csv As String)
		  Wires.RemoveAllRows
		  Var Rand As New Random
		  Rand.RandomizeSeed
		  Var Lines() As String = Csv.Split(EndOfLine)
		  For Each Line As String In Lines
		    Var c As New Wire
		    c.DrawingColor = Color.HSV(Rand.Number, 1, 1)
		    c.StepsCsv = Line
		    c.LoadCoordinates Line
		    Wires.AddRow c
		  Next
		  
		  MaximumSteps = CalculateMaximumSteps(Csv)
		  CalculateIntersections
		  InvalidateGrid
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CachedGridPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		GridSize As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		Intersections() As Intersection
	#tag EndProperty

	#tag Property, Flags = &h0
		MaximumSteps As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviousCsv As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Wires() As Wire
	#tag EndProperty


	#tag Constant, Name = DistanceLabel_Value, Type = String, Dynamic = True, Default = \"Distance from center: {distance}", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EnergyLabel_Value, Type = String, Dynamic = True, Default = \"Current step: {step}", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StartPushButton_Caption, Type = String, Dynamic = True, Default = \"Start simulator", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StopPushButton_Caption, Type = String, Dynamic = True, Default = \"Stop simulator", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events WiringCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawPicture GetGridPicture, 0, 0, g.Width, g.Height
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  HorizontalScrollBar.Value = HorizontalScrollBar.Value + deltaX
		  VerticalScrollBar.Value = VerticalScrollBar.Value + deltaY
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LoadFromCsvPushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.Csv = PreviousCsv
		  d.ShowModalWithin(Self.Window)
		  If d.Csv.Trim = "" Then Return
		  PreviousCsv = d.Csv
		  LoadWiresFromCsv(d.Csv)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GridSizeSlider
	#tag Event
		Sub ValueChanged()
		  GridSize = Me.Value
		  InvalidateGrid
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VerticalScrollBar
	#tag Event
		Sub ValueChanged()
		  InvalidateGrid
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HorizontalScrollBar
	#tag Event
		Sub ValueChanged()
		  InvalidateGrid
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
		Name="GridSize"
		Visible=false
		Group="Behavior"
		InitialValue="4"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CachedGridPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PreviousCsv"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumSteps"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
