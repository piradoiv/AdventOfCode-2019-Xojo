#tag Window
Begin Window MainWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   "2"
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   28663807
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Advent of Code 2019"
   Type            =   "0"
   Visible         =   True
   Width           =   600
   Begin MainAppToolbar AppToolbar
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
   Begin PagePanel AppPagePanel
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   400
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin FuelCalculatorContainerControl FuelCalculator
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
         Height          =   400
         InitialParent   =   "AppPagePanel"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   0
         Transparent     =   True
         Visible         =   True
         Width           =   600
      End
      Begin IntCodeComputerContainerControl Computer
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
         Height          =   400
         InitialParent   =   "AppPagePanel"
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   0
         Transparent     =   True
         Visible         =   True
         Width           =   600
      End
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events AppToolbar
	#tag Event
		Sub Open()
		  Me.FuelCalculatorToolItem.Tag = 0
		  Me.IntCodeComputerToolItem.Tag = 1
		  ToolbarButton(Me.FuelCalculatorToolItem).Pressed = True
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action(item As ToolItem)
		  AppPagePanel.SelectedPanelIndex = item.Tag
		End Sub
	#tag EndEvent
#tag EndEvents
