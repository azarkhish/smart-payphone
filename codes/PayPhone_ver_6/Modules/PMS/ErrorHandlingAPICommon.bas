Attribute VB_Name = "ErrorHandlingAPICommon"
Option Explicit
'Module: ErrorHandlingAPICommon
'Author: J. Kamau
'Date: 08-03-2002
''''''''''''''Notes:'''''''''''''''''
'Contains any api functions used within the error handling procs.
'Error handling modules MUST be accompanied by this module.
'
'''''''''''''''
Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
'Local Constants
Private Const ERR_OUT_OF_MEMORY = 0
Private Const VER_PLATFORM_WIN32_NT = 2
Private Const VER_PLATFORM_WIN32_WINDOWS = 1
Private Const VER_PLATFORM_WIN32s = 0

Private Type OSVERSIONINFO
        dwOSVersionInfoSize As Long
        dwMajorVersion As Long
        dwMinorVersion As Long
        dwBuildNumber As Long
        dwPlatformId As Long
        szCSDVersion As String * 128      '  Maintenance string for PSS usage
End Type

Public Function GetWindowsVersion() As String
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
    GetWindowsVersion = strWinVer
End Function


