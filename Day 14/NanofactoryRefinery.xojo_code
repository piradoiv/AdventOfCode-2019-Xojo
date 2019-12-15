#tag Class
Protected Class NanofactoryRefinery
	#tag Method, Flags = &h0
		Function GetOreRequiredForMaterial(Name As String, Inventory As Dictionary = Nil) As Integer
		  If Inventory = Nil Then
		    Inventory = New Dictionary
		    For Each Entry As DictionaryEntry In Materials
		      Inventory.Value(Entry.Key) = New Stock(Entry.Value, 0)
		    Next
		  End If
		  
		  Var Material As Material = Materials.Value(Name)
		  Var Ore As Integer
		  For Each Entry As DictionaryEntry In Material.Requires
		    Var Req As Material = Entry.Key
		    Var Amount As Integer = Entry.Value
		    Var StockForRequirement As Stock = Inventory.Value(Material.Name)
		    If StockForRequirement.Amount > 0 Then
		      Var Retired As Integer = StockForRequirement.Amount - Amount
		      Amount = Amount - Retired
		      StockForRequirement.Amount = StockForRequirement.Amount - Max(0, Retired)
		      If Amount = 0 Then Continue
		    End If
		    
		    If Req.Name = "ORE" Then
		      StockForRequirement.Amount = StockForRequirement.Amount + Material.MinAmount - 1
		      Ore = Ore + Amount * Material.MinAmount
		      Continue
		    End If
		    
		    Ore = Ore + GetOreRequiredForMaterial(Req.Name, Inventory)
		  Next
		  
		  Return Ore
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize(Reactions As String)
		  Materials = New Dictionary
		  Var Ore As New Material("ORE", 1)
		  Materials.Value(Ore.Name) = Ore
		  
		  For Each Line As String In Reactions.Split(EndOfLine)
		    Var RequirementsAndResult() As String = Line.Split(" => ")
		    Var NameAndProduction() As String = RequirementsAndResult(1) _
		    .Trim.Split(" ")
		    
		    Var Name As String = NameAndProduction(1).Trim
		    Var MinAmount As Integer = NameAndProduction(0).Trim.ToInteger
		    Var m As New Material(Name, MinAmount)
		    m.Requires = New Dictionary
		    Materials.Value(Name) = m
		  Next
		  
		  For Each Line As String In Reactions.Split(EndOfLine)
		    Var RequirementsAndResult() As String = Line.Split(" => ")
		    Var NameAndProduction() As String = RequirementsAndResult(1) _
		    .Trim.Split(" ")
		    
		    Var Name As String = NameAndProduction(1).Trim
		    Var Material As Material = Materials.Value(Name)
		    For Each Req As String In RequirementsAndResult(0).Trim.Split(", ")
		      Var AmountName() As String = Req.Trim.Split(" ")
		      Var MaterialRequired As Material = Materials.Value(AmountName(1))
		      Material.Requires.Value(MaterialRequired) = AmountName(0)
		    Next
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Materials As Dictionary
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
