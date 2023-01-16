VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form formMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ‰ŸÌ„«  »«‰ò «ÿ·«⁄« Ì"
   ClientHeight    =   8520
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11475
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
   Icon            =   "formMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   8520
   ScaleWidth      =   11475
   StartUpPosition =   2  'CenterScreen
   WhatsThisHelp   =   -1  'True
   WindowState     =   2  'Maximized
   Begin VB.Frame fraBackRestore 
      Height          =   7440
      Left            =   315
      TabIndex        =   1
      Top             =   675
      Width           =   9015
      Begin VB.CommandButton cmdClose 
         Caption         =   "Œ—ÊÃ"
         Height          =   345
         Left            =   7425
         TabIndex        =   42
         Top             =   6705
         Width           =   1215
      End
      Begin MSComDlg.CommonDialog dlgCommon 
         Left            =   945
         Top             =   6660
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   5715
         Left            =   405
         TabIndex        =   2
         Top             =   630
         Width           =   8325
         _ExtentX        =   14684
         _ExtentY        =   10081
         _Version        =   393216
         TabHeight       =   520
         WordWrap        =   0   'False
         BackColor       =   -2147483648
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TabCaption(0)   =   "–ŒÌ—Â/»«“Ì«»Ì »«‰ò"
         TabPicture(0)   =   "formMain.frx":0442
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "Label7"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "Frame3"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "Frame4"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "fraSQLBackup"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "fraSQLRestore"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).ControlCount=   5
         TabCaption(1)   =   "«—”«·/œ—Ì«›  Ãœ«Ê·"
         TabPicture(1)   =   "formMain.frx":045E
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "cmnDLG"
         Tab(1).Control(1)=   "Frame5"
         Tab(1).ControlCount=   2
         TabCaption(2)   =   "Å«ò”«“Ì Ãœ«Ê·"
         TabPicture(2)   =   "formMain.frx":047A
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "Frame6"
         Tab(2).ControlCount=   1
         Begin VB.Frame Frame6 
            Caption         =   "Å«ò”«“Ì Ãœ«Ê·"
            Height          =   1995
            Left            =   -74160
            TabIndex        =   46
            Top             =   1800
            Width           =   6540
            Begin VB.CommandButton Command1 
               Caption         =   "Å«ò”«“Ì"
               Height          =   375
               Left            =   4560
               TabIndex        =   48
               Top             =   945
               Width           =   1770
            End
            Begin VB.ComboBox Combo2 
               Height          =   315
               ItemData        =   "formMain.frx":0496
               Left            =   270
               List            =   "formMain.frx":04A9
               RightToLeft     =   -1  'True
               TabIndex        =   47
               Top             =   990
               Width           =   4245
            End
         End
         Begin VB.Frame Frame5 
            Caption         =   "«—”«· »Â ›«Ì·"
            Height          =   1995
            Left            =   -73965
            TabIndex        =   43
            Top             =   1935
            Width           =   6540
            Begin VB.ComboBox Combo1 
               Height          =   315
               ItemData        =   "formMain.frx":04FB
               Left            =   270
               List            =   "formMain.frx":051E
               TabIndex        =   45
               Top             =   990
               Width           =   4245
            End
            Begin VB.CommandButton cmdExport 
               Caption         =   "«—”«·"
               Height          =   375
               Left            =   4590
               TabIndex        =   44
               Top             =   945
               Width           =   1770
            End
         End
         Begin VB.Frame fraSQLRestore 
            Caption         =   "»«“Ì«»Ì »«‰ò «ÿ·«⁄« Ì"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   2925
            Left            =   120
            TabIndex        =   21
            Top             =   2520
            Visible         =   0   'False
            Width           =   8175
            Begin VB.TextBox txtSQLRestorationFileLocation 
               Height          =   285
               Left            =   1380
               TabIndex        =   27
               Top             =   870
               Width           =   6315
            End
            Begin VB.CommandButton cmdRestoreBrowse 
               Caption         =   "..."
               Height          =   270
               Left            =   7740
               TabIndex        =   26
               Top             =   870
               Width           =   345
            End
            Begin VB.CommandButton cmdRestore 
               Caption         =   "»«“Ì«»Ì »«‰ò"
               Enabled         =   0   'False
               Height          =   330
               Left            =   210
               TabIndex        =   25
               Top             =   2400
               Width           =   1380
            End
            Begin VB.CommandButton cmdViewSets 
               Caption         =   "»Â —Ê“ —”«‰Ì "
               Height          =   300
               Left            =   1020
               TabIndex        =   24
               Top             =   1545
               Width           =   1695
            End
            Begin VB.ComboBox cboData 
               Height          =   315
               Left            =   1380
               TabIndex        =   23
               Top             =   1185
               Width           =   6720
            End
            Begin VB.CheckBox chkReplace 
               Caption         =   "«ÿ·«⁄«  »«‰ò »Â ÿÊ— ò«„· Ã«Ìê“Ì‰ ‘Êœ"
               Enabled         =   0   'False
               Height          =   195
               Left            =   1650
               TabIndex        =   22
               Top             =   2550
               Value           =   1  'Checked
               Width           =   3945
            End
            Begin VB.Label lblBackupFile 
               Caption         =   "„”Ì— –ŒÌ—Â:"
               Height          =   225
               Left            =   105
               TabIndex        =   29
               Top             =   915
               Width           =   1005
            End
            Begin VB.Label Label9 
               Caption         =   "«ÿ·«⁄«  »«‰ò:"
               Height          =   255
               Left            =   105
               TabIndex        =   28
               Top             =   1260
               Width           =   1320
            End
         End
         Begin VB.Frame fraSQLBackup 
            Caption         =   " ÂÌÂ Å‘ Ì»«‰ «“ »«‰ò «ÿ·«⁄« Ì"
            ForeColor       =   &H00008000&
            Height          =   2895
            Left            =   120
            TabIndex        =   9
            Top             =   2640
            Visible         =   0   'False
            Width           =   8175
            Begin VB.TextBox txtBackupFolder 
               Height          =   285
               Left            =   1515
               TabIndex        =   17
               Top             =   1155
               Width           =   5820
            End
            Begin VB.CommandButton cmdBrowse 
               Caption         =   "..."
               Height          =   330
               Left            =   7755
               TabIndex        =   16
               Top             =   1110
               Width           =   330
            End
            Begin VB.CommandButton cmdBackup 
               Caption         =   "–ŒÌ—Â ”«“Ì"
               Enabled         =   0   'False
               Height          =   345
               Left            =   1755
               TabIndex        =   15
               Top             =   2475
               Width           =   1545
            End
            Begin VB.TextBox txtSQLBackupFileName 
               Height          =   285
               Left            =   1515
               TabIndex        =   14
               Top             =   1470
               Width           =   6195
            End
            Begin VB.TextBox txtBackupSetName 
               Height          =   285
               Left            =   1515
               TabIndex        =   13
               Top             =   840
               Width           =   2940
            End
            Begin VB.CommandButton cmdVerify 
               Caption         =   "çò ò—œ‰ ’Õ  ⁄„·Ì« "
               Enabled         =   0   'False
               Height          =   345
               Left            =   4770
               TabIndex        =   12
               Top             =   2475
               Width           =   2085
            End
            Begin VB.CommandButton cmdScheduleBackup 
               Caption         =   "“„«‰»‰œÌ"
               Enabled         =   0   'False
               Height          =   345
               Left            =   3330
               TabIndex        =   11
               Top             =   2475
               Width           =   1425
            End
            Begin VB.CommandButton cmdAutoFill 
               Height          =   315
               Left            =   7365
               Picture         =   "formMain.frx":05E3
               Style           =   1  'Graphical
               TabIndex        =   10
               ToolTipText     =   "Automatically autofill the backup location based off the connection information"
               Top             =   1125
               Width           =   375
            End
            Begin VB.Label Label3 
               Caption         =   "„”Ì— ›«Ì· :"
               Height          =   210
               Left            =   120
               TabIndex        =   20
               Top             =   1215
               Width           =   1110
            End
            Begin VB.Label Label10 
               Caption         =   "‰«„ ›«Ì·:"
               Height          =   255
               Left            =   120
               TabIndex        =   19
               Top             =   1530
               Width           =   1515
            End
            Begin VB.Label lblBackupName 
               Caption         =   "‰«„ –ŒÌ—Â:"
               Height          =   210
               Left            =   120
               TabIndex        =   18
               Top             =   870
               Width           =   1185
            End
         End
         Begin VB.Frame Frame4 
            Height          =   1320
            Left            =   45
            TabIndex        =   3
            Top             =   1125
            Width           =   8175
            Begin VB.Frame Frame2 
               Caption         =   "⁄„·Ì« "
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   178
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H8000000D&
               Height          =   690
               Left            =   3735
               TabIndex        =   6
               Top             =   315
               Width           =   4110
               Begin VB.OptionButton optOperation 
                  Caption         =   "–ŒÌ—Â"
                  Height          =   195
                  Index           =   0
                  Left            =   450
                  TabIndex        =   8
                  Top             =   300
                  Width           =   990
               End
               Begin VB.OptionButton optOperation 
                  Caption         =   "»«“Ì«»Ì"
                  Height          =   195
                  Index           =   1
                  Left            =   1890
                  TabIndex        =   7
                  Top             =   300
                  Width           =   1605
               End
            End
            Begin VB.CommandButton cmdViewDatabaseInfo 
               Enabled         =   0   'False
               Height          =   315
               Left            =   3105
               Picture         =   "formMain.frx":072D
               Style           =   1  'Graphical
               TabIndex        =   5
               ToolTipText     =   "View More Information about this database."
               Top             =   585
               Width           =   330
            End
            Begin VB.ComboBox cboDatabase 
               Height          =   315
               Left            =   360
               TabIndex        =   4
               Top             =   585
               Width           =   2700
            End
         End
         Begin VB.Frame Frame3 
            Caption         =   "Frame3"
            Height          =   375
            Left            =   1080
            TabIndex        =   30
            Top             =   1170
            Visible         =   0   'False
            Width           =   870
            Begin VB.TextBox txtServerName 
               Height          =   300
               Left            =   705
               TabIndex        =   39
               Text            =   "(local)"
               Top             =   0
               Width           =   2700
            End
            Begin VB.Frame Frame1 
               Height          =   1050
               Left            =   0
               TabIndex        =   34
               Top             =   705
               Width           =   3945
               Begin VB.TextBox txtUserName 
                  Height          =   285
                  Left            =   1095
                  TabIndex        =   36
                  Top             =   270
                  Width           =   2715
               End
               Begin VB.TextBox txtPassword 
                  Height          =   285
                  IMEMode         =   3  'DISABLE
                  Left            =   1095
                  PasswordChar    =   "*"
                  TabIndex        =   35
                  Top             =   585
                  Width           =   1530
               End
               Begin VB.Label Label5 
                  Caption         =   "Login:"
                  Height          =   255
                  Left            =   135
                  TabIndex        =   38
                  Top             =   345
                  Width           =   465
               End
               Begin VB.Label Label6 
                  Caption         =   "Password:"
                  Height          =   225
                  Left            =   120
                  TabIndex        =   37
                  Top             =   645
                  Width           =   795
               End
            End
            Begin VB.OptionButton optConnType 
               Caption         =   "&Windows Authentication"
               Height          =   210
               Index           =   0
               Left            =   120
               TabIndex        =   33
               Top             =   390
               Value           =   -1  'True
               Width           =   2070
            End
            Begin VB.CommandButton cmdConnect 
               BackColor       =   &H00E0E0E0&
               Caption         =   "Co&nnect"
               Height          =   315
               Left            =   3435
               TabIndex        =   32
               Top             =   0
               Width           =   1155
            End
            Begin VB.OptionButton optConnType 
               Caption         =   "&SQL Server Authentication"
               Height          =   195
               Index           =   1
               Left            =   0
               TabIndex        =   31
               Top             =   0
               Width           =   2235
            End
            Begin VB.Label Label4 
               Caption         =   "Server:"
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   255
               Left            =   -45
               TabIndex        =   40
               Top             =   45
               Width           =   675
            End
         End
         Begin MSComDlg.CommonDialog cmnDLG 
            Left            =   -74775
            Top             =   4860
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
         End
         Begin VB.Label Label7 
            Caption         =   "Database:"
            Height          =   240
            Left            =   4185
            TabIndex        =   41
            Top             =   1215
            Width           =   840
         End
      End
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   8205
      Width           =   11475
      _ExtentX        =   20241
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   20188
            Text            =   "Backup and Restore Utility"
            TextSave        =   "Backup and Restore Utility"
            Key             =   "pnlMain"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "formMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public FilePath As String
Public TableName As String

'''''''''''''''''''''''''''''''''
'Project: Backup and Restore
'Author: John Kamau
'Email: john_ndungu@hotmail.com
'Comments:
'   For comments on this prj. See the CDBSQLUtil class in the SynDBUtil dll
'
'''''''''''''''''''''''''''''''''
Public mobjCDBSQL As SynDBUtil.CDBSQLUtil
Private mobjCDBAccess As SynDBUtil.CDBAccessUtil

Private Const M_MODULENAME As String = "formMain"
Private mblnConnected As Boolean

Private Sub cboDatabase_Change()
    SetDefaultBackupValues
    fraSQLBackup.Caption = "&Backup of Database (" & cboDatabase.Text & ")"
    fraSQLRestore.Caption = "&Complete Restoration of Database(" & cboDatabase.Text & ")"
End Sub

Private Sub cboDatabase_Click()
    SetDefaultBackupValues
    fraSQLBackup.Caption = "&Backup of Database (" & cboDatabase.Text & ")"
    fraSQLRestore.Caption = "&Complete Restoration of Database(" & cboDatabase.Text & ")"
End Sub

Private Sub cmdAutoFill_Click()
    On Error Resume Next
    txtBackupFolder.Text = mobjCDBSQL.GetDefaultBackupLocation
End Sub

Private Sub cmdBackup_Click()
    On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub cmdBackup_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
    Dim strFileName As String
    Dim strFolderLocation As String

    If cboDatabase = vbNullString Then
        MsgBox "« ’«· »Â sql server »—ﬁ—«— ‰Ì”  ÊÌ« »«‰ò »Â œ—” Ì «‰ Œ«» ‰‘œÂ!"
        Exit Sub
    End If

    If txtBackupFolder = vbNullString Or txtBackupSetName = vbNullString Or txtSQLBackupFileName = vbNullString Then
        MsgBox "„”Ì— Ê ‰«„ ›«Ì· Ê ‰«„ –ŒÌ—Â ”«“Ì —« «‰ Œ«» ò‰Ìœ "
                
                
        Exit Sub
    End If

    strFolderLocation = txtBackupFolder
    strFileName = txtSQLBackupFileName

    'strFileName = Right(strFolderLocation, (Len(strFolderLocation) - InStrRev(txtBackupFolder.Text, "\")))
    With mobjCDBSQL
        .BackupFileLocation = strFolderLocation
        .BackupFileName = strFileName
        .DatabaseName = cboDatabase.Text
        .BackupSetName = txtBackupSetName
        StatusMessage "Backing Up " & cboDatabase.Text & " Completely to file " & strFileName & "...."
        mobjCDBSQL.BackupDatabase
        StatusMessage "Successfully Backed Up " & cboDatabase.Text & "."
    End With
    '================================ MAIN BODY =============================================


CleanUp:
    On Error Resume Next

Out:

    Exit Sub

Handle_Error:
    blnInError = True
    StatusMessage "Backup Incomplete due to Errors!"
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description

    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
        ReportUnexpectedError lngErrorNumber, strErrorDescription
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« : " & lngErrorNumber
    Else
        ShowErrorMessage "Œÿ« œ— «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp
End Sub

Private Sub SetDefaultBackupValues()
    txtSQLBackupFileName = "BK-" & cboDatabase.Text & "-" & ReturnMonthString(Month(Date)) & ".BAK"
    txtBackupSetName = cboDatabase.Text & " Backup"
End Sub

Private Sub cmdBrowse_Click()
    If cboDatabase.Text = vbNullString Then
        MsgBox "»«‰ò «ÿ·«⁄« Ì —« «‰ Œ«» ò‰Ìœ"
        cboDatabase.SetFocus
    Else
        txtBackupFolder.Text = SynBrowseForFolder(Me.hwnd, "Select your backup folder location") & "\"
        SetDefaultBackupValues
    End If
End Sub

Private Sub cmdClose_Click()
        Unload Me
      de.cnnTelephone.Open

    SetUserAccessLevel UserId
End Sub

Private Sub DoDisconnectAndClearLists()
On Error Resume Next
    mobjCDBSQL.DisConnectFromSQLServer
    cboDatabase.Clear
    optConnType(0).Enabled = True
    optConnType(1).Enabled = True

    If optConnType(0).Value Then
        EnableTextBox txtUserName
        EnableTextBox txtServerName
        EnableTextBox txtPassword
    Else
        DisableTextBox txtUserName
        DisableTextBox txtServerName
        DisableTextBox txtPassword
    End If

    txtBackupFolder = vbNullString
    txtBackupSetName = vbNullString
    txtSQLBackupFileName = vbNullString
    mblnConnected = False
    cmdConnect.Caption = "&Connect"
    cmdRestore.Enabled = False
    cmdViewDatabaseInfo.Enabled = False
    cmdBackup.Enabled = False
    cmdVerify.Enabled = False
    cmdScheduleBackup.Enabled = False
End Sub

Private Sub Connect()
    On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub cmdConnect_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
        If txtServerName = vbNullString Then
            MsgBox "‰«„ sql server »Â œ—” Ì «‰ Œ«» ‰‘œÂ"
            Exit Sub
        End If

        If optConnType(1).Value = True Then
            If txtUserName = vbNullString Then
                MsgBox "‰«„ ò«—»— Ê ”ÿÕ œ” —”Ì »Â ⁄„·Ì«  „Ê—œ ‰Ÿ— ò‰ —· ‘Êœ"
                Exit Sub
            End If
        End If

        If mblnConnected = False Then
            DoConnectAndFetchList
        Else
            DoDisconnectAndClearLists
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
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    Else
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp

End Sub

Private Sub DoConnectAndFetchList()
   On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub DoConnectAndFetchList()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    ' ============================ MAIN BODY ===========================
    Dim strList As Variant
    Dim strListDevices As Variant
    Dim I
    Dim blnWindowsAuth As Boolean

    If mobjCDBSQL Is Nothing Then
        Set mobjCDBSQL = New CDBSQLUtil
    End If

    cboDatabase.Clear

    StatusMessage "Connecting to SQL Server and Fetching List of Databases..."
    blnWindowsAuth = optConnType(0).Value

    If mobjCDBSQL.ConnectToSQLServer(txtServerName, txtUserName, txtPassword, blnWindowsAuth) = True Then
        strList = mobjCDBSQL.GetListOfDatabases(False)
        For I = 0 To UBound(strList)
            cboDatabase.AddItem strList(I)
        Next I
    End If

    cboDatabase.ListIndex = cboDatabase.ListCount - 1

    optConnType(0).Enabled = False
    optConnType(1).Enabled = False
    DisableTextBox txtServerName
    DisableTextBox txtUserName
    DisableTextBox txtPassword
    cmdConnect.Caption = "&Disconnect"
    cmdViewDatabaseInfo.Enabled = True
    cmdRestore.Enabled = True
    cmdBackup.Enabled = True
    cmdVerify.Enabled = True
    cmdScheduleBackup.Enabled = True
    mblnConnected = True
    StatusMessage "Done"
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

Private Sub cmdExport_Click()
    Dim iFreeFile As Integer
    Dim I As Integer
    Dim sTemp As String
Dim cn As ADODB.Connection
Dim outtb As New ADODB.Recordset
Dim CONSTR As String
On Error GoTo EH

Set cn = New ADODB.Connection
   CONSTR = "driver={SQL Server};" & _
   "server=" & "(local)" & ";" & _
   "database=" & "dbTelephone"


   cn.ConnectionString = CONSTR
   cn.ConnectionTimeout = 30
   cn.Open
  'TableName = "CMonth"
   outtb.Open TableName, cn, adOpenStatic, adLockOptimistic

    iFreeFile = FreeFile
    cmnDLG.FileName = ""
    cmnDLG.Filter = "csv"

    cmnDLG.ShowSave
    If Not cmnDLG.FileName = "" Then
     FilePath = cmnDLG.FileName + ".csv"



   EXPORTQUOCOM FilePath, outtb

   Else
   MsgBox ("⁄„·Ì«  «‰Ã«„ ‰‘œ")
   End If
   outtb.Close
   cn.Close
Exit Sub
EH:
MsgBox ("⁄„·Ì«  »Â ⁄·  Œÿ« „ Êﬁ› ‘œ")
End Sub



Private Sub cmdRestore_Click()
    On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub cmdRestore_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
    Dim blnReplace As Boolean: blnReplace = False


    If cboDatabase = vbNullString Then
        MsgBox "«— »«ÿ »« sql server »—ﬁ—«— ‰Ì” "
        Exit Sub
    End If

    If txtSQLRestorationFileLocation = vbNullString Or cboData.Text = vbNullString Then
        MsgBox "‰«„ Ê „”Ì— ›«Ì· —« «‰ Œ«» ò‰Ìœ"
        Exit Sub
    End If


    If chkReplace.Value = vbChecked Then
        blnReplace = True
    End If

    StatusMessage "Restoring Database " & cboDatabase.Text & " from " & txtSQLRestorationFileLocation

    With mobjCDBSQL
        .BackupFileLocation = Left$(txtSQLRestorationFileLocation.Text, (InStrRev(txtSQLRestorationFileLocation, "\")))
        .BackupFileName = Right$(txtSQLRestorationFileLocation, (Len(txtSQLRestorationFileLocation) - InStrRev(txtSQLRestorationFileLocation, "\")))
        .DatabaseName = cboDatabase.Text
        .RestoreDatabase blnReplace, Left$(cboData.Text, 1)
    End With

    StatusMessage "Successfully Restored Database!"
    '================================ MAIN BODY =============================================


CleanUp:
    On Error Resume Next
Out:

    Exit Sub

Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description

    StatusMessage "Restore Unsuccessfull due to errors!"

    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
        ReportUnexpectedError lngErrorNumber, strErrorDescription
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« : " & lngErrorNumber
    Else
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp


End Sub

Private Sub cmdRestoreBrowse_Click()
  On Error GoTo Handle_Error

    Const PROC_NAME As String = "cmdRestoreBrowse_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
    With dlgCommon
        .Filter = "BAK Files(*.bak)|*.bak|All Files(*.*)|*.*"
        .DialogTitle = "Select Previous Backup File Location"
        .ShowOpen
        If .FileName <> vbNullString Then
            txtSQLRestorationFileLocation.Text = .FileName
        End If
    End With
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
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp
End Sub

Private Sub cmdScheduleBackup_Click()
    On Error GoTo Handle_Error

    Const PROC_NAME As String = "cmdScheduleBackup_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
    If txtBackupFolder.Text = vbNullString Or txtSQLBackupFileName = vbNullString Then
        MsgBox "‰«„ Ê „”Ì— ›«Ì· Å‘ Ì»«‰ —« Ê«—œ ò‰Ìœ"
        Exit Sub
    End If
    With formSchedule
        .Show vbModal
    End With
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
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    Else
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp


End Sub

Private Sub cmdVerify_Click()
    On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub cmdVerify_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
    Dim strFileName As String
    Dim strFolderLocation As String

    If cboDatabase = vbNullString Then
        MsgBox "« ’«· »Â »«‰ò «ÿ·«⁄« Ì »—ﬁ—«— ‰Ì” "
        Exit Sub
    End If

    strFolderLocation = txtBackupFolder
    strFileName = txtSQLBackupFileName
    StatusMessage "Verifying Backup File..."
    mobjCDBSQL.VerifyBackupFile strFolderLocation & strFileName, cboDatabase.Text
    StatusMessage "Vefication Complete! No Errors Found."
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
        MsgBox "Œÿ«Ì «‰Ã«„ ⁄„·Ì« : " & lngErrorNumber
    Else
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp
End Sub

Private Sub cmdViewDatabaseInfo_Click()
    On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub cmdViewDatabaseInfo_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
        Dim strCurrentSize, strDBName, strDBOwner, strDataSpace, strIndexSpace, strPrimaryFilePath, dtCreateDate, strMemoryUse, arrDbFiles
        Dim I As Integer

        If cboDatabase.Text = vbNullString Then
            MsgBox "»«‰ò «ÿ·«⁄« Ì „Ê—œ ‰Ÿ— —« «‰ Œ«» ò‰Ìœ"
        End If

        StatusMessage "Retrieving More Database Information..."
        mobjCDBSQL.DatabaseName = cboDatabase.Text
        mobjCDBSQL.GetDatabaseSummary strDBOwner, strCurrentSize, strDataSpace, strIndexSpace, strPrimaryFilePath, dtCreateDate, strMemoryUse, arrDbFiles

        With formSqlDBInfo
            .txtCurrentSize.Text = strCurrentSize
            .txtDataSpaceUsed.Text = CDbl(strDataSpace)
            .txtDBName.Text = cboDatabase.Text
            .txtDBOwner.Text = strDBOwner
            .txtIndexSpaceUsed.Text = strIndexSpace
            .txtMemoryUse.Text = strMemoryUse
            .txtPrimaryFilePath.Text = strPrimaryFilePath
            .txtCreateDate = dtCreateDate
            If Not IsEmpty(arrDbFiles) Then
                For I = 0 To UBound(arrDbFiles)
                    If Not Trim(arrDbFiles(I)) = vbNullString And Not IsEmpty(arrDbFiles(I)) Then
                        .txtFiles.Text = .txtFiles.Text & vbCrLf & Trim$(arrDbFiles(I))
                    End If
                Next I
            End If
            .Show
            StatusMessage "Done"
        End With
    '================================ MAIN BODY =============================================


CleanUp:
    On Error Resume Next

Out:

    Exit Sub

Handle_Error:
    blnInError = True
    lngErrorNumber = Err.Number
    strErrorDescription = Err.Description
    StatusMessage "Error Attempting to Retrieve Information. Error: " & strErrorDescription
    If lngErrorNumber <> G_ERR_APP_DEFINED_ERROR Then
        strErrorDescription = FormatErrorDescription(M_MODULENAME, PROC_NAME, strErrorDescription)
        ReportUnexpectedError lngErrorNumber, strErrorDescription
    Else
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp

End Sub

Private Sub cmdViewSets_Click()
  On Error GoTo Handle_Error

    Const PROC_NAME As String = "Sub cmdViewSets_Click()"
    Dim lngErrorNumber As Long
    Dim strErrorDescription As String
    Dim blnInError As Boolean
    blnInError = False

    '================================ MAIN BODY =============================================
    Dim I As Integer
    Dim strList As Variant

    cboData.Clear

    If txtSQLRestorationFileLocation <> vbNullString Then
        strList = mobjCDBSQL.GetListOfBackupSetsInFile(txtSQLRestorationFileLocation)
        For I = 0 To UBound(strList)
            cboData.AddItem strList(I)
        Next
    Else
        MsgBox "„”Ì— –ŒÌ—Â ›«Ì· Å‘ Ì»«‰ —« «‰ Œ«» ò‰Ìœ"
    End If
    cboData.ListIndex = cboData.ListCount - 1
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
        ShowErrorMessage "Œÿ«Ì «‰Ã«„ ⁄„·Ì« "
    End If

    Resume CleanUp
End Sub

Private Sub Combo1_Click()
Select Case Val(Combo1.ItemData(Combo1.ListIndex))
Case 1:
TableName = "PMSTelNo"
Case 2:
TableName = "FreeTelNo"
Case 3:
TableName = "Chargging"
Case 4:
TableName = "CharggingScheduller"
Case 5:
TableName = "BlackList"
Case 6:
TableName = "WhiteList"
Case 7:
TableName = "SamSetting"
Case 8:
TableName = "Message"
Case 9:
TableName = "BaseInformation"
Case 10:
TableName = "PhoneStation"

Case Else
TableName = ""

End Select
End Sub


Private Sub Form_Load()
SetSkin Me


        If (de.cnnTelephone.State = adStateOpen) Then de.cnnTelephone.Close


    mblnConnected = False
Connect
            fraSQLBackup.Visible = True
            fraSQLRestore.Visible = False
            optOperation(0).Value = True
End Sub

Private Sub Form_Resize()
    With fraBackRestore
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
    End With
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set mobjCDBSQL = Nothing
    Set mobjCDBAccess = Nothing
End Sub



Private Sub optConnType_Click(Index As Integer)
    If Index = 0 Then

        DisableTextBox txtPassword
        DisableTextBox txtUserName
    Else

        EnableTextBox txtPassword
        EnableTextBox txtUserName
    End If
End Sub

Private Sub optOperation_Click(Index As Integer)
    Select Case Index
        Case 0
            fraSQLBackup.Visible = True
            fraSQLRestore.Visible = False
        Case 1
            fraSQLBackup.Visible = False
            fraSQLRestore.Visible = True
    End Select
End Sub


Private Sub txtBackupFolder_Change()
    SetDefaultBackupValues
End Sub

Private Sub txtSQLBackupFileName_Change()
    txtSQLBackupFileName = RemoveWhiteSpace(txtSQLBackupFileName)
End Sub

Private Sub txtSQLRestorationFileLocation_Change()
    cboData.Clear
End Sub

