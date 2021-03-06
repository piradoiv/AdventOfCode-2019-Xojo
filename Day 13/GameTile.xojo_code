#tag Class
Protected Class GameTile
	#tag Method, Flags = &h0
		Sub Constructor(X As Integer, Y As Integer, Type As Types)
		  Position = New Point(X, Y)
		  Self.Type = Type
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TileTypeFromInteger(Type As Integer) As Types
		  Select Case Type
		  Case 1
		    Return Types.Wall
		  Case 2
		    Return Types.Block
		  Case 3
		    Return Types.HorizontalPaddle
		  Case 4
		    Return Types.Ball
		  Else
		    Return Types.Empty
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mType As Types
	#tag EndProperty

	#tag Property, Flags = &h0
		Position As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		Tile As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mType = value
			  Select Case value
			  Case Types.Ball
			    Tile = ballBlue
			  Case Types.Block
			    Var BlockTiles() As Picture = Array(blockBlue, blockGreen, blockPurple, blockRed, blockYellow)
			    BlockTiles.Shuffle
			    Tile = BlockTiles(0)
			  Case Types.HorizontalPaddle
			    Tile = paddleBlue
			  Case Types.Wall
			    Tile = blockGrey
			  Else
			    Tile = Nil
			  End Select
			End Set
		#tag EndSetter
		Type As Types
	#tag EndComputedProperty


	#tag Enum, Name = Types, Type = Integer, Flags = &h0
		Empty
		  Wall
		  Block
		  HorizontalPaddle
		Ball
	#tag EndEnum


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="mType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Types"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
