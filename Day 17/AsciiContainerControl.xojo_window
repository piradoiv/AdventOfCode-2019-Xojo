#tag Window
Begin ContainerControl AsciiContainerControl
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
   Height          =   286
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
   Width           =   448
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   320
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
      Width           =   108
   End
   Begin IntCodeComputer AsciiComputer
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
   Begin TextArea AsciiTextArea
      AllowAutoDeactivate=   True
      AllowFocusRing  =   False
      AllowSpellChecking=   True
      AllowStyledText =   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Consolas for Powerline"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      Height          =   214
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   230
   End
   Begin TextField OriginalTextField
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
      Italic          =   False
      Left            =   262
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
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
      Top             =   52
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   166
   End
   Begin TextField AsciiTextField
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
      Italic          =   False
      Left            =   262
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   86
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   166
   End
   Begin PushButton PushButton1
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Bulk Input"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   320
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   246
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin TextArea TextArea1
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
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
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   114
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   262
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   166
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Reset()
		  AsciiTextArea.Value = ""
		  CurrentPosition = New Point
		  Tiles = New Dictionary
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Buffer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CharsAppeared() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentPosition As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Program As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Tiles As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events LoadProgramPushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.Csv = Program
		  d.Title = "Load program"
		  d.ShowModalWithin Self.Window
		  If d.Csv = "" Then Return
		  
		  Reset
		  Program = d.Csv
		  AsciiComputer.LoadProgram Program
		  AsciiComputer.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AsciiComputer
	#tag Event
		Sub Output(Message As Integer)
		  AsciiTextArea.AddText Chr(Message) + EndOfLine
		  
		  'Select Case Message
		  'Case 10
		  'CurrentPosition.Y = CurrentPosition.Y + 1
		  'CurrentPosition.X = -1
		  'Else
		  'CurrentPosition.X = CurrentPosition.X + 1
		  'End Select
		  '
		  'Var X, Y As Integer
		  'X = CurrentPosition.X
		  'Y = CurrentPosition.Y
		  'Var Key As String = X.ToString + "," + Y.ToString
		  '
		  'Tiles.Value(Key) = Chr(Message)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Finished()
		  Var Result As Integer
		  For Each TileEntry As DictionaryEntry In Tiles
		    Var KeyParts() As String = TileEntry.Key.StringValue.Split(",")
		    Var Pos As New Point(KeyParts(0).ToInteger, KeyParts(1).ToInteger)
		    Var Tile As String = TileEntry.Value
		    
		    Var X, Y As Integer
		    Var Key, North, South, West, East As String
		    
		    Var NorthPos As New Point(Pos.X, Pos.Y - 1)
		    Var SouthPos As New Point(Pos.X, Pos.Y + 1)
		    Var WestPos As New Point(Pos.X - 1, Pos.Y)
		    Var EastPos As New Point(Pos.X + 1, Pos.Y)
		    
		    For Each PositionToCheck As Point In Array(NorthPos, SouthPos, WestPos, EastPos)
		      X = PositionToCheck.X
		      Y = PositionToCheck.Y
		      Key = X.ToString + "," + Y.ToString
		      Var CurrentTile As String = Tiles.Lookup(Key, "?")
		      If CurrentTile <> "#" Then
		        Continue For TileEntry
		      End If
		    Next
		    
		    Result = Result + Pos.X * Pos.Y
		    AsciiTextArea.AddText Pos.X.ToString + "," + Pos.Y.ToString + EndOfLine
		  Next
		  
		  MessageDialog.Show Result.ToString
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OriginalTextField
	#tag Event
		Sub TextChange()
		  AsciiTextField.Value = ""
		  Var Chars() As String = OriginalTextField.Value.Split("")
		  Var Result As String
		  For Each Char As String In Chars
		    Result = Result + Asc(Char).ToString
		  Next
		  
		  AsciiTextField.Value = Result + "10"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Var BulkInput As String = TextArea1.Value
		  
		  For Each Line As String In BulkInput.Split(EndOfLine)
		    Var Chars() As String = Line.Trim.Split("")
		    For Each Char As String In Chars
		      AsciiComputer.AddInput Asc(Char)
		    Next
		    AsciiComputer.AddInput 10
		  Next
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
	#tag ViewProperty
		Name="Buffer"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
