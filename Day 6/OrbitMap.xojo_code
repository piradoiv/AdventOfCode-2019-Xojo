#tag Class
Protected Class OrbitMap
	#tag Method, Flags = &h0
		Function Calculate() As Integer
		  If CachedTotalOrbitsAmount <> -1 Then Return CachedTotalOrbitsAmount
		  
		  Var Result As Integer
		  For Each Entry As DictionaryEntry In Finder
		    Var CurrentObject As SpaceObject = Entry.Value
		    Result = Result + CurrentObject.CountChilds
		  Next
		  
		  CachedTotalOrbitsAmount = Result
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalculateOrbitsBetween(Origin As SpaceObject, Destination As SpaceObject) As Integer
		  Var OrbitsCount As Integer
		  Var CommonParent As SpaceObject
		  
		  Var OriginParents() As SpaceObject = Origin.GetAllParents
		  Var DestinationParents() As SpaceObject = Destination.GetAllParents
		  Var CommonParents As New Dictionary
		  For Each Parent As SpaceObject In OriginParents
		    CommonParents.Value(Parent.Name) = Parent
		  Next
		  
		  For Each Parent As SpaceObject In DestinationParents
		    If Not CommonParents.HasKey(Parent.Name) Then Continue
		    CommonParent = Parent
		    Exit For
		  Next
		  
		  Var CurrentOriginParent As SpaceObject = Origin.Parent
		  Var CurrentDestinationParent As SpaceObject = Destination.Parent
		  
		  Do
		    If CurrentOriginParent <> CommonParent Then
		      CurrentOriginParent = CurrentOriginParent.Parent
		      OrbitsCount = OrbitsCount + 1
		    End If
		    
		    If CurrentDestinationParent <> CommonParent Then
		      CurrentDestinationParent = CurrentDestinationParent.Parent
		      OrbitsCount = OrbitsCount + 1
		    End If
		  Loop Until CurrentOriginParent = CurrentDestinationParent
		  
		  Return OrbitsCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMapData(MapData As String)
		  CachedTotalOrbitsAmount = -1
		  Finder = New Dictionary
		  Finder.Value("COM") = New SpaceObject("COM")
		  
		  For Each Line As String In MapData.Split(EndOfLine)
		    Var Objects() As String = Line.Split(")")
		    Var Parent As SpaceObject = Finder.Lookup(Objects(0), New SpaceObject(Objects(0)))
		    Var Child As SpaceObject = Finder.Lookup(Objects(1), New SpaceObject(Objects(1)))
		    Parent.Childs.AddRow Child
		    Child.Parent = Parent
		    Finder.Value(Objects(0)) = Parent
		    Finder.Value(Objects(1)) = Child
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CachedTotalOrbitsAmount As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		CenterOfMass As SpaceObject
	#tag EndProperty

	#tag Property, Flags = &h0
		Finder As Dictionary
	#tag EndProperty


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
	#tag EndViewBehavior
End Class
#tag EndClass
