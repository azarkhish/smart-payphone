Attribute VB_Name = "SynergyAPI"
Option Explicit
'Module: SynergyAPI
'Author: J. Kamau
'Date: 12 Dec 2001
''''''''''''''Notes:'''''''''''''''''
'None right now
'
'''''''''''''''

Private Const M_MODULENAME = "SynergyAPI"
'Window Activation Constants
Private Const SW_HIDE = 0
Private Const SW_MAXIMIZE = 3
Private Const SW_MINIMIZE = 6
Private Const SW_NORMAL = 1
Private Const SW_RESTORE = 9
Private Const SW_SHOWMAXIMIZED = 3
Private Const SW_SHOWDEFAULT = 10
Private Const SW_SHOWMINIMIZED = 2
Private Const SW_SHOWMINNOACTIVE = 7
Private Const SW_SHOWNOACTIVATE = 4
Private Const SW_SHOWNA = 8
Private Const SW_SHOWNORMAL = 1
'Error Constants
Private Const ERROR_FILE_NOT_FOUND = 2&
Private Const ERROR_PATH_NOT_FOUND = 3&
Private Const ERROR_BAD_FORMAT = 11&
Private Const SE_ERR_ACCESSDENIED = 5
Private Const SE_ERR_ASSOCINCOMPLETE = 27
Private Const SE_ERR_DDEBUSY = 30
Private Const SE_ERR_DDEFAIL = 29
Private Const SE_ERR_DLLNOTFOUND = 32
Private Const SE_ERR_DDETIMEOUT = 28
Private Const SE_ERR_FNF = 2
Private Const SE_ERR_NOASSOC = 31
Private Const SE_ERR_OOM = 8
Private Const SE_ERR_PNF = 3
Private Const SE_ERR_SHARE = 26

Public Const MF_BYCOMMAND = &H0&
Public Const MF_BYPOSITION = &H400&

Public Const ERROR_NONE = 0
Public Const ERROR_BADDB = 1
Public Const ERROR_BADKEY = 2
Public Const ERROR_CANTOPEN = 3
Public Const ERROR_CANTREAD = 4
Public Const ERROR_CANTWRITE = 5
Public Const ERROR_OUTOFMEMORY = 6
Public Const ERROR_ARENA_TRASHED = 7
Public Const ERROR_ACCESS_DENIED = 8
Public Const ERROR_INVALID_PARAMETERS = 87
Public Const ERROR_NO_MORE_ITEMS = 259
'NotifyIconData Actions
Private Const NIM_ADD = &H0
Private Const NIM_DELETE = &H2
Private Const NIM_MODIFY = &H1
'Mouse move constants
Public Const WM_MOUSEMOVE = &H200
'Left-click constants.
Public Const WM_LBUTTONDBLCLK = &H203   'Double-click
Public Const WM_LBUTTONDOWN = &H201     'Button down
Public Const WM_LBUTTONUP = &H202       'Button up

'Right-click constants.
Public Const WM_RBUTTONDBLCLK = &H206   'Double-click
Public Const WM_RBUTTONDOWN = &H204     'Button down
Public Const WM_RBUTTONUP = &H205       'Button up
'The following constants are the flags that indicate the valid
'members of the NOTIFYICONDATA data type.
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4
'Local Constants
Private Const ERR_OUT_OF_MEMORY = 0
Private Const VER_PLATFORM_WIN32_NT = 2
Private Const VER_PLATFORM_WIN32_WINDOWS = 1
Private Const VER_PLATFORM_WIN32s = 0

'Browse for folder constants
Private Const BIF_RETURNONLYFSDIRS = 1
Private Const BIF_DONTGOBELOWDOMAIN = 2
Private Const BIF_RETURNFSANCESTORS = 8
Private Const BIF_USENEWUI = 11
Private Const MAX_PATH = 260
'End: Browse for folder constants


'******************Data Types******************
'-----------------SHBrowseForFolder data type-----------------
Private Type BrowseInfo
   hWndOwner      As Long
   pIDLRoot       As Long
   pszDisplayName As Long
   lpszTitle      As Long
   ulFlags        As Long
   lpfnCallback   As Long
   lParam         As Long
   iImage         As Long
End Type
'---------------------------------------------------
'-----------------Notify Icon Data type-------------
Private Type NOTIFYICONDATA
        cbSize As Long
        hwnd As Long
        uID As Long
        uFlags As Long
        uCallbackMessage As Long
        hIcon As Long
        szTip As String * 64
End Type
'---------------------------------------------------
'-----------------OS Version Data type-----------------
Private Type OSVERSIONINFO
        dwOSVersionInfoSize As Long
        dwMajorVersion As Long
        dwMinorVersion As Long
        dwBuildNumber As Long
        dwPlatformId As Long
        szCSDVersion As String * 128      '  Maintenance string for PSS usage
End Type
'---------------------------------------------------

'*************Private Declares********************
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Function SHBrowseForFolder Lib "shell32" (lpbi As BrowseInfo) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32" (ByVal pidList As Long, ByVal lpBuffer As String) As Long
Private Declare Function lstrcat Lib "kernel32" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
Private Declare Function UrlEscape Lib "Shlwapi.dll" Alias "UrlEscapeA" (ByVal pszURL As String, ByVal pszEscaped As String, ByVal pcchEscaped As String, ByVal dwFlags As String) As Long
'**************************************************
Public Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
'**************************************************



'*******************Wrapper Functions*************************

Public Function SynBrowseForFolder(ByVal lngwHandle As Long, ByVal strTitle As String) As String
On Error Resume Next
        'PURPOSE: The function displays a folder list and returns the path of the selected folder
        'INPUT: lngwHandle. This is the handle of the calling window
                'strTitle. The title of the displayed browse dialog
        'OUTPUT: The path of the selected folder
        
         Dim lpIDList As Long
         Dim sBuffer As String
         Dim szTitle As String
         Dim tBrowseInfo As BrowseInfo

        ' szTitle = "This is the title"
         With tBrowseInfo
            .hWndOwner = lngwHandle
            .lpszTitle = lstrcat(strTitle, "")
            .ulFlags = BIF_RETURNONLYFSDIRS '+ BIF_DONTGOBELOWDOMAIN + BIF_USENEWUI
         End With

         lpIDList = SHBrowseForFolder(tBrowseInfo)

         If (lpIDList) Then
            sBuffer = Space(MAX_PATH)
            SHGetPathFromIDList lpIDList, sBuffer
            sBuffer = Left(sBuffer, InStr(sBuffer, vbNullChar) - 1)
            SynBrowseForFolder = sBuffer
            'MsgBox sBuffer
         End If
End Function

Public Function SynGetWindowsVersion() As String
    On Error Resume Next
    Dim osv As OSVERSIONINFO
    Dim lngRetVal As Long
    Dim OSName As String
    Dim strWinVer As String
    
    osv.dwOSVersionInfoSize = Len(osv)
    lngRetVal = GetVersionEx(osv)
    
    If lngRetVal = 0 Then
        Err.Raise G_ERR_APP_DEFINED_ERROR, , "Failure attempting to fetch Operating System Information."
    End If
    
    Select Case osv.dwPlatformId
        Case VER_PLATFORM_WIN32_NT
            OSName = "Microsoft Windows NT"
            
        Case VER_PLATFORM_WIN32_WINDOWS
            If osv.dwMinorVersion = 0 Then
                OSName = "Micosoft Windows 95"
            Else
                OSName = "Microsoft Windows 98"
            End If
            
        Case VER_PLATFORM_WIN32s
            OSName = "Microsoft Windows 3.1"
    End Select
    
    strWinVer = OSName & " " & osv.dwMajorVersion & "." & _
                    osv.dwMinorVersion & " Build: " & _
                    osv.dwBuildNumber & " " & osv.szCSDVersion
    SynGetWindowsVersion = strWinVer
End Function

Public Function RemoveApplicationFromSystemTray(ByRef ParentWindow As Form)
    Dim lngRetVal As Long
    Dim udtNotifyIconData As NOTIFYICONDATA
          
    With udtNotifyIconData
        .cbSize = Len(udtNotifyIconData)
        .hIcon = ParentWindow.Icon
        .hwnd = ParentWindow.hwnd
        .uCallbackMessage = WM_MOUSEMOVE
        .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        .uID = vbNull
    End With
    lngRetVal = Shell_NotifyIcon(NIM_DELETE, udtNotifyIconData)
End Function

Public Function AddApplicationToSystemTray(ByRef ParentWindow As Form, Optional strToolTip As String) As Boolean
    Dim lngRetVal As Long
    Dim udtNotifyIconData As NOTIFYICONDATA
    
    If strToolTip = vbNullString Then
        strToolTip = ParentWindow.Caption
    End If
    
    'Check for size
    If Len(strToolTip) > 64 Then
        strToolTip = Left(strToolTip, 63)
    End If
    
    
    With udtNotifyIconData
        .cbSize = Len(udtNotifyIconData)
        .hIcon = ParentWindow.Icon
        .hwnd = ParentWindow.hwnd
        .szTip = strToolTip & vbNullChar
        .uCallbackMessage = WM_MOUSEMOVE
        .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        .uID = vbNull
    End With
    lngRetVal = Shell_NotifyIcon(NIM_ADD, udtNotifyIconData)
End Function

Private Function ShellExecuteErrorDescription(ReturnVal As Long) As String
'There are some common errors that occur when using ShellExecute
'This function returns an error description based on the REturnVal that shellExecute returned
    Select Case ReturnVal
        Case ERR_OUT_OF_MEMORY
            ShellExecuteErrorDescription = "Ugh! Out of Memory"
            
        Case ERROR_BAD_FORMAT
            ShellExecuteErrorDescription = "The .exe file is invalid (non-Win32® .exe or error in .exe image)."
            
        Case ERROR_PATH_NOT_FOUND
            ShellExecuteErrorDescription = "The specified path was not found."
            
        Case ERROR_FILE_NOT_FOUND
            ShellExecuteErrorDescription = "The specified file was not found."
            
        Case SE_ERR_ACCESSDENIED
            ShellExecuteErrorDescription = "The operating system denied access to the specified file. "
            
        Case SE_ERR_ASSOCINCOMPLETE
            ShellExecuteErrorDescription = "The file name association is incomplete or invalid."
            
        Case SE_ERR_DLLNOTFOUND
            ShellExecuteErrorDescription = "The specified dynamic-link library was not found. "
            
        Case SE_ERR_NOASSOC
            ShellExecuteErrorDescription = "There is no application associated with the given file name extension."
            
        Case SE_ERR_OOM
            ShellExecuteErrorDescription = "There was not enough memory to complete the operation."
            
        Case Else
            ShellExecuteErrorDescription = "Error Occurred While Attempting the operation."
            
    End Select
End Function

Public Function OpenDocument(ByRef ParentWindow As Long, ByVal strDocPath As String)
    On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Function OpenDocument"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    ' ============================ MAIN BODY ===========================
        
    Dim lngRetVal As Long
    
    lngRetVal = ShellExecute(ParentWindow, "open", strDocPath & vbNullChar, vbNullString, vbNullString, SW_SHOWNORMAL)
    
    If lngRetVal < 32 Then
        Err.Raise G_ERR_APP_DEFINED_ERROR, , ShellExecuteErrorDescription(lngRetVal)
    End If
    
    ' ============================ MAIN BODY ===========================
   
CleanUp:
    On Error Resume Next

Out:
    If Not blnInError Then
        Exit Function
    Else
        On Error GoTo 0
        
        Err.Raise lngErrorNumber, , strErrorDescription
    End If

Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
    End If

    Resume CleanUp
End Function

Public Function OpenURL(ByRef ParentWindow As Long, ByVal strURL As String)
    On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Function OpenURL"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    ' ============================ MAIN BODY ===========================
    Dim lngRetVal As Long
    
    If UCase$(Left$(strURL, 7)) <> UCase$("http://") And _
        UCase(Left$(strURL, 7)) <> UCase$("http:\\") And _
        UCase$(Left$(strURL, 6)) <> UCase$("ftp://") And _
        UCase$(Left$(strURL, 6)) <> UCase$("ftp:\\") Then
        'if http:// or ftp:// are not the first chars then assume it's http
        strURL = "http://" & strURL
    End If
    
    If Trim$(strURL) <> vbNullString Then
        lngRetVal = ShellExecute(ParentWindow, "open", strURL & vbNullChar, vbNullString, vbNullString, SW_SHOWMAXIMIZED)
    End If
    If lngRetVal < 32 Then
        Err.Raise G_ERR_APP_DEFINED_ERROR, , ShellExecuteErrorDescription(lngRetVal)
    End If
    
    ' ============================ MAIN BODY ===========================
   
CleanUp:
    On Error Resume Next

Out:
    If Not blnInError Then
        Exit Function
    Else
        On Error GoTo 0
        
        Err.Raise lngErrorNumber, , strErrorDescription
    End If

Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
    End If

    Resume CleanUp
    

End Function

Public Function OpenEmail(ByRef ParentWindow As Long, ByVal strRecipient As String, Optional ByVal varSubject As Variant, Optional ByVal varCCAddresses As Variant, Optional ByVal varBccAddresses As Variant, Optional ByVal varInitialBodyText As Variant)
    On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Function OpenEmail"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    ' ============================ MAIN BODY ===========================
    'Function will open the default email client application
    'and create an email with the variables presented.
    'Note: This function does not do any internet safety checks
    'for the variables given, you must do the conversion yourself.
    'E.g to convert the space " " char to the safe char (%20%)
    
    Dim lngRetVal As Long 'Return val of shellExecute
    Dim strMailtoText As String
    Dim strSeparator As String: strSeparator = "?" 'Separator for the mailto protocol parameters
    Dim lngURlEscapeRetVal As Long
    
    strMailtoText = "mailto:" & strRecipient
    
    If Not IsMissing(varSubject) Then
        strMailtoText = strMailtoText & "?subject=" & varSubject
        strSeparator = "&"
    End If
    
    If Not IsMissing(varCCAddresses) Then
        strMailtoText = strMailtoText & strSeparator & "CC=" & varCCAddresses
        strSeparator = "&"
    End If
    
    If Not IsMissing(varBccAddresses) Then
        strMailtoText = strMailtoText & strSeparator & "BCC=" & varBccAddresses
        strSeparator = "&"
    End If
    
    If Not IsMissing(varInitialBodyText) Then
        strMailtoText = strMailtoText & strSeparator & "body=" & varInitialBodyText
        strSeparator = "&"
    End If
    
    If Trim$(strRecipient) <> vbNullString Then
        lngRetVal = ShellExecute(ParentWindow, "open", strMailtoText & vbNullChar, vbNullString, vbNullString, SW_SHOWMAXIMIZED)
        If lngRetVal < 32 Then
            Err.Raise G_ERR_APP_DEFINED_ERROR, , ShellExecuteErrorDescription(lngRetVal)
        End If
    Else
        Err.Raise G_ERR_APP_DEFINED_ERROR, , "E-mail address not specified."
    End If
    
    ' ============================ MAIN BODY ===========================
   
CleanUp:
    On Error Resume Next

Out:
    If Not blnInError Then
        Exit Function
    Else
        On Error GoTo 0
        
        Err.Raise lngErrorNumber, , strErrorDescription
    End If

Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
    End If

    Resume CleanUp
    
End Function



