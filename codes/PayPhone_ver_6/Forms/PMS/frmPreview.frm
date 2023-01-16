VERSION 5.00
Object = "{E281C260-6F27-11D1-8AF0-00A0C98CD92B}#2.0#0"; "ardespro2.dll"
Begin VB.Form frmPreview 
   ClientHeight    =   8880
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   9975
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   178
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   RightToLeft     =   -1  'True
   ScaleHeight     =   8880
   ScaleWidth      =   9975
   WindowState     =   2  'Maximized
   Begin VB.Timer timPreview2 
      Left            =   420
      Top             =   1800
   End
   Begin VB.Timer timPreview1 
      Left            =   420
      Top             =   1140
   End
   Begin VB.Frame fraPreview 
      BackColor       =   &H00808080&
      Height          =   735
      Left            =   240
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   5820
      Width           =   6735
      Begin VB.CommandButton cmdEditPicture 
         Caption         =   "ÊÌ—«Ì‘  ’ÊÌ—"
         Height          =   375
         Left            =   1880
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdReport 
         Caption         =   "ê“«—‘"
         Height          =   375
         Left            =   300
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdEditText 
         Caption         =   "ÊÌ—«Ì‘ „ ‰"
         Height          =   375
         Left            =   3460
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "Œ—ÊÃ"
         Height          =   375
         Left            =   5040
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Top             =   240
         Width           =   1455
      End
   End
   Begin DDActiveReportsDesignerCtl.ARDesigner ardPreview 
      Height          =   8385
      Left            =   -120
      TabIndex        =   4
      Top             =   0
      Width           =   11835
      _ExtentX        =   20876
      _ExtentY        =   14790
   End
End
Attribute VB_Name = "frmPreview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cmdEditPicture_Click()
    ChangePicSize
End Sub

Private Sub cmdEditText_Click()
    frmEditPreview.Show vbModal
    
'    ChangePicSize
End Sub

Private Sub ChangePicSize()
         ardPreview.SaveToObject arGlobal

            With frmReport.ChartReport
                HeightTemp = .Height
                WidthTemp = .Width

                .Height = arGlobal.Image1.Height
                .Width = arGlobal.Image1.Width
                .ExportPicture App.Path & "\Picture\1.jpg"

                frmReport.RowColChange

                .Height = arGlobal.Image2.Height
                .Width = arGlobal.Image2.Width
                .ExportPicture App.Path & "\Picture\2.jpg"

                frmReport.RowColChange
              End With

            ardPreview.LoadFromObject arGlobal

    timPreview1.Interval = 100

End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub CmdReport_Click()
    ardPreview.SaveToObject arGlobal
    
    arGlobal.Show vbModal
    ardPreview.SaveToObject arGlobal
End Sub

Private Sub Form_Load()
    SetSkin Me
End Sub

'Private Sub cmdSubmitChange_Click()
'   ardPreview.SaveToObject arGlobal
'
'        With frmReport.ChartReport
'            .Height = arGlobal.Image1.Height
'            .Width = arGlobal.Image1.Width
'            .ExportPicture App.Path & "\1.jpg"
'        End With
'
'    ardPreview.LoadFromObject arGlobal
'    Timer1.Interval = 100
'End Sub
'Private Sub Command2_Click()
'End Sub

Private Sub Form_Resize()
   
    ardPreview.LoadFromObject arGlobal
    With ardPreview
        .Top = 0
        .Left = 0
        .Width = Width
        .Height = Height
    End With
    
    With fraPreview
        .Top = Height - 1620
        .Left = (Width - .Width) / 2
    End With
End Sub

Private Sub timPreview2_Timer()

'
'
'
    ardPreview.SaveToObject arGlobal

    Set arGlobal.Image1.Picture = Nothing
    Set arGlobal.Image1.Picture = LoadPicture(App.Path & "\Picture\1.jpg")

    Set arGlobal.Image2.Picture = Nothing
    Set arGlobal.Image2.Picture = LoadPicture(App.Path & "\Picture\2.jpg")

    Set arGlobal.Image1.Picture = Nothing
    Set arGlobal.Image1.Picture = LoadPicture(App.Path & "\Picture\1.jpg")

    Set arGlobal.Image2.Picture = Nothing
    Set arGlobal.Image2.Picture = LoadPicture(App.Path & "\Picture\2.jpg")


    ardPreview.LoadFromObject arGlobal

'    ardPreview.SaveToObject arGlobal

    timPreview2.Interval = 0

    With frmReport.ChartReport
        .Height = HeightTemp
        .Width = WidthTemp
    End With
End Sub

Private Sub timPreview1_Timer()
    With frmReport.ChartReport
        .Height = arGlobal.Image1.Height
        .Width = arGlobal.Image1.Width
        .ExportPicture App.Path & "\Picture\1.jpg"
        
        frmReport.RowColChange
        
        .Height = arGlobal.Image2.Height
        .Width = arGlobal.Image2.Width
        .ExportPicture App.Path & "\Picture\2.jpg"
        
        frmReport.RowColChange
    End With

'    ardPreview.LoadFromObject arGlobal
'    ardPreview.SaveToObject arGlobal


    timPreview1.Interval = 0
    timPreview2.Interval = 100
End Sub
