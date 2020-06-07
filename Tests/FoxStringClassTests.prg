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
	Endfunc

&& ======================================================================== &&
&& Function TestVersion
&& ======================================================================== &&
	Function TestVersion
		This.MessageOut("The StringClass version is: " + String.Version)
	Endfunc
Enddefine