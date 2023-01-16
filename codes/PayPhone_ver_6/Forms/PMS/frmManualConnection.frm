VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmManualConnection 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Manual Connection"
   ClientHeight    =   1680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   WhatsThisHelp   =   -1  'True
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   285
      Index           =   0
      Left            =   135
      OleObjectBlob   =   "frmManualConnection.frx":0000
      TabIndex        =   4
      Top             =   180
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2475
      TabIndex        =   3
      Top             =   1170
      Width           =   1230
   End
   Begin VB.CommandButton Command1 
      Caption         =   "C&onnect"
      Height          =   375
      Left            =   900
      TabIndex        =   2
      Top             =   1170
      Width           =   1185
   End
   Begin VB.TextBox Text1 
      Height          =   315
      Left            =   2025
      TabIndex        =   1
      Top             =   675
      Width           =   2040
   End
   Begin MSDataListLib.DataCombo DataCombo1 
      Bindings        =   "frmManualConnection.frx":008A
      Height          =   315
      Left            =   2025
      TabIndex        =   0
      Top             =   180
      Width           =   2040
      _ExtentX        =   3598
      _ExtentY        =   556
      _Version        =   393216
      Appearance      =   0
      ListField       =   "ID"
      BoundColumn     =   "TelNO"
      Text            =   ""
      Object.DataMember      =   "cmdPhoneStation"
   End
   Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
      Height          =   285
      Index           =   1
      Left            =   135
      OleObjectBlob   =   "frmManualConnection.frx":009B
      TabIndex        =   5
      Top             =   720
      Width           =   1815
   End
End
Attribute VB_Name = "frmManualConnection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim PhoneStationID As Long
Dim PhoneStationTelNo As String
Private Sub Command1_Click()
   Dim i As Byte
    If (PhoneStationID <> 0) And (PhoneStationTelNo <> "") Then
    i = Val(frmManualConnection.Tag)
    MakeOutgoConnection i
    Unload Me
    End If
   
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub DataCombo1_Change()
    
 DoEvents
    Text1.Text = DataCombo1.BoundText
    PhoneStationID = Val(DataCombo1.Text)
    PhoneStationTelNo = DataCombo1.BoundText
End Sub

Public Sub kill_me()

    Unload Me
End Sub

Private Sub Form_Load()
    SetSkin Me
End Sub

Private Sub MakeOutgoConnection(a As Byte)
   OutgoHandler = a
   Dim frmNEW As New frmOutGo
   frmNEW.ValidateControls
   frmNEW.connect PhoneStationID, PhoneStationTelNo
End Sub

