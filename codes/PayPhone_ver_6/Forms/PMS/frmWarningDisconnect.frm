VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Begin VB.Form frmWarningDisconnect 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Warning"
   ClientHeight    =   840
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2910
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   840
   ScaleWidth      =   2910
   StartUpPosition =   2  'CenterScreen
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   285
      Left            =   675
      OleObjectBlob   =   "frmWarningDisconnect.frx":0000
      TabIndex        =   2
      Top             =   90
      Width           =   1680
   End
   Begin VB.CommandButton Command2 
      Caption         =   "No"
      Height          =   285
      Left            =   1665
      TabIndex        =   1
      Top             =   495
      Width           =   1005
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Yes"
      Height          =   285
      Left            =   270
      TabIndex        =   0
      Top             =   495
      Width           =   1005
   End
End
Attribute VB_Name = "frmWarningDisconnect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
frmMain.chkDCLine(Val(frmWarningDisconnect.Tag)).Value = 1
Unload Me
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
SetSkin Me
End Sub
