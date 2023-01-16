VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Begin VB.Form frmEditPreview 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   4335
   ClientLeft      =   45
   ClientTop       =   5940
   ClientWidth     =   7380
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   2  'Custom
   RightToLeft     =   -1  'True
   ScaleHeight     =   4335
   ScaleWidth      =   7380
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraBottun 
      Height          =   1455
      Left            =   300
      RightToLeft     =   -1  'True
      TabIndex        =   13
      Top             =   2520
      Width           =   2235
      Begin VB.CommandButton cmdEdit 
         Caption         =   "«⁄„«·  €ÌÌ—« "
         Height          =   435
         Left            =   120
         TabIndex        =   15
         Top             =   300
         Width           =   1875
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "Œ—ÊÃ"
         Height          =   495
         Left            =   120
         TabIndex        =   14
         Top             =   840
         Width           =   1875
      End
   End
   Begin ACTIVESKINLibCtl.SkinLabel slblEdit 
      Height          =   315
      Left            =   3000
      OleObjectBlob   =   "frmEditPreview.frx":0000
      TabIndex        =   12
      Top             =   180
      Width           =   1395
   End
   Begin VB.Frame fraColumnSize 
      Caption         =   " €ÌÌ— «‰œ«“Â ” Ê‰"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1515
      Left            =   3420
      RightToLeft     =   -1  'True
      TabIndex        =   7
      Top             =   2580
      Width           =   3735
      Begin VB.CommandButton cmdReduceColWidth 
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   14.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   435
         Left            =   960
         TabIndex        =   11
         Top             =   960
         Width           =   495
      End
      Begin VB.CommandButton cmdIncreaseColWidth 
         Caption         =   "+"
         Height          =   435
         Left            =   1620
         TabIndex        =   10
         Top             =   960
         Width           =   495
      End
      Begin VB.ComboBox cboColHeader 
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
         ItemData        =   "frmEditPreview.frx":006F
         Left            =   720
         List            =   "frmEditPreview.frx":00C1
         TabIndex        =   9
         Top             =   300
         Width           =   1635
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   375
         Left            =   2460
         OleObjectBlob   =   "frmEditPreview.frx":0113
         TabIndex        =   8
         Top             =   300
         Width           =   1155
      End
   End
   Begin VB.Frame fraEditPreviewText 
      Caption         =   "ÊÌ—«Ì‘ ⁄‰«ÊÌ‰ ê“«—‘"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   300
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   660
      Width           =   6915
      Begin VB.TextBox txtChart2 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   240
         MaxLength       =   200
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   1380
         Width           =   5415
      End
      Begin VB.TextBox txtChart1 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   240
         MaxLength       =   200
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   840
         Width           =   5415
      End
      Begin VB.TextBox txtTable 
         Alignment       =   1  'Right Justify
         Height          =   315
         Left            =   240
         MaxLength       =   200
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   360
         Width           =   5415
      End
      Begin ACTIVESKINLibCtl.SkinLabel slblTable 
         Height          =   375
         Left            =   5700
         OleObjectBlob   =   "frmEditPreview.frx":0184
         TabIndex        =   1
         Top             =   360
         Width           =   1155
      End
      Begin ACTIVESKINLibCtl.SkinLabel slblChart1 
         Height          =   375
         Left            =   5700
         OleObjectBlob   =   "frmEditPreview.frx":01EF
         TabIndex        =   2
         Top             =   900
         Width           =   1155
      End
      Begin ACTIVESKINLibCtl.SkinLabel slblChart2 
         Height          =   375
         Left            =   5760
         OleObjectBlob   =   "frmEditPreview.frx":0262
         TabIndex        =   3
         Top             =   1380
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmEditPreview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEdit_Click()
    
    arGlobal.txtTable = txtTable.Text
    arGlobal.txtChart1 = txtChart1.Text
    arGlobal.txtChart2 = txtChart2.Text
'    Unload frmPreview
'    Load frmPreview

    
    frmPreview.ardPreview.LoadFromObject arGlobal
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdIncreaseColWidth_Click()
    On Error Resume Next
    Dim ColHeader As String * 1
    
    If cboColHeader.Text = "" Then
        MsgBox "·ÿ›« ” Ê‰ „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ", vbOKOnly, "Œÿ«"
        Exit Sub
    End If
   
   ColHeader = Trim(cboColHeader.Text)
   arGlobal.Spreadsheet1.ActiveSheet.Columns(ColHeader).ColumnWidth = arGlobal.Spreadsheet1.ActiveSheet.Columns(ColHeader).ColumnWidth + 1
    frmPreview.ardPreview.LoadFromObject arGlobal
End Sub

Private Sub cmdReduceColWidth_Click()
    On Error Resume Next
    Dim ColHeader As String * 1
    
    If cboColHeader.Text = "" Then
        MsgBox "·ÿ›« ” Ê‰ „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ", vbOKOnly, "Œÿ«"
        Exit Sub
    End If
    ColHeader = Trim(cboColHeader.Text)
    arGlobal.Spreadsheet1.ActiveSheet.Columns(ColHeader).ColumnWidth = arGlobal.Spreadsheet1.ActiveSheet.Columns(ColHeader).ColumnWidth - 1
    frmPreview.ardPreview.LoadFromObject arGlobal
End Sub
Private Sub Form_Load()

    SetSkin Me
    txtTable.Text = Trim(arGlobal.txtTable)
    txtChart1.Text = Trim(arGlobal.txtChart1)
    txtChart2.Text = Trim(arGlobal.txtChart2)
End Sub

Private Sub Form_Resize()
     On Error Resume Next
    
    With fraEditPreviewText
        .Left = (Width - .Width) / 2
        .Top = ((Height - .Height) / 2) - 1400
        fraColumnSize.Top = .Top + 2320
        fraBottun.TabIndex = .Top + 2320
        slblEdit.Top = .Top - 200
    End With
    
End Sub

