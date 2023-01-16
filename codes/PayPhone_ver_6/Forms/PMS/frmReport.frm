VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "Tabctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{0002E550-0000-0000-C000-000000000046}#1.0#0"; "OWC10.DLL"
Begin VB.Form frmReport 
   ClientHeight    =   8400
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   11400
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
   MDIChild        =   -1  'True
   PaletteMode     =   1  'UseZOrder
   RightToLeft     =   -1  'True
   ScaleHeight     =   8400
   ScaleWidth      =   11400
   WindowState     =   2  'Maximized
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame fraReport 
      Height          =   7515
      Left            =   720
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   600
      Width           =   10095
      Begin VB.CommandButton cmdRefresh 
         Caption         =   " «“Â ”«“Ì ’›ÕÂ"
         Height          =   615
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   54
         Top             =   6840
         Width           =   2175
      End
      Begin VB.CommandButton cmdOtherPreview 
         Caption         =   "ÅÌ‘ ‰„«Ì‘ ê“«—‘"
         Height          =   615
         Left            =   5160
         RightToLeft     =   -1  'True
         TabIndex        =   53
         Top             =   6840
         Width           =   2175
      End
      Begin VB.CommandButton cmdExit 
         Cancel          =   -1  'True
         Caption         =   "Œ—ÊÃ"
         Height          =   615
         Left            =   7560
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   6840
         Width           =   2175
      End
      Begin VB.CommandButton cmdSearch 
         Caption         =   "Ã” ÃÊ"
         Height          =   615
         Left            =   360
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   6840
         Width           =   2175
      End
      Begin TabDlg.SSTab sstReport 
         Height          =   6435
         Left            =   300
         TabIndex        =   1
         Top             =   360
         Width           =   9555
         _ExtentX        =   16854
         _ExtentY        =   11351
         _Version        =   393216
         TabHeight       =   520
         TabCaption(0)   =   "‰„Êœ«—"
         TabPicture(0)   =   "frmReport.frx":0000
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "fraChart"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).ControlCount=   1
         TabCaption(1)   =   "«ÿ·«⁄« "
         TabPicture(1)   =   "frmReport.frx":001C
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "lbl(5)"
         Tab(1).Control(1)=   "SheetReport"
         Tab(1).Control(2)=   "cmdExportToExcel"
         Tab(1).Control(3)=   "cmdSum"
         Tab(1).Control(4)=   "txtReportTitle"
         Tab(1).Control(5)=   "cmdDeleteUnUsedRows"
         Tab(1).ControlCount=   6
         TabCaption(2)   =   "Ã“∆Ì«  ê“«—‘"
         TabPicture(2)   =   "frmReport.frx":0038
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "cdlgColor"
         Tab(2).Control(1)=   "fraReport1"
         Tab(2).Control(2)=   "fraDefaultReport"
         Tab(2).Control(3)=   "SkinLabel1(3)"
         Tab(2).Control(4)=   "Image1"
         Tab(2).ControlCount=   5
         Begin VB.CommandButton cmdDeleteUnUsedRows 
            Caption         =   "Õ–› ”ÿ—Â«Ì Œ«·Ì"
            Height          =   495
            Left            =   -70620
            RightToLeft     =   -1  'True
            TabIndex        =   43
            Top             =   5640
            Width           =   2235
         End
         Begin VB.Frame fraChart 
            DragMode        =   1  'Automatic
            Enabled         =   0   'False
            Height          =   5835
            Left            =   120
            RightToLeft     =   -1  'True
            TabIndex        =   26
            Top             =   540
            Width           =   9135
            Begin MSDataListLib.DataCombo dtcFontName 
               Bindings        =   "frmReport.frx":0054
               Height          =   315
               Left            =   6720
               TabIndex        =   52
               Top             =   4800
               Width           =   1275
               _ExtentX        =   2249
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               Object.DataMember      =   "cmdFont"
            End
            Begin VB.ComboBox cboLegendPosition 
               Height          =   315
               ItemData        =   "frmReport.frx":0065
               Left            =   6720
               List            =   "frmReport.frx":0078
               TabIndex        =   50
               Top             =   5340
               Width           =   1275
            End
            Begin VB.HScrollBar hscChartInclination 
               Height          =   195
               Left            =   3060
               Max             =   90
               Min             =   -90
               RightToLeft     =   -1  'True
               TabIndex        =   46
               Top             =   5520
               Width           =   2235
            End
            Begin VB.HScrollBar hscChartPerspective 
               Height          =   255
               Left            =   120
               Max             =   80
               RightToLeft     =   -1  'True
               TabIndex        =   45
               Top             =   5460
               Width           =   2055
            End
            Begin VB.HScrollBar hscChartRotate 
               Height          =   315
               Left            =   120
               Max             =   360
               TabIndex        =   44
               Top             =   5100
               Width           =   5175
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   0
               Left            =   8220
               OleObjectBlob   =   "frmReport.frx":009D
               TabIndex        =   39
               Top             =   1080
               Width           =   795
            End
            Begin VB.Frame fraChartType 
               Caption         =   " ‰Ê⁄   ›ﬂÌﬂ "
               Height          =   735
               Left            =   6660
               RightToLeft     =   -1  'True
               TabIndex        =   33
               Top             =   180
               Width           =   2355
               Begin VB.OptionButton optSeprated 
                  Caption         =   " ›ﬂÌﬂ ‘œÂ"
                  Height          =   492
                  Left            =   180
                  TabIndex        =   35
                  Top             =   180
                  Width           =   1155
               End
               Begin VB.OptionButton optTotal 
                  Caption         =   "ﬂ·Ì"
                  Height          =   255
                  Left            =   1560
                  TabIndex        =   34
                  Top             =   300
                  Width           =   675
               End
            End
            Begin VB.ComboBox CboPart 
               Height          =   315
               Left            =   6660
               TabIndex        =   32
               Top             =   1380
               Width           =   1395
            End
            Begin OWC10.ChartSpace ChartReport 
               Height          =   4755
               Left            =   120
               OleObjectBlob   =   "frmReport.frx":0108
               TabIndex        =   36
               Top             =   240
               Width           =   6435
            End
            Begin MSDataListLib.DataCombo dtcPattern 
               Bindings        =   "frmReport.frx":0CFE
               Height          =   315
               Left            =   6660
               TabIndex        =   37
               Top             =   1740
               Width           =   1395
               _ExtentX        =   2461
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               Object.DataMember      =   "cmdPattern"
            End
            Begin MSDataListLib.DataCombo dtcChartType 
               Bindings        =   "frmReport.frx":0D0F
               Height          =   315
               Left            =   6660
               TabIndex        =   38
               Top             =   1020
               Width           =   1395
               _ExtentX        =   2461
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               Object.DataMember      =   "cmdChartType"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   1
               Left            =   8220
               OleObjectBlob   =   "frmReport.frx":0D20
               TabIndex        =   40
               Top             =   1800
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   2
               Left            =   8220
               OleObjectBlob   =   "frmReport.frx":0D87
               TabIndex        =   41
               Top             =   1440
               Width           =   915
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   4
               Left            =   8100
               OleObjectBlob   =   "frmReport.frx":0DF2
               TabIndex        =   42
               Top             =   4800
               Width           =   495
            End
            Begin VB.CommandButton cmdRowColChange 
               Caption         =   " €ÌÌ— ”ÿ— Ê ” Ê‰ ‰„Êœ«—"
               Height          =   435
               Left            =   6660
               RightToLeft     =   -1  'True
               TabIndex        =   27
               Top             =   3660
               Width           =   2295
            End
            Begin VB.CommandButton cmdSolidColor 
               Caption         =   "—‰ê ”«œÂ"
               Height          =   435
               Left            =   6660
               TabIndex        =   28
               Top             =   3180
               Width           =   2295
            End
            Begin VB.CommandButton cmdBackGroundColor 
               Caption         =   "—‰ê Å” “„Ì‰Â"
               Height          =   435
               Left            =   7860
               TabIndex        =   30
               Top             =   2700
               Width           =   1095
            End
            Begin VB.CommandButton cmdPatternColor 
               Caption         =   "—‰ê «·êÊ"
               Height          =   435
               Left            =   6660
               TabIndex        =   29
               Top             =   2700
               Width           =   1155
            End
            Begin VB.CommandButton cmdPatternConfirm 
               Caption         =   " «ÌÌœ «·êÊ"
               Height          =   435
               Left            =   6660
               TabIndex        =   31
               Top             =   2220
               Width           =   2295
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   5
               Left            =   5520
               OleObjectBlob   =   "frmReport.frx":0E51
               TabIndex        =   47
               Top             =   5100
               Width           =   1095
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   6
               Left            =   2280
               OleObjectBlob   =   "frmReport.frx":0EC4
               TabIndex        =   48
               Top             =   5460
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   7
               Left            =   5580
               OleObjectBlob   =   "frmReport.frx":0F2B
               TabIndex        =   49
               Top             =   5460
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   8
               Left            =   8100
               OleObjectBlob   =   "frmReport.frx":0F94
               TabIndex        =   51
               Top             =   5340
               Width           =   975
            End
         End
         Begin MSComDlg.CommonDialog cdlgColor 
            Left            =   -74760
            Top             =   1020
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
         End
         Begin VB.TextBox txtReportTitle 
            Alignment       =   1  'Right Justify
            Height          =   345
            Left            =   -74640
            RightToLeft     =   -1  'True
            TabIndex        =   24
            Top             =   660
            Width           =   7455
         End
         Begin VB.CommandButton cmdSum 
            Caption         =   "„Õ«”»Â „Ã„Ê⁄"
            Height          =   495
            Left            =   -72660
            RightToLeft     =   -1  'True
            TabIndex        =   22
            Top             =   5640
            Width           =   1935
         End
         Begin VB.CommandButton cmdExportToExcel 
            Caption         =   "«‰ ﬁ«· «ÿ·«⁄«  »Â Excel"
            Height          =   495
            Left            =   -68280
            RightToLeft     =   -1  'True
            TabIndex        =   21
            Top             =   5640
            Width           =   2235
         End
         Begin VB.Frame fraReport1 
            Caption         =   " Ã“∆Ì«  ê“«—‘ "
            Height          =   2595
            Left            =   -74280
            RightToLeft     =   -1  'True
            TabIndex        =   6
            Top             =   960
            Width           =   7755
            Begin VB.Timer timFormLoad 
               Left            =   60
               Top             =   120
            End
            Begin VB.CommandButton cmdSaveAsCommon 
               Caption         =   "À»  ê“«—‘ »Â ⁄‰Ê«‰ ê“«—‘ ÅÌ‘ ›—÷  "
               Enabled         =   0   'False
               Height          =   495
               Left            =   1200
               RightToLeft     =   -1  'True
               TabIndex        =   14
               Top             =   1935
               Width           =   3315
            End
            Begin VB.CommandButton cmdOtherReport 
               Caption         =   "ê“«—‘"
               Height          =   495
               Left            =   4860
               RightToLeft     =   -1  'True
               TabIndex        =   12
               Top             =   1935
               Width           =   1515
            End
            Begin MSDataListLib.DataCombo dtcSeries 
               Bindings        =   "frmReport.frx":1001
               DataSource      =   "de"
               Height          =   315
               Index           =   1
               Left            =   3780
               TabIndex        =   11
               Top             =   1140
               Width           =   1575
               _ExtentX        =   2778
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "NameInQuery"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdSeries"
            End
            Begin MSDataListLib.DataCombo dtcSeries 
               Bindings        =   "frmReport.frx":1012
               DataSource      =   "de"
               Height          =   315
               Index           =   0
               Left            =   1560
               TabIndex        =   10
               Top             =   780
               Width           =   3795
               _ExtentX        =   6694
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "NameInQuery"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdSeries"
            End
            Begin MSDataListLib.DataCombo dtcItems 
               Bindings        =   "frmReport.frx":1023
               DataSource      =   "de"
               Height          =   315
               Left            =   1560
               TabIndex        =   9
               Top             =   360
               Width           =   2415
               _ExtentX        =   4260
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "NameInQuery"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdItems"
            End
            Begin MSDataListLib.DataCombo dtcFunction 
               Bindings        =   "frmReport.frx":1034
               Height          =   315
               Left            =   4005
               TabIndex        =   8
               Top             =   360
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "NameInQuery"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdFunctions"
            End
            Begin MSDataListLib.DataCombo dtcSeries 
               Bindings        =   "frmReport.frx":1045
               DataSource      =   "de"
               Height          =   315
               Index           =   2
               Left            =   1560
               TabIndex        =   15
               Top             =   1140
               Width           =   1995
               _ExtentX        =   3519
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "NameInQuery"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdSeries"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   0
               Left            =   5340
               OleObjectBlob   =   "frmReport.frx":1056
               TabIndex        =   16
               Top             =   420
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   1
               Left            =   5400
               OleObjectBlob   =   "frmReport.frx":10B7
               TabIndex        =   17
               Top             =   780
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   2
               Left            =   5220
               OleObjectBlob   =   "frmReport.frx":1118
               TabIndex        =   18
               Top             =   1140
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   4
               Left            =   3540
               OleObjectBlob   =   "frmReport.frx":117F
               TabIndex        =   19
               Top             =   1140
               Width           =   195
            End
            Begin VB.ComboBox cboQueryType 
               Height          =   315
               ItemData        =   "frmReport.frx":11D8
               Left            =   1560
               List            =   "frmReport.frx":11FA
               RightToLeft     =   -1  'True
               Style           =   2  'Dropdown List
               TabIndex        =   55
               Top             =   360
               Width           =   2415
            End
         End
         Begin VB.Frame fraDefaultReport 
            Caption         =   " ê“«—‘«  ÅÌ‘ ›—÷"
            Height          =   1815
            Left            =   -74280
            RightToLeft     =   -1  'True
            TabIndex        =   5
            Top             =   3600
            Width           =   7755
            Begin VB.Timer timFormLoad2 
               Left            =   0
               Top             =   0
            End
            Begin VB.CommandButton cmdClearDefaultReport 
               Caption         =   "Õ–› ê“«—‘ «“ ·Ì”  ê“«—‘« "
               Height          =   495
               Left            =   1200
               RightToLeft     =   -1  'True
               TabIndex        =   23
               Top             =   1080
               Width           =   3375
            End
            Begin VB.CommandButton cmdCommonReport 
               Caption         =   "ê“«—‘"
               Height          =   495
               Left            =   4920
               RightToLeft     =   -1  'True
               TabIndex        =   13
               Top             =   1080
               Width           =   1515
            End
            Begin MSDataListLib.DataCombo dtcDefaultReport 
               Bindings        =   "frmReport.frx":127D
               Height          =   315
               Left            =   240
               TabIndex        =   7
               Top             =   600
               Width           =   6195
               _ExtentX        =   10927
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdStoredQuery"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   6
               Left            =   6480
               OleObjectBlob   =   "frmReport.frx":128E
               TabIndex        =   20
               Top             =   600
               Width           =   795
            End
         End
         Begin OWC10.Spreadsheet SheetReport 
            Height          =   4545
            Left            =   -74640
            OleObjectBlob   =   "frmReport.frx":12F7
            TabIndex        =   2
            Top             =   1080
            Width           =   8475
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   285
            Index           =   3
            Left            =   -71130
            OleObjectBlob   =   "frmReport.frx":1B5E
            TabIndex        =   56
            Top             =   2115
            Width           =   1320
         End
         Begin VB.Label lbl 
            Alignment       =   1  'Right Justify
            Caption         =   "⁄‰Ê«‰ ê“«—‘"
            Height          =   315
            Index           =   5
            Left            =   -67980
            RightToLeft     =   -1  'True
            TabIndex        =   25
            Top             =   660
            Width           =   1815
         End
         Begin VB.Image Image1 
            Height          =   525
            Left            =   -74760
            Picture         =   "frmReport.frx":1BD8
            Stretch         =   -1  'True
            Top             =   420
            Width           =   825
         End
      End
   End
End
Attribute VB_Name = "frmReport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Base 1

Dim rs As New ADODB.Recordset

Dim strQueryWhere As String
Dim strQueryTotal As String
Dim QueryType As Byte
Dim strQueryFrom As String
Dim strQueryItems As String
Dim strQueryStart As String
Dim FieldRows(4) As Integer
    
Dim chConstants
Dim ssConstants
Dim cboIndexBackUpTotal As Integer
Dim cboIndexBackUpSeprated As Integer
Dim PatternColor As Long
Dim PatternBackGround As Long
Dim Col As String
Dim Row As String
Dim SWTotal As Boolean
Dim SWSeprated As Boolean
Dim dlSeries1Labels
Dim serSeries1
Dim StartCol As String * 1
Dim QueryWhere As String
Dim SWSetPattern As Boolean
'
'Private Sub cboChangeFont_Change()
'    If cboChangeFont.ListIndex = 0 Then
'        SheetReport.Range("A1:H8").Font.Name = cboFontName.Text
'    Else
'        If cboChangeFont.ListIndex = 1 Then
'            ChartReport.Charts(0).Legend.Font.Name = cboFontName.Text
'        Else
'            If cboChangeFont.ListIndex = 2 Then
'                ChartReport.Charts(0).Axes(1).Font.Name = cboFontName.Text
'            End If
'        End If
'    End If
'End Sub
'Private Sub cboFontName_Change()
' ''   If cboChangeFont.ListIndex = 0 Then
'  ''      SheetReport.Range("A1:H8").Font.Name = cboFontName.Text
'  ''  Else
'        ChartReport.Charts(0).Legend.Font.Name = cboFontName.Text
'   '' End If
'End Sub

Private Sub cboLegendPosition_click()
    On Error Resume Next
    ChartReport.Charts(0).Legend.Position = cboLegendPosition.ListIndex
End Sub






Private Sub CboPart_Click()
    Dim I As Integer
    Dim ColorBackup As Long
    If optTotal.Value = True Then
        For I = 1 To ChartReport.Charts(0).SeriesCollection(0).Points.Count
              ChartReport.Charts(0).SeriesCollection(0).Points(I - 1).Explosion = 0
        Next I
        
        ChartReport.Charts(0).SeriesCollection(0).Points(CboPart.ListIndex).Explosion = 45
        cboIndexBackUpTotal = CboPart.ListIndex
    Else
        If optSeprated.Value = True Then
          If Not (SWSetPattern) Then
            With ChartReport.Charts(0).SeriesCollection(cboIndexBackUpSeprated).Interior
                .SetSolid .DefaultColor
            End With
            SWSeprated = False
          End If
            ChartReport.Charts(0).SeriesCollection(CboPart.ListIndex).Interior.SetPatterned chPatternWave, "Blue", "White"
            cboIndexBackUpSeprated = CboPart.ListIndex
        End If
    End If
End Sub

Private Sub cboQueryType_Click()
    Dim arrCallFields, arrRepairFields, arrRingFields, arrOtherEventFields, arrPhoneStationFields
    Dim arrCallNames, arrRepairNames, arrRingNames, arrOtherEventNames, arrPhoneStationNames
    Dim indexCounter As Integer
    
    
    arrCallFields = Array("PhoneCall.PhoneCardRef,PhoneCall.PhoneStationRef,PhoneCall.CallEventCodeRef,PhoneCall.CallYear,PhoneCall.CallMonth,PhoneCall.CallDay")
    arrCallNames = Array("‘„«—Â ò«— ", "‘„«—Â œ” ê«Â  ·›‰", "‰Ê⁄ „ò«·„Â", "”«·", "„«Â", "—Ê“")
    
    
'    cboOrderBy.Clear
'
'    Select Case Trim(cboQueryType.Text)
'        Case "„ò«·„« ":
'            For indexCounter = LBound(arrCallFields) To UBound(arrCallFields)
'                cboOrderBy.AddItem arrCallNames(indexCounter)
''                cboOrderBy.ItemData(indexCounter) = arrcal`l
'            Next indexCounter
'
'        Case " ⁄„Ì—«   ·›‰":
'        Case " „«” »«  ·›‰":
'        Case "—ÊÌœ«œÂ«Ì Œ«’":
'        Case " ·›‰Â«":
'    End Select
End Sub

Private Sub cmdBackGroundColor_Click()
    CommonDialog1.ShowColor
     
    If (optTotal.Value) Then
        ChartReport.Charts(0).SeriesCollection(0).Points(cboIndexBackUpTotal).Interior.SetPatterned Val(dtcPattern.BoundText), PatternColor, CommonDialog1.Color
     Else
    If optSeprated.Value = True Then
        ChartReport.Charts(0).SeriesCollection(cboIndexBackUpSeprated).Interior.SetPatterned Val(dtcPattern.BoundText), PatternColor, CommonDialog1.Color
        End If
    End If
    PatternBackGround = CommonDialog1.Color
End Sub

Private Sub cmdCommonReport_Click()
    Dim strSql As String
        
    ClearSheet
    txtReportTitle.Text = dtcDefaultReport.Text
    QueryWhere = frmSearch.QueryWhere(QueryType)
    frmMain.ZOrder 0
    ZOrder 0
    frmReportWait.Show
    timFormLoad2.Interval = 100
    
    cmdSum.Enabled = True
    fraChart.Enabled = False
    
End Sub

Private Sub cmdDeleteUnUsedRows_Click()
    ClearUnusedRows
    cmdDeleteUnUsedRows.Enabled = False
End Sub

Private Sub cmdExit_Click()
  ''  Unload Me
  ''  Unload frmSearch
  frmMain.ZOrder 0
End Sub

Private Sub cmdPreview_Click()
    frmPreview.Show
    frmPreview.ZOrder 0
End Sub

Private Sub cmdExportToExcel_Click()
    SheetReport.Export
End Sub

Private Sub cmdOtherPreview_Click()
On Error Resume Next ''width:=320, height:=240
    
    HeightTemp = ChartReport.Height
    WidthTemp = ChartReport.Width
    
    ChartReport.Height = arGlobal.Image1.Height
    ChartReport.Width = arGlobal.Image1.Width
    
    ChartReport.ExportPicture App.Path & "\Picture\1.jpg", Width:=558, Height:=227
    RowColChange
    
    ChartReport.Height = arGlobal.Image2.Height
    ChartReport.Width = arGlobal.Image2.Width
    
    ChartReport.ExportPicture App.Path & "\Picture\2.jpg", Width:=558, Height:=227
    RowColChange
    
    Set arGlobal.Image1.Picture = LoadPicture(App.Path & "\Picture\1.jpg")
    Set arGlobal.Image2.Picture = LoadPicture(App.Path & "\Picture\2.jpg")
    
    ChartReport.Height = HeightTemp
    ChartReport.Width = WidthTemp
    
    arGlobal.Spreadsheet1.ActiveSheet.Range("A1").Select
    SheetReport.ActiveSheet.Range("A1:Z63").Copy
    arGlobal.Spreadsheet1.ActiveSheet.Paste
    
    
    Set arGlobal.Image1.Picture = LoadPicture(App.Path & "\Picture\1.jpg")
    Set arGlobal.Image2.Picture = LoadPicture(App.Path & "\Picture\2.jpg")
    
    arGlobal.txtChart1.Text = "ÃœÊ· ‘„«—Â " & txtReportTitle
    arGlobal.txtChart2.Text = "‰„Êœ«— ‘„«—Â  " & txtReportTitle
    arGlobal.txtTable.Text = "‰„Êœ«— ‘„«—Â  " & txtReportTitle
    
    With frmPreview
'        .timPreview1.Interval = 100
        .Show
    End With
End Sub
Private Sub cmdOtherReport_Click()
    QueryType = 1
    
    If (UCase(Trim(dtcFunction.BoundText)) = "LIST") Then
        QueryType = cboQueryType.ListIndex + 1
        If (QueryType = 4) Then QueryType = 3
        If (QueryType = 5) Then QueryType = 4
        strQueryWhere = frmSearch.QueryWhere(QueryType)
        
        ClearSheet
        frmMain.ZOrder 0
        ZOrder 0
        frmReportWait.Show
        timFormLoad.Interval = 100
        cmdSum.Enabled = True
        cmdDeleteUnUsedRows.Enabled = True
        fraChart.Enabled = False
        
    ElseIf (CheckReportDetails) Then
        strQueryWhere = frmSearch.QueryWhere(QueryType)
        
        ClearSheet
        frmMain.ZOrder 0
        ZOrder 0
        frmReportWait.Show
        timFormLoad.Interval = 100
        cmdSum.Enabled = True
        cmdDeleteUnUsedRows.Enabled = True
        fraChart.Enabled = False
    End If
End Sub

Private Function CheckReportDetails() As Boolean
    CheckReportDetails = True
    
    If Not (dtcFunction.MatchedWithList) Then
        MsgBox "·ÿ›«  «»⁄ „Ê—œ ‰Ÿ— —« «‰ Œ«» ﬂ‰Ìœ", vbOKOnly, "Œÿ«"
        CheckReportDetails = False
        dtcFunction.SetFocus
        Exit Function
    End If
    
    If Not (dtcItems.MatchedWithList) Then
        MsgBox "·ÿ›« ¬Ì „ „Ê—œ ‰Ÿ— —« «‰ Œ«» ﬂ‰Ìœ", vbOKOnly, "Œÿ«"
        CheckReportDetails = False
        dtcItems.SetFocus
        Exit Function
    End If
    
    If Not (dtcSeries(0).MatchedWithList) Then
        MsgBox "·ÿ›« „Ê—œ  ›ﬂÌﬂ —« «‰ Œ«» ﬂ‰Ìœ", vbOKOnly, "Œÿ«"
        CheckReportDetails = False
        dtcSeries(0).SetFocus
        Exit Function
    End If
End Function

Private Sub OtherReport()
On Error Resume Next
    Dim indexCounter As Byte
    Dim SwSeries As Boolean
    
    SheetStartCol = 1
    strQueryItems = ""
    
    
    If (dtcFunction.MatchedWithList And UCase(Trim(dtcFunction.BoundText)) = "LIST") Then
        
  Select Case cboQueryType.ListIndex
         Case 0:
                strQueryFrom = QueryFrom(QueryType)
                strQueryStart = "Select CallEventCode.Name AS CallEventCodeRef,PhoneCall.DistinationNumber AS DistinationNumber,PhoneCall.InitialPrice AS InitialPrice,PhoneCall.FinalPrice AS FinalPrice,PhoneCall.PalsCount AS PalsCount,PhoneCall.CallHour AS CallHour,PhoneCall.CallMinute AS CallMinute,PhoneCall.PhoneCardRef AS PhoneCardRef ,PhoneCall.CallDay AS CallDay,PhoneCall.CallMonth AS CallMonth,PhoneCall.PayphoneXDRef as PayphoneXDRef,PhoneCall.CallDuration as CallDuration "
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " WHERE " & strQueryWhere & _
                               " ORDER BY PhoneCall.CallEventCodeRef , PhoneCall.CallMonth DESC, PhoneCall.CallDay DESC"
                               

                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arPhoneCalls
                    .dcPhoneCalls.Recordset = rs
                    .Show vbModal
                End With
        
        
         Case 1:
                strQueryFrom = QueryFrom(QueryType)
                strQueryStart = "Select PhoneStationRepairing.PayphoneXDRef as PayphoneXDRef,PhoneStationRepairing.PhoneStationRef as PhoneStationRef,PhoneStationRepairType.Name as PhoneStationRepairTypeRef,PhoneStationRepairing.RepairStartMonth as RepairStartMonth,PhoneStationRepairing.RepairStartDay as RepairStartDay,PhoneStationRepairing.RepairTimeInDay as RepairTimeInDay "
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " WHERE " & strQueryWhere
        
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arPhoneRepairing
                    .dcPhoneRepairing.Recordset = rs
                    .Show vbModal
                End With
         
         Case 2:
               strQueryFrom = QueryFrom(5)
                strQueryStart = "Select RingEventCode.Name as RingEventCodeRef,RingEvent.PayphoneXDRef as PayphoneXDRef,RingEvent.RingEventMonth as RingEventMonth,RingEvent.RingEventDay as RingEventDay,RingEvent.RingEventHour as RingEventHour,RingEvent.RingEventMinute as RingEventMinute,RingEvent.RingEventTelNo as RingEventTelNo "
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " WHERE " & strQueryWhere


                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic

                With arPhoneRings
                    .dcPhoneRings.Recordset = rs
                    .Show vbModal
                End With
'---------------------------------------
         
         Case 3:
               strQueryFrom = QueryFrom(6)
                strQueryStart = "Select OtherEventCode.Name as OtherEventCodeRef,OtherEvent.PayphoneXDRef as PayphoneXDRef,OtherEvent.OtherEventMonth as OtherEventMonth,OtherEvent.OtherEventDay as OtherEventDay,OtherEvent.OtherEventMinute as OtherEventMinute,OtherEvent.OtherEventHour as OtherEventHour "
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " WHERE " & strQueryWhere


                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic

                With arOtherEvents
                    .dcOtherEvents.Recordset = rs
                    .Show vbModal
                End With
'---------------------------------------
         
         Case 4:
                QueryType = 4
                
                strQueryFrom = " FROM PhoneStation"
                strQueryStart = "Select DISTINCT PhoneStation.ID AS ID,PhoneStation.PayPhoneXD AS PayPhoneXD,PhoneStation.TelNo AS TelNo, PhoneStation.Address AS Address,PhoneStation.SoftwareVersion AS SoftwareVersion,PhoneStation.PhoneGroup AS PhoneGroup,PhoneStation.phoneCity AS phoneCity "
       
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " WHERE " & strQueryWhere
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arPhoneStation
                    .dcPhoneStation.Recordset = rs
                    .Show vbModal
                End With
'---------------------------------------
         
         Case 5:
                QueryType = 6
                
                strQueryFrom = " FROM TransactionLog"
                strQueryStart = "Select DISTINCT TransactionLog.PayphoneXDRef AS PayphoneXDRef,TransactionLog.CallYear AS CallYear,TransactionLog.CallMonth AS CallMonth,TransactionLog.CallDay AS CallDay,TransactionLog.CallHour AS CallHour,TransactionLog.CallMinute AS CallMinute,TransactionLog.ReportComplete AS ReportComplete,TransactionLog.MessageUpdate AS MessageUpdate,TransactionLog.PMSNumUpdate AS PMSNumUpdate,TransactionLog.FreeNumUpdate AS FreeNumUpdate,TransactionLog.CharggingUpdate AS CharggingUpdate,TransactionLog.ChargeSchedullerUpdate AS ChargeSchedullerUpdate,TransactionLog.DayTypeUpdate AS DayTypeUpdate,TransactionLog.PhoneSettingUpdate AS PhoneSettingUpdate,TransactionLog.SamUpdate AS SamUpdate,TransactionLog.BlackListUpdate AS BlackListUpdate,TransactionLog.WhiteListUpdate AS WhiteListUpdate,TransactionLog.SoftwareUpgrade AS SoftwareUpgrade,TransactionLog.Sync AS Sync "
       
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " WHERE " & strQueryWhere
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arTransactionLog
                    .dcTransactionLog.Recordset = rs
                    .Show vbModal
                
                End With
 '---------------------------------------
         Case 6:
                QueryType = 6
                
                strQueryFrom = " FROM WhiteList"
                strQueryStart = "Select DISTINCT WhiteList.FromNo AS FromNo,WhiteList.ToNo AS ToNo,WhiteList.f1 AS f1,WhiteList.f2 AS f2,WhiteList.f3 AS f3,WhiteList.f4 AS f4,WhiteList.f5 AS f5,WhiteList.f6 AS f6,WhiteList.f7 AS f7 "
       
                strQueryTotal = strQueryStart & _
                                strQueryFrom
                                
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arWhiteList
                    .dcWhiteList.Recordset = rs
                    .Show vbModal
                End With

 '---------------------------------------
         Case 7:
                QueryType = 6
                
                strQueryFrom = " FROM BlackList"
                strQueryStart = "Select DISTINCT BlackList.FromNo AS FromNo,BlackList.ToNo AS ToNo,BlackList.f1 AS f1,BlackList.f2 AS f2,BlackList.f3 AS f3,BlackList.f4 AS f4,BlackList.f5 AS f5,BlackList.f6 AS f6,BlackList.f7 AS f7 "
       
                strQueryTotal = strQueryStart & _
                                strQueryFrom
                                
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arBlackList
                    .dcBlackList.Recordset = rs
                    .Show vbModal
                End With
'---------------------------------------
         Case 8:
                QueryType = 6
                
                strQueryFrom = "FROM Chargging INNER JOIN " & _
                               "CharggingArea " & _
                               "ON CharggingArea.AreaNumber = Chargging.CharggingArea"

                strQueryStart = "Select DISTINCT Chargging.PreNoFrom AS PreNoFrom,Chargging.PreNoTo AS PreNoTo,Chargging.ChargeLevel AS ChargeLevel,CharggingArea.AreaName AS CharggingArea "
       
                strQueryTotal = strQueryStart & _
                                strQueryFrom & _
                                " Order By Chargging.CharggingArea "
                                
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arChargging
                    .dcChargging.Recordset = rs
                    .Show vbModal
                End With
'---------------------------------------
         Case 9:
                QueryType = 6
                
                strQueryFrom = "FROM DayType INNER JOIN " & _
                               "CharggingScheduller " & _
                               "ON CharggingScheduller.DayType = DayType.DayType"

                strQueryStart = "Select DISTINCT DayType.DayIndex AS DayIndex,DayType.DayMonth AS DayMonth,DayType.DayDay AS DayDay,CharggingScheduller.Comment AS DayType "
       
                strQueryTotal = strQueryStart & _
                                strQueryFrom
                                
        
                rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
                With arDayType
                    .dcDayType.Recordset = rs
                    .Show vbModal
                End With


 End Select
        
 '---------------------------------------
        Else
        
        txtReportTitle.Text = "ê“«—‘ " & dtcFunction.Text & " " & dtcItems.Text & " »—Õ”» " & dtcSeries(0).Text
        SWSeprated = False
      '' SwSeries = False
        
        For indexCounter = 0 To 2
            With dtcSeries
                If (.Item(indexCounter).MatchedWithList) Then
                    
                    strQueryItems = strQueryItems & Trim(.Item(indexCounter).BoundText) & " ,"
                    SheetStartCol = SheetStartCol + 1
                                 
                    If (indexCounter > 0) Then
                        If (Not SWSeprated) Then txtReportTitle.Text = txtReportTitle.Text & " »Â  ›ﬂÌﬂ "
                        SWSeprated = True
                      '' SwSeries = True
                    
                        txtReportTitle.Text = txtReportTitle.Text & .Item(indexCounter).Text & " Ê "
                    End If
                End If
            End With
        Next indexCounter
        
        If (SWSeprated) Then txtReportTitle.Text = Left(txtReportTitle.Text, Len(txtReportTitle.Text) - 3)
      ''     If (SwSeries) Then txtReportTitle.Text = Left(txtReportTitle.Text, Len(txtReportTitle.Text) - 3)
        
       
        strQueryItems = Left(strQueryItems, Len(strQueryItems) - 1)
        
    'Define QueryType ?????
        
        If (Trim(dtcItems.BoundText) = "OtherEvent.OtherEventHour") Then QueryType = 3
        
        strQueryFrom = QueryFrom(QueryType)
        
        strQueryStart = "Select " & Trim(dtcFunction.BoundText) & "(" & Trim(dtcItems.BoundText) & ") AS S,"
        
        strQueryTotal = strQueryStart & _
                        strQueryItems & " " & _
                        strQueryFrom & _
                        " WHERE " & strQueryWhere & _
                        " Group By " & Replace(strQueryItems, "1,", "") & _
                        " Order By " & Replace(strQueryItems, "1,", "")
        
        rs.Open strQueryTotal, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        
        sstReport.Tab = 1
        ExportDataToSpreadSheet rs, SheetStartCol
    End If
    
    rs.Close
End Sub

Private Sub cmdPatternColor_Click()
    On Error Resume Next
    CommonDialog1.ShowColor
    
    If (optTotal) Then
     ChartReport.Charts(0).SeriesCollection(0).Points(CboPart.ListIndex).Interior.SetPatterned Val(dtcPattern.BoundText), CommonDialog1.Color, PatternBackGround
     PatternColor = CommonDialog1.Color
    End If

    If (optSeprated) Then
      ChartReport.Charts(0).SeriesCollection(0).Interior.SetPatterned Val(dtcPattern.BoundText), CommonDialog1.Color, PatternBackGround
      PatternColor = CommonDialog1.Color
    End If
End Sub

Private Sub cmdPatternConfirm_Click()
    Dim I As Integer
    If ChartReport.Charts.Count > 0 Then
      If (optTotal.Value) Then
        For I = 1 To ChartReport.Charts(0).SeriesCollection(0).Points.Count
              ChartReport.Charts(0).SeriesCollection(0).Points(I - 1).Explosion = 0
        Next I
      End If
   End If
End Sub
Public Sub RowColChange()
    Dim I As Integer
    Dim Row1 As Integer
    Dim Col1 As String * 1
    Dim chtChart1
    
   On Error Resume Next
   If optTotal.Value = True Then
        If SWTotal = False Then
            ChartReport.SetData chConstants.chDimCategories, chConstants.chDataBound, "B1:" & Col & "1"
            ChartReport.Charts(0).SeriesCollection(0).SetData chConstants.chDimValues, chConstants.chDataBound, StartCol & Trim(Str(SheetRow + 1)) & ":" & Col & Trim(Str(SheetRow + 1)) '' "B_Row:Col_Row"
            SWTotal = True
        Else
            ChartReport.SetData chConstants.chDimCategories, chConstants.chDataBound, "A2:" & "A" & Trim(Str(SheetRow))
            ChartReport.Charts(0).SeriesCollection(0).SetData chConstants.chDimValues, chConstants.chDataBound, Chr(Asc(Col) + 1) & "2" & ":" & Chr$(Asc(Col) + 1) & Trim(Str(SheetRow))
            SWTotal = False
        End If
        
        CboPart.Clear
        
     For I = 1 To ChartReport.Charts(0).SeriesCollection(0).Points.Count
         CboPart.AddItem (Str(I))
     Next I

    End If

''''''
     If optSeprated.Value = True Then
            If ChartReport.Charts.Count <> 0 Then
                ChartReport.Charts(0).SeriesCollection.Delete (0)
                ChartReport.Charts.Delete (0)
            End If
             
            Col1 = StartCol
            Row1 = 2
            
            Set ChartReport.DataSource = SheetReport
            Set chtChart1 = ChartReport.Charts.Add
            
            If (dtcChartType.BoundText = "") Then
             ChartReport.Charts(0).Type = chChartTypeAreaStacked
               Else
              ChartReport.Charts(0).Type = Val(dtcChartType.BoundText)
            End If
          
            
            If Not (ChartReport.Charts(0).HasLegend) Then
                ChartReport.Charts(0).HasLegend = True
          
                     
            If SWSeprated = False Then
                For I = 0 To SheetRow - 2
                    ChartReport.Charts(0).SeriesCollection.Add
                    ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimSeriesNames, chConstants.chDataBound, "A" & Trim(Str(Row1))
                    ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimCategories, chConstants.chDataBound, "B1:" & Col & "1"
                    ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimValues, chConstants.chDataBound, StartCol & Trim(Str(Row1)) & ":" & Col & Trim(Str(Row1))
                    Row1 = Row1 + 1
                Next I
                 SWSeprated = True
                Else
                    For I = 0 To Asc(Col) - 66 '' add startcaol
                        ChartReport.Charts(0).SeriesCollection.Add
                        ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimSeriesNames, chConstants.chDataBound, Col1 & "1" ''col1=StartCol
                        ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimCategories, chConstants.chDataBound, "A2:" & "A" & Trim(Str(SheetRow)) '' row=row-1
                        ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimValues, chConstants.chDataBound, Col1 & "2" & ":" & Col1 & Trim(Str(SheetRow)) ''Row=Row-1
                        Col1 = Chr(Asc(Col1) + 1)
                    Next I
                    SWSeprated = False
                 End If
             End If
             
             CboPart.Clear
           
            For I = 1 To ChartReport.Charts(0).SeriesCollection.Count
                   CboPart.AddItem (Str(I))
            Next I
            
            ChartReport.Charts(0).Legend.Font.Name = "Tahoma"
            ChartReport.Charts(0).Axes(1).Font.Name = "B Nazanin"
     End If
  
    
End Sub

Private Sub cmdRefresh_Click()
    Unload frmReport
    Unload frmSearch
    frmReport.ZOrder 0
End Sub

Private Sub cmdRowColChange_Click()
    RowColChange
End Sub

Private Sub cmdSaveAsCommon_Click()
On Error GoTo EH
If ReportDefaultAccessSW = True Then
    If (Trim(strQueryFrom) <> "" And Trim(strQueryItems) <> "" And Trim(strQueryStart) <> "") Then
        With de.rscmdStoredQuery
            If (.State = adStateClosed) Then .Open
            
            .AddNew
            
            !Name = txtReportTitle.Text
            !QueryType = QueryType
            !QueryStart = strQueryStart
            !QueryItems = strQueryItems
            !QueryFrom = strQueryFrom
            !SheetStartCol = SheetStartCol
            
            .Update
            
            dtcDefaultReport.RowMember = ""
            dtcDefaultReport.RowMember = "cmdStoredQuery"
        End With
    End If
    End If
    Exit Sub
EH:
MsgBox ("À»  ê“«—‘ ÅÌ‘ ›—÷ »Â ⁄·  Œÿ« «‰Ã«„ ‰‘œ")
End Sub

Private Sub cmdSearch_Click()
    frmSearch.ZOrder 0
End Sub

Private Sub cmdSolidColor_Click()
    cdlgColor.ShowColor
    
    With ChartReport.Charts(0).SeriesCollection(0).Points(cboIndexBackUpTotal).Interior
       .SetSolid (cdlgColor.Color)
    End With
End Sub

Private Sub cmdSum_Click()
On Error Resume Next
    
    Dim I As Integer
    Dim ExtraCol As String
    Dim ADR As String
    Dim Tmp As Integer
    Dim TotalSum As Long
    Dim TotalSumAdr As String
    
    Tmp = (SheetCol - 1)
    SheetCol = Tmp
    
'    Tmp = (SheetRow - 1)
'    SheetRow = Tmp
    Tmp = (SheetStartCol - 1)
    SheetStartCol = Tmp
    
    
    
    Col = Chr(SheetCol + 64)
    Row = Trim(Str(SheetRow))
    StartCol = Chr(SheetStartCol + 64)
    
    '        Col = Chr$(SheetCol)
    '        Row = Chr$(SheetCol)
    
    ExtraCol = Chr$(Asc(Col) + 1)
    SheetReport.Refresh
    SheetReport.Repaint
    
    SheetReport.ActiveSheet.Range(StartCol & "1").Select
   
    
    For I = Asc(StartCol) To Asc(Col)
'        SheetReport.Commands(ssConstants.ssCommandSelectCol).Execute
'        SheetReport.Commands(ssConstants.ssCommandAutosum).Execute
'        SheetReport.ActiveCell.Select
'        SheetReport.Commands(ssConstants.ssCommandMoveLeft).Execute
         ADR = Chr(I) & "2" & ":" & Chr(I) & Row
         SheetReport.ActiveSheet.Range(Trim(Chr(I) & Row + 1)).Formula = Trim("=Sum(" & ADR & ")")
    Next I
    
    SheetReport.ActiveSheet.Range("A1").Select
    SheetReport.ActiveSheet.Range("B2").Select
    
    For I = 2 To CInt(Row) + 1 '''' Changed With +1
       '' SheetReport.ActiveSheet.Range(ADR).Select
       ''SheetReport.Commands(ssConstants.ssCommandAutosum).Execute
        ADR = StartCol & I & ":" & Col & I
        SheetReport.ActiveSheet.Range(ExtraCol & I).Formula = Trim("=Sum(" & ADR & ")")
    Next I
    
    SheetReport.ActiveSheet.Cells(SheetRow + 1, 1) = "Ã„⁄"
    SheetReport.ActiveSheet.Cells(1, SheetCol + 1) = "Ã„⁄"
    SheetReport.ActiveSheet.Range("A1").Select
     
 
      SheetReport.ActiveCell.Range(StartCol & "2" & ":" & Chr(Asc(Col) + 2) & Row + 2).Borders.Weight = 2
      SheetReport.ActiveCell.Range(StartCol & "2" & ":" & Chr(Asc(Col) + 2) & Row + 2).Borders.Color = "Black"
       
      SheetReport.ActiveCell.Range(StartCol & "1" & ":" & Chr(Asc(Col) + 2) & "1").Borders.Weight = 1
      SheetReport.ActiveCell.Range(StartCol & "1" & ":" & Chr(Asc(Col) + 2) & "1").BorderAround 4, xlThin, xlColorIndexAutomatic, "Black"
      
      SheetReport.ActiveCell.Range("A" & "2" & ":" & "A" & Row + 2).Borders.Weight = 2
      SheetReport.ActiveCell.Range("A" & "2" & ":" & "A" & Row + 2).BorderAround 4, xlThin, xlColorIndexAutomatic, "Black"
      
      fraChart.Enabled = True
      cmdSum.Enabled = False

'''''''''Makin Prcentage
     TotalSumAdr = Trim(Chr(Asc(Col) + 1) & Row + 1)
       
     For I = Asc(StartCol) To Asc(Col) + 1
         SheetReport.ActiveSheet.Range(Trim(Chr(I) & Row + 2)).Formula = "=" & Trim(Chr(I) & Row + 1) & "/" & TotalSumAdr & "*100"
         SheetReport.ActiveSheet.Range(Trim(Chr(I) & Row + 2)).NumberFormat = "#.##"
     Next I
    
    For I = 2 To CInt(Row) + 1 '''' Changed With +1
         SheetReport.ActiveSheet.Range(Chr(Asc(Col) + 2) & I).Formula = "=" & Chr(Asc(Col) + 1) & I & "/" & TotalSumAdr & "*100"
         SheetReport.ActiveSheet.Range(Chr(Asc(Col) + 2) & I).NumberFormat = "#.##"
       Next I
     SheetReport.ActiveSheet.Cells(SheetRow + 2, 1) = "œ—’œ"
     SheetReport.ActiveSheet.Cells(1, SheetCol + 2) = "œ—’œ"
End Sub

Private Sub cmdClearDefaultReport_Click()
    With de.rscmdStoredQuery
        If (dtcDefaultReport.MatchedWithList) Then
            .MoveFirst
            .Find "ID=" & dtcDefaultReport.BoundText
            
           If (MsgBox("¬Ì« „«Ì· »Â Õ–› ê“«—‘ ÅÌ‘ ›—÷ «‰ Œ«» ‘œÂ Â” Ìœø", vbYesNo, "Â‘œ«—!!!")) = 7 Then Exit Sub
           
                    If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                        .Delete
                        dtcDefaultReport.Text = ""
                    End If
         
        Else
         MsgBox "·ÿ›«‰Ê⁄ ê“«—‘ —« „‘Œ’ ò‰Ìœ!!", vbOKOnly, "ŒŸ«"
         dtcDefaultReport.SetFocus
       End If
    End With
End Sub

Private Sub dtcChartType_Click(Area As Integer)
     
  If ChartReport.Charts.Count > 0 Then
     
     If dtcChartType.BoundText <> "" Then
        ChartReport.Charts(0).Type = Val(dtcChartType.BoundText)
     End If
  End If
End Sub

Private Sub dtcFontName_Change()
   On Error Resume Next
    ChartReport.Charts(0).Legend.Font.Name = dtcFontName.Text
End Sub

Private Sub dtcFunction_Click(Area As Integer)
    If (Trim(dtcFunction.BoundText) = "List") Then
        If ReportListAccessSW = True Then
            'cboOrderBy.Enabled = True
            dtcItems.Visible = False
            dtcSeries(0).Enabled = False
            dtcSeries(1).Enabled = False
            dtcSeries(2).Enabled = False
            Else
            MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â ê“«—‘Â«Ì ·Ì” Ì")
            dtcFunction.BoundText = ""
        End If
    Else
        If ReportStatisticsAccessSW = True Then
            'cboOrderBy.Enabled = False
            dtcItems.Visible = True
            dtcSeries(0).Enabled = True
            dtcSeries(1).Enabled = True
            dtcSeries(2).Enabled = True
        End If
    End If
End Sub

Private Sub dtcPattern_Click(Area As Integer)
On Error GoTo ErrHandel
    Dim ColorBackup As Long
    
    If optTotal.Value = True Then
        ChartReport.Charts(0).SeriesCollection(0).Points(cboIndexBackUpTotal).Interior.SetPatterned Val(dtcPattern.BoundText), PatternColor, PatternBackGround
    Else
        If optSeprated.Value = True Then
            ChartReport.Charts(0).SeriesCollection(cboIndexBackUpSeprated).Interior.SetPatterned Val(dtcPattern.BoundText), PatternColor, PatternBackGround
            SWSetPattern = True
        End If
    End If
    
    Exit Sub
     
ErrHandel:
     With ChartReport.Charts(0).SeriesCollection(0).Points(cboIndexBackUpTotal).Interior
        .SetSolid (PatternBackGround)
     End With
End Sub

Private Sub dtcSeries_Click(Index As Integer, Area As Integer)
    
    Select Case Trim(dtcSeries(Index).BoundText)
        Case "PhoneStation.ID,PhoneStation.TelNO":
'            QueryType = 0
        
        
        Case "CallEventCode.ID,CallEventCode.Name":
            QueryType = 1
        Case "PhoneCall.CallYear,PhoneCall.CallYear":
            QueryType = 1
        Case "PhoneCall.CallDay,PhoneCall.CallDay":
            QueryType = 1
        Case "DayInWeek.ID,DayInWeek.Name":
            QueryType = 1
        Case "PhoneCall.CallHour,PhoneCall.CallHour":
            QueryType = 1
        Case "PhoneCall.CallMinute,PhoneCall.CallMinute":
            QueryType = 1
        
        Case "PhoneStationRepairing.RepairStartYear,PhoneStationRepairing.RepairStartYear"
            QueryType = 2
        Case "PhoneStationRepairing.RepairStartDay,PhoneStationRepairing.RepairStartDay":
            QueryType = 2
        
        Case "OtherEventCode.ID,OtherEventCode.Name":
            QueryType = 3
        Case "RingEventCode.ID,RingEventCode.Name":
            QueryType = 3
        Case "RingEvent.RingEventHour,RingEvent.RingEventHour":
            QueryType = 3
        Case "RingEvent.RingEventMinute,RingEvent.RingEventMinute":
            QueryType = 3

    End Select
    
    CheckSeriesComboBoxes
    checkItemsComboBox
End Sub

Private Sub CheckSeriesComboBoxes()
    Dim indexCounter As Integer
    
    Select Case QueryType
        Case 1:
            For indexCounter = 0 To 2
                If (Trim(dtcSeries(indexCounter).BoundText) = "OtherEventCode.ID,OtherEventCode.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "RingEventCode.ID,RingEventCode.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "RingEvent.RingEventHour,RingEvent.RingEventHour" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "RingEvent.RingEventMinute,RingEvent.RingEventMinute" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneStationRepairing.RepairStartYear,PhoneStationRepairing.RepairStartYear" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneStationRepairing.RepairStartDay,PhoneStationRepairing.RepairStartDay") Then
        
                    dtcSeries.Item(indexCounter).Text = ""
                End If
            Next indexCounter
        

        Case 2:
            For indexCounter = 0 To 2
                If (Trim(dtcSeries(indexCounter).BoundText) = "CallEventCode.ID,CallEventCode.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallYear,PhoneCall.CallYear" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallDay,PhoneCall.CallDay" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "DayInWeek.ID,DayInWeek.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallHour,PhoneCall.CallHour" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallMinute,PhoneCall.CallMinute" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "OtherEventCode.ID,OtherEventCode.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "RingEventCode.ID,RingEventCode.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "RingEvent.RingEventHour,RingEvent.RingEventHour" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "RingEvent.RingEventMinute,RingEvent.RingEventMinute") Then
        
                    dtcSeries.Item(indexCounter).Text = ""
                End If
            Next indexCounter
        
        Case 3:
            For indexCounter = 0 To 2
                If (Trim(dtcSeries(indexCounter).BoundText) = "CallEventCode.ID,CallEventCode.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallYear,PhoneCall.CallYear" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallDay,PhoneCall.CallDay" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "DayInWeek.ID,DayInWeek.Name" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallHour,PhoneCall.CallHour" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneCall.CallMinute,PhoneCall.CallMinute" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneStationRepairing.RepairStartYear,PhoneStationRepairing.RepairStartYear" Or _
                    Trim(dtcSeries(indexCounter).BoundText) = "PhoneStationRepairing.RepairStartDay,PhoneStationRepairing.RepairStartDay") Then
        
                    dtcSeries.Item(indexCounter).Text = ""
                End If
            Next indexCounter
    End Select
End Sub

Private Sub dtcItems_Click(Area As Integer)
    Select Case Trim(dtcItems.BoundText)
        Case "PhoneStationRepairing.RepairTimeInDay":
            QueryType = 2
        Case "RingEvent.RingEventHour", "OtherEvent.OtherEventHour":
            QueryType = 3
        Case Else:
            QueryType = 1
    End Select
    
    CheckSeriesComboBoxes
End Sub

Private Sub checkItemsComboBox()
    Select Case QueryType
        Case 1:
            If (Trim(dtcItems.BoundText) = "PhoneStationRepairing.RepairTimeInDay" Or _
                Trim(dtcItems.BoundText) = "RingEvent.RingEventHour" Or _
                Trim(dtcItems.BoundText) = "OtherEvent.OtherEventHour") Then
                
                dtcItems.Text = ""
            End If
    
        Case 2:
            If (Trim(dtcItems.BoundText) <> "PhoneStationRepairing.RepairTimeInDay") Then
                dtcItems.Text = ""
            End If
        Case 3:
            If (Trim(dtcItems.BoundText) <> "RingEvent.RingEventHour" And _
                Trim(dtcItems.BoundText) <> "OtherEvent.OtherEventHour") Then
                
                dtcItems.Text = ""
            End If
    End Select
    
End Sub

Private Sub Form_Load()
SetAccessCondition
    SetSkin Me
    
    Set chConstants = ChartReport.Constants
    Set ssConstants = SheetReport.Constants
    
    sstReport.Tab = 2
    PatternColor = RGB(0, 0, 255)
    PatternBackGround = RGB(255, 255, 255)
    
End Sub
Public Sub ExportPicture()
    ChartReport.ExportPicture (App.Path & "\Picture\1.jpg")
    ChartReport.ExportPicture (App.Path & "\Picture\2.jpg")
End Sub


Private Sub Form_Resize()
    With fraReport
        .Top = ((Height - .Height) / 2) + 300
        .Left = (Width - .Width) / 2
    End With
'    With fraSearchResult
'        .Top = 10
'        .Left = (Width - .Width) / 2 ''10980  ''
'    End With
End Sub

Private Sub ExportDataToSpreadSheet(rs As ADODB.Recordset, SStartCol As Integer)
    Dim RecordCounter As Integer, ColCounter As Integer, SecondCounter As Integer
    Dim BeforeSeries As Long
    Dim MaxRows As Integer
    
    BeforeSeries = 1000
    SheetCol = SStartCol - 1
    MaxRows = 0
    
    If (rs.RecordCount < 1) Then
        SheetRow = 1
        SheetCol = 1
        Exit Sub
    End If

    For ColCounter = 1 To 2
        FieldRows(ColCounter) = 1
    Next ColCounter
' Calculate for find the row of a record in sheet
    For ColCounter = 2 To SStartCol - 1
        FieldRows(ColCounter - 1) = GetRecordCount(rs.Fields(ColCounter * 2).Name)
        
        For SecondCounter = 2 To ColCounter - 1
            FieldRows(SecondCounter - 1) = FieldRows(SecondCounter - 1) * FieldRows(ColCounter - 1)
        Next SecondCounter
    Next ColCounter
    
    rs.MoveFirst
    
    For RecordCounter = 1 To rs.RecordCount
        If (rs.Fields(1).Value <> BeforeSeries Or (rs.Fields(1).Value = 1)) Then
            SheetCol = SheetCol + 1
            SheetRow = 2
            BeforeSeries = rs.Fields(1).Value
            SheetReport.Cells(1, SheetCol - 1) = rs.Fields(2)
        End If
                
        SheetRow = 0
        
        For ColCounter = 2 To SStartCol - 1
            SheetRow = SheetRow + FieldRows(ColCounter) * (rs.Fields(ColCounter * 2 - 1) - 1)
            SheetRow = SheetRow + 1
        Next ColCounter
        
        SheetRow = SheetRow + 2
        
        For ColCounter = 2 To SStartCol - 1
            SheetReport.Cells(SheetRow, ColCounter - 1) = rs.Fields(ColCounter * 2)
        Next ColCounter
        
        If (rs!s >= 0) Then
        SheetReport.Cells(SheetRow, SheetCol - 1) = rs!s
        Else
        SheetReport.Cells(SheetRow, SheetCol - 1) = 0
        End If
        
        rs.MoveNext
        If (SheetRow > MaxRows) Then MaxRows = SheetRow
        
'        SheetRow = SheetRow + 1
    Next RecordCounter
    
    SheetRow = MaxRows
    
   ClearUnusedRows ''SStartCol
End Sub

Private Sub hscChartPerspective_Change()
    On Error Resume Next
    ChartReport.Charts(0).Perspective = hscChartPerspective.Value
End Sub

Private Sub hscChartInclination_Change()
    On Error Resume Next
    ChartReport.Charts(0).Inclination = hscChartInclination.Value
End Sub

Private Sub hscChartRotate_Change()
    On Error Resume Next
    ChartReport.Charts(0).Rotation = hscChartRotate.Value
End Sub

Private Sub optSeprated_Click()
On Error Resume Next
     Dim I As Integer
     Dim Row1 As Integer, Col1 As Integer
     Dim chtChart1
     
     If ChartReport.Charts.Count <> 0 Then
         ChartReport.Charts(0).SeriesCollection.Delete (0)
         ChartReport.Charts.Delete (0)
     End If
     
     Row1 = 2
    
    Set ChartReport.DataSource = SheetReport
    Set chtChart1 = ChartReport.Charts.Add
    If ChartReport.Charts(0).HasLegend = False Then
        ChartReport.Charts(0).HasLegend = True
    End If
  
    chtChart1.Type = chConstants.chChartTypeAreaStacked
     For I = 0 To Val(SheetRow) - 2
        ChartReport.Charts(0).SeriesCollection.Add
        ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimSeriesNames, chConstants.chDataBound, "A" & Trim(Str(Row1))
        ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimCategories, chConstants.chDataBound, "B1:" & Col & "1"
        ChartReport.Charts(0).SeriesCollection(I).SetData chConstants.chDimValues, chConstants.chDataBound, StartCol & Trim(Str(Row1)) & ":" & Col & Trim(Str(Row1))
      ''  Col1 = Col1 + 1
        Row1 = Row1 + 1
     Next I
     
     SWSeprated = True
            
     CboPart.Clear
     For I = 1 To ChartReport.Charts(0).SeriesCollection.Count
            CboPart.AddItem (Str(I))
     Next I
     ChartReport.Charts(0).Legend.Font.Name = "Tahoma"
     ChartReport.Charts(0).Axes(1).Font.Name = "B Nazanin"
     
End Sub

Private Sub optTotal_Click()
On Error Resume Next
    Dim I As Integer
    Dim chtChart1
    
    CboPart.Clear
    
 
   
    If ChartReport.Charts.Count <> 0 Then
      ChartReport.Charts(0).SeriesCollection.Delete (0)
      ChartReport.Charts.Delete (0)
    End If
   
    Set ChartReport.DataSource = SheetReport
    Set chtChart1 = ChartReport.Charts.Add
    
    chtChart1.Type = chConstants.chChartTypePie3D
    ChartReport.SetData chConstants.chDimCategories, chConstants.chDataBound, StartCol & "1:" & Col & "1"
    ChartReport.Charts(0).SeriesCollection(0).SetData chConstants.chDimValues, chConstants.chDataBound, StartCol & Row & ":" & Col & Row
    If ChartReport.Charts(0).HasLegend = False Then
        ChartReport.Charts(0).HasLegend = True
    End If
       
     For I = 1 To ChartReport.Charts(0).SeriesCollection(0).Points.Count
      CboPart.AddItem (Str(I))
    Next I
    
    SWTotal = True ''Bind To Row
       
    Set serSeries1 = ChartReport.Charts(0).SeriesCollection(0)
    Set dlSeries1Labels = serSeries1.DataLabelsCollection.Add

    dlSeries1Labels.HasValue = False
    dlSeries1Labels.HasPercentage = True
    dlSeries1Labels.Font.Size = 10
    ChartReport.Charts(0).Legend.Font.Name = "Tahoma"
    dlSeries1Labels.Font.Name = "B Nazanin"
''    ChartReport.Charts(0).Axes(0).Font.Name = "B Nazanin"
''    ChartReport.Charts(0).Axes(1).Font.Name = "B Nazanin"
End Sub



Private Sub timFormLoad_Timer()
    timFormLoad.Interval = 0
    OtherReport
    cmdSaveAsCommon.Enabled = True
    Unload frmReportWait
End Sub

Public Sub ClearSheet()
    Dim I As Integer
      
    SheetReport.ActiveSheet.Range("A1").Select
    For I = 1 To 50
        SheetReport.ActiveCell.Select
        SheetReport.Commands(ssConstants.ssCommandDeleteRows).Execute
    Next I
    
    SheetReport.ActiveSheet.Range("A1").Select
End Sub

Private Sub timFormLoad2_Timer()
   On Error Resume Next
    Dim strSql As String
    
    timFormLoad2.Interval = 0
    
    If (dtcDefaultReport.MatchedWithList) Then
        With de.rscmdStoredQuery
            If (.State = adStateClosed) Then .Open
            
            .MoveFirst
            .Find "ID=" & dtcDefaultReport.BoundText
            
            If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub

            strSql = !QueryStart & _
                     !QueryItems & " " & _
                     !QueryFrom & _
                     " WHERE " & QueryWhere & _
                     " Group By " & !QueryItems & _
                     " Order By " & !QueryItems

            rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            SheetStartCol = !SheetStartCol
            ExportDataToSpreadSheet rs, !SheetStartCol
        End With
        
        sstReport.Tab = 1
        
        rs.Close
        Unload frmReportWait
   Else
   
     MsgBox "‰Ê⁄ ê“«—‘ —« „‘Œ’ ò‰Ìœ!!", vbOKOnly, "Œÿ«"
     dtcDefaultReport.SetFocus
  End If
    
End Sub

Private Function GetRecordCount(FieldName As String) As Integer
    Dim rsTemp As New ADODB.Recordset
    Dim strQueryTemp As String
    
    Select Case UCase(FieldName)
        Case "PHONESTATION.TELNO": 'PhoneStation.TelNo
            strQueryTemp = "SELECT Count(*) as rc " & _
                           "FROM [Select Distinct TelNo  " & _
                           "From PhoneStation]. AS [PhoneStationTemp];"

            rsTemp.Open strQueryTemp, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            GetRecordCount = rsTemp!rc
            
            rsTemp.Close
            Set rsTemp = Nothing
            
        Case "CALLEVENTCODE.Name": 'CallEventCode.Name
            strQueryTemp = "SELECT Count(*) as rc FROM CallEventCode"

            rsTemp.Open strQueryTemp, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            GetRecordCount = rsTemp!rc
            
            rsTemp.Close
            Set rsTemp = Nothing
            
        Case "RINGEVENTCODE.NAME": 'RingEventCode.Name
            strQueryTemp = "SELECT Count(*) as rc FROM RingEventCode"

            rsTemp.Open strQueryTemp, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            GetRecordCount = rsTemp!rc
            
            rsTemp.Close
            Set rsTemp = Nothing
            
        Case "OTHEREVENTCODE.NAME": 'OtherEventCode.Name
            strQueryTemp = "SELECT Count(*) as rc FROM OtherEventCode"

            rsTemp.Open strQueryTemp, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            GetRecordCount = rsTemp!rc
            
            rsTemp.Close
            Set rsTemp = Nothing
            
        Case "PHONECALL.CALLYEAR": 'YearMonth.CYear
            strQueryTemp = "SELECT Count(*) as rc " & _
                           "FROM [Select Distinct CallYear  " & _
                           "From PhoneCall]. AS [PhoneCallTemp];"

            rsTemp.Open strQueryTemp, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            GetRecordCount = rsTemp!rc
            
            rsTemp.Close
            Set rsTemp = Nothing


''''        Case "CSEASON.NAME": 'CSeason.Name
''''            GetRecordCount = 4
        Case "CMONTH.NAME": 'CMonth.Name
            GetRecordCount = 12
        Case "PHONECALL.CALLDAY": 'PhoneCall.CallDay
            GetRecordCount = 31
        Case "DAYINWEEK.NAME": 'DayInWeek.Name
            GetRecordCount = 7
        Case "PHONECALL.CALLHOUR": 'PhoneCall.CallHour
            GetRecordCount = 24
        Case "PHONECALL.CALLMINUTE": 'PhoneCall.CallMinute
            GetRecordCount = 60
            
    End Select
    
End Function

Private Sub ClearUnusedRows()
On Error Resume Next
    Dim RowCounter As Integer, ColCounter As Integer, RowNo As Integer
    Dim SWEmptyRow As Boolean
    Dim TempRowCounter As Integer
    
    SWEmptyRow = False
    TempRowCounter = 1
    RowNo = 2
    For RowCounter = 2 To SheetRow
        If (SheetReport.Cells(RowNo, 1) = "") Then
            SheetReport.Cells(RowNo, 1).Select
            SheetReport.Commands(ssConstants.ssCommandDeleteRows).Execute
            SWEmptyRow = True
        Else
            RowNo = RowNo + 1
            TempRowCounter = TempRowCounter + 1
        End If
    Next RowCounter
    
    ''If (SWEmptyRow) Then RowNo = RowNo - 1
    SheetRow = TempRowCounter
End Sub
Private Sub SetAccessCondition()
If ReportDefaultAccessSW = False Then fraDefaultReport.Enabled = False
If ReportListAccessSW = False Then cboQueryType.Visible = False
If ReportStatisticsAccessSW = False Then
dtcItems.Visible = False
dtcSeries(0).Visible = False
dtcSeries(1).Visible = False
dtcSeries(2).Visible = False
End If

If ReportListAccessSW = False And ReportStatisticsAccessSW = False Then fraReport1.Visible = False

End Sub
