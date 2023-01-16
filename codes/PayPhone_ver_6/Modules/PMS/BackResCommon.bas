Attribute VB_Name = "BackResCommon"
Option Explicit

Public Const G_APPTITLE  As String = "Backup and Restore"

Public Sub DisableTextBox(ByRef objTextbox As VB.TextBox)
    objTextbox.Enabled = False
    objTextbox.BackColor = &H80000004
End Sub

Public Sub EnableTextBox(ByRef objTextbox As VB.TextBox)
    objTextbox.Enabled = True
    objTextbox.BackColor = vbWhite
End Sub

Public Sub StatusMessage(strMessage)
    formMain.stbMain.Panels("pnlMain").Text = strMessage
End Sub

Public Function RemoveWhiteSpace(strString As String) As String
    RemoveWhiteSpace = Replace(strString, " ", vbNullString)
End Function
