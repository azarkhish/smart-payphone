Attribute VB_Name = "ErrorConstants"
Option Explicit
'-------------------Error Codes---------------------------------------------'
'General/Common Errors
Public Const G_ERR_APP_DEFINED_ERROR As Long = vbObjectError + 512 'Error deliberately raised by the application
Public Const G_ERR_APP_CODING_ERROR As Long = vbObjectError + 513 ' Error raised by app to signal improper interface usage
Public Const G_ERR_ADO_CONNECTIONFAILED As Long = -2147467259

'Truncated file' here''''''''''''''
