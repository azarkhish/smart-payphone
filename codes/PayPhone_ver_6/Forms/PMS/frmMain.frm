VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   ClientHeight    =   8865
   ClientLeft      =   2535
   ClientTop       =   1350
   ClientWidth     =   9375
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8865
   ScaleWidth      =   9375
   WindowState     =   2  'Maximized
   Begin VB.Frame fraMain 
      Height          =   4695
      Left            =   360
      TabIndex        =   0
      Top             =   1200
      Width           =   8775
      Begin VB.CommandButton cmdConnection 
         Caption         =   "������� ��� ��������"
         Height          =   615
         Left            =   5040
         TabIndex        =   9
         Top             =   2520
         Width           =   2415
      End
      Begin VB.CommandButton cmdExit 
         Cancel          =   -1  'True
         Caption         =   "����"
         Height          =   615
         Left            =   3300
         TabIndex        =   7
         Top             =   3420
         Width           =   2415
      End
      Begin VB.CommandButton cmdThemes 
         Caption         =   "������ �����"
         Height          =   615
         Left            =   1440
         TabIndex        =   6
         Top             =   2550
         Width           =   2415
      End
      Begin VB.CommandButton cmdRepairData 
         Caption         =   "����� �������"
         Height          =   615
         Left            =   6480
         TabIndex        =   5
         Top             =   4860
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.CommandButton cmdReports 
         Caption         =   "�������"
         Height          =   615
         Left            =   1440
         TabIndex        =   4
         Top             =   1800
         Width           =   2415
      End
      Begin VB.CommandButton cmdSearch 
         Caption         =   "�����"
         Height          =   615
         Left            =   5040
         TabIndex        =   3
         Top             =   1800
         Width           =   2415
      End
      Begin VB.CommandButton cmdEnterData 
         Caption         =   "���� �������"
         Height          =   615
         Left            =   1440
         TabIndex        =   2
         Top             =   1080
         Width           =   2415
      End
      Begin VB.CommandButton cmdConfig 
         Caption         =   "������� ����"
         Height          =   615
         Left            =   5040
         TabIndex        =   1
         Top             =   1080
         Width           =   2415
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel slbl 
      Height          =   675
      Left            =   1800
      OleObjectBlob   =   "frmMain.frx":030A
      TabIndex        =   8
      Top             =   360
      Width           =   6015
   End
   Begin MSComctlLib.StatusBar StatusMain 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   10
      Top             =   8550
      Width           =   9375
      _ExtentX        =   16536
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Text            =   "��� �����"
            TextSave        =   "��� �����"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Text            =   "���� ���� �� �����"
            TextSave        =   "���� ���� �� �����"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuNavigation 
      Caption         =   "������ �����"
      Begin VB.Menu mnuLogOff 
         Caption         =   "����� �����"
      End
      Begin VB.Menu mnuAccessLevel 
         Caption         =   "��� ������ �������"
      End
      Begin VB.Menu mnuChangeView 
         Caption         =   "����� ���� ��� �����"
         Begin VB.Menu mnuChangeFont 
            Caption         =   "����� ����"
         End
         Begin VB.Menu mnuChangeSkin 
            Caption         =   "����� ���� �����"
         End
      End
      Begin VB.Menu mnuExit 
         Caption         =   "����"
      End
   End
   Begin VB.Menu PayphoneSettings 
      Caption         =   "������� ���� ��"
      Begin VB.Menu BaseInfoSetting 
         Caption         =   "������� ����"
      End
      Begin VB.Menu TableSetting 
         Caption         =   "������� ����"
         Begin VB.Menu mnuCharging 
            Caption         =   "���� ����� ��"
         End
         Begin VB.Menu mnuChargeScheduller 
            Caption         =   "�������� ������� �� ��� ��"
         End
         Begin VB.Menu mnuDayType 
            Caption         =   "����� ��� ��� ��� ���"
         End
         Begin VB.Menu mnuFreeNum 
            Caption         =   "����� ��� �����"
         End
         Begin VB.Menu mnuPmsNum 
            Caption         =   "����� ��� ����� �ј��"
         End
         Begin VB.Menu mnuWhiteList 
            Caption         =   "���� ���� ���� ��"
         End
         Begin VB.Menu mnuBlackList 
            Caption         =   "���� ���� ���� ��"
         End
         Begin VB.Menu mnuMessage 
            Caption         =   "�� ��"
         End
         Begin VB.Menu MnuSamSetting 
            Caption         =   "SAM������� "
         End
         Begin VB.Menu mnuRepair 
            Caption         =   "������� ����"
         End
         Begin VB.Menu mnuPhoneStation 
            Caption         =   "���� ��� ��� ���"
         End
      End
      Begin VB.Menu mnuRegInPhoneFile 
         Caption         =   "��� �� ��ʐ�� ����"
      End
   End
   Begin VB.Menu mnuDataManagement 
      Caption         =   "������ �������"
      Begin VB.Menu mnuSearch 
         Caption         =   "�����"
         Begin VB.Menu mnuPhoneCall 
            Caption         =   "������"
            Begin VB.Menu mnuPhoneCallAll 
               Caption         =   "���"
            End
            Begin VB.Menu mnuPhoneCallOne 
               Caption         =   "�����"
            End
         End
         Begin VB.Menu mnuOtherEvent 
            Caption         =   "��������� ���"
            Begin VB.Menu mnuOtherEventAll 
               Caption         =   "���"
            End
            Begin VB.Menu mnuOtherEventOne 
               Caption         =   "�����"
            End
         End
         Begin VB.Menu mnuRepaire 
            Caption         =   "������� ����"
            Begin VB.Menu mnuRepaireAll 
               Caption         =   "���"
            End
            Begin VB.Menu mnuRepaireOne 
               Caption         =   "�����"
            End
         End
      End
      Begin VB.Menu mnuReports 
         Caption         =   "�������"
      End
   End
   Begin VB.Menu mnuDataBase 
      Caption         =   "��� ��������"
      Begin VB.Menu mnuBackup 
         Caption         =   "���� �������(Backup)"
      End
      Begin VB.Menu mnuRestore 
         Caption         =   "������� ���(Restore)"
      End
      Begin VB.Menu mnuExport 
         Caption         =   "Export table"
      End
      Begin VB.Menu mnuImport 
         Caption         =   "Import Table"
      End
   End
   Begin VB.Menu Help 
      Caption         =   "Help"
      Begin VB.Menu HelpIndex 
         Caption         =   "�������"
      End
      Begin VB.Menu About 
         Caption         =   "About"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub About_Click()
frmAbout.Show
End Sub

Private Sub BaseInfoSetting_Click()
    With frmBaseInformation
        .Show
        .ZOrder 0
    End With

End Sub

Private Sub cmdConfig_Click()
    With frmBaseInformation
        .Show
        .ZOrder 0
    End With
End Sub

Private Sub cmdConnection_Click()
    
    With formMain
        .Show
        .ZOrder 0
    End With
End Sub
Private Sub cmdEnterData_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
    End With
End Sub
Private Sub cmdExit_Click()
    If (MsgBox("��� ������ �� ��� ����� ���� ���Ͽ", vbYesNo, "                  !!!�����") = vbYes) Then
        With de.cnnTelephone
              If (.State = adStateOpen) Then .Close
        End With
     
        End
    End If
      
End Sub
Private Sub cmdReports_Click()
    With frmReport
        .Show
        .ZOrder 0
    End With
End Sub
Private Sub cmdSearch_Click()
    With frmSearch
        .Show
        .ZOrder 0
    End With
End Sub
Private Sub cmdThemes_Click()
   With frmConfig
        .Show
        .ZOrder 0
   End With
End Sub




Private Sub Form_Load()
    SetSkin frmMain
StatusMain.Panels(1).Text = UserNameSave
StatusMain.Panels(4).Text = Time

End Sub
Private Sub Form_Resize()
On Error Resume Next

    With fraMain
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
    End With
    
    slbl.Left = (Width - slbl.Width) / 2
End Sub




Private Sub mnuAccessLevel_Click()
    With frmConfig
        .Show
        .ZOrder 0
        .sstBaseInformation.Tab = 0
    End With

End Sub

Private Sub mnuBackup_Click()
    
    With formMain
        .Show
        .ZOrder 0
        .SSTab1.Tab = 0
        
            .fraSQLBackup.Visible = True
            .fraSQLRestore.Visible = False
            .optOperation(0).Value = True
    End With

End Sub

Private Sub mnuBlackList_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 1
    End With

End Sub

Private Sub mnuChangeFont_Click()
    With frmConfig
        .Show
        .ZOrder 0
        .sstBaseInformation.Tab = 1
    End With

End Sub

Private Sub mnuChangeSkin_Click()
    With frmConfig
        .Show
        .ZOrder 0
        .sstBaseInformation.Tab = 2
    End With

End Sub

Private Sub mnuChargeScheduller_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 10
    End With
End Sub

Private Sub mnuCharging_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 3
    End With
End Sub

Private Sub mnuDayType_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 11
    End With
End Sub

Private Sub mnuExit_Click()
    If (MsgBox("��� ������ �� ��� ����� ���� ���Ͽ", vbYesNo, "                  !!!�����") = vbYes) Then
        With de.cnnTelephone
              If (.State = adStateOpen) Then .Close
        End With
     
        End
    End If
End Sub

Private Sub mnuExport_Click()
    With formMain
        .Show
        .ZOrder 0
        .SSTab1.Tab = 1
    End With

End Sub

Private Sub mnuFreeNum_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 2
    End With
End Sub

Private Sub mnuLogOff_Click()
    If (MsgBox("��� ������� ����� �� ����� ����Ͽ", vbYesNo, "                  !!!�����") = vbYes) Then
    frmConfig.cmdChangeUser.Value = True
End If
End Sub

Private Sub mnuMessage_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 4
    End With
End Sub

Private Sub mnuOtherEventAll_Click()
    With frmSearch
        .Show
        .ZOrder 0
        .sstSearch.Tab = 2
    End With

End Sub

Private Sub mnuOtherEventOne_Click()
    With frmSearch
        .Show
        .ZOrder 0
        .sstSearch.Tab = 5
    End With

End Sub

Private Sub mnuPhoneCallAll_Click()
    With frmSearch
        .Show
        .ZOrder 0
        .sstSearch.Tab = 0
    End With

End Sub

Private Sub mnuPhoneCallOne_Click()
    With frmSearch
        .Show
        .ZOrder 0
        .sstSearch.Tab = 3
    End With

End Sub

Private Sub mnuPhoneStation_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 5
    End With

End Sub

Private Sub mnuPmsNum_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 0
    End With
End Sub

Private Sub mnuRegInPhoneFile_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 7
    End With

End Sub

Private Sub mnuRepair_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 6
    End With
End Sub

Private Sub mnuRepaireAll_Click()
    With frmSearch
        .Show
        .ZOrder 0
        .sstSearch.Tab = 1
    End With

End Sub

Private Sub mnuRepaireOne_Click()
    With frmSearch
        .Show
        .ZOrder 0
        .sstSearch.Tab = 4
    End With

End Sub

Private Sub mnuReports_Click()
    With frmReport
        .Show
        .ZOrder 0
    End With

End Sub

Private Sub mnuRestore_Click()
    
    With formMain
        .Show
        .ZOrder 0
        .SSTab1.Tab = 0
        
            .fraSQLBackup.Visible = False
            .fraSQLRestore.Visible = True
            .optOperation(1).Value = True
    End With
End Sub

Private Sub MnuSamSetting_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 9
    End With
End Sub

Private Sub mnuWhiteList_Click()
    With frmDataEntry
        .Show
        .ZOrder 0
        .sstDataEntry.Tab = 8
    End With
End Sub

