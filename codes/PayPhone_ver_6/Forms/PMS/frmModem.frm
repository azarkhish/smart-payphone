VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomct2.ocx"
Begin VB.Form frmModem 
   ClientHeight    =   10230
   ClientLeft      =   1305
   ClientTop       =   555
   ClientWidth     =   11400
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
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   10230
   ScaleWidth      =   11400
   WindowState     =   2  'Maximized
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   465
      Left            =   315
      TabIndex        =   3
      Top             =   585
      Width           =   780
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   825
      Left            =   1215
      TabIndex        =   2
      Top             =   5535
      Width           =   1275
      _ExtentX        =   2249
      _ExtentY        =   1455
      _Version        =   393216
      Format          =   52232193
      CurrentDate     =   38867
   End
   Begin MSComCtl2.MonthView MonthView1 
      Height          =   2370
      Left            =   2880
      TabIndex        =   1
      Top             =   1935
      Width           =   5010
      _ExtentX        =   8837
      _ExtentY        =   4180
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      Appearance      =   1
      StartOfWeek     =   52232193
      CurrentDate     =   38867
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "ÎÑæÌ"
      Height          =   555
      Left            =   4140
      TabIndex        =   0
      Top             =   7245
      Width           =   3120
   End
End
Attribute VB_Name = "frmModem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Base 1

Private Sub cmdExit_Click()
    ZOrder 1
End Sub


Private Sub Form_Resize()
On Error Resume Next

    With fraModem
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
    End With
End Sub
Private Sub Form_Load()
    SetSkin frmModem
    
End Sub

