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
   Begin Listbox CrossedWiresListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
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
      HasBorder       =   False
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   152
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Position	Distance	Steps"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   290
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   528
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas WiresCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   290
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   528
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
         InitialParent   =   "WiresCanvas"
         Italic          =   False
         Left            =   392
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
         Width           =   116
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Intersections = New Dictionary
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  InvalidateCanvas
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  WiresCanvas.Invalidate
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CalculateIntersections()
		  Intersections.RemoveAll
		  
		  Var LessStepsWireIndex As Integer
		  Var WireWithLessSteps As Wire
		  For I As Integer = 0 To Wires.Count - 1
		    Var w As Wire = Wires(I)
		    If WireWithLessSteps = Nil Then
		      WireWithLessSteps = w
		      Continue
		    End If
		    
		    If w.Traveled < WireWithLessSteps.Traveled Then
		      WireWithLessSteps = w
		      LessStepsWireIndex = I
		    End If
		  Next
		  
		  For Each CoordEntry As DictionaryEntry In WireWithLessSteps.PointSteps
		    For I As Integer = 0 To Wires.Count - 1
		      If I = LessStepsWireIndex Then Continue
		      Var w As Wire = Wires(I)
		      If Not w.PointSteps.HasKey(CoordEntry.Key) Then Continue
		      Var OtherWireSteps As Integer = w.PointSteps.Value(CoordEntry.Key)
		      Var NewValue As Integer = Intersections.Lookup(CoordEntry.Key, CoordEntry.Value) + OtherWireSteps
		      Intersections.Value(CoordEntry.Key) = NewValue
		    Next
		  Next
		  
		  Var Found As Integer = Intersections.Count
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGridPicture() As Picture
		  If CachedGridPicture <> Nil Then
		    Return CachedGridPicture
		  End If
		  
		  Var Bounds() As Coordinate
		  Bounds.AddRow New Coordinate
		  Bounds.AddRow New Coordinate
		  For Each w As Wire In Wires
		    If w.Bounds(0).X < Bounds(0).X Then Bounds(0).X = w.Bounds(0).X
		    If w.Bounds(0).Y < Bounds(0).Y Then Bounds(0).Y = w.Bounds(0).Y
		    If w.Bounds(1).X > Bounds(1).X Then Bounds(1).X = w.Bounds(1).X
		    If w.Bounds(1).Y > Bounds(1).Y Then Bounds(1).Y = w.Bounds(1).Y
		  Next
		  
		  Var BoundsWidth As Integer = Max(1, Abs(Bounds(1).X) + Abs(Bounds(0).X))
		  Var BoundsHeight As Integer = Max(1, Abs(Bounds(1).Y) + Abs(Bounds(0).Y))
		  
		  Var NewPicture As New Picture(BoundsWidth, BoundsHeight)
		  Var g As Graphics = NewPicture.Graphics
		  
		  Var OffsetX As Integer = 0'- (g.Width / 2)
		  Var OffsetY As Integer = 0'- (g.Height / 2)
		  
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
		Sub InvalidateCanvas()
		  CachedGridPicture = Nil
		  WiresCanvas.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadWiresFromCsv(Csv As String)
		  Wires.RemoveAllRows
		  
		  For Each Line As String In Csv.Split(EndOfLine)
		    Var c As New Wire
		    c.StepsCsv = Line
		    c.LoadCoordinates Line
		    Wires.AddRow c
		  Next
		  
		  CalculateIntersections
		  RefreshIntersectionsList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshIntersectionsList()
		  CrossedWiresListbox.RemoveAllRows
		  For Each Intersection As DictionaryEntry In Intersections
		    Var Steps As Integer = Intersection.Value
		    Var CoordParts() As String = Intersection.Key.StringValue.Split("x")
		    Var Distance As Integer = Abs(CoordParts(0).Val) + Abs(CoordParts(1).Val)
		    CrossedWiresListbox.AddRow Intersection.Key, Distance.ToString, Steps.ToString
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CachedGridPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		GridSize As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		Intersections As Dictionary
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

#tag Events CrossedWiresListbox
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column = 0 Then Return False
		  
		  Var val1 As Integer = Me.CellValueAt(row1, column).Val
		  Var val2 As Integer = Me.CellValueAt(row2, column).Val
		  
		  Select Case val1 - val2
		  Case Is < 0
		    result = -1
		  Case Is > 0
		    result = 1
		  Else
		    result = 0
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events WiresCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Var p As Picture = GetGridPicture
		  g.DrawPicture p, 0, 0, g.Width, g.Height, 0, 0, p.Width, p.Height
		End Sub
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
		  InvalidateCanvas
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
#tag EndViewBehavior
