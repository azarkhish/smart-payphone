VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   6795
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9870
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6795
   ScaleWidth      =   9870
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Height          =   6495
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   9375
      Begin VB.TextBox txtPhoneId 
         Height          =   375
         Left            =   240
         TabIndex        =   17
         Top             =   1320
         Width           =   1935
      End
      Begin VB.TextBox txtAnswertime 
         Height          =   375
         Left            =   240
         TabIndex        =   16
         Top             =   1800
         Width           =   1935
      End
      Begin VB.TextBox txtRingCount 
         Height          =   375
         Left            =   240
         TabIndex        =   15
         Top             =   3240
         Width           =   1935
      End
      Begin VB.TextBox txtReportScheduling 
         Height          =   375
         Left            =   240
         TabIndex        =   14
         Top             =   2280
         Width           =   1935
      End
      Begin VB.TextBox txtDialWaitTime 
         Height          =   375
         Left            =   240
         TabIndex        =   13
         Top             =   2760
         Width           =   1935
      End
      Begin VB.TextBox txtCardChangeWait 
         Height          =   375
         Left            =   240
         TabIndex        =   12
         Top             =   3720
         Width           =   1935
      End
      Begin VB.ComboBox cboCharggingType 
         Height          =   315
         ItemData        =   "Form2.frx":0000
         Left            =   5400
         List            =   "Form2.frx":000E
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   5880
         Width           =   1995
      End
      Begin VB.ComboBox cboCharggingRoutin 
         Height          =   315
         ItemData        =   "Form2.frx":0023
         Left            =   5400
         List            =   "Form2.frx":0036
         RightToLeft     =   -1  'True
         TabIndex        =   10
         Top             =   5400
         Width           =   1995
      End
      Begin VB.ComboBox cboRingManageRoutine 
         Height          =   315
         ItemData        =   "Form2.frx":005B
         Left            =   5400
         List            =   "Form2.frx":006E
         RightToLeft     =   -1  'True
         TabIndex        =   9
         Top             =   5040
         Width           =   1995
      End
      Begin VB.ComboBox cboRinger 
         Height          =   315
         ItemData        =   "Form2.frx":008A
         Left            =   5400
         List            =   "Form2.frx":0098
         RightToLeft     =   -1  'True
         TabIndex        =   8
         Top             =   4560
         Width           =   1995
      End
      Begin VB.ComboBox cboDialingRule 
         Height          =   315
         ItemData        =   "Form2.frx":00A9
         Left            =   5400
         List            =   "Form2.frx":00BC
         RightToLeft     =   -1  'True
         TabIndex        =   7
         Top             =   4080
         Width           =   1995
      End
      Begin VB.ComboBox cboPhoneAccessLevel 
         Height          =   315
         ItemData        =   "Form2.frx":00DA
         Left            =   5400
         List            =   "Form2.frx":00ED
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   3600
         Width           =   1995
      End
      Begin VB.ComboBox cboDialingType 
         Height          =   315
         ItemData        =   "Form2.frx":011A
         Left            =   5400
         List            =   "Form2.frx":0128
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   3120
         Width           =   1995
      End
      Begin VB.ComboBox cboCardCheckPolicy 
         Height          =   315
         ItemData        =   "Form2.frx":0139
         Left            =   5400
         List            =   "Form2.frx":0147
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   2640
         Width           =   1995
      End
      Begin VB.ComboBox cboDefaultLanguage 
         Height          =   315
         ItemData        =   "Form2.frx":0161
         Left            =   5400
         List            =   "Form2.frx":0179
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   2160
         Width           =   1995
      End
      Begin VB.ComboBox cboPhoneGroup 
         Height          =   315
         ItemData        =   "Form2.frx":019B
         Left            =   5400
         List            =   "Form2.frx":01D2
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   1680
         Width           =   1995
      End
      Begin VB.ComboBox cboChargePriority 
         Height          =   315
         ItemData        =   "Form2.frx":0245
         Left            =   5400
         List            =   "Form2.frx":024F
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Top             =   1200
         Width           =   1995
      End
      Begin VB.Label Label1 
         Caption         =   "”—Ì«· œ”‰ê«Â  ·›‰"
         Height          =   255
         Index           =   0
         Left            =   2280
         TabIndex        =   34
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "“»«‰ «’·Ì "
         Height          =   255
         Index           =   14
         Left            =   7440
         TabIndex        =   33
         Top             =   2160
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "ê—ÊÂ  ·›‰"
         Height          =   255
         Index           =   15
         Left            =   7440
         TabIndex        =   32
         Top             =   1680
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "“„«‰ ò”— „»·€"
         Height          =   255
         Index           =   16
         Left            =   7440
         TabIndex        =   31
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "„Â·   ⁄ÊÌ÷ ò«— "
         Height          =   255
         Index           =   1
         Left            =   2280
         TabIndex        =   30
         Top             =   3840
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   " ⁄œ«œ “‰ê ﬁ»· «“ Å«”Œ"
         Height          =   255
         Index           =   2
         Left            =   2280
         TabIndex        =   29
         Top             =   3360
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "„Â·  ‘„«—Â êÌ—Ì"
         Height          =   255
         Index           =   3
         Left            =   2280
         TabIndex        =   28
         Top             =   2880
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "“„«‰»‰œÌ «—”«· ê“«—‘"
         Height          =   255
         Index           =   4
         Left            =   2280
         TabIndex        =   27
         Top             =   2400
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "answer „Â· "
         Height          =   255
         Index           =   5
         Left            =   2280
         TabIndex        =   26
         Top             =   1920
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "‰Ê⁄ ‘«—éÌ‰ê"
         Height          =   255
         Index           =   7
         Left            =   7440
         TabIndex        =   25
         Top             =   5880
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "⁄„·Ì«  ‘«—éÌ‰ê"
         Height          =   255
         Index           =   8
         Left            =   7440
         TabIndex        =   24
         Top             =   5400
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "—Ê‘ Å«”Œ »Â “‰ê"
         Height          =   255
         Index           =   9
         Left            =   7440
         TabIndex        =   23
         Top             =   5040
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "“‰ê ŒÊ—"
         Height          =   255
         Index           =   10
         Left            =   7440
         TabIndex        =   22
         Top             =   4560
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "„ÕœÊœÌ  ‘„«—Â êÌ—Ì"
         Height          =   255
         Index           =   11
         Left            =   7440
         TabIndex        =   21
         Top             =   4080
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "”ÿÕ œ” —”Ì »Â  ·›‰"
         Height          =   255
         Index           =   12
         Left            =   7440
         TabIndex        =   20
         Top             =   3600
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "‰Ê⁄ ‘„«—Â êÌ—Ì"
         Height          =   255
         Index           =   13
         Left            =   7440
         TabIndex        =   19
         Top             =   3120
         Width           =   1695
      End
      Begin VB.Label Label1 
         Caption         =   "—Ê‘ çò ò—œ‰ ò«— "
         Height          =   255
         Index           =   17
         Left            =   7440
         TabIndex        =   18
         Top             =   2640
         Width           =   1695
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Form_Load()
ReadSettingFromFile
End Sub
Private Sub ReadSettingFromFile()
   On Error Resume Next
    Dim IndexCounter As Integer
    Dim PhoneStationID As Long
    Dim CardState As Byte
    
 
'    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Read As #1 Len = Len(FileBlockTemp)
    Open Form1.Text1.Text For Random Access Read As #1 Len = Len(FileBlockTemp)

    Get #1, 1, FileBlockTemp

    Close #1
   ' SetCalled PhoneStationSerialNo
    txtPhoneId = DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
   ' PhoneStationID = PhoneStationSerialNo
    'If (Not IsInPhoneStations(PhoneStationID)) Then Exit Sub
    
    

            txtAnswertime = FileBlockTemp.FileAnswerTime
           ' txtCharggingType = FileBlockTemp.FileCharggingType
          '  txtCharggingRoutine = FileBlockTemp.FileCharggingRoutin
            txtRingCount = FileBlockTemp.FileRingCount
           ' txtRingManageRoutine = FileBlockTemp.FileRingManageRoutin
          '  txtRinger = FileBlockTemp.FileRinger
         '   txtDialingRule = FileBlockTemp.FileDialingRule
     '       txtPhoneLevelAccess = FileBlockTemp.FilePhoneAccessLevel
       '     txtDialingType = FileBlockTemp.FileDialingType
            txtReportScheduling = FileBlockTemp.FileReportScheduling
            txtDialWaitTime = FileBlockTemp.FileDialWaitTime
            txtCardChangeWait = FileBlockTemp.FileCardChangeWait
'            txtCardCheckPolicy = FileBlockTemp.FileCardCheckPolicy
'            txtDefaultLang = FileBlockTemp.FileDefaultLanguage
'            txtPhoneGroup = FileBlockTemp.FilePhoneGroup
'            txtChargePriority = FileBlockTemp.FileChargePriority


        
        

'         txtRingCount.Text = !RingCount
'         txtDialWaitTime.Text = !DialWaitTime
'         txtCardChangeWait.Text = !CardChangeWait
'         txtCityCode.Text = !CityCode
         'txtChargePriority.Text = !ChargePriority
        cboChargePriority.ListIndex = Val(FileBlockTemp.FileChargePriority)
       cboPhoneGroup.ListIndex = Val(FileBlockTemp.FilePhoneGroup) - 1
        cboDefaultLanguage.ListIndex = (Val(FileBlockTemp.FileDefaultLanguage) - 160) \ 10
        cboCardCheckPolicy.ListIndex = (Val(FileBlockTemp.FileCardCheckPolicy) - 160) \ 10
       cboDialingType.ListIndex = (Val(FileBlockTemp.FileDialingType) - 160) \ 10
       cboPhoneAccessLevel.ListIndex = (Val(FileBlockTemp.FilePhoneAccessLevel) - 160) \ 10
        cboDialingRule.ListIndex = (Val(FileBlockTemp.FileDialingRule) - 160) \ 10
       cboRinger.ListIndex = (Val(FileBlockTemp.FileRinger) - 160) \ 10
        cboRingManageRoutine.ListIndex = (Val(FileBlockTemp.FileRingManageRoutin) - 160) \ 10
            cboCharggingRoutin.ListIndex = (Val(FileBlockTemp.FileCharggingRoutin) - 160) \ 10
            cboCharggingType.ListIndex = (Val(FileBlockTemp.FileCharggingType) - 160) \ 10

End Sub
