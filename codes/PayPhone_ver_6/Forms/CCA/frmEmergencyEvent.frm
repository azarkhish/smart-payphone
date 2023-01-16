VERSION 5.00
Begin VB.Form frmEmergencyEvent 
   BorderStyle     =   0  'None
   Caption         =   "Emergency Event Warning!"
   ClientHeight    =   2190
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3900
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form1"
   ScaleHeight     =   2190
   ScaleWidth      =   3900
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Line Number:"
      Height          =   240
      Index           =   0
      Left            =   1305
      TabIndex        =   7
      Top             =   315
      Width           =   1050
   End
   Begin VB.Label lblLNum 
      BackStyle       =   0  'Transparent
      Height          =   240
      Left            =   2295
      TabIndex        =   6
      Top             =   315
      Width           =   1050
   End
   Begin VB.Label lblEventName 
      BackStyle       =   0  'Transparent
      Height          =   240
      Left            =   1845
      TabIndex        =   5
      Top             =   1575
      Width           =   1860
   End
   Begin VB.Label lblPSNum 
      BackStyle       =   0  'Transparent
      Height          =   240
      Left            =   2520
      TabIndex        =   4
      Top             =   720
      Width           =   1050
   End
   Begin VB.Label lblPPNum 
      BackStyle       =   0  'Transparent
      Height          =   240
      Left            =   2655
      TabIndex        =   3
      Top             =   1170
      Width           =   1050
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Event :"
      Height          =   240
      Index           =   3
      Left            =   1305
      TabIndex        =   2
      Top             =   1575
      Width           =   645
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "PayPhoneNumber:"
      Height          =   240
      Index           =   2
      Left            =   1305
      TabIndex        =   1
      Top             =   1170
      Width           =   1365
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "PayPhoneSerial:"
      Height          =   240
      Index           =   1
      Left            =   1305
      TabIndex        =   0
      Top             =   720
      Width           =   1230
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   360
      Picture         =   "frmEmergencyEvent.frx":0000
      Top             =   765
      Width           =   480
   End
   Begin VB.Shape Shape1 
      BackStyle       =   1  'Opaque
      BorderWidth     =   3
      Height          =   2175
      Left            =   0
      Top             =   0
      Width           =   3885
   End
End
Attribute VB_Name = "frmEmergencyEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Form_Activate()
SetView
End Sub

Private Sub Form_Load()
Me.Top = (frmMain.Top + (frmMain.Height - Me.Height) / 2)
Me.Left = (frmMain.Left + (frmMain.Width - Me.Width) / 2)
End Sub
Public Sub SetView()
'lblLNum.FontBold = True
'lblEventName.FontBold = True
'lblPSNum.FontBold = True
'lblPPNum.FontBold = True
'lblEventName.ForeColor = vbRed
'
'lblLNum = Str(EmergencyLNUM + 1)
'lblPSNum = Str(EmergencyPSNUM)
'
'Select Case EmergencyEventCode
'Case 1:
'lblEventName = "Low Battery"
'Case 2:
'lblEventName = "No Charge Signal"
'Case 3:
'lblEventName = "Line Error"
'Case 4:
'lblEventName = "Door Open!"
'Case 5:
'lblEventName = "Handset damaged"
'Case 6:
'lblEventName = "No Sam"
'Case 7:
'lblEventName = "No AntiTap signal"
'Case 8:
'lblEventName = "RTC Error"
'Case 9:
'lblEventName = "Line Tap!"
'
'End Select
End Sub

