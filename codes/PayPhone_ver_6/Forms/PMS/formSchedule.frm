VERSION 5.00
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form formSchedule 
   Caption         =   "“„«‰»‰œÌ –ŒÌ—Â ”«“Ì »«‰ò"
   ClientHeight    =   3855
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6645
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
   ScaleHeight     =   3855
   ScaleWidth      =   6645
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdDeleteSchedule 
      Caption         =   "Õ–›"
      Height          =   330
      Left            =   1125
      TabIndex        =   17
      Top             =   3300
      Width           =   1200
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "À» "
      Height          =   330
      Left            =   15
      TabIndex        =   14
      Top             =   3300
      Width           =   1095
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Œ—ÊÃ"
      Height          =   315
      Left            =   5505
      TabIndex        =   8
      Top             =   3315
      Width           =   1140
   End
   Begin VB.Frame Frame1 
      Caption         =   "“„«‰ »‰œÌ –ŒÌ—Â ”«“Ì"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   1215
      TabIndex        =   5
      Top             =   1290
      Width           =   4890
      Begin VB.OptionButton optDaily 
         Caption         =   "—Ê“«‰Â"
         Height          =   270
         Left            =   1155
         TabIndex        =   15
         Top             =   405
         Width           =   735
      End
      Begin MSMask.MaskEdBox medTime 
         Height          =   300
         Left            =   1155
         TabIndex        =   13
         Top             =   1050
         Width           =   1560
         _ExtentX        =   2752
         _ExtentY        =   529
         _Version        =   393216
         AllowPrompt     =   -1  'True
         AutoTab         =   -1  'True
         MaxLength       =   8
         Format          =   "hh:mm AM/PM"
         Mask            =   "##:##:##"
         PromptChar      =   "_"
      End
      Begin VB.ComboBox cboDay 
         Height          =   315
         ItemData        =   "formSchedule.frx":0000
         Left            =   1170
         List            =   "formSchedule.frx":0019
         TabIndex        =   10
         Top             =   690
         Width           =   1545
      End
      Begin VB.OptionButton optMonthly 
         Caption         =   "„«Â«‰Â"
         Height          =   210
         Left            =   2910
         TabIndex        =   7
         Top             =   480
         Width           =   1455
      End
      Begin VB.OptionButton optWeekly 
         Caption         =   "Â› êÌ"
         Height          =   390
         Left            =   1980
         TabIndex        =   6
         Top             =   360
         Width           =   900
      End
      Begin VB.Label Label7 
         Caption         =   "(”«⁄ :œﬁÌﬁÂ: À«‰ÌÂ)"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   2745
         TabIndex        =   16
         Top             =   1110
         Width           =   1545
      End
      Begin VB.Label Label6 
         Caption         =   "œÊ—Â:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   150
         TabIndex        =   12
         Top             =   405
         Width           =   990
      End
      Begin VB.Label Label5 
         Caption         =   "”«⁄ :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   180
         TabIndex        =   11
         Top             =   1125
         Width           =   795
      End
      Begin VB.Label Label4 
         Caption         =   "—Ê“:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   150
         TabIndex        =   9
         Top             =   765
         Width           =   645
      End
   End
   Begin VB.TextBox txtBackupFile 
      Enabled         =   0   'False
      Height          =   315
      Left            =   1455
      TabIndex        =   3
      Top             =   960
      Width           =   4620
   End
   Begin VB.TextBox txtDatabaseName 
      Enabled         =   0   'False
      Height          =   300
      Left            =   1440
      TabIndex        =   1
      Top             =   630
      Width           =   3420
   End
   Begin VB.Image Image1 
      Height          =   240
      Left            =   180
      Picture         =   "formSchedule.frx":005D
      Top             =   180
      Width           =   240
   End
   Begin VB.Label Label3 
      Caption         =   "«Ã—«:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   375
      TabIndex        =   4
      Top             =   1380
      Width           =   660
   End
   Begin VB.Label Label2 
      Caption         =   "‰«„ ›«Ì·:"
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
      Left            =   345
      TabIndex        =   2
      Top             =   1035
      Width           =   960
   End
   Begin VB.Label Label1 
      Caption         =   "»«‰ò  «ÿ·«⁄« Ì:"
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
      Left            =   105
      TabIndex        =   0
      Top             =   675
      Width           =   1395
   End
End
Attribute VB_Name = "formSchedule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const M_MODULENAME As String = "formSchedule"
Private mblnCancelPressed As Boolean

Public Property Get CancelPressed() As Boolean
    CancelPressed = mblnCancelPressed
End Property

Private Sub cmdClose_Click()
    mblnCancelPressed = True
    Unload Me
End Sub

Private Sub cmdDeleteSchedule_Click()
    On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Sub cmdDeleteSchedule_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    '================================ MAIN BODY =============================================
    If MsgBox("Are you sure you want to delete the current schedule?", vbExclamation + vbYesNo, G_APPTITLE) = vbYes Then
        formMain.mobjCDBSQL.DropSchedule
        MsgBox "Current Job has been Deleted!", vbInformation, G_APPTITLE
        Unload Me
    End If
    '================================ MAIN BODY =============================================
    
    
CleanUp:
    On Error Resume Next
    
Out:
    
    Exit Sub
    
Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
        ReportUnexpectedError lngErrorNumber, strErrorDescription
        ShowErrorMessage strErrorDescription
    Else
        ShowErrorMessage strErrorDescription
    End If
    
    Resume CleanUp

End Sub

Private Sub cmdSave_Click()
    On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Sub cmdSave_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    '================================ MAIN BODY =============================================
    Dim Freq As enFrequencyTypes
    
    If InStr(medTime.Text, "_") > 0 Then
        MsgBox "You must provide all the necessary time fields. i.e. Hour, Minute and Second in the form of hh:mm:ss.", vbInformation, G_APPTITLE
        Exit Sub
    End If
    
    If optDaily.Value = False And cboDay.Text = vbNullString Then
        MsgBox "You must select a day if your schedule recurs weekly or monthly!", vbInformation, G_APPTITLE
        Exit Sub
    End If
    
    If optMonthly.Value = True Then
        Freq = BackupMonthly
    ElseIf optDaily.Value = True Then
        Freq = BackupDaily
    Else
        Freq = BackupWeekly
    End If
    With formMain.mobjCDBSQL
        .BackupSetName = formMain.txtBackupSetName
        .DatabaseName = formMain.cboDatabase.Text
        .BackupFileLocation = formMain.txtBackupFolder.Text
        .BackupFileName = formMain.txtSQLBackupFileName.Text
        .SetSchedule Freq, medTime, cboDay.Text, Now()
    End With
    Unload Me
    '================================ MAIN BODY =============================================
    
    
CleanUp:
    On Error Resume Next
    
Out:
    
    Exit Sub
    
Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
        ReportUnexpectedError lngErrorNumber, strErrorDescription
        ShowErrorMessage "Error: " & strErrorDescription
    Else
        ShowErrorMessage strErrorDescription
    End If
    
    Resume CleanUp


End Sub

Private Sub Form_Load()
    On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Sub Form_Load()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    '================================ MAIN BODY =============================================
    Me.Icon = formMain.Icon
    FetchSchedule
    '================================ MAIN BODY =============================================
    
    
CleanUp:
    On Error Resume Next
    
Out:
    
    Exit Sub
    
Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
        ReportUnexpectedError lngErrorNumber, strErrorDescription
    Else
        ShowErrorMessage strErrorDescription
    End If
    
    Resume CleanUp


End Sub

Private Sub FetchSchedule()
 On Error GoTo Handle_Error
    
    Const PROC_NAME As String = "Sub FetchSchedule()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False
    
    ' ============================ MAIN BODY ===========================
        Dim Freq As enFrequencyTypes
        Dim strStartTime, strStartDate, strDayOfWeek
        
        With formMain.mobjCDBSQL
            .DatabaseName = formMain.cboDatabase.Text
            .BackupFileLocation = formMain.txtBackupFolder
            .BackupFileName = formMain.txtSQLBackupFileName
            .GetSchedule Freq, strStartTime, strDayOfWeek, strStartDate
        End With
        
        txtDatabaseName = formMain.cboDatabase.Text
        txtBackupFile = formMain.txtBackupFolder & formMain.txtSQLBackupFileName
        
        Select Case Freq
            Case BackupDaily
                optDaily.Value = True
            Case BackupMonthly
                optMonthly.Value = True
            Case BackupWeekly
                optWeekly.Value = True
        End Select
        
        cboDay.Text = strDayOfWeek
        
        If strStartTime <> vbNullString Then
            medTime.SelText = strStartTime
        End If
    ' ============================ MAIN BODY ===========================
   
CleanUp:
    On Error Resume Next

Out:
    If Not blnInError Then
        Exit Sub
    Else
        On Error GoTo 0
        
        Err.Raise lngErrorNumber, , strErrorDescription
    End If

Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
    End If

    Resume CleanUp
    
End Sub

