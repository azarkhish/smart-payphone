VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Begin VB.Form frmSchedulling 
   Caption         =   "Connection Scheduller"
   ClientHeight    =   1965
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5010
   LinkTopic       =   "Form2"
   ScaleHeight     =   1965
   ScaleWidth      =   5010
   StartUpPosition =   3  'Windows Default
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
      Height          =   255
      Left            =   2640
      OleObjectBlob   =   "frmSchedulling.frx":0000
      TabIndex        =   5
      Top             =   240
      Width           =   855
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   255
      Left            =   2640
      OleObjectBlob   =   "frmSchedulling.frx":0066
      TabIndex        =   4
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2760
      TabIndex        =   3
      Top             =   1320
      Width           =   1575
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   360
      Top             =   360
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1560
      TabIndex        =   2
      Top             =   735
      Width           =   915
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1605
      TabIndex        =   1
      Top             =   195
      Width           =   915
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   1320
      Width           =   1575
   End
End
Attribute VB_Name = "frmSchedulling"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Timer1.Enabled = True
Me.Hide
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
    SetSkin frmSchedulling

Text1.Text = Hour(Now)
Text2.Text = Minute(Now)
End Sub

Private Sub Timer1_Timer()
If (Text1.Text = Hour(Now)) And (Text2.Text = Minute(Now)) Then
frmMain.Check1.Value = 1
Timer1.Enabled = False
End If
End Sub
