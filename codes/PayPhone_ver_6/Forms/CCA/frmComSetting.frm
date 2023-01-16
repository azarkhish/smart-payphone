VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmComSetting 
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ‰ŸÌ„«  ÅÊ— Â«Ì ”—Ì«·"
   ClientHeight    =   7485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6375
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7485
   ScaleWidth      =   6375
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Œ—ÊÃ"
      Height          =   375
      Left            =   3870
      TabIndex        =   12
      Top             =   7020
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   1365
      Left            =   405
      TabIndex        =   2
      Top             =   5535
      Width           =   5685
      Begin VB.TextBox txtPortNumber 
         Height          =   330
         Left            =   1800
         TabIndex        =   10
         Top             =   900
         Width           =   1185
      End
      Begin VB.CheckBox chkActivate 
         Caption         =   "›⁄«·"
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
         Left            =   4230
         TabIndex        =   7
         Top             =   945
         Width           =   1005
      End
      Begin VB.OptionButton optKind 
         Caption         =   "Œ—ÊÃÌ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   1
         Left            =   4230
         TabIndex        =   6
         Top             =   630
         Width           =   1140
      End
      Begin VB.OptionButton optKind 
         Caption         =   "Ê—ÊœÌ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   0
         Left            =   4230
         TabIndex        =   5
         Top             =   270
         Width           =   1140
      End
      Begin VB.TextBox txtTelNum 
         Height          =   330
         Left            =   1800
         TabIndex        =   4
         Top             =   540
         Width           =   1185
      End
      Begin VB.TextBox txtLineNum 
         Height          =   330
         Left            =   1800
         TabIndex        =   3
         Top             =   180
         Width           =   1185
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   330
         Index           =   0
         Left            =   405
         OleObjectBlob   =   "frmComSetting.frx":0000
         TabIndex        =   8
         Top             =   180
         Width           =   1185
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   330
         Index           =   1
         Left            =   405
         OleObjectBlob   =   "frmComSetting.frx":0067
         TabIndex        =   9
         Top             =   540
         Width           =   1185
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   330
         Index           =   2
         Left            =   405
         OleObjectBlob   =   "frmComSetting.frx":00D2
         TabIndex        =   11
         Top             =   900
         Width           =   1185
      End
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Bindings        =   "frmComSetting.frx":013D
      Height          =   5325
      Left            =   405
      TabIndex        =   1
      Top             =   45
      Width           =   5595
      _ExtentX        =   9869
      _ExtentY        =   9393
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      FormatLocked    =   -1  'True
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataMember      =   "cmdConnections"
      ColumnCount     =   4
      BeginProperty Column00 
         DataField       =   "Line"
         Caption         =   "‘„«—Â Œÿ"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1065
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   "Tel"
         Caption         =   "‘„«—Â  ·›‰"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1065
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column02 
         DataField       =   "ComPort"
         Caption         =   "”—Ì«· ÅÊ— "
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1065
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column03 
         DataField       =   "Activate"
         Caption         =   "›⁄«·Ì "
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1065
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
            Locked          =   -1  'True
            ColumnWidth     =   794.835
         EndProperty
         BeginProperty Column01 
            Locked          =   -1  'True
            ColumnWidth     =   1140.095
         EndProperty
         BeginProperty Column02 
            Locked          =   -1  'True
            ColumnWidth     =   900.284
         EndProperty
         BeginProperty Column03 
            Locked          =   -1  'True
            ColumnWidth     =   764.787
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton Command1 
      Caption         =   " «ÌÌœ"
      Height          =   375
      Left            =   1125
      TabIndex        =   0
      Top             =   7020
      Width           =   1215
   End
End
Attribute VB_Name = "frmComSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim strSql As String
                With de.rscmdConnections
                    strSql = "Select * From Connections"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdConnections, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetData
                    .Update
                End With

End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub DataGrid1_Click()
SetText
End Sub

Private Sub SetText()
    txtTelNum.Text = de.rscmdConnections!Tel
    txtLineNum.Text = de.rscmdConnections!Line
    txtPortNumber.Text = de.rscmdConnections!ComPort
    chkActivate.Value = (de.rscmdConnections!Activate And 1)
    optKind(Val(de.rscmdConnections!Kind) - 1).Value = True
End Sub
Private Sub SetData()
      de.rscmdConnections!Tel = txtTelNum.Text
    de.rscmdConnections!Line = Val(txtLineNum.Text)
     de.rscmdConnections!ComPort = Val(txtPortNumber.Text)
   de.rscmdConnections!Activate = (chkActivate.Value And 1)
    
    If optKind(0).Value = True Then
        de.rscmdConnections!Kind = 1
    Else
        de.rscmdConnections!Kind = 2
    End If

End Sub

Private Sub Form_Load()
SetSkin Me
End Sub
