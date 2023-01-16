Attribute VB_Name = "ErrorHandlingSupport"
Option Explicit

Public Function FormatErrorDescription(strModuleName As String, strProcedureName As String, strErrorDescription As String) As String
    FormatErrorDescription = strErrorDescription & vbCrLf & _
                            strModuleName & "_" & strProcedureName
    
End Function
Public Sub ShowErrorMessage(ByVal strErrorMessage As String)
    MsgBox strErrorMessage, vbExclamation, "Attention"
End Sub
Public Sub ReportUnexpectedError(lngErrorNumber As Long, strErrorDescription As String)
    On Error Resume Next
    LogError lngErrorNumber, strErrorDescription
End Sub
Private Sub WriteLog(strLogInformation As String)
On Error GoTo Handle_Error
'Error Handling Data
    Const PROCEDURE_NAME As String = "WriteLog"

    Dim lngCurrentErrorNumber As Long
    Dim strCurrentErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    '=========================== Main Body ==========================='
    
    Dim objFSO As FileSystemObject
    Dim objTextStream As TextStream
    Dim strAppPath As String
    Dim strDirErrorPath As String
    Dim strFileName As String
    Dim strFilePath As String
    Dim MonthStamp As String
    Dim strErrorFolderName As String
    Dim strErrorFileName As String
    Dim strYearStamp As String
    
    strErrorFolderName = "Error Log"
    strErrorFileName = Trim$(App.ProductName)
    
    MonthStamp = ReturnMonthString(Month(Date))
    strYearStamp = CStr(Year(Date))
    
    Set objFSO = New FileSystemObject
    
    strAppPath = App.Path
    strDirErrorPath = strAppPath & "\" & strErrorFolderName
    strFileName = strErrorFileName & "_" & MonthStamp & "_" & strYearStamp & ".txt"
    strFilePath = strDirErrorPath & "\" & strFileName
    
    If Not objFSO.FolderExists(strDirErrorPath) Then
        objFSO.CreateFolder strAppPath & "\" & strErrorFolderName
    End If

    If Not objFSO.FileExists(strFilePath) Then
        Set objTextStream = objFSO.CreateTextFile(strFilePath, False)
        objTextStream.WriteLine "====== John Kamaus Software Error Log for " & _
                                App.ProductName & " for the month of " & _
                                ReturnMonthString(Month(Date)) & " for " & Year(Date) & "============="
    Else
        Set objTextStream = objFSO.OpenTextFile(strFilePath, ForAppending)
    End If
    
    With objTextStream
        .WriteBlankLines 1
        .WriteLine strLogInformation
        .WriteBlankLines 1
        .WriteLine "Operating System: " & GetWindowsVersion()
        .WriteLine String(100, "_")
        .Close
    End With
'======================== End of Main Body ======================='

Clean_Up:
    On Error Resume Next  'Assumption : Clean_up errors have
    'already been fully handled and reported in the Class Terminates
    'or they are as a result of an attempt to close an already
    'closed object
    Set objTextStream = Nothing
    Set objFSO = Nothing

Out:
    Exit Sub

Handle_Error:
    
    Resume Clean_Up
    
End Sub
Public Sub LogError(lngErrorNumber, strDescription)
On Error Resume Next

Dim strLogInfo As String
Dim strErrorNumber As String
Dim strErrorDescription As String
Dim strLogTime As String
Dim strLogDate As String

'=========================== Main Body ==========================='

    strLogTime = "Time: " & CStr(Time)
    strLogDate = "Date: " & CStr(Date)
    strErrorNumber = "Error Number: " & CStr(lngErrorNumber)
    strErrorDescription = "Error Description: " & strDescription
    
    strLogInfo = strLogDate & vbCrLf & strLogTime & vbCrLf & strErrorNumber & vbCrLf & strErrorDescription
    
    WriteLog strLogInfo
   

'======================== End of Main Body ======================='

End Sub
Public Function ReturnMonthString(Month As Integer) As String
'Returns the Name in text of the string specified, usefull
'especially using the Month() function.
    Select Case Month
        Case 1
            ReturnMonthString = "January"
        Case 2
            ReturnMonthString = "February"
        Case 3
            ReturnMonthString = "March"
        Case 4
            ReturnMonthString = "April"
        Case 5
            ReturnMonthString = "May"
        Case 6
            ReturnMonthString = "June"
        Case 7
            ReturnMonthString = "July"
        Case 8
            ReturnMonthString = "August"
        Case 9
            ReturnMonthString = "September"
        Case 10
            ReturnMonthString = "October"
        Case 11
            ReturnMonthString = "November"
        Case 12
            ReturnMonthString = "December"
        Case Else
            ReturnMonthString = "UnknownMonth"
    End Select
End Function
