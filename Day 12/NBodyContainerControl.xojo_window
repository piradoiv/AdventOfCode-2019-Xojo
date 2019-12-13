#tag Window
Begin ContainerControl NBodyContainerControl
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
   Height          =   348
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
   Width           =   600
   Begin Canvas SimulationCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   207
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   600
      Begin PushButton DetectCyclesPushButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Detect cycles"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "SimulationCanvas"
         Italic          =   False
         Left            =   468
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   167
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   112
      End
      Begin Label FactsLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   56
         Index           =   -2147483648
         InitialParent   =   "SimulationCanvas"
         Italic          =   False
         Left            =   20
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   131
         Transparent     =   False
         Underline       =   False
         Value           =   ""
         Visible         =   True
         Width           =   436
      End
   End
   Begin Listbox MoonListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   9
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
      Height          =   141
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "pX	pY	pZ	vX	vY	vZ	Pot	Kin	Total"
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   207
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
      Begin PushButton UpdatePushButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Update"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "MoonListbox"
         Italic          =   False
         Left            =   500
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   306
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin Label StepsLabel
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
         InitialParent   =   "MoonListbox"
         Italic          =   False
         Left            =   380
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "3"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   307
         Transparent     =   False
         Underline       =   False
         Value           =   "Steps:"
         Visible         =   True
         Width           =   51
      End
      Begin TextField StepsAmountTextField
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "MoonListbox"
         Italic          =   False
         Left            =   443
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   306
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Value           =   "1"
         Visible         =   True
         Width           =   45
      End
   End
   Begin PushButton LoadScanPushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load scan"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   489
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
      Width           =   91
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub DetectCyclesForMoons(MoonsFirstCycle() As Moon)
		  Var MoonsCopy() As Moon = GetArrayCopy(MoonsFirstCycle)
		  Var CycleX, CycleY, CycleZ, TotalCycle As Integer
		  Var CurrentStep As Integer
		  
		  While CycleX = 0 Or CycleY = 0 Or CycleZ = 0
		    CurrentStep = CurrentStep + 1
		    UpdateMoons(MoonsCopy)
		    If CycleX = 0 And VectorAxisInArrayAreTheSame("X", MoonsCopy, MoonsFirstCycle) Then
		      CycleX = CurrentStep
		    End If
		    
		    If CycleY = 0 And VectorAxisInArrayAreTheSame("Y", MoonsCopy, MoonsFirstCycle) Then
		      CycleY = CurrentStep
		    End If
		    
		    If CycleZ = 0 And VectorAxisInArrayAreTheSame("Z", MoonsCopy, MoonsFirstCycle) Then
		      CycleZ = CurrentStep
		    End If
		  Wend
		  
		  UpdateFactsLabel(CycleX, CycleY, CycleZ)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetArrayCopy(Moons() As Moon) As Moon()
		  Var Result() As Moon
		  For Each Original As Moon In Moons
		    Var m As New Moon(Original.Position.X, Original.Position.Y, Original.Position.Z)
		    m.Speed = New Vector(Original.Speed.X, Original.Speed.Y, Original.Speed.Z)
		    Result.AddRow m
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMoonsFromScan(ScannerInput As String) As Moon()
		  Var Result() As Moon
		  For Each Line As String In ScannerInput.Split(EndOfLine)
		    Line = Line.Replace("<x=", "").Replace("y=", "").Replace("z=", "").Replace(">", "").ReplaceAll(" ", "")
		    Var Parts() As String = Line.Split(",")
		    Var Position As New Vector(Parts(0).Val, Parts(1).Val, Parts(2).Val)
		    Var m As New Moon(Position.X, Position.Y, Position.Z)
		    Result.AddRow m
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshMoonList()
		  MoonListbox.RemoveAllRows
		  For Each m As Moon In Moons
		    Var pX, pY, pZ, vX, vY, vZ As Integer
		    pX = m.Position.X
		    pY = m.Position.Y
		    pZ = m.Position.Z
		    vX = m.Speed.X
		    vY = m.Speed.Y
		    vZ = m.Speed.Z
		    Var Total As Integer = m.GetPot * m.GetKin
		    MoonListbox.AddRow pX.ToString, pY.ToString, pZ.ToString, _
		    vX.ToString, vY.ToString, vZ.ToString, _
		    m.GetPot.ToString, m.GetKin.ToString, Total.ToString
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  UpdateMoons(Moons)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateFactsLabel(xCycle As Integer, yCycle As Integer, zCycle As Integer)
		  FactsLabel.Value = FactsLabel_Value.Replace("{xSteps}", If(xCycle = 0, "n/a", xCycle.ToString)) _
		  .Replace("{ySteps}", If(yCycle = 0, "n/a", yCycle.ToString)) _
		  .Replace("{zSteps}", If(yCycle = 0, "n/a", zCycle.ToString))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMoons(MoonsToUpdate() As Moon)
		  Var PendingToUpdate() As Moon
		  For Each m As Moon In MoonsToUpdate
		    PendingToUpdate.AddRow m
		  Next
		  
		  While PendingToUpdate.Count > 0
		    Var m As Moon = PendingToUpdate(0)
		    PendingToUpdate.RemoveRowAt(0)
		    For Each Other As Moon In PendingToUpdate
		      m.ApplyGravity(Other.Position)
		      Other.ApplyGravity(m.Position)
		    Next
		  Wend
		  
		  For Each m As Moon In MoonsToUpdate
		    m.Update
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VectorAxisInArrayAreTheSame(Axis As String, FirstMoons() As Moon, SecondMoons() As Moon) As Boolean
		  For Index As Integer = 0 To FirstMoons.LastRowIndex
		    Var fmAxis, smAxis As Integer
		    Var sfmAxis, ssmAxis As Integer
		    Select Case Axis
		    Case "X"
		      fmAxis = FirstMoons(Index).Position.X
		      smAxis = SecondMoons(Index).Position.X
		      sfmAxis = FirstMoons(Index).Speed.X
		      ssmAxis = SecondMoons(Index).Speed.X
		    Case "Y"
		      fmAxis = FirstMoons(Index).Position.Y
		      smAxis = SecondMoons(Index).Position.Y
		      sfmAxis = FirstMoons(Index).Speed.Y
		      ssmAxis = SecondMoons(Index).Speed.Y
		    Case "Z"
		      fmAxis = FirstMoons(Index).Position.Z
		      smAxis = SecondMoons(Index).Position.Z
		      sfmAxis = FirstMoons(Index).Speed.Z
		      ssmAxis = SecondMoons(Index).Speed.Z
		    End Select
		    
		    If fmAxis <> smAxis Or sfmAxis <> ssmAxis Then Return False
		  Next
		  
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Moons() As Moon
	#tag EndProperty

	#tag Property, Flags = &h0
		OriginalScan As String
	#tag EndProperty


	#tag Constant, Name = FactsLabel_Value, Type = String, Dynamic = True, Default = \"- X is repeating after {Xsteps} steps\n- Y is repeating after {Ysteps} steps\n- Z is repeating after {Zsteps} steps", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events SimulationCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawingColor = Color.Black
		  g.FillRectangle 0, 0, g.Width, g.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DetectCyclesPushButton
	#tag Event
		Sub Action()
		  DetectCyclesForMoons(GetArrayCopy(Moons))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpdatePushButton
	#tag Event
		Sub Action()
		  For I As Integer = 1 To StepsAmountTextField.Value.Val
		    Update
		  Next
		  
		  RefreshMoonList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadScanPushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.ShowModalWithin Self.Window
		  OriginalScan = d.Csv
		  Moons = GetMoonsFromScan(OriginalScan)
		  FactsLabel.Value = ""
		  RefreshMoonList
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
		Name="OriginalScan"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
