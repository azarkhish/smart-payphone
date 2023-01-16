VERSION 5.00
Begin VB.MDIForm mfrmMain 
   BackColor       =   &H8000000C&
   Caption         =   "‰—„ «›“«— „œÌ—Ì   ·›‰Â«Ì Â„ê«‰Ì"
   ClientHeight    =   7815
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9015
   LinkTopic       =   "MDIForm1"
   Moveable        =   0   'False
   RightToLeft     =   -1  'True
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
End
Attribute VB_Name = "mfrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub MDIForm_Load()
'    SetSkin Me
End Sub

Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
'    If (MsgBox("¬Ì« „«Ì·Ìœ «“ ‰—„ «›“«— Œ«—Ã ‘ÊÌœø", vbYesNo, "                  !!!Â‘œ«—") = vbNo) Then
'        Cancel = True
'    End If
End Sub

Private Sub mnuConfig_Click()
    With frmBaseInformation
        .Show
        .ZOrder 0
    End With
End Sub

Private Sub mnuDataEntering_Click()
    With frmDataEntery
        .Show
        .ZOrder 0
    End With
End Sub

Private Sub mnuExit_Click()
    If (MsgBox("¬Ì« „«Ì·Ìœ «“ ‰—„ «›“«— Œ«—Ã ‘ÊÌœø", vbYesNo, "                  !!!Â‘œ«—") = vbYes) Then
        End
    End If
End Sub

Private Sub mnuMain_Click()
    With frmMain
        .Show
        .ZOrder 0
    End With
End Sub

Private Sub mnuMulti_Click()
    With frmDataEntery
        .Show
        frmDataEntery.sstData.Tab = 1
        ZOrder 0
    End With
End Sub

Private Sub mnuPassenger_Click()
    With frmDataEntery
        .Show
        frmDataEntery.sstData.Tab = 2
        ZOrder 0
    End With
End Sub

Private Sub mnuReports_Click()
    With frmReport
        .Show
        .ZOrder 0
    End With
End Sub

Private Sub mnuSearch_Click()
    With frmSearch
        .Show
        .ZOrder 0
    End With
End Sub

Private Sub smnuAbout_Click()
    With frmAbout
        .Show
        .ZOrder 0
    End With
End Sub

