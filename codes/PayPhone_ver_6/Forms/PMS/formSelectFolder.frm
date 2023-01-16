VERSION 5.00
Begin VB.Form formSelectFolder 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "«‰ Œ«» ÅÊ‘Â"
   ClientHeight    =   4500
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5160
   ControlBox      =   0   'False
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
   MinButton       =   0   'False
   ScaleHeight     =   4500
   ScaleWidth      =   5160
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdSelectFolder 
      Caption         =   "«‰ Œ«»"
      Height          =   300
      Left            =   15
      TabIndex        =   3
      Top             =   4170
      Width           =   1185
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Œ—ÊÃ"
      Height          =   315
      Left            =   3960
      TabIndex        =   2
      Top             =   4155
      Width           =   1170
   End
   Begin VB.DirListBox dirMain 
      Height          =   3240
      Left            =   45
      TabIndex        =   1
      Top             =   465
      Width           =   5070
   End
   Begin VB.DriveListBox drvMain 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   90
      TabIndex        =   0
      Top             =   75
      Width           =   5010
   End
   Begin VB.Label lblFolderPath 
      Caption         =   "„”Ì— —« «‰ Œ«» ò‰Ìœ..."
      Height          =   225
      Left            =   90
      TabIndex        =   4
      Top             =   3825
      Width           =   4995
   End
End
Attribute VB_Name = "formSelectFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public mstrFolder As String

Public Property Get Folder() As String
    Folder = mstrFolder
End Property

Public Property Let Folder(strFolder As String)
    mstrFolder = strFolder
End Property

Private Sub cmdCancel_Click()
    mstrFolder = vbNullString
    Unload Me
End Sub

Private Sub cmdSelectFolder_Click()
    mstrFolder = dirMain.Path
    Unload Me
End Sub

Private Sub dirMain_Change()
    mstrFolder = dirMain.Path
    lblFolderPath = mstrFolder
End Sub

Private Sub drvMain_Change()
On Error Resume Next
    dirMain.Path = drvMain.List(drvMain.ListIndex)
    
    If Err.Number <> 0 Then
        MsgBox Err.Description, vbExclamation, "Error"
    End If
End Sub




