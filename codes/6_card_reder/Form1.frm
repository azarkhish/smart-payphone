VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   " ‰ŸÌ„ ò«—  „œÌ—Ì   ·›‰Â«Ì Â„ê«‰Ì"
   ClientHeight    =   6105
   ClientLeft      =   2160
   ClientTop       =   2160
   ClientWidth     =   8745
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6105
   ScaleWidth      =   8745
   Begin VB.Timer fault_timer 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   240
      Top             =   1440
   End
   Begin VB.TextBox txtComportSetting 
      Height          =   375
      Left            =   2400
      TabIndex        =   12
      Text            =   "1"
      Top             =   120
      Width           =   495
   End
   Begin VB.CommandButton Command2 
      Caption         =   "start device1"
      Height          =   375
      Left            =   3120
      TabIndex        =   11
      Top             =   120
      Width           =   1095
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   120
      Top             =   720
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   2
      DTREnable       =   -1  'True
      Handshaking     =   1
   End
   Begin VB.Frame Frame2 
      Height          =   1815
      Left            =   1320
      TabIndex        =   8
      Top             =   600
      Width           =   6255
      Begin VB.CommandButton Command1 
         Caption         =   "Load File"
         Height          =   615
         Left            =   2160
         TabIndex        =   10
         Top             =   960
         Width           =   1695
      End
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   5535
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1935
      Left            =   1320
      TabIndex        =   3
      Top             =   3960
      Width           =   6255
      Begin VB.CommandButton cmdSendData 
         Caption         =   "Write Setting"
         Height          =   555
         Left            =   360
         TabIndex        =   6
         Top             =   1080
         Width           =   1725
      End
      Begin VB.CommandButton cmdReadData 
         Caption         =   "Read Report"
         Height          =   555
         Left            =   2160
         TabIndex        =   5
         Top             =   1080
         Width           =   1725
      End
      Begin VB.CommandButton Command6 
         Caption         =   "Read Setting"
         Height          =   555
         Left            =   3960
         TabIndex        =   4
         Top             =   1080
         Width           =   1725
      End
      Begin ComctlLib.ProgressBar ProgressBar1 
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   480
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   450
         _Version        =   327682
         Appearance      =   1
      End
   End
   Begin VB.Frame Frame3 
      Height          =   1095
      Left            =   1320
      TabIndex        =   0
      Top             =   2640
      Width           =   6255
      Begin VB.TextBox Text2 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1065
            SubFormatType   =   1
         EndProperty
         Height          =   495
         IMEMode         =   3  'DISABLE
         Left            =   3120
         MaxLength       =   4
         PasswordChar    =   "*"
         TabIndex        =   1
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "Password:"
         Height          =   255
         Left            =   2280
         TabIndex        =   2
         Top             =   480
         Width           =   855
      End
   End
   Begin MSComDlg.CommonDialog Dialog 
      Left            =   120
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label2 
      Caption         =   "comport:"
      Height          =   255
      Left            =   1680
      TabIndex        =   13
      Top             =   240
      Width           =   615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim State As Integer
Dim mode As Integer
Dim Command As Byte
Dim SendCounter As Integer
Dim i As Integer
Dim stop_sub As Boolean
'''''''''commands table''''''''''
Const WriteE2p = 1
Const ReadE2p = 2
Const WritePassword = 3

'''''''state table'''''''''
Const StartDevice = 0
Const SendData = 1
Const ReceiveData = 2
'''''''''''''''''''''''''''
''''''mode table''''''''''
Const WaitForCommand = 0
Const WaitForDeviceReady = 1
Const WaitForDeviceAck = 2
Const WaitForDSR = 3
Const PcReady = 4

Dim FileMap(14600) As Byte
Const MapSize = 14600
Dim Error As Boolean

Private Sub cmdSendData_Click()
Dim TmpCmd(0) As Byte
Dim Tmpdta(89) As Byte
Error = False

stop_sub = False

ReadFile
If (Error <> True) Then
SendCounter = 0
TmpCmd(0) = WriteE2p
MSComm1.Output = TmpCmd 'Command
State = SendData
mode = WaitForDSR

For i = 1 To 163 '163

ProgressBar1.Value = (i / 163) * 100
MSComm1.DTREnable = True

fault_timer.Enabled = True

WaitForDsrTrue:
   Sleep 100
    DoEvents
    If stop_sub = True Then Exit Sub
    If (MSComm1.DSRHolding = False) Then GoTo WaitForDsrTrue
fault_timer.Enabled = False

MSComm1.DTREnable = False
 
    For j = 1 To 90
    If (((((i - 1) * 90) + j) - 1) <= 14600) Then
       Tmpdta(j - 1) = FileMap((((i - 1) * 90) + j) - 1)
    Else
       Tmpdta(j - 1) = 0
    End If
    Next j
    
    MSComm1.Output = Tmpdta
    
    fault_timer.Enabled = True

WaitForDsrFalse:
Sleep 100
 DoEvents
      
    If stop_sub = True Then Exit Sub
        If (MSComm1.DSRHolding = True) Then GoTo WaitForDsrFalse
    fault_timer.Enabled = False
    
    Next i
    
    MsgBox "⁄„·Ì«  «‰Ã«„ ‘œ"
    ProgressBar1.Value = 0
    
    Else
    MsgBox "⁄„·Ì«  „ Êﬁ› ‘œ"
    End If

End Sub

'Private Sub cmdSetPassword_Click()
'
'Dim TmpCmd(0) As Byte
'Dim Tmpdta(3) As Byte
'
'
'
'If Text2.Text = "" Then
'MsgBox "ò·„Â ⁄»Ê— —«Ê«—œ ò‰Ìœ", vbOKOnly, "Œÿ«"
'Exit Sub
'End If
'a = Text2.Text
'If a < 1000 Then
'MsgBox "ÿÊ· ò·„Â ⁄»Ê— »«Ìœ 4 ò«—«ò — »«‘œ", vbOKOnly, "Œÿ«"
'Exit Sub
'End If
'
'Tmpdta(0) = a \ 1000
'a = a Mod 1000
'Tmpdta(1) = a \ 100
'a = a Mod 100
'Tmpdta(2) = a \ 10
'a = a Mod 10
'Tmpdta(3) = a
'
'
'TmpCmd(0) = WritePassword
'MSComm1.Output = TmpCmd 'Command
'
'MSComm1.DTREnable = True
'
'WaitForDsrTrue:
'    DoEvents
'    If (MSComm1.DSRHolding = False) Then GoTo WaitForDsrTrue
'
'MSComm1.DTREnable = False
'
'    MSComm1.Output = Tmpdta
'
'WaitForDsrFalse:
'    DoEvents
'    If (MSComm1.DSRHolding = True) Then GoTo WaitForDsrFalse
'
'
'MsgBox "⁄„·Ì«  «‰Ã«„ ‘œ"
'
'
'End Sub

Private Sub Command1_Click()
Dialog.ShowOpen
Text1.Text = Dialog.FileName
End Sub

Private Sub ReadFile()
On Error GoTo EH
    Open Text1.Text For Binary As #1 Len = 14429
    Get #1, 1, FileMap
    Close #1

If Text2.Text = "" Then
MsgBox "ò·„Â ⁄»Ê— —«Ê«—œ ò‰Ìœ", vbOKOnly, "Œÿ«"
GoTo EH
End If
a = Text2.Text
If a < 1000 Then
MsgBox "ÿÊ· ò·„Â ⁄»Ê— »«Ìœ 4 ò«—«ò — »«‘œ", vbOKOnly, "Œÿ«"
GoTo EH
End If

FileMap(14597) = a \ 1000
a = a Mod 1000
FileMap(14598) = a \ 100
a = a Mod 100
FileMap(14599) = a \ 10
a = a Mod 10
FileMap(14600) = a

Exit Sub
EH:
Error = True
End Sub

Private Sub WriteFile()
   Dim File1(14428) As Byte

        For i = 0 To 14428
        File1(i) = FileMap(i)
        Next i
    Open Text1.Text For Binary As #1 Len = 14429
    Put #1, 1, File1
    Close #1
End Sub


Private Sub Command2_Click()
On Error GoTo EH
MSComm1.CommPort = Val(txtComportSetting.Text)

MSComm1.PortOpen = True
MSComm1.DTREnable = False
Error = False


MSComm1.DTREnable = True
State = StartDevice
mode = WaitForDSR

MSComm1.DTREnable = False
Exit Sub
EH:
MsgBox " Œÿ« œ— Ê—Êœ «ÿ·«⁄« "
End
End Sub

Private Sub Command3_Click()
End Sub

Private Sub fault_timer_Timer()

MsgBox "⁄„·Ì«  »« Œÿ« „ Êﬁ› ‘œ"

Error = False
MSComm1.DTREnable = False
State = StartDevice
mode = WaitForDSR
stop_sub = True
clear_all


End Sub

Private Sub clear_all()
ProgressBar1.Value = 0
fault_timer.Enabled = False
End Sub

