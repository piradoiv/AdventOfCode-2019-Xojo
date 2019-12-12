#tag Window
Begin ContainerControl MonitoringContainerControl
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
   Width           =   506
   Begin Canvas MonitoringCanvas
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
      Width           =   295
      Begin PushButton LoadMapPushButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Load map"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "MonitoringCanvas"
         Italic          =   False
         Left            =   20
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
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
         Width           =   92
      End
      Begin Label BetLabel
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
         InitialParent   =   "MonitoringCanvas"
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
         TextAlignment   =   "0"
         TextColor       =   &cFFFFFF00
         Tooltip         =   ""
         Top             =   260
         Transparent     =   False
         Underline       =   False
         Value           =   ""
         Visible         =   True
         Width           =   255
      End
      Begin PushButton VaporizePushButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Vaporize!"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "MonitoringCanvas"
         Italic          =   False
         Left            =   195
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   "0"
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   20
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   80
      End
   End
   Begin Listbox AsteroidListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   "30,30,*"
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
      Height          =   300
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "X	Y	Detected asteroids"
      Italic          =   False
      Left            =   295
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   211
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub DetectAsteroids()
		  Var PendingAsteroidsToCheck() As Asteroid
		  For Each a As Asteroid In Asteroids
		    PendingAsteroidsToCheck.AddRow a
		  Next
		  
		  While PendingAsteroidsToCheck.Count <> 0
		    Var Candidate As Asteroid = PendingAsteroidsToCheck(0)
		    PendingAsteroidsToCheck.RemoveRowAt(0)
		    For Each Other As Asteroid In PendingAsteroidsToCheck
		      Candidate.AddTargetAtAngle(Candidate.AngleTo(Other), Other)
		      Other.AddTargetAtAngle(Other.AngleTo(Candidate), Candidate)
		    Next
		  Wend
		  
		  VaporizePushButton.Visible = Asteroids.Count > 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMap()
		  Var d As New CsvDialog
		  d.ShowModalWithin Self.Window
		  MapData = d.Csv
		  
		  BetLabel.Value = ""
		  Asteroids.RemoveAllRows
		  Var X, Y As Integer = -1
		  For Each Line As String In MapData.Split(EndOfLine)
		    X = -1
		    Y = Y + 1
		    For Each Cell As String In Line.Split("")
		      X = X + 1
		      If Cell <> "#" Then Continue
		      Asteroids.AddRow New Asteroid(X, Y)
		    Next
		  Next
		  
		  DetectAsteroids
		  RefreshAsteroidList
		  SelectBestAsteroid
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshAsteroidList()
		  AsteroidListbox.RemoveAllRows
		  For Each a As Asteroid In Asteroids
		    AsteroidListbox.AddRow Format(a.Position.X, "#"), Format(a.Position.Y, "#"), a.Targets.KeyCount.ToString
		    AsteroidListbox.RowTagAt(AsteroidListbox.LastRowIndex) = a
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectBestAsteroid()
		  Var MaxDetectedAsteroids As Integer
		  For Each Candidate As Asteroid In Asteroids
		    If Candidate.Targets.KeyCount > MaxDetectedAsteroids Then
		      MaxDetectedAsteroids = Candidate.Targets.KeyCount
		      BestAsteroid = Candidate
		    End If
		  Next
		  
		  For Index As Integer = 0 To AsteroidListbox.LastRowIndex
		    If AsteroidListbox.RowTagAt(Index) = BestAsteroid Then
		      AsteroidListbox.SelectedRowIndex = Index
		      Exit For
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Vaporize()
		  VaporizePushButton.Visible = False
		  Var VaporizedAsteroids As Integer
		  Var LastVaporizedAsteroid As Asteroid
		  Var MinAngle As Double = -1
		  
		  While VaporizedAsteroids < 200 And Asteroids.Count > 0
		    If BestAsteroid.Targets.KeyCount = 0 Then
		      DetectAsteroids
		    End If
		    
		    Var NextTargetKey As Double = 99
		    For Each Key As Variant In BestAsteroid.Targets.Keys
		      If Key > MinAngle And Key < NextTargetKey Then
		        NextTargetKey = Key
		      End If
		    Next
		    
		    MinAngle = NextTargetKey
		    LastVaporizedAsteroid = BestAsteroid.Targets.Value(NextTargetKey)
		    BestAsteroid.Targets.Remove(NextTargetKey)
		    Asteroids.RemoveRowAt(Asteroids.IndexOf(LastVaporizedAsteroid))
		    VaporizedAsteroids = VaporizedAsteroids + 1
		  Wend
		  
		  BetLabel.Value = "#200 asteroid location was X: " + _
		  Format(LastVaporizedAsteroid.Position.X, "#") + _
		  " Y: " + Format(LastVaporizedAsteroid.Position.Y, "#")
		  
		  RefreshAsteroidList
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Asteroids() As Asteroid
	#tag EndProperty

	#tag Property, Flags = &h0
		BestAsteroid As Asteroid
	#tag EndProperty

	#tag Property, Flags = &h0
		MapData As String
	#tag EndProperty


#tag EndWindowCode

#tag Events MonitoringCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawingColor = Color.Black
		  g.FillRectangle 0, 0, g.Width, g.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadMapPushButton
	#tag Event
		Sub Action()
		  LoadMap
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VaporizePushButton
	#tag Event
		Sub Action()
		  Vaporize
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
		Name="MapData"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
