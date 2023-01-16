VERSION 5.00
Begin VB.Form formSqlDBInfo 
   Caption         =   "«ÿ·«⁄«  »«‰ò"
   ClientHeight    =   5175
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7050
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5175
   ScaleWidth      =   7050
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtCreateDate 
      BackColor       =   &H80000000&
      Height          =   315
      Left            =   2235
      Locked          =   -1  'True
      TabIndex        =   20
      Top             =   465
      Width           =   2205
   End
   Begin VB.TextBox txtFiles 
      BackColor       =   &H80000000&
      Height          =   1065
      Left            =   2235
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   16
      Top             =   3990
      Width           =   3555
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Œ—ÊÃ"
      Height          =   315
      Left            =   5850
      TabIndex        =   14
      Top             =   4770
      Width           =   1185
   End
   Begin VB.TextBox txtDBOwner 
      BackColor       =   &H80000000&
      Height          =   300
      Left            =   2235
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   3660
      Width           =   1335
   End
   Begin VB.TextBox txtIndexSpaceUsed 
      BackColor       =   &H80000000&
      Height          =   300
      Left            =   2235
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   3330
      Width           =   855
   End
   Begin VB.TextBox txtMemoryUse 
      BackColor       =   &H80000000&
      Height          =   1380
      Left            =   2235
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   11
      Top             =   1800
      Width           =   4365
   End
   Begin VB.TextBox txtPrimaryFilePath 
      BackColor       =   &H80000000&
      Height          =   300
      Left            =   2235
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   10
      Top             =   1470
      Width           =   4365
   End
   Begin VB.TextBox txtDataSpaceUsed 
      BackColor       =   &H80000000&
      Height          =   300
      Left            =   2235
      Locked          =   -1  'True
      TabIndex        =   9
      Top             =   1140
      Width           =   825
   End
   Begin VB.TextBox txtCurrentSize 
      BackColor       =   &H80000000&
      Height          =   300
      Left            =   2235
      Locked          =   -1  'True
      TabIndex        =   8
      Top             =   810
      Width           =   825
   End
   Begin VB.TextBox txtDBName 
      BackColor       =   &H80000000&
      Height          =   300
      Left            =   2220
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   135
      Width           =   4260
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   165
      Picture         =   "formSqlDBInfo.frx":0000
      Top             =   285
      Width           =   480
   End
   Begin VB.Label Label12 
      Caption         =   "“„«‰ ”«Œ :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   930
      TabIndex        =   19
      Top             =   555
      Width           =   1320
   End
   Begin VB.Label Label11 
      Caption         =   "KB"
      Height          =   270
      Left            =   3135
      TabIndex        =   18
      Top             =   3405
      Width           =   285
   End
   Begin VB.Label Label9 
      Caption         =   "MB"
      Height          =   210
      Left            =   3120
      TabIndex        =   17
      Top             =   900
      Width           =   480
   End
   Begin VB.Label Label8 
      Caption         =   "›«Ì·Â«:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   15
      Top             =   4080
      Width           =   1140
   End
   Begin VB.Label Label7 
      Caption         =   "”«“‰œÂ:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   6
      Top             =   3735
      Width           =   1095
   End
   Begin VB.Label Label6 
      Caption         =   "›÷«Ì «Ì‰œò”:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   5
      Top             =   3405
      Width           =   1230
   End
   Begin VB.Label Label5 
      Caption         =   "Õ«›ŸÂ œ— Õ«· «” ›«œÂ:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   945
      TabIndex        =   4
      Top             =   1860
      Width           =   1155
   End
   Begin VB.Label Label4 
      Caption         =   "„”Ì— «’·Ì:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   3
      Top             =   1528
      Width           =   1320
   End
   Begin VB.Label Label3 
      Caption         =   "Data Size:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   2
      Top             =   1191
      Width           =   1050
   End
   Begin VB.Label Label2 
      Caption         =   "”«Ì“:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   945
      TabIndex        =   1
      Top             =   855
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "‰«„:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   960
      TabIndex        =   0
      Top             =   225
      Width           =   1350
   End
End
Attribute VB_Name = "formSqlDBInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Me.Icon = formMain.Icon
End Sub
