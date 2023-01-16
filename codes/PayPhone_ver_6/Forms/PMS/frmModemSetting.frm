VERSION 5.00
Begin VB.Form frmModemSetting 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Modem Setting"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2505
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   2505
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check1 
      Caption         =   "ATN0 (Turn off  auto mode)"
      Height          =   195
      Left            =   180
      TabIndex        =   4
      Top             =   360
      Width           =   2265
   End
   Begin VB.CheckBox Check2 
      Caption         =   "ATB0 (V.22 Selected)"
      Height          =   195
      Left            =   180
      TabIndex        =   3
      Top             =   810
      Width           =   2265
   End
   Begin VB.CheckBox Check3 
      Caption         =   "ATS37=5 (1200 bps)"
      Height          =   195
      Left            =   180
      TabIndex        =   2
      Top             =   1350
      Width           =   2265
   End
   Begin VB.CheckBox Check4 
      Caption         =   "ATM0 (Mute Speaker)"
      Height          =   195
      Left            =   180
      TabIndex        =   1
      Top             =   1890
      Width           =   2265
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   465
      Left            =   630
      TabIndex        =   0
      Top             =   2520
      Width           =   1320
   End
End
Attribute VB_Name = "frmModemSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
SetData
Unload Me
End Sub

Private Sub Form_Load()
SetSkin Me
SetText
End Sub
Private Sub SetText()
    OpenRecordset de.rscmdModemSetting, "Select * From ModemSetting"
    With de.rscmdModemSetting
    Check1.Value = (!ATN0 And 1)
    Check2.Value = (!ATB0 And 1)
    Check3.Value = (!ATS37 And 1)
    Check4.Value = (!ATM0 And 1)
    
    End With


End Sub
Private Sub SetData()
    OpenRecordset de.rscmdModemSetting, "Select * From ModemSetting"
    With de.rscmdModemSetting
      !ATN0 = (Check1.Value And 1)
      !ATB0 = (Check2.Value And 1)
      !ATS37 = (Check3.Value And 1)
      !ATM0 = (Check4.Value And 1)
      .Update
    End With
End Sub
