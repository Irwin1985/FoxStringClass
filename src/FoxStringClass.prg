&& ======================================================================== &&
&& Name:    FoxStringClass.prg
&& Descrip: Provides a set of built-in function for string management
&& Author:  <Irwin Rodriguez> rodriguez.irwin@gmail.com
&& Version: 1.0.1
&& ======================================================================== &&
&& ======================================================================== &&
&& Default code snippet when user performs: do FoxStringClass.prg
&& ======================================================================== &&
Set Procedure To "FoxStringClass" Additive
If Type("String") = "U"
    PUBLIC String As StringClass
Endif
String = CreateObject("StringClass")
* Internal String counter.
If Type("_Screen.nStringSize") = "U"
    =AddProperty(_Screen, "nStringSize", 0)
Endif
* String pool.
If Type("_Screen.aStrings") = "U"
    =AddProperty(_Screen, "aStrings[1]", .Null.)
Endif
&& ======================================================================== &&
&& NewString.
&& ======================================================================== &&
Function NewString(tcString As Memo) As StringClass
    tcString = evl(tcString, "")
    _Screen.nStringSize = _Screen.nStringSize + 1
    Dimension _Screen.aStrings(_Screen.nStringSize)
    _Screen.aStrings[_Screen.nStringSize] = CreateObject("StringClass", tcString)
    Return _Screen.aStrings[_Screen.nStringSize]
EndFunc
&& ======================================================================== &&
&& DeleteAllStrings.
&& ======================================================================== &&
Function DeleteAllStrings() As Void
    For i = 1 To Alen(_Screen.aStrings, 1)
        loString = _Screen.aStrings[i]
        If Type("loString") = "O"
            loString.Destroy()
        Endif
    EndFor
    =RemoveProperty(_Screen, "nStringSize")
    =RemoveProperty(_Screen, "aStrings")
EndFunc
&& ======================================================================== &&
&& Class StringClass
&& ======================================================================== &&
Define Class StringClass As Custom
    Hidden lInternalAssignment
    lError    = .F.
    cErrorMsg = ""
    Version   = "1.0.1"
    Protected aParams[1]
    Hidden nParamCounter
    Hidden cString
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
    Function Init As Void
        lParameters tcString As String
        This.nParamCounter = 0
        This.cString = evl(tcString, "")
    EndFunc
&& ======================================================================== &&
&& Function Length
&& ======================================================================== &&
    Function Length As Integer
        Local lnLength As Integer
        lnLength = 0
        If Type("This.cString") = "C"
            lnLength = len(This.cString)
        Endif
        Return lnLength
    EndFunc
&& ======================================================================== &&
&& Function Format
&& ======================================================================== &&
    Function Format As String
        lParameters ;
        tcString As String, ;
        tvParam1 As Variant, ;
        tvParam2 As Variant, ;
        tvParam3 As Variant, ;
        tvParam4 As Variant, ;
        tvParam5 As Variant, ;
        tvParam6 As Variant, ;
        tvParam7 As Variant, ;
        tvParam8 As Variant, ;
        tvParam9 As Variant, ;
        tvParam10 As Variant
        Local lcResult As String
        lcResult = ""
        With This
            If !Empty(tcString)
                .nParamCounter = 0
                For i = 1 To 10
                    .IncrementArray()
                    .aParams[.nParamCounter] = evaluate("tvParam" + alltrim(str(i)))
                EndFor
                Return .ParseString(tcString)
            Endif
        Endwith
        Return lcResult
    EndFunc
&& ======================================================================== &&
&& Function CharAt
&& ======================================================================== &&
    Function CharAt As String
        lParameters tnIndex As Integer
        Return SubStr(This.cString, tnIndex, 1)
    EndFunc
&& ======================================================================== &&
&& Function IndexOf
&& ======================================================================== &&
    Function IndexOf As Integer
        lParameters tcExpressionSough As String
        Return At(tcExpressionSough, This.cString, 1)
    EndFunc
&& ======================================================================== &&
&& Function LastIndexOf
&& ======================================================================== &&
    Function LastIndexOf As Integer
        lParameters tcExpressionSough As String
        Return At(tcExpressionSough, This.cString, Occurs(tcExpressionSough, This.cString))
    EndFunc
&& ======================================================================== &&
&& Function Replace
&& ======================================================================== &&
    Function Replace As String
        lParameters tcExpressionSough As String, tcReplacement As String
        Return StrTran(This.cString, tcExpressionSough, tcReplacement)
    EndFunc
&& ======================================================================== &&
&& Function Equals
&& ======================================================================== &&
    Function Equals As Boolean
        lParameters tcExpressionSough As String
        Return This.cString == tcExpressionSough
    EndFunc
&& ======================================================================== &&
&& Function EqualsIgnoreCase
&& ======================================================================== &&
    Function EqualsIgnoreCase As Boolean
        lParameters tcExpressionSough As String
        Return lower(This.cString) == lower(tcExpressionSough)
    EndFunc
&& ======================================================================== &&
&& Function Contains
&& ======================================================================== &&
    Function Contains As Boolean
        lParameters tcExpressionSough As String
        Return At(tcExpressionSough, This.cString) > 0
    EndFunc
&& ======================================================================== &&
&& Function Trim
&& ======================================================================== &&
    Function Trim As String
        Return Alltrim(This.cString)
    EndFunc
&& ======================================================================== &&
&& Function StartsWith
&& ======================================================================== &&
    Function StartsWith As Boolean
        lParameters tcExpressionSough As String
        Return tcExpressionSough == Left(This.cString, len(tcExpressionSough))
    EndFunc
&& ======================================================================== &&
&& Function EndsWith
&& ======================================================================== &&
    Function EndsWith As Boolean
        lParameters tcExpressionSough As String
        Return tcExpressionSough == Right(This.cString, len(tcExpressionSough))
    EndFunc
&& ======================================================================== &&
&& Function Concat
&& ======================================================================== &&
    Function Concat As String
        lParameters tcExpressionSough As String
        Return This.cString + tcExpressionSough
    EndFunc
&& ======================================================================== &&
&& Function IsEmpty
&& ======================================================================== &&
    Function IsEmpty As Boolean
        Return Empty(This.cString)
    EndFunc
&& ======================================================================== &&
&& Function Matches
&& ======================================================================== &&
    Function Matches As String
        lParameters tcRegEx As String
        Local loRegEx As Object, llResult As Boolean
        loRegEx = CreateObject("VBScript.RegExp")
        loRegEx.Pattern = tcRegEx
        llResult = loRegEx.Test(This.cString)
        Release loRegEx
        Return llResult
    EndFunc
&& ======================================================================== &&
&& Function SubString
&& ======================================================================== &&
    Function SubString As String
        lParameters tnStartPosition As Integer, tnCharactersRetorned As Integer
        Local lcResStr As String
        lcResStr = ""
        tnCharactersRetorned = evl(tnCharactersRetorned, 0)
        If tnCharactersRetorned > 0
            lcResStr = SubStr(This.cString, tnStartPosition, tnCharactersRetorned)
        Else
            lcResStr = SubStr(This.cString, tnStartPosition)
        Endif
        Return lcResStr
    EndFunc
&& ======================================================================== &&
&& Function ToUpperCase
&& ======================================================================== &&
    Function ToUpperCase As String
        Return Upper(This.cString)
    EndFunc
&& ======================================================================== &&
&& Function ToLowerCase
&& ======================================================================== &&
    Function ToLowerCase As String
        Return Lower(This.cString)
    EndFunc
&& ======================================================================== &&
&& Hidden Function ParseString
&& ======================================================================== &&
    Hidden Function ParseString As Void
        lParameters tcString As String
        #Define OPEN_BRACKET "{"
        #Define CLOSE_BRACKET "}"

        Local lnTotal As Integer, lcReplaceStr As String, lcExtractedStr As String, lcFinalStr As String
        lnTotal = Occurs(OPEN_BRACKET, tcString)
        Store "" To lcReplaceStr, lcExtractedStr
        lcFinalStr = tcString
        If lnTotal > 0
            For i = 1 to lnTotal
                lcExtractedStr = StrExtract(tcString, OPEN_BRACKET, CLOSE_BRACKET, i)
                lcReplaceStr = OPEN_BRACKET + lcExtractedStr + CLOSE_BRACKET
                lcFinalStr = StrTran(lcFinalStr, lcReplaceStr, Transform(This.aParams[val(lcExtractedStr)]))
            EndFor
        Endif
        Return lcFinalStr
    EndFunc
&& ======================================================================== &&
&& Hidden Function IncrementArray
&& ======================================================================== &&
    Hidden Function IncrementArray As Void
        With This
            .nParamCounter = .nParamCounter + 1
            Dimension .aParams[.nParamCounter]
        Endwith
    EndFunc
&& ======================================================================== &&
&& Hidden Function SetErrorMsg
&& ======================================================================== &&
    Hidden Function SetErrorMsg As Void
        lParameters tnError As Integer, tcMsg As String
        With This
            .lInternalAssignment = .T.
            .lError = .T.
            .lInternalAssignment = .T.
            .cErrorMsg = "ERROR:" + Alltrim(Str(tnError)) + " - MENSAJE: " + tcMsg
        Endwith
    Endfunc
&& ======================================================================== &&
&& Function lError_Assign
&& ======================================================================== &&
    Function lError_Assign(vNewVal As Variant)
        With This
            If .lInternalAssignment
                .lInternalAssignment = .F.
                .lError = m.vNewVal
            Endif
        Endwith
    Endfunc
&& ======================================================================== &&
&& Function cErrorMsg_Assign
&& ======================================================================== &&
    Function cErrorMsg_Assign(vNewVal As Variant)
        With This
            If .lInternalAssignment
                .lInternalAssignment = .F.
                .cErrorMsg = m.vNewVal
            Endif
        Endwith
    Endfunc
&& ======================================================================== &&
&& Function Version_Assign
&& ======================================================================== &&
    Function Version_Assign(vNewVal As Variant)
        With This
            If .lInternalAssignment
                .lInternalAssignment = .F.
                .Version = m.vNewVal
            Endif
        Endwith
    Endfunc
EndDefine