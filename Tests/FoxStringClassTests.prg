Define Class FoxStringClassTests As FxuTestCase Of FxuTestCase.prg
	#If .F.
		Local This As FoxStringClassTests Of FoxStringClassTests.prg
	#Endif
	icTestPrefix = "Test"
	cProcAct = ""
&& ======================================================================== &&
&& Function Setup
&& ======================================================================== &&
	Function Setup
		This.cProcAct = Set("Procedure")
		Set Path To "Src" Additive
		Do FoxStringClass.prg
	Endfunc
&& ======================================================================== &&
&& Function TearDown
&& ======================================================================== &&
	Function TearDown
		Local lcProcAct As String
		lcProcAct = This.cProcAct
		If Type("String") = "O"
			String = .Null.
		EndIf
		=DeleteAllStrings()
		Clear Class StringClass
		Release Procedure FoxStringClass
		If Not Empty(lcProcAct)
			Set Procedure To (lcProcAct)
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestObject
&& ======================================================================== &&
	Function TestObject
		If This.AssertNotNull(String, "Test Failed")
			This.MessageOut("String public object created successfully")
		Endif
	Endfunc
&& ======================================================================== &&
&& Function TestFormat
&& ======================================================================== &&
	Function TestFormat
		Local lcName As String, lnAge As Integer, ldBirthDate As Date
		lcName = "Irwin"
		lnAge = 34
		ldBirthDate = Date(1985, 11, 15)
		This.MessageOut(String.Format("Hi, my name is {1} and I'm {2} years old 'cause I was born in {3}", lcName, lnAge, ldBirthDate))
	Endfunc
&& ======================================================================== &&
&& Function TestFormatWithoutWilcard
&& ======================================================================== &&
	Function TestFormatWithoutWilcard
		Local lcResult as String
		lcResult = String.Format("Sample text without any wilcard!")
		This.MessageOut(lcResult)
	Endfunc
&& ======================================================================== &&
&& Function TestFormatShuffled
&& ======================================================================== &&
	Function TestFormatShuffled
		This.MessageOut(String.Format("{2} is bigger than {3} but lesser than {1}", 20, 15, 10))
	Endfunc
&& ======================================================================== &&
&& Function TestLength
&& ======================================================================== &&
	Function TestLength
		Local lcMyString As String
		lcMyString = NewString("My Sample String Variable")
		This.MessageOut("lcMyString.length() : " + Transform(lcMyString.length()))
	EndFunc
&& ======================================================================== &&
&& Function TestCharAt
&& ======================================================================== &&
	Function TestCharAt
		Local lcMyString As String
		lcMyString = NewString("My Sample String Variable")
		This.MessageOut("lcMyString.CharAt(18) : " + Transform(lcMyString.CharAt(18)))
	Endfunc
&& ======================================================================== &&
&& Function TestIndexOf
&& ======================================================================== &&
	Function TestIndexOf
		Local lcMyString As String
		lcMyString = NewString("My Sample String Variable")
		This.MessageOut("lcMyString.IndexOf('ia') : " + Transform(lcMyString.IndexOf("ia")))
	EndFunc
&& ======================================================================== &&
&& Function TestLastIndexOf
&& ======================================================================== &&
	Function TestLastIndexOf
		Local lcMyString As String
		lcMyString = NewString("This is instintive!")
		This.MessageOut("lcMyString.LastIndexOf('i') : " + Transform(lcMyString.LastIndexOf("i")))
	EndFunc
&& ======================================================================== &&
&& Function TestReplace
&& ======================================================================== &&
	Function TestReplace
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.Replace() : " + lcMyString.Replace("Hello", "Bye"))
	Endfunc
&& ======================================================================== &&
&& Function TestSubString
&& ======================================================================== &&
	Function TestSubString
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.SubString() : " + lcMyString.SubString(1, 5))
	Endfunc
&& ======================================================================== &&
&& Function TestToUpperCase
&& ======================================================================== &&
	Function TestToUpperCase
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.ToUpperCase() : " + lcMyString.ToUpperCase())
	Endfunc
&& ======================================================================== &&
&& Function TestToLowerCase
&& ======================================================================== &&
	Function TestToLowerCase
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.ToLowerCase() : " + lcMyString.ToLowerCase())
	Endfunc
&& ======================================================================== &&
&& Function TestEquals
&& ======================================================================== &&
	Function TestEquals
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.Equals() : " + Transform(lcMyString.Equals("Hello World!")))
	EndFunc
&& ======================================================================== &&
&& Function TestEqualsIgnoreCase
&& ======================================================================== &&
	Function TestEqualsIgnoreCase
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.EqualsIgnoreCase() : " + Transform(lcMyString.EqualsIgnoreCase("hello world!")))
	Endfunc
&& ======================================================================== &&
&& Function TestContains
&& ======================================================================== &&
	Function TestContains
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.Contains() : " + Transform(lcMyString.Contains("H")))
	EndFunc
&& ======================================================================== &&
&& Function TestTrim
&& ======================================================================== &&
	Function TestTrim
		Local lcMyString As String
		lcMyString = NewString("    --Hello World!--    ")
		This.MessageOut("lcMyString.Trim() : " + Transform(lcMyString.Trim()))
	EndFunc
&& ======================================================================== &&
&& Function TestStartsWith
&& ======================================================================== &&
	Function TestStartsWith
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.StartsWith() : " + Transform(lcMyString.StartsWith("H")))
	Endfunc
&& ======================================================================== &&
&& Function TestEndsWith
&& ======================================================================== &&
	Function TestEndsWith
		Local lcMyString As String
		lcMyString = NewString("Hello World!")
		This.MessageOut("lcMyString.EndsWith() : " + Transform(lcMyString.EndsWith("d!")))
	EndFunc
&& ======================================================================== &&
&& Function TestConcat
&& ======================================================================== &&
	Function TestConcat
		Local lcMyString As String
		lcMyString = NewString("Hello World")
		This.MessageOut("lcMyString.Concat() : " + Transform(lcMyString.Concat(" from FoxStringClass!")))
	EndFunc
&& ======================================================================== &&
&& Function TestIsEmpty
&& ======================================================================== &&
	Function TestIsEmpty
		Local lcMyString As String
		lcMyString = NewString("Hello World")
		This.MessageOut("lcMyString.IsEmpty() : " + Transform(lcMyString.IsEmpty()))
	EndFunc
&& ======================================================================== &&
&& Function TestMatches
&& ======================================================================== &&
	Function TestMatches
		Local lcMyString As String
		lcMyString = NewString("Hello World 123")
		This.MessageOut("lcMyString.Matches() : " + Transform(lcMyString.Matches("\w+\s\w+\d+")))
	Endfunc
&& ======================================================================== &&
&& Function TestVersion
&& ======================================================================== &&
	Function TestVersion
		This.MessageOut("The StringClass version is: " + String.Version)
	Endfunc
Enddefine