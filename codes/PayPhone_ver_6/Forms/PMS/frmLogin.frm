VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2595
   ClientLeft      =   5490
   ClientTop       =   4335
   ClientWidth     =   4560
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   RightToLeft     =   -1  'True
   ScaleHeight     =   2595
   ScaleWidth      =   4560
   ShowInTaskbar   =   0   'False
   Begin ACTIVESKINLibCtl.SkinLabel sknLbl 
      Height          =   555
      Left            =   173
      OleObjectBlob   =   "frmLogin.frx":0000
      TabIndex        =   6
      Top             =   120
      Width           =   4215
   End
   Begin VB.CommandButton cmdExit 
      Cancel          =   -1  'True
      Caption         =   "Œ—ÊÃ"
      Height          =   615
      Left            =   473
      TabIndex        =   3
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "Ê—Êœ »Â ”Ì” „"
      Default         =   -1  'True
      Height          =   615
      Left            =   2393
      TabIndex        =   2
      Top             =   1800
      Width           =   1695
   End
   Begin VB.TextBox txtPassword 
      Alignment       =   1  'Right Justify
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   600
      PasswordChar    =   "*"
      RightToLeft     =   -1  'True
      TabIndex        =   1
      Top             =   1320
      Width           =   2295
   End
   Begin MSDataListLib.DataCombo dtcUserName 
      Bindings        =   "frmLogin.frx":0095
      Height          =   315
      Left            =   600
      TabIndex        =   0
      Top             =   840
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   556
      _Version        =   393216
      ListField       =   "UserName"
      BoundColumn     =   "ID"
      Text            =   ""
      RightToLeft     =   -1  'True
      Object.DataMember      =   "cmdUsers"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin ACTIVESKINLibCtl.SkinLabel slbl 
      Height          =   255
      Index           =   0
      Left            =   3060
      OleObjectBlob   =   "frmLogin.frx":00A7
      TabIndex        =   4
      Top             =   840
      Width           =   1095
   End
   Begin ACTIVESKINLibCtl.SkinLabel slbl 
      Height          =   255
      Index           =   2
      Left            =   3060
      OleObjectBlob   =   "frmLogin.frx":0110
      TabIndex        =   5
      Top             =   1320
      Width           =   1095
   End
   Begin VB.Image imgBackGround 
      Height          =   2895
      Left            =   -840
      Picture         =   "frmLogin.frx":0179
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   5535
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEnter_Click()
On Error Resume Next
    With de.rscmdUsers
        If .State = adStateClosed Then .Open "Select * From Users", , adOpenKeyset, adLockOptimistic

        If .RecordCount = 0 Then
            MsgBox "»Â ⁄‰Ê«‰ «Ê·Ì‰ ﬂ«—»— »Â ”Ì” „ ŒÊ‘ ¬„œÌœ", vbOKOnly, "    Ê—Êœ »Â ”Ì” „ ò‰ —· „—ò“Ì "
            frmMain.Show
            Unload Me
            Exit Sub
        End If
    End With

    If Not (dtcUserName.MatchedWithList) Then
        MsgBox "·ÿ›√ ‰«„ Ìﬂ ﬂ«—»— —« «“ ·Ì”  «‰ Œ«» ﬂ‰Ìœ", vbOKOnly, "                     !!!Œÿ«"
        dtcUserName.SetFocus
        Exit Sub
    End If

    With de.rscmdUsers
        If .State = adStateClosed Then .Open "SELECT * FROM User"
        .MoveFirst
        .Find "UserName='" & VBA.Trim(dtcUserName.Text) & "'", 0, adSearchForward, 0

        If !Password = txtPassword.Text Then
            strSkinPath = App.Path & "\Scin\" & !SkinName
            FormSkin.LoadSkin strSkinPath
            UserId = dtcUserName.BoundText
            FormSkin.GetImages.SetHue !SkinColor, False
            UserNameSave = !UserName
            UserId = !ID

            SetUserAccessLevel !ID

            frmMain.Show

            Unload Me
        Else
            MsgBox "ﬂ·„Â —„“ ‰«œ—”  «”  . ·ÿ›√ œÊ»«—Â ”⁄Ì ﬂ‰Ìœ", vbOKOnly, "                      !!!Œÿ«"
            txtPassword.SetFocus
            txtPassword.SelStart = 0
            txtPassword.SelLength = Len(txtPassword.Text)
        End If
    End With
End Sub

Private Sub cmdExit_Click()
    End
End Sub


Private Sub dtcUserName_Change()
      txtPassword.SetFocus

End Sub

Private Sub Form_Load()
    SetSkin frmLogin
    
    With imgBackGround
        .Top = 0
        .Left = 0
        .Width = Width
        .Height = Height
    End With
End Sub
