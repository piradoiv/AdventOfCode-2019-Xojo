#tag Window
Begin ContainerControl IntCodeComputerContainerControl
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
   Height          =   434
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
   Begin Label MemoryLabel
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
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   "Memory:"
      Visible         =   True
      Width           =   453
   End
   Begin Listbox MemoryListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "60,*"
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
      Height          =   154
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Address	Value"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   53
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   152
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton StartPushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Start"
      Default         =   False
      Enabled         =   False
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
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   254
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin ProgressWheel RunningProgressWheel
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   16
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   564
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   394
      Transparent     =   False
      Visible         =   False
      Width           =   16
   End
   Begin PushButton FromCSVPushButton
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
      Left            =   464
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   116
   End
   Begin TextField DesiredOutputTextField
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
      Hint            =   "Leave blank if not needed"
      Index           =   -2147483648
      Italic          =   False
      Left            =   132
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   218
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   448
   End
   Begin Label DesiredOutputLabel
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   219
      Transparent     =   False
      Underline       =   False
      Value           =   "Desired output:"
      Visible         =   True
      Width           =   100
   End
   Begin Thread BackgroundThread
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
   End
   Begin TextArea OutputTextArea
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
      Height          =   128
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
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   286
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Value           =   ""
      Visible         =   True
      Width           =   560
   End
   Begin PushButton StartAndResetPushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Start and Reset"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   254
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   125
   End
   Begin PushButton ClearOutputPushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear output"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   485
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   "0"
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   254
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   95
   End
   Begin Listbox DisassembleListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   6
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
      Height          =   154
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Address	Code	Instruction	Noun	Verb	Address"
      Italic          =   False
      Left            =   184
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   "0"
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   53
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   396
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function BuildComputerWithMemory(FromMemory() As Integer) As IntCodeComputer
		  Var Result As New IntCodeComputer
		  AddHandler Result.InputRequired, WeakAddressOf HandleInputRequired
		  AddHandler Result.Output, WeakAddressOf HandleOutput
		  Result.Memory = FromMemory
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disassemble()
		  Var ModeSymbols() As String = Array("p", "d", "r", "", "", "", "", "", "", "")
		  
		  Var PreviousSelectedAddress As Integer = -1
		  If DisassembleListbox.SelectedRowCount = 1 Then
		    PreviousSelectedAddress = DisassembleListbox.CellValueAt(DisassembleListbox.SelectedRowIndex, 0).ToInteger
		  End If
		  
		  DisassembleListbox.RemoveAllRows
		  
		  Var Address As Integer
		  While Address < Memory.LastRowIndex
		    Var OriginAddress As Integer = Address
		    Var Noun, Verb, Output As Integer
		    Var NounMode, VerbMode, OutputMode As String
		    Var NounStr, VerbStr, OutputStr As String
		    Var Instruction As String
		    Var Help As String = ""
		    
		    Var Code As String = Memory(Address).ToString
		    While Code.Length < 5
		      Code = "0" + Code
		    Wend
		    
		    OutputMode = ModeSymbols(Code.Left(1).ToInteger)
		    VerbMode = ModeSymbols(Code.Left(2).Right(1).ToInteger)
		    NounMode = ModeSymbols(Code.Left(3).Right(1).ToInteger)
		    
		    Select Case Code.Right(2).ToInteger
		    Case 1
		      Instruction = "SUM"
		      Help = "Sum two numbers"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Verb = Address + 2
		      VerbStr = VerbMode + Verb.ToString
		      Output = Address + 3
		      OutputStr = OutputMode + Output.ToString
		      Address = Address + 4
		    Case 2
		      Instruction = "MUL"
		      Help = "Multiply two numbers"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Verb = Address + 2
		      VerbStr = VerbMode + Verb.ToString
		      Output = Address + 3
		      OutputStr = OutputMode + Output.ToString
		      Address = Address + 4
		    Case 3
		      Instruction = "INP"
		      Help = "Input required"
		      Output = Address + 1
		      OutputStr = OutputMode + Output.ToString
		      Address = Address + 2
		    Case 4
		      Instruction = "OUT"
		      Help = "Output"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Address = Address + 2
		    Case 5
		      Instruction = "JMT"
		      Help = "Jump if noun is not zero"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Verb = Address + 2
		      VerbStr = VerbMode + Verb.ToString
		      Address = Address + 3
		    Case 6
		      Instruction = "JMF"
		      Help = "Jump if noun is zero"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Verb = Address + 2
		      VerbStr = VerbMode + Verb.ToString
		      Address = Address + 3
		    Case 7
		      Instruction = "LES"
		      Help = "Check if noun is less than verb"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Verb = Address + 2
		      VerbStr = VerbMode + Verb.ToString
		      Output = Address + 3
		      OutputStr = OutputMode + Output.ToString
		      Address = Address + 4
		    Case 8
		      Instruction = "EQU"
		      Help = "Check if noun is equals to verb"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Verb = Address + 2
		      VerbStr = VerbMode + Verb.ToString
		      Output = Address + 3
		      OutputStr = OutputMode + Output.ToString
		      Address = Address + 4
		    Case 9
		      Instruction = "REL"
		      Help = "Modify the relative base"
		      Noun = Address + 1
		      NounStr = NounMode + Noun.ToString
		      Address = Address + 2
		    Case 99
		      Instruction = "END"
		      Help = "Terminate the program"
		      Address = Address + 1
		    Else
		      Instruction = ""
		      Address = Address + 1
		    End Select
		    
		    DisassembleListbox.AddRow OriginAddress.ToString, Code, Instruction, NounStr, VerbStr, OutputStr
		    DisassembleListbox.CellTooltipAt(DisassembleListbox.LastRowIndex, 2) = Help
		    If OriginAddress = PreviousSelectedAddress Then
		      DisassembleListbox.SelectedRowIndex = DisassembleListbox.LastRowIndex
		    End If
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindResultForDesiredOutput(DesiredOutput As Integer) As Integer()
		  Var Noun As Integer
		  Var Verb As Integer
		  Var Success As Boolean = False
		  For Noun = 0 To 99
		    For Verb = 0 To 99
		      Var TempMemory() As Integer = GetMemoryCopy(Memory)
		      TempMemory(1) = Noun
		      TempMemory(2) = Verb
		      Computer = BuildComputerWithMemory(TempMemory)
		      Try
		        Computer.Run
		        If Computer.Memory(0) = DesiredOutputTextField.Value.Val Then
		          Exit For Noun
		        End If
		      Catch E As RuntimeException
		        Continue
		      End Try
		    Next
		  Next
		  
		  Var Result() As Integer = Array(Noun, Verb)
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMemoryCopy(FromMemory() As Integer) As Integer()
		  Var Result() As Integer
		  For I As Integer = 0 To FromMemory.Count - 1
		    Result.AddRow FromMemory(I)
		  Next
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleFinishedEvent(Sender As IntCodeComputer)
		  RunningProgressWheel.Visible = False
		  RefreshMemory
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleInputRequired(Sender As IntCodeComputer)
		  Var d As New InputDialog
		  d.ShowModalWithin(Self.Window)
		  Var InputMessage As Integer = d.InputMessage.Val
		  OutputTextArea.AddText "< " + d.InputMessage + EndOfLine
		  Computer.AddInput InputMessage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleOutput(Sender As IntCodeComputer, Message As Integer)
		  OutputTextArea.AddText "> " + Message.ToString + EndOfLine
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProgramFromCsv(csv As String)
		  PreviousCsv = csv
		  Memory.RemoveAllRows
		  For Each Line As String In csv.Split(",")
		    Memory.AddRow Line.Val
		  Next
		  
		  RefreshMemory
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshMemory()
		  MemoryListbox.RemoveAllRows
		  For I As Integer = 0 To Memory.Count - 1
		    MemoryListbox.AddRow I.ToString, Memory(I).ToString
		    MemoryListbox.CellTypeAt(I, 1) = Listbox.CellTypes.TextField
		  Next
		  
		  StartPushButton.Enabled = Memory.Count > 0
		  StartAndResetPushButton.Enabled = Memory.Count > 0
		  Disassemble
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunComputer()
		  #Pragma BreakOnExceptions False
		  RunningProgressWheel.Visible = True
		  Var RunJustOnce As Boolean = DesiredOutputTextField.Value.Trim = ""
		  
		  If RunJustOnce Then
		    RunComputerOnce
		  Else
		    Var TempMemory() As Integer = GetMemoryCopy(Memory)
		    Var Result() As Integer = FindResultForDesiredOutput(DesiredOutputTextField.Value.Val)
		    RunningProgressWheel.Visible = False
		    Memory = TempMemory
		    Memory(1) = Result(0)
		    Memory(2) = Result(1)
		    DesiredOutputTextField.Value = ""
		    RefreshMemory
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunComputerOnce()
		  Try
		    Computer = BuildComputerWithMemory(Memory)
		    AddHandler Computer.Finished, WeakAddressOf HandleFinishedEvent
		    Computer.Run
		  Catch E As OutOfBoundsException
		    MessageDialog.Show "The memory address is beyond the limits."
		  Catch E As RuntimeException
		    MessageDialog.Show "The computer has encountered an invalid opcode and must stop its execution:" + _
		    EndOfLine + E.Message
		  End Try
		  
		  HandleFinishedEvent(Computer)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Computer As IntCodeComputer
	#tag EndProperty

	#tag Property, Flags = &h0
		Memory() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviousCsv As String
	#tag EndProperty


#tag EndWindowCode

#tag Events MemoryListbox
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Memory(row) = Me.CellValueAt(row, column).Val
		  Disassemble
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  g.DrawingColor = If(row Mod 2 = 0, Palette.CellAlternateBackground, Color.White)
		  g.FillRectangle 0, 0, g.Width, g.Height
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events StartPushButton
	#tag Event
		Sub Action()
		  RunComputer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FromCSVPushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.Csv = PreviousCsv
		  d.ShowModalWithin(Self.Window)
		  If d.Csv = "" Then Return
		  LoadProgramFromCsv(d.Csv)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BackgroundThread
	#tag Event
		Sub Run()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() as Dictionary)
		  Var Result As Dictionary = data(data.LastRowIndex)
		  Memory = Result.Value("memory")
		  RefreshMemory
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartAndResetPushButton
	#tag Event
		Sub Action()
		  RunComputer
		  LoadProgramFromCsv(PreviousCsv)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClearOutputPushButton
	#tag Event
		Sub Action()
		  OutputTextArea.Value = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DisassembleListbox
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  g.DrawingColor = If(row Mod 2 = 0, Palette.CellAlternateBackground, Color.White)
		  g.FillRectangle 0, 0, g.Width, g.Height
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  Var Address As Integer = Me.CellValueAt(Me.SelectedRowIndex, 0).ToInteger
		  MemoryListbox.SelectedRowIndex = Address
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
		Name="PreviousCsv"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
