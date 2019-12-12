#tag Class
Protected Class MathTests
Inherits UnitTest
	#tag Method, Flags = &h0
		Sub Constructor()
		  Tests.AddRow WeakAddressOf TestAngleToReturnsProperDegrees
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestAngleToReturnsProperDegrees()
		  Var SutAsteroid As New Asteroid(5, 5)
		  Var Target As New Asteroid(0, 0)
		  
		  Target.Position = New Point(5, 0)
		  AssertEquals 0, SutAsteroid.AngleTo(Target)
		  
		  Target.Position = New Point(10, 5)
		  AssertEquals 1.5707963267948966, SutAsteroid.AngleTo(Target)
		  
		  Target.Position = New Point(5, 10)
		  AssertEquals Asteroid.Pi, SutAsteroid.AngleTo(Target)
		  
		  Target.Position = New Point(0, 5)
		  AssertEquals 4.7123889803846897, SutAsteroid.AngleTo(Target)
		  
		  SutAsteroid.Position = New Point(11, 13)
		  Target.Position = New Point(1, 0)
		  AssertTrue(SutAsteroid.AngleTo(Target) > 0)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
