#tag Window
Begin ContainerControl CommunicationsContainerControl
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
   Begin PushButton LoadImagePushButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Load image"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   188
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
      Width           =   92
   End
   Begin Label ChecksumLabel
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
      Value           =   "Checksum: n/a"
      Visible         =   True
      Width           =   156
   End
   Begin Canvas ImageCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   60
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   True
      Visible         =   True
      Width           =   250
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function CalculateImageChecksum() As Integer
		  Var FewestZeroesCount As Integer = -1
		  Var LayerIndexWithFewestZeroes As Integer
		  Var Checksum As Integer
		  
		  For I As Integer = 0 To StringLayers.LastRowIndex
		    Var Layer As String = StringLayers(I)
		    Var Chars() As String = Layer.Split("")
		    Var Zeroes, One, Two As Integer
		    For Each Char As String In Chars
		      If Char = "0" Then Zeroes = Zeroes + 1
		      If Char = "1" Then One = One + 1
		      If Char = "2" Then Two = Two + 1
		    Next
		    
		    If FewestZeroesCount = -1 Or Zeroes < FewestZeroesCount Then
		      FewestZeroesCount = Zeroes
		      LayerIndexWithFewestZeroes = I
		      Checksum = One * Two
		    End If
		  Next
		  
		  Return Checksum
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateImageLayers()
		  Layers.RemoveAllRows
		  For Each StringLayer As String In StringLayers
		    Var LayerRows() As String = SplitLayerIntoRows(StringLayer)
		    Var LayerImage As New Picture(ImageWidth * 10, ImageHeight * 10)
		    Var g As Graphics = LayerImage.Graphics
		    
		    For Y As Integer = 0 To LayerRows.LastRowIndex
		      For X As Integer = 0 To LayerRows(Y).Length - 1
		        Var RowPixels() As String = LayerRows(Y).Split("")
		        Select Case RowPixels(X)
		        Case "0"
		          g.DrawingColor = Color.Black
		        Case "1"
		          g.DrawingColor = Color.White
		        Case "2"
		          g.DrawingColor = Color.Clear
		        End Select
		        
		        g.FillRectangle X * 10, Y * 10, 10, 10
		      Next
		    Next
		    
		    Layers.AddRow LayerImage
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SplitImageIntoStringLayers()
		  StringLayers.RemoveAllRows
		  Var PixelsPerLayer As Integer = ImageWidth * ImageHeight
		  
		  Var Image As String = ImageStr
		  While Image.Length >= PixelsPerLayer
		    Var Layer As String = Image.Left(PixelsPerLayer)
		    Image = Image.Right(Image.Length - PixelsPerLayer)
		    StringLayers.AddRow Layer
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SplitLayerIntoRows(LayerString As String) As String()
		  Var Result() As String
		  While LayerString.Length >= ImageWidth
		    Var Line As String = LayerString.Left(ImageWidth)
		    LayerString = LayerString.Right(LayerString.Length - ImageWidth)
		    Result.AddRow Line
		  Wend
		  
		  Return Result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ImageStr As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Layers() As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		StringLayers() As String
	#tag EndProperty


	#tag Constant, Name = ImageHeight, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ImageWidth, Type = Double, Dynamic = False, Default = \"25", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events LoadImagePushButton
	#tag Event
		Sub Action()
		  Var d As New CsvDialog
		  d.ShowModalWithin(Self.Window)
		  ImageStr = d.Csv
		  SplitImageIntoStringLayers
		  ChecksumLabel.Value = "Checksum: " + CalculateImageChecksum.ToString
		  CreateImageLayers
		  ImageCanvas.Invalidate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ImageCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  For I As Integer = Layers.LastRowIndex DownTo 0
		    Var Layer As Picture = Layers(I)
		    g.DrawPicture Layer, 0, 0, g.Width, g.Height, 0, 0, Layer.Width, Layer.Height
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
		Name="ImageStr"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
