VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "Tabctl32.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmSearch 
   ClientHeight    =   9135
   ClientLeft      =   1140
   ClientTop       =   255
   ClientWidth     =   14385
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
   RightToLeft     =   -1  'True
   ScaleHeight     =   9135
   ScaleWidth      =   14385
   WindowState     =   2  'Maximized
   Begin VB.Frame fraSearchDetail 
      Height          =   8985
      Left            =   -360
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   0
      Width           =   14055
      Begin VB.CommandButton ccmdReport 
         Caption         =   "ê“«—‘« "
         Height          =   615
         Left            =   600
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   8160
         Width           =   1755
      End
      Begin VB.CommandButton cmdExit 
         Cancel          =   -1  'True
         Caption         =   "Œ—ÊÃ"
         Height          =   615
         Left            =   4440
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   8160
         Width           =   1755
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Å«ò ò—œ‰ ›—„"
         Default         =   -1  'True
         Height          =   615
         Left            =   2520
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Top             =   8160
         Width           =   1755
      End
      Begin TabDlg.SSTab sstSearch 
         Height          =   7485
         Left            =   360
         TabIndex        =   4
         Top             =   420
         Width           =   13335
         _ExtentX        =   23521
         _ExtentY        =   13203
         _Version        =   393216
         Tabs            =   7
         Tab             =   2
         TabsPerRow      =   7
         TabHeight       =   882
         TabCaption(0)   =   "Ã” ÃÊÌ ò·Ì „ò«·„« "
         TabPicture(0)   =   "frmSearch.frx":0000
         Tab(0).ControlEnabled=   0   'False
         Tab(0).Control(0)=   "fraItemBorder(0)"
         Tab(0).ControlCount=   1
         TabCaption(1)   =   "Ã” ÃÊÌ ﬂ·Ì  ⁄„Ì—«   ·›‰"
         TabPicture(1)   =   "frmSearch.frx":001C
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "fraItemBorder(1)"
         Tab(1).ControlCount=   1
         TabCaption(2)   =   "Ã” ÃÊÌ ò·Ì —ÊÌœ«œÂ«"
         TabPicture(2)   =   "frmSearch.frx":0038
         Tab(2).ControlEnabled=   -1  'True
         Tab(2).Control(0)=   "fraItemBorder(2)"
         Tab(2).Control(0).Enabled=   0   'False
         Tab(2).ControlCount=   1
         TabCaption(3)   =   "Ã” ÃÊÌ „Ê—œÌ „ò«·„« "
         TabPicture(3)   =   "frmSearch.frx":0054
         Tab(3).ControlEnabled=   0   'False
         Tab(3).Control(0)=   "fraSelectItems(0)"
         Tab(3).Control(1)=   "fraSearchButton(0)"
         Tab(3).Control(2)=   "txtSelectedItems1(8)"
         Tab(3).Control(3)=   "txtSelectedItems1(7)"
         Tab(3).Control(4)=   "txtSelectedItems1(6)"
         Tab(3).Control(5)=   "txtSelectedItems1(5)"
         Tab(3).Control(6)=   "txtSelectedItems1(4)"
         Tab(3).Control(7)=   "txtSelectedItems1(1)"
         Tab(3).Control(8)=   "txtSelectedItems1(2)"
         Tab(3).Control(9)=   "txtSelectedItems1(3)"
         Tab(3).Control(10)=   "txtSelectedItems1(0)"
         Tab(3).ControlCount=   11
         TabCaption(4)   =   "Ã” ÃÊÌ „Ê—œÌ  ⁄„Ì—«   ·›‰"
         TabPicture(4)   =   "frmSearch.frx":0070
         Tab(4).ControlEnabled=   0   'False
         Tab(4).Control(0)=   "fraSelectItems(1)"
         Tab(4).Control(1)=   "fraSearchButton(1)"
         Tab(4).Control(2)=   "txtSelectedItems2(13)"
         Tab(4).Control(3)=   "txtSelectedItems2(10)"
         Tab(4).Control(4)=   "txtSelectedItems2(11)"
         Tab(4).Control(5)=   "txtSelectedItems2(12)"
         Tab(4).Control(6)=   "txtSelectedItems2(9)"
         Tab(4).ControlCount=   7
         TabCaption(5)   =   "Ã” ÃÊÌ „Ê—œÌ —ÊÌœ«œ Â«"
         TabPicture(5)   =   "frmSearch.frx":008C
         Tab(5).ControlEnabled=   0   'False
         Tab(5).Control(0)=   "fraSelectItems(2)"
         Tab(5).Control(1)=   "fraSearchButton(2)"
         Tab(5).Control(2)=   "txtSelectedItems3(21)"
         Tab(5).Control(3)=   "txtSelectedItems3(20)"
         Tab(5).Control(4)=   "txtSelectedItems3(19)"
         Tab(5).Control(5)=   "txtSelectedItems3(18)"
         Tab(5).Control(6)=   "txtSelectedItems3(15)"
         Tab(5).Control(7)=   "txtSelectedItems3(16)"
         Tab(5).Control(8)=   "txtSelectedItems3(17)"
         Tab(5).Control(9)=   "txtSelectedItems3(14)"
         Tab(5).ControlCount=   10
         TabCaption(6)   =   "Ã” ÃÊÌ ò·Ì »Â —Ê“ —”«‰Ì"
         TabPicture(6)   =   "frmSearch.frx":00A8
         Tab(6).ControlEnabled=   0   'False
         Tab(6).Control(0)=   "fraItemBorder(3)"
         Tab(6).ControlCount=   1
         Begin VB.Frame fraItemBorder 
            Caption         =   " ⁄„Ì—«   ·›‰"
            Height          =   5415
            Index           =   1
            Left            =   -71280
            RightToLeft     =   -1  'True
            TabIndex        =   204
            Top             =   1320
            Width           =   5955
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   23
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":00C4
               TabIndex        =   205
               Top             =   960
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   24
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":0121
               TabIndex        =   206
               Top             =   1380
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   25
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":017E
               TabIndex        =   207
               Top             =   1920
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   31
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":01DB
               TabIndex        =   208
               Top             =   480
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   32
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":023C
               TabIndex        =   209
               Top             =   480
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   33
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0297
               TabIndex        =   210
               Top             =   960
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   34
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":02F2
               TabIndex        =   211
               Top             =   1380
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   35
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":034D
               TabIndex        =   212
               Top             =   1920
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   39
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":03A8
               TabIndex        =   213
               Top             =   480
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   40
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0403
               TabIndex        =   214
               Top             =   960
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   41
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":045E
               TabIndex        =   215
               Top             =   1380
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   42
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":04B9
               TabIndex        =   216
               Top             =   1920
               Width           =   195
            End
            Begin MSDataListLib.DataCombo QueryType2cbo 
               Bindings        =   "frmSearch.frx":0514
               Height          =   315
               Index           =   0
               Left            =   2760
               TabIndex        =   217
               Tag             =   "PhoneStationRepairing.RepairStartMonth>="
               Top             =   1380
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "ID"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCMonth"
            End
            Begin MSMask.MaskEdBox QueryType2mtxt 
               Height          =   375
               Index           =   5
               Left            =   1080
               TabIndex        =   218
               Tag             =   "PhoneStationRepairing.RepairStartDay<="
               Top             =   1800
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType2mtxt 
               Height          =   375
               Index           =   4
               Left            =   2760
               TabIndex        =   219
               Tag             =   "PhoneStationRepairing.RepairStartDay>="
               Top             =   1800
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType2mtxt 
               Height          =   375
               Index           =   3
               Left            =   1080
               TabIndex        =   220
               Tag             =   "PhoneStationRepairing.RepairStartYear<="
               Top             =   900
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   4
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType2mtxt 
               Height          =   375
               Index           =   2
               Left            =   2760
               TabIndex        =   221
               Tag             =   "PhoneStationRepairing.RepairStartYear>="
               Top             =   900
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   4
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin MSDataListLib.DataCombo QueryType2cbo 
               Bindings        =   "frmSearch.frx":0525
               Height          =   315
               Index           =   1
               Left            =   1080
               TabIndex        =   222
               Tag             =   "PhoneStationRepairing.RepairStartMonth<="
               Top             =   1380
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "ID"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCMonth"
            End
            Begin MSMask.MaskEdBox QueryType2mtxt 
               Height          =   375
               Index           =   0
               Left            =   2760
               TabIndex        =   223
               Tag             =   $"frmSearch.frx":0536
               Top             =   420
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               Mask            =   "####/##/##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType2mtxt 
               Height          =   375
               Index           =   1
               Left            =   1080
               TabIndex        =   224
               Tag             =   $"frmSearch.frx":0641
               Top             =   420
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               Mask            =   "####/##/##"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   46
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":074C
               TabIndex        =   225
               Top             =   4500
               Width           =   735
            End
            Begin MSDataListLib.DataCombo QueryType2cbo 
               Bindings        =   "frmSearch.frx":07B5
               Height          =   315
               Index           =   2
               Left            =   1080
               TabIndex        =   226
               Tag             =   "PhoneStationRepairing.PhoneStationRepairTypeRef="
               Top             =   4530
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdPhoneStationRepairType"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   47
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":07C6
               TabIndex        =   227
               Top             =   4920
               Width           =   1635
            End
            Begin MSDataListLib.DataCombo QueryType2cbo 
               Bindings        =   "frmSearch.frx":0841
               Height          =   315
               Index           =   3
               Left            =   1080
               TabIndex        =   228
               Tag             =   "PhoneStation.ID="
               Top             =   4920
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "PayphoneXD"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdPhoneStation"
            End
         End
         Begin VB.Frame fraItemBorder 
            Caption         =   "   „«” »« œ” ê«Â  "
            Height          =   5415
            Index           =   2
            Left            =   3720
            RightToLeft     =   -1  'True
            TabIndex        =   163
            Top             =   1320
            Width           =   5955
            Begin VB.CheckBox QueryType3chk 
               Alignment       =   1  'Right Justify
               Height          =   255
               Left            =   4320
               RightToLeft     =   -1  'True
               TabIndex        =   166
               Tag             =   " PhoneStation.Called="
               Top             =   4500
               Width           =   255
            End
            Begin VB.OptionButton optCalled 
               Caption         =   "‰œ«‘ Â"
               Height          =   255
               Index           =   1
               Left            =   1080
               RightToLeft     =   -1  'True
               TabIndex        =   165
               Top             =   4500
               Visible         =   0   'False
               Width           =   795
            End
            Begin VB.OptionButton optCalled 
               Caption         =   "œ«‘ Â"
               Height          =   255
               Index           =   0
               Left            =   2760
               RightToLeft     =   -1  'True
               TabIndex        =   164
               Top             =   4500
               Value           =   -1  'True
               Visible         =   0   'False
               Width           =   795
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   6
               Left            =   2760
               TabIndex        =   167
               Tag             =   "RingEvent.RingEventHour>="
               Top             =   2280
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   29
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":0852
               TabIndex        =   168
               Top             =   960
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   30
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":08AF
               TabIndex        =   169
               Top             =   1380
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   48
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":090C
               TabIndex        =   170
               Top             =   1920
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   49
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":0969
               TabIndex        =   171
               Top             =   2340
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   50
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":09C8
               TabIndex        =   172
               Top             =   2820
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   53
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0A29
               TabIndex        =   173
               Top             =   3600
               Width           =   1395
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   54
               Left            =   4620
               OleObjectBlob   =   "frmSearch.frx":0AA2
               TabIndex        =   174
               Top             =   480
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   55
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0B03
               TabIndex        =   175
               Top             =   480
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   56
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0B5E
               TabIndex        =   176
               Top             =   960
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   57
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0BB9
               TabIndex        =   177
               Top             =   1380
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   58
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0C14
               TabIndex        =   178
               Top             =   1920
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   59
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0C6F
               TabIndex        =   179
               Top             =   2340
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   60
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":0CCA
               TabIndex        =   180
               Top             =   2820
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   62
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0D25
               TabIndex        =   181
               Top             =   480
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   63
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0D80
               TabIndex        =   182
               Top             =   960
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   64
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0DDB
               TabIndex        =   183
               Top             =   1380
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   65
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0E36
               TabIndex        =   184
               Top             =   1920
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   66
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0E91
               TabIndex        =   185
               Top             =   2340
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   67
               Left            =   2520
               OleObjectBlob   =   "frmSearch.frx":0EEC
               TabIndex        =   186
               Top             =   2820
               Width           =   195
            End
            Begin MSDataListLib.DataCombo QueryType3cbo 
               Bindings        =   "frmSearch.frx":0F47
               Height          =   315
               Index           =   0
               Left            =   2760
               TabIndex        =   187
               Tag             =   "RingEvent.RingEventMonth>="
               Top             =   1380
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "ID"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCMonth"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   5
               Left            =   1080
               TabIndex        =   188
               Tag             =   "RingEvent.RingEventDay<="
               Top             =   1800
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   4
               Left            =   2760
               TabIndex        =   189
               Tag             =   "RingEvent.RingEventDay>="
               Top             =   1800
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   3
               Left            =   1080
               TabIndex        =   190
               Tag             =   "RingEvent.RingEventYear<="
               Top             =   900
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   4
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   2
               Left            =   2760
               TabIndex        =   191
               Tag             =   "RingEvent.RingEventYear>="
               Top             =   900
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   4
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   7
               Left            =   1080
               TabIndex        =   192
               Tag             =   "RingEvent.RingEventHour<="
               Top             =   2280
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   9
               Left            =   1080
               TabIndex        =   193
               Tag             =   "RingEvent.RingEventMinute<="
               Top             =   2760
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   8
               Left            =   2760
               TabIndex        =   194
               Tag             =   "RingEvent.RingEventMinute>="
               Top             =   2760
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSDataListLib.DataCombo QueryType3cbo 
               Bindings        =   "frmSearch.frx":0F58
               Height          =   315
               Index           =   2
               Left            =   1080
               TabIndex        =   195
               Tag             =   "OtherEvent.OtherEventCodeRef="
               Top             =   3480
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdOtherEventCode"
            End
            Begin MSDataListLib.DataCombo QueryType3cbo 
               Bindings        =   "frmSearch.frx":0F69
               Height          =   315
               Index           =   1
               Left            =   1080
               TabIndex        =   196
               Tag             =   "RingEvent.RingEventMonth<="
               Top             =   1380
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "ID"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCMonth"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   0
               Left            =   2760
               TabIndex        =   197
               Tag             =   $"frmSearch.frx":0F7A
               Top             =   420
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               Mask            =   "####/##/##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType3mtxt 
               Height          =   375
               Index           =   1
               Left            =   1080
               TabIndex        =   198
               Tag             =   $"frmSearch.frx":103F
               Top             =   420
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               Mask            =   "####/##/##"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   255
               Index           =   71
               Left            =   4110
               OleObjectBlob   =   "frmSearch.frx":1104
               TabIndex        =   199
               Top             =   4080
               Width           =   1815
            End
            Begin MSDataListLib.DataCombo QueryType3cbo 
               Bindings        =   "frmSearch.frx":1189
               Height          =   315
               Index           =   3
               Left            =   1080
               TabIndex        =   200
               Tag             =   "RingEvent.RingEventCodeRef="
               Top             =   4080
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdRingEventCode"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   72
               Left            =   4200
               OleObjectBlob   =   "frmSearch.frx":119A
               TabIndex        =   201
               Top             =   4920
               Width           =   1575
            End
            Begin MSDataListLib.DataCombo QueryType3cbo 
               Bindings        =   "frmSearch.frx":1215
               Height          =   315
               Index           =   4
               Left            =   1080
               TabIndex        =   202
               Tag             =   "PhoneStation.ID="
               Top             =   4920
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "PayphoneXD"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdPhoneStation"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   27
               Left            =   4680
               OleObjectBlob   =   "frmSearch.frx":1226
               TabIndex        =   203
               Top             =   4500
               Width           =   975
            End
         End
         Begin VB.TextBox txtSelectedItems2 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   9
            Left            =   -71820
            RightToLeft     =   -1  'True
            TabIndex        =   162
            Tag             =   "PhoneStationRepairing.PhoneStationRepairTypeRef"
            Top             =   1725
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems2 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   12
            Left            =   -71820
            RightToLeft     =   -1  'True
            TabIndex        =   161
            Tag             =   "PhoneStationRepairing.RepairStartMonth"
            Top             =   3000
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems2 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   11
            Left            =   -71820
            RightToLeft     =   -1  'True
            TabIndex        =   160
            Tag             =   "PhoneStationRepairing.RepairStartYear"
            Top             =   2580
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems2 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   10
            Left            =   -71820
            RightToLeft     =   -1  'True
            TabIndex        =   159
            Tag             =   "PhoneStation.PayphoneXD"
            Top             =   2145
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems2 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   13
            Left            =   -71820
            RightToLeft     =   -1  'True
            TabIndex        =   158
            Tag             =   "PhoneStationRepairing.RepairStartDay"
            Top             =   3435
            Width           =   4635
         End
         Begin VB.Frame fraSearchButton 
            Height          =   2355
            Index           =   1
            Left            =   -67080
            RightToLeft     =   -1  'True
            TabIndex        =   152
            Top             =   1545
            Width           =   2115
            Begin VB.CommandButton cmdSelect 
               Caption         =   "„«Â"
               Height          =   375
               Index           =   12
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   157
               Tag             =   "cmdCMonth"
               Top             =   1455
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "—Ê“"
               Height          =   375
               Index           =   13
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   156
               Tag             =   "cmdCDay"
               Top             =   1890
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‰Ê⁄  ⁄„Ì—"
               Height          =   375
               Index           =   9
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   155
               Tag             =   "cmdPhoneStationRepairType"
               Top             =   180
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‘„«—Â ”—Ì«· œ” ê«Â"
               Height          =   375
               Index           =   10
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   154
               Tag             =   "cmdPhoneStation"
               Top             =   600
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "”«·"
               Height          =   375
               Index           =   11
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   153
               Tag             =   "cmdYearName"
               Top             =   1035
               Width           =   1755
            End
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   14
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   151
            Tag             =   "OtherEvent.OtherEventCodeRef"
            Top             =   1725
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   17
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   150
            Tag             =   "RingEvent.RingEventYear"
            Top             =   3000
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   16
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   149
            Tag             =   "PhoneStation.PayphoneXD"
            Top             =   2580
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   15
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   148
            Tag             =   "RingEvent.RingEventCodeRef"
            Top             =   2145
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   18
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   147
            Tag             =   "RingEvent.RingEventMonth"
            Top             =   3435
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   19
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   146
            Tag             =   "RingEvent.RingEventDay"
            Top             =   3855
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   20
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   145
            Tag             =   "RingEvent.RingEventHour"
            Top             =   4275
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems3 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   21
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   144
            Tag             =   "RingEvent.RingEventMinute"
            Top             =   4710
            Width           =   4635
         End
         Begin VB.Frame fraSearchButton 
            Height          =   3675
            Index           =   2
            Left            =   -66960
            RightToLeft     =   -1  'True
            TabIndex        =   135
            Top             =   1545
            Width           =   2115
            Begin VB.CommandButton cmdSelect 
               Caption         =   "”«·"
               Height          =   375
               Index           =   17
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   143
               Tag             =   "cmdYearName"
               Top             =   1455
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "„«Â"
               Height          =   375
               Index           =   18
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   142
               Tag             =   "cmdCMonth"
               Top             =   1890
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "—Ê“"
               Height          =   375
               Index           =   19
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   141
               Tag             =   "cmdCDay"
               Top             =   2310
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "”«⁄ "
               Height          =   375
               Index           =   20
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   140
               Tag             =   "cmdCHour"
               Top             =   2730
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "œﬁÌﬁÂ"
               Height          =   375
               Index           =   21
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   139
               Tag             =   "cmdCMinute"
               Top             =   3165
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‰Ê⁄ —ÊÌœ«œ „ ›—ﬁÂ"
               Height          =   375
               Index           =   14
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   138
               Tag             =   "cmdOtherEventCode"
               Top             =   180
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‰Ê⁄  „«” »« œ” ê«Â"
               Height          =   375
               Index           =   15
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   137
               Tag             =   "cmdRingEventCode"
               Top             =   600
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‘„«—Â ”—Ì«· œ” ê«Â"
               Height          =   375
               Index           =   16
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   136
               Tag             =   "cmdPhoneStation"
               Top             =   1035
               Width           =   1755
            End
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   0
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   134
            Tag             =   "PhoneCard.CardStateRef"
            Top             =   1440
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   3
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   133
            Tag             =   "PhoneCall.CallYear"
            Top             =   2760
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   2
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   132
            Tag             =   "PhoneStation.PayphoneXD"
            Top             =   2340
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   1
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   131
            Tag             =   "PhoneCall.CallEventCodeRef"
            Top             =   1920
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   4
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   130
            Tag             =   "PhoneCall.CallMonth"
            Top             =   3195
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   5
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   129
            Tag             =   "PhoneCall.CallDay"
            Top             =   3615
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   6
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   128
            Tag             =   "PhoneCall.DayInWeekRef"
            Top             =   4035
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   7
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   127
            Tag             =   "Phonecall.CallHour"
            Top             =   4470
            Width           =   4635
         End
         Begin VB.TextBox txtSelectedItems1 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   375
            Index           =   8
            Left            =   -71700
            RightToLeft     =   -1  'True
            TabIndex        =   126
            Tag             =   "PhoneCall.CallMinute"
            Top             =   4890
            Width           =   4635
         End
         Begin VB.Frame fraSearchButton 
            Height          =   4095
            Index           =   0
            Left            =   -66960
            RightToLeft     =   -1  'True
            TabIndex        =   116
            Top             =   1320
            Width           =   2115
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‘„«—Â ”—Ì«· œ” ê«Â"
               Height          =   375
               Index           =   2
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   125
               Tag             =   "cmdPhoneStation"
               Top             =   1035
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "‰Ê⁄  „«”"
               Height          =   375
               Index           =   1
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   124
               Tag             =   "cmdCallEventCode"
               Top             =   600
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "Õ«·  ò«— "
               Height          =   375
               Index           =   0
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   123
               Tag             =   "cmdCardState"
               Top             =   180
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "œﬁÌﬁÂ"
               Height          =   375
               Index           =   8
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   122
               Tag             =   "cmdCMinute"
               Top             =   3585
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "”«⁄ "
               Height          =   375
               Index           =   7
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   121
               Tag             =   "cmdCHour"
               Top             =   3165
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "—Ê“ œ— Â› Â"
               Height          =   375
               Index           =   6
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   120
               Tag             =   "cmdDayInWeek"
               Top             =   2730
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "—Ê“"
               Height          =   375
               Index           =   5
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   119
               Tag             =   "cmdCDay"
               Top             =   2310
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "„«Â"
               Height          =   375
               Index           =   4
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   118
               Tag             =   "cmdCMonth"
               Top             =   1890
               Width           =   1755
            End
            Begin VB.CommandButton cmdSelect 
               Caption         =   "”«·"
               Height          =   375
               Index           =   3
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   117
               Tag             =   "cmdYearName"
               Top             =   1455
               Width           =   1755
            End
         End
         Begin VB.Frame fraSelectItems 
            Caption         =   " ”—⁄  Â« "
            Height          =   2835
            Index           =   0
            Left            =   -72000
            RightToLeft     =   -1  'True
            TabIndex        =   106
            Top             =   5520
            Visible         =   0   'False
            Width           =   4665
            Begin VB.ListBox lstSelectedIndex 
               Height          =   1815
               Index           =   0
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   114
               Top             =   300
               Width           =   1455
            End
            Begin VB.CommandButton cmdAddAll 
               Caption         =   ">>"
               Height          =   375
               Index           =   0
               Left            =   2160
               RightToLeft     =   -1  'True
               TabIndex        =   113
               Top             =   810
               Width           =   435
            End
            Begin VB.CommandButton cmdAdd 
               Caption         =   ">"
               Height          =   375
               Index           =   0
               Left            =   2160
               RightToLeft     =   -1  'True
               TabIndex        =   112
               Top             =   330
               Width           =   435
            End
            Begin VB.ListBox lstSelectedItems 
               Height          =   1815
               Index           =   0
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   111
               Top             =   300
               Width           =   1725
            End
            Begin VB.CommandButton cmdRemove 
               Caption         =   "<"
               Height          =   315
               Index           =   0
               Left            =   2160
               RightToLeft     =   -1  'True
               TabIndex        =   110
               Top             =   1290
               Width           =   435
            End
            Begin VB.CommandButton cmdRemoveAll 
               Caption         =   "<<"
               Height          =   375
               Index           =   0
               Left            =   2160
               RightToLeft     =   -1  'True
               TabIndex        =   109
               Top             =   1710
               Width           =   435
            End
            Begin VB.CommandButton cmdOKSelect 
               Caption         =   " «ÌÌœ"
               Height          =   495
               Index           =   0
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   108
               Top             =   2220
               Width           =   1455
            End
            Begin VB.CommandButton cmdCancelSelect 
               Caption         =   "«‰’—«›"
               Height          =   495
               Index           =   0
               Left            =   3000
               RightToLeft     =   -1  'True
               TabIndex        =   107
               Top             =   2220
               Width           =   1455
            End
            Begin MSDataListLib.DataList DataList 
               Bindings        =   "frmSearch.frx":1293
               Height          =   1815
               Index           =   0
               Left            =   2760
               TabIndex        =   115
               Top             =   300
               Width           =   1725
               _ExtentX        =   3043
               _ExtentY        =   3201
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCGate"
            End
         End
         Begin VB.Frame fraSelectItems 
            Caption         =   " ”—⁄  Â« "
            Height          =   2835
            Index           =   1
            Left            =   -72660
            RightToLeft     =   -1  'True
            TabIndex        =   96
            Top             =   3405
            Visible         =   0   'False
            Width           =   4665
            Begin VB.CommandButton cmdCancelSelect 
               Caption         =   "«‰’—«›"
               Height          =   495
               Index           =   1
               Left            =   3030
               RightToLeft     =   -1  'True
               TabIndex        =   104
               Top             =   2220
               Width           =   1455
            End
            Begin VB.CommandButton cmdOKSelect 
               Caption         =   " «ÌÌœ"
               Height          =   495
               Index           =   1
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   103
               Top             =   2220
               Width           =   1455
            End
            Begin VB.CommandButton cmdRemoveAll 
               Caption         =   "<<"
               Height          =   375
               Index           =   1
               Left            =   2130
               RightToLeft     =   -1  'True
               TabIndex        =   102
               Top             =   1710
               Width           =   435
            End
            Begin VB.CommandButton cmdRemove 
               Caption         =   "<"
               Height          =   315
               Index           =   1
               Left            =   2130
               RightToLeft     =   -1  'True
               TabIndex        =   101
               Top             =   1290
               Width           =   435
            End
            Begin VB.ListBox lstSelectedItems 
               Height          =   1815
               Index           =   1
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   100
               Top             =   300
               Width           =   1455
            End
            Begin VB.CommandButton cmdAdd 
               Caption         =   ">"
               Height          =   375
               Index           =   1
               Left            =   2130
               RightToLeft     =   -1  'True
               TabIndex        =   99
               Top             =   330
               Width           =   435
            End
            Begin VB.CommandButton cmdAddAll 
               Caption         =   ">>"
               Height          =   375
               Index           =   1
               Left            =   2130
               RightToLeft     =   -1  'True
               TabIndex        =   98
               Top             =   810
               Width           =   435
            End
            Begin VB.ListBox lstSelectedIndex 
               Height          =   1815
               Index           =   1
               Left            =   120
               RightToLeft     =   -1  'True
               TabIndex        =   97
               Top             =   300
               Width           =   1785
            End
            Begin MSDataListLib.DataList DataList 
               Bindings        =   "frmSearch.frx":12C3
               Height          =   1815
               Index           =   1
               Left            =   2760
               TabIndex        =   105
               Top             =   330
               Width           =   1785
               _ExtentX        =   3149
               _ExtentY        =   3201
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCGate"
            End
         End
         Begin VB.Frame fraSelectItems 
            Caption         =   " ”—⁄  Â« "
            Height          =   2835
            Index           =   2
            Left            =   -73650
            RightToLeft     =   -1  'True
            TabIndex        =   86
            Top             =   4335
            Visible         =   0   'False
            Width           =   4665
            Begin VB.CommandButton cmdCancelSelect 
               Caption         =   "«‰’—«›"
               Height          =   495
               Index           =   2
               Left            =   2940
               RightToLeft     =   -1  'True
               TabIndex        =   94
               Top             =   2190
               Width           =   1455
            End
            Begin VB.CommandButton cmdOKSelect 
               Caption         =   " «ÌÌœ"
               Height          =   495
               Index           =   2
               Left            =   210
               RightToLeft     =   -1  'True
               TabIndex        =   93
               Top             =   2220
               Width           =   1455
            End
            Begin VB.CommandButton cmdRemoveAll 
               Caption         =   "<<"
               Height          =   375
               Index           =   2
               Left            =   2100
               RightToLeft     =   -1  'True
               TabIndex        =   92
               Top             =   1740
               Width           =   435
            End
            Begin VB.CommandButton cmdRemove 
               Caption         =   "<"
               Height          =   315
               Index           =   2
               Left            =   2100
               RightToLeft     =   -1  'True
               TabIndex        =   91
               Top             =   1320
               Width           =   435
            End
            Begin VB.ListBox lstSelectedItems 
               Height          =   1815
               Index           =   2
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   90
               Top             =   300
               Width           =   1455
            End
            Begin VB.CommandButton cmdAdd 
               Caption         =   ">"
               Height          =   375
               Index           =   2
               Left            =   2100
               RightToLeft     =   -1  'True
               TabIndex        =   89
               Top             =   360
               Width           =   435
            End
            Begin VB.CommandButton cmdAddAll 
               Caption         =   ">>"
               Height          =   375
               Index           =   2
               Left            =   2100
               RightToLeft     =   -1  'True
               TabIndex        =   88
               Top             =   840
               Width           =   435
            End
            Begin VB.ListBox lstSelectedIndex 
               Height          =   1815
               Index           =   2
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   87
               Top             =   300
               Width           =   1755
            End
            Begin MSDataListLib.DataList DataList 
               Bindings        =   "frmSearch.frx":12F3
               Height          =   1815
               Index           =   2
               Left            =   2700
               TabIndex        =   95
               Top             =   270
               Width           =   1755
               _ExtentX        =   3096
               _ExtentY        =   3201
               _Version        =   393216
               ListField       =   "Name"
               BoundColumn     =   "ID"
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCGate"
            End
         End
         Begin VB.Frame fraItemBorder 
            Caption         =   "  Ã“ÌÌ«  Ã” ÃÊ  œ— „ò«·„« "
            Height          =   5865
            Index           =   0
            Left            =   -73200
            RightToLeft     =   -1  'True
            TabIndex        =   28
            Top             =   1320
            Width           =   10155
            Begin VB.Frame Frame3 
               Height          =   2415
               Left            =   120
               RightToLeft     =   -1  'True
               TabIndex        =   77
               Top             =   2880
               Width           =   5175
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   8
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1323
                  TabIndex        =   78
                  Top             =   240
                  Width           =   735
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":138C
                  Height          =   315
                  Index           =   5
                  Left            =   120
                  TabIndex        =   79
                  Tag             =   "PhoneCard.CardStateRef="
                  Top             =   240
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "Name"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdCardState"
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":139D
                  Height          =   315
                  Index           =   9
                  Left            =   120
                  TabIndex        =   80
                  Tag             =   "PhoneCall.PhoneCardRef="
                  Top             =   720
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "PhoneCardRef"
                  BoundColumn     =   "PhoneCardRef"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdPhoneCall"
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   37
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":13AE
                  TabIndex        =   81
                  Top             =   720
                  Width           =   1440
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":1425
                  Height          =   315
                  Index           =   10
                  Left            =   120
                  TabIndex        =   82
                  Tag             =   "PhoneCall.FinalPrice="
                  Top             =   1800
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "FinalPrice"
                  BoundColumn     =   "FinalPrice"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdPhoneCall"
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   38
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1436
                  TabIndex        =   83
                  Top             =   1800
                  Width           =   1440
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":14A1
                  Height          =   315
                  Index           =   11
                  Left            =   120
                  TabIndex        =   84
                  Tag             =   "PhoneCall.InitialPrice="
                  Top             =   1320
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "InitialPrice"
                  BoundColumn     =   "InitialPrice"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdPhoneCall"
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   43
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":14B2
                  TabIndex        =   85
                  Top             =   1320
                  Width           =   1440
               End
            End
            Begin VB.Frame Frame2 
               Height          =   2535
               Left            =   120
               RightToLeft     =   -1  'True
               TabIndex        =   65
               Top             =   360
               Width           =   5175
               Begin VB.TextBox QueryType1PreNum 
                  Alignment       =   1  'Right Justify
                  Height          =   285
                  Left            =   120
                  RightToLeft     =   -1  'True
                  TabIndex        =   66
                  Tag             =   "PhoneCall.DistinationNumber"
                  Top             =   1260
                  Width           =   3015
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   69
                  Left            =   3360
                  OleObjectBlob   =   "frmSearch.frx":151D
                  TabIndex        =   67
                  Top             =   360
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   28
                  Left            =   3360
                  OleObjectBlob   =   "frmSearch.frx":1584
                  TabIndex        =   68
                  Top             =   810
                  Width           =   960
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   36
                  Left            =   3405
                  OleObjectBlob   =   "frmSearch.frx":15EF
                  TabIndex        =   69
                  Top             =   1305
                  Width           =   960
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   70
                  Left            =   3360
                  OleObjectBlob   =   "frmSearch.frx":1658
                  TabIndex        =   70
                  Top             =   1680
                  Width           =   1755
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":16D7
                  Height          =   315
                  Index           =   7
                  Left            =   1800
                  TabIndex        =   71
                  Tag             =   "PhoneStation.ID>="
                  Top             =   1680
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "PayphoneXD"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdPhoneStation"
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   7
                  Left            =   3240
                  OleObjectBlob   =   "frmSearch.frx":16E8
                  TabIndex        =   72
                  Top             =   1680
                  Width           =   135
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   26
                  Left            =   1560
                  OleObjectBlob   =   "frmSearch.frx":1743
                  TabIndex        =   73
                  Top             =   1680
                  Width           =   195
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":179E
                  Height          =   315
                  Index           =   4
                  Left            =   120
                  TabIndex        =   74
                  Tag             =   "PhoneStation.ID<="
                  Top             =   1680
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "PayphoneXD"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdPhoneStation"
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":17AF
                  Height          =   315
                  Index           =   6
                  Left            =   120
                  TabIndex        =   75
                  Tag             =   "PhoneCall.CallEventCodeRef="
                  Top             =   360
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "Name"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdCallEventCode"
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":17C0
                  Height          =   315
                  Index           =   8
                  Left            =   120
                  TabIndex        =   76
                  Tag             =   "PhoneCall.DistinationNumber="
                  Top             =   810
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "DistinationNumber"
                  BoundColumn     =   "DistinationNumber"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdPhoneCall"
               End
               Begin ACTIVESKINLibCtl.SkinLabel slbl 
                  Height          =   225
                  Index           =   17
                  Left            =   3240
                  OleObjectBlob   =   "frmSearch.frx":17D1
                  TabIndex        =   229
                  Top             =   2040
                  Width           =   495
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":182E
                  Height          =   360
                  Index           =   12
                  Left            =   120
                  TabIndex        =   230
                  Tag             =   "PhoneStation.phoneCity="
                  Top             =   2040
                  Width           =   3015
                  _ExtentX        =   5318
                  _ExtentY        =   635
                  _Version        =   393216
                  ListField       =   "CityName"
                  BoundColumn     =   "CityNumber"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdCity"
                  BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
               End
            End
            Begin VB.Frame Frame1 
               Height          =   4935
               Left            =   5400
               RightToLeft     =   -1  'True
               TabIndex        =   29
               Top             =   360
               Width           =   4575
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   6
                  Left            =   2040
                  TabIndex        =   30
                  Tag             =   "PhoneCall.CallHour>="
                  Top             =   2700
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   2
                  Mask            =   "##"
                  PromptChar      =   "_"
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   1
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":1840
                  TabIndex        =   31
                  Top             =   1320
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   2
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":189D
                  TabIndex        =   32
                  Top             =   1800
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   3
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":18FA
                  TabIndex        =   33
                  Top             =   2280
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   4
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":1957
                  TabIndex        =   34
                  Top             =   2760
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   5
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":19B6
                  TabIndex        =   35
                  Top             =   3240
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   6
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":1A17
                  TabIndex        =   36
                  Top             =   3600
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   0
                  Left            =   3720
                  OleObjectBlob   =   "frmSearch.frx":1A7E
                  TabIndex        =   37
                  Top             =   840
                  Width           =   735
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   9
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1ADF
                  TabIndex        =   38
                  Top             =   900
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   10
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1B3A
                  TabIndex        =   39
                  Top             =   1380
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   11
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1B95
                  TabIndex        =   40
                  Top             =   1800
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   12
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1BF0
                  TabIndex        =   41
                  Top             =   2340
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   13
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1C4B
                  TabIndex        =   42
                  Top             =   2760
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   14
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1CA6
                  TabIndex        =   43
                  Top             =   3240
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   15
                  Left            =   3480
                  OleObjectBlob   =   "frmSearch.frx":1D01
                  TabIndex        =   44
                  Top             =   3660
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   16
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1D5C
                  TabIndex        =   45
                  Top             =   900
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   17
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1DB7
                  TabIndex        =   46
                  Top             =   1380
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   18
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1E12
                  TabIndex        =   47
                  Top             =   1800
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   19
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1E6D
                  TabIndex        =   48
                  Top             =   2340
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   20
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1EC8
                  TabIndex        =   49
                  Top             =   2760
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   21
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1F23
                  TabIndex        =   50
                  Top             =   3240
                  Width           =   195
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
                  Height          =   315
                  Index           =   22
                  Left            =   1800
                  OleObjectBlob   =   "frmSearch.frx":1F7E
                  TabIndex        =   51
                  Top             =   3660
                  Width           =   195
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":1FD9
                  Height          =   315
                  Index           =   0
                  Left            =   2040
                  TabIndex        =   52
                  Tag             =   "PhoneCall.CallMonth>="
                  Top             =   1800
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "ID"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdCMonth"
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":1FEA
                  Height          =   315
                  Index           =   3
                  Left            =   360
                  TabIndex        =   53
                  Tag             =   "PhoneCall.DayInWeekRef<="
                  Top             =   3660
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "Name"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdDayInWeek"
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":1FFB
                  Height          =   315
                  Index           =   2
                  Left            =   2040
                  TabIndex        =   54
                  Tag             =   "PhoneCall.DayInWeekRef>="
                  Top             =   3660
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "Name"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdDayInWeek"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   5
                  Left            =   360
                  TabIndex        =   55
                  Tag             =   "PhoneCall.CallDay<="
                  Top             =   2220
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   2
                  Mask            =   "##"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   4
                  Left            =   2040
                  TabIndex        =   56
                  Tag             =   "PhoneCall.CallDay>="
                  Top             =   2220
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   2
                  Mask            =   "##"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   3
                  Left            =   360
                  TabIndex        =   57
                  Tag             =   "PhoneCall.CallYear<="
                  Top             =   1320
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   4
                  Mask            =   "####"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   2
                  Left            =   2040
                  TabIndex        =   58
                  Tag             =   "PhoneCall.CallYear>="
                  Top             =   1320
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   4
                  Mask            =   "####"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   7
                  Left            =   360
                  TabIndex        =   59
                  Tag             =   "PhoneCall.CallHour<="
                  Top             =   2700
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   2
                  Mask            =   "##"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   9
                  Left            =   360
                  TabIndex        =   60
                  Tag             =   "PhoneCall.CallMinute<="
                  Top             =   3180
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   2
                  Mask            =   "##"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   8
                  Left            =   2040
                  TabIndex        =   61
                  Tag             =   "PhoneCall.CallMinute>="
                  Top             =   3180
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   2
                  Mask            =   "##"
                  PromptChar      =   "_"
               End
               Begin MSDataListLib.DataCombo QueryType1cbo 
                  Bindings        =   "frmSearch.frx":200C
                  Height          =   315
                  Index           =   1
                  Left            =   360
                  TabIndex        =   62
                  Tag             =   "PhoneCall.CallMonth<="
                  Top             =   1800
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   556
                  _Version        =   393216
                  ListField       =   "ID"
                  BoundColumn     =   "ID"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdCMonth"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   0
                  Left            =   2040
                  TabIndex        =   63
                  Tag             =   $"frmSearch.frx":201D
                  Top             =   840
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   10
                  Mask            =   "####/##/##"
                  PromptChar      =   "_"
               End
               Begin MSMask.MaskEdBox QueryType1mtxt 
                  Height          =   375
                  Index           =   1
                  Left            =   360
                  TabIndex        =   64
                  Tag             =   $"frmSearch.frx":20C9
                  Top             =   840
                  Width           =   1335
                  _ExtentX        =   2355
                  _ExtentY        =   661
                  _Version        =   393216
                  MaxLength       =   10
                  Mask            =   "####/##/##"
                  PromptChar      =   "_"
               End
            End
         End
         Begin VB.Frame fraItemBorder 
            Caption         =   "»Â —Ê“ —”«‰Ì  ‰ŸÌ„« "
            Height          =   3615
            Index           =   3
            Left            =   -71280
            RightToLeft     =   -1  'True
            TabIndex        =   5
            Top             =   1320
            Width           =   5955
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   44
               Left            =   4380
               OleObjectBlob   =   "frmSearch.frx":2175
               TabIndex        =   6
               Top             =   1200
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   45
               Left            =   4380
               OleObjectBlob   =   "frmSearch.frx":21D2
               TabIndex        =   7
               Top             =   1620
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   51
               Left            =   4380
               OleObjectBlob   =   "frmSearch.frx":222F
               TabIndex        =   8
               Top             =   2160
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   52
               Left            =   4380
               OleObjectBlob   =   "frmSearch.frx":228C
               TabIndex        =   9
               Top             =   720
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   61
               Left            =   3960
               OleObjectBlob   =   "frmSearch.frx":22ED
               TabIndex        =   10
               Top             =   720
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   68
               Left            =   3960
               OleObjectBlob   =   "frmSearch.frx":2348
               TabIndex        =   11
               Top             =   1200
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   73
               Left            =   3960
               OleObjectBlob   =   "frmSearch.frx":23A3
               TabIndex        =   12
               Top             =   1620
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   74
               Left            =   3960
               OleObjectBlob   =   "frmSearch.frx":23FE
               TabIndex        =   13
               Top             =   2160
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   75
               Left            =   2280
               OleObjectBlob   =   "frmSearch.frx":2459
               TabIndex        =   14
               Top             =   720
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   76
               Left            =   2280
               OleObjectBlob   =   "frmSearch.frx":24B4
               TabIndex        =   15
               Top             =   1200
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   77
               Left            =   2280
               OleObjectBlob   =   "frmSearch.frx":250F
               TabIndex        =   16
               Top             =   1620
               Width           =   195
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   78
               Left            =   2280
               OleObjectBlob   =   "frmSearch.frx":256A
               TabIndex        =   17
               Top             =   2160
               Width           =   195
            End
            Begin MSDataListLib.DataCombo QueryType6cbo 
               Bindings        =   "frmSearch.frx":25C5
               Height          =   315
               Index           =   4
               Left            =   2520
               TabIndex        =   18
               Tag             =   "TransactionLog.CallMonth>="
               Top             =   1620
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "ID"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCMonth"
            End
            Begin MSMask.MaskEdBox QueryType6mtxt 
               Height          =   375
               Index           =   6
               Left            =   840
               TabIndex        =   19
               Tag             =   "TransactionLog.CallDay<="
               Top             =   2040
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType6mtxt 
               Height          =   375
               Index           =   7
               Left            =   2520
               TabIndex        =   20
               Tag             =   "TransactionLog.CallDay>="
               Top             =   2040
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   2
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType6mtxt 
               Height          =   375
               Index           =   8
               Left            =   840
               TabIndex        =   21
               Tag             =   "TransactionLog.CallYear<="
               Top             =   1140
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   4
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType6mtxt 
               Height          =   375
               Index           =   9
               Left            =   2520
               TabIndex        =   22
               Tag             =   "TransactionLog.CallYear>="
               Top             =   1140
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   4
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin MSDataListLib.DataCombo QueryType6cbo 
               Bindings        =   "frmSearch.frx":25D6
               Height          =   315
               Index           =   5
               Left            =   840
               TabIndex        =   23
               Tag             =   "TransactionLog.CallMonth<="
               Top             =   1620
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "ID"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCMonth"
            End
            Begin MSMask.MaskEdBox QueryType6mtxt 
               Height          =   375
               Index           =   10
               Left            =   2520
               TabIndex        =   24
               Tag             =   $"frmSearch.frx":25E7
               Top             =   660
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               Mask            =   "####/##/##"
               PromptChar      =   "_"
            End
            Begin MSMask.MaskEdBox QueryType6mtxt 
               Height          =   375
               Index           =   11
               Left            =   840
               TabIndex        =   25
               Tag             =   $"frmSearch.frx":26AC
               Top             =   660
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               Mask            =   "####/##/##"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
               Height          =   315
               Index           =   80
               Left            =   3840
               OleObjectBlob   =   "frmSearch.frx":2771
               TabIndex        =   26
               Top             =   2640
               Width           =   1635
            End
            Begin MSDataListLib.DataCombo QueryType6cbo 
               Bindings        =   "frmSearch.frx":27EC
               Height          =   315
               Index           =   7
               Left            =   840
               TabIndex        =   27
               Tag             =   "TransactionLog.PhoneStationRef="
               Top             =   2640
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   556
               _Version        =   393216
               ListField       =   "PayphoneXD"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdPhoneStation"
            End
         End
      End
      Begin VB.Image Image2 
         Height          =   525
         Left            =   60
         Picture         =   "frmSearch.frx":27FD
         Stretch         =   -1  'True
         Top             =   120
         Width           =   705
      End
   End
End
Attribute VB_Name = "frmSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private rsDataList As New ADODB.Recordset
Dim IndexBackUp0, IndexBackUp1, IndexBackUp2 As Integer

Private Sub ccmdReport_Click()
    frmReport.ZOrder 0
End Sub

Private Sub QueryType3chk_Click()
    optCalled(0).Visible = QueryType3chk.Value
    optCalled(1).Visible = QueryType3chk.Value
End Sub

Private Sub cmdAdd_Click(Index As Integer)
    If (Trim(DataList(sstSearch.Tab Mod 3).BoundText) <> "") Then
        lstSelectedItems(sstSearch.Tab Mod 3).AddItem (DataList(sstSearch.Tab Mod 3).Text)
        lstSelectedIndex(sstSearch.Tab Mod 3).AddItem (DataList(sstSearch.Tab Mod 3).BoundText)
    End If
End Sub

Private Sub cmdAddAll_Click(Index As Integer)
    Dim I As Integer
    Dim rsName As String
    Dim FieldName As String
    Dim BoundColumn As String
    
    Dim rs As New ADODB.Recordset
    
    lstSelectedItems(sstSearch.Tab Mod 3).Clear
    lstSelectedIndex(sstSearch.Tab Mod 3).Clear
    
    FieldName = DataList(sstSearch.Tab Mod 3).ListField
    BoundColumn = DataList(sstSearch.Tab Mod 3).BoundColumn

    Set rs = de.Recordsets.Item(DataList(sstSearch.Tab Mod 3).RowMember)
    With rs
        .MoveFirst
        For I = 1 To .RecordCount
            lstSelectedItems(sstSearch.Tab Mod 3).AddItem (.Fields(FieldName).Value)
            lstSelectedIndex(sstSearch.Tab Mod 3).AddItem (.Fields(BoundColumn).Value)
            .MoveNext
        Next I
    End With
    
    Set rs = Nothing
    
End Sub

Private Sub cmdCancelSelect_Click(Index As Integer)
    fraSelectItems(sstSearch.Tab Mod 3).Visible = False
End Sub

Private Sub cmdClear_Click()
    Dim obj As Object

    For Each obj In Controls
        Select Case TypeName(obj)
            Case "TextBox", "DataCombo":
                obj.Text = ""
                obj.ToolTipText = ""
            Case "MaskEdBox":
                obj.Text = Replace(obj.Mask, "#", obj.PromptChar)
        End Select
    Next obj
    
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdOKSelect_Click(Index As Integer)
    Dim I As Integer

    Select Case (sstSearch.Tab Mod 3)
        Case 0:
            txtSelectedItems1(IndexBackUp0).Text = ""
            txtSelectedItems1(IndexBackUp0).ToolTipText = ""
            
            For I = 0 To lstSelectedItems(sstSearch.Tab Mod 3).ListCount - 1
              txtSelectedItems1(IndexBackUp0).Text = txtSelectedItems1(IndexBackUp0).Text & lstSelectedItems(sstSearch.Tab Mod 3).List(I) & ","
              txtSelectedItems1(IndexBackUp0).ToolTipText = txtSelectedItems1(IndexBackUp0).ToolTipText & lstSelectedIndex(sstSearch.Tab Mod 3).List(I) & ","
            Next I
            
            With txtSelectedItems1(IndexBackUp0)
                If (Trim(.Text) <> "") Then
                    .Text = Left(.Text, Len(.Text) - 1)
                End If
            End With
            
            With txtSelectedItems1(IndexBackUp0)
                If (Trim(.ToolTipText) <> "") Then
                    .ToolTipText = Left(.ToolTipText, Len(.ToolTipText) - 1)
                End If
            End With
        
        Case 1:
            txtSelectedItems2(IndexBackUp1).Text = ""
            txtSelectedItems2(IndexBackUp1).ToolTipText = ""
            
            For I = 0 To lstSelectedItems(sstSearch.Tab Mod 3).ListCount - 1
              txtSelectedItems2(IndexBackUp1).Text = txtSelectedItems2(IndexBackUp1).Text & lstSelectedItems(sstSearch.Tab Mod 3).List(I) & ","
              txtSelectedItems2(IndexBackUp1).ToolTipText = txtSelectedItems2(IndexBackUp1).ToolTipText & lstSelectedIndex(sstSearch.Tab Mod 3).List(I) & ","
            Next I
            
            With txtSelectedItems2(IndexBackUp1)
                If (Trim(.Text) <> "") Then
                    .Text = Left(.Text, Len(.Text) - 1)
                End If
            End With
            
            With txtSelectedItems2(IndexBackUp1)
                If (Trim(.ToolTipText) <> "") Then
                    .ToolTipText = Left(.ToolTipText, Len(.ToolTipText) - 1)
                End If
            End With
        
        Case 2:
            txtSelectedItems3(IndexBackUp2).Text = ""
            txtSelectedItems3(IndexBackUp2).ToolTipText = ""
            
            For I = 0 To lstSelectedItems(sstSearch.Tab Mod 3).ListCount - 1
              txtSelectedItems3(IndexBackUp2).Text = txtSelectedItems3(IndexBackUp2).Text & lstSelectedItems(sstSearch.Tab Mod 3).List(I) & ","
              txtSelectedItems3(IndexBackUp2).ToolTipText = txtSelectedItems3(IndexBackUp2).ToolTipText & lstSelectedIndex(sstSearch.Tab Mod 3).List(I) & ","
            Next I
            
            With txtSelectedItems3(IndexBackUp2)
                If (Trim(.Text) <> "") Then
                    .Text = Left(.Text, Len(.Text) - 1)
                End If
            End With
            
            With txtSelectedItems3(IndexBackUp2)
                If (Trim(.ToolTipText) <> "") Then
                    .ToolTipText = Left(.ToolTipText, Len(.ToolTipText) - 1)
                End If
            End With
    
    End Select
    
    fraSelectItems(sstSearch.Tab Mod 3).Visible = False
End Sub

Private Sub cmdRemove_Click(Index As Integer)
    With lstSelectedItems(sstSearch.Tab Mod 3)
        If (.ListIndex >= 0) Then
            lstSelectedIndex(sstSearch.Tab Mod 3).RemoveItem (.ListIndex)
            .RemoveItem (.ListIndex)
        End If
    End With
End Sub

Private Sub cmdRemoveAll_Click(Index As Integer)
    lstSelectedItems(sstSearch.Tab Mod 3).Clear
    lstSelectedIndex(sstSearch.Tab Mod 3).Clear
End Sub
Private Sub cmdSelect_Click(Index As Integer)
    Select Case (sstSearch.Tab Mod 3)
        Case 0:
            IndexBackUp0 = Index
        Case 1:
            IndexBackUp1 = Index
        Case 2:
            IndexBackUp2 = Index
    End Select
    

    lstSelectedItems(sstSearch.Tab Mod 3).Clear
    lstSelectedIndex(sstSearch.Tab Mod 3).Clear
    
    With fraSelectItems(sstSearch.Tab Mod 3)
        .Caption = cmdSelect(Index).Caption
        .Top = cmdSelect(Index).Top + fraSearchButton(sstSearch.Tab Mod 3).Top
        .Top = IIf(.Top + .Height > sstSearch.Height - 100, sstSearch.Height - 100 - .Height, .Top)
        .Left = fraSearchButton(sstSearch.Tab Mod 3).Left - .Width - 10
        .Visible = True
        .ZOrder 0
    End With
    
    fraSelectItems(sstSearch.Tab Mod 3).Caption = cmdSelect(Index).Caption
    
    DataList(sstSearch.Tab Mod 3).RowMember = ""
    
    
    DataList(sstSearch.Tab Mod 3).BoundColumn = de.Recordsets.Item(cmdSelect(Index).Tag).Fields(0).Name
    
    If (de.Recordsets.Item(cmdSelect(Index).Tag).Fields(1).Name <> "Name") Then
        DataList(sstSearch.Tab Mod 3).ListField = de.Recordsets.Item(cmdSelect(Index).Tag).Fields(0).Name
    Else
        DataList(sstSearch.Tab Mod 3).ListField = de.Recordsets.Item(cmdSelect(Index).Tag).Fields(1).Name
    End If
    
    DataList(sstSearch.Tab Mod 3).RowMember = cmdSelect(Index).Tag
End Sub



Private Sub DataList_DblClick(Index As Integer)
    If (Trim(DataList(sstSearch.Tab Mod 3).BoundText) <> "") Then
        lstSelectedItems(sstSearch.Tab Mod 3).AddItem (DataList(sstSearch.Tab Mod 3).Text)
        lstSelectedIndex(sstSearch.Tab Mod 3).AddItem (DataList(sstSearch.Tab Mod 3).BoundText)
    End If
End Sub

Private Sub Form_Load()
    SetSkin frmSearch
    sstSearch.Tab = 0
End Sub

Private Sub Form_Resize()
    
    With fraSearchDetail
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
    End With
End Sub



Private Sub lstSelectedItems_DblClick(Index As Integer)
    With lstSelectedItems(sstSearch.Tab Mod 3)
        If (.ListIndex >= 0) Then
            lstSelectedIndex(sstSearch.Tab Mod 3).RemoveItem (.ListIndex)
            .RemoveItem (.ListIndex)
        End If
    End With
End Sub

Public Function QueryWhere(Optional QueryType As Byte = 1) As String
    Dim strWhere As String
    Dim indexCounter As Byte
    Dim obj As Object
    
    strWhere = " 1=1"

'TextBoxes
    For Each obj In Controls
        If (obj.Name = "txtSelectedItems" & QueryType) Then
            If (Trim(obj.ToolTipText) <> "") Then
                    strWhere = strWhere & " AND " & _
                                        Trim(obj.Tag) & " IN (" & _
                                        Trim(obj.ToolTipText) & ")"
            End If
        End If
    Next obj


'MaskEdit And DataCombos
    For Each obj In Controls
        If (Trim(Left(obj.Name, 10)) = "QueryType" & QueryType) Then
            Select Case TypeName(obj)
                Case "MaskEdBox":
                    If (Trim(obj.Tag) <> "" And Trim(obj.ClipText) <> "") Then
                        strWhere = strWhere & " AND " & Trim(obj.Tag) & Trim(obj.ClipText)
                    End If
                Case "DataCombo":
                    If (Trim(obj.Tag) = "PhoneCall.DistinationNumber=") Then
                        If obj.BoundText <> "" Then
                         strWhere = strWhere & " AND " & Trim(obj.Tag) & "'" & Trim(obj.BoundText) & "'"
                        End If
                    Else
                        If (obj.MatchedWithList) Then
                            strWhere = strWhere & " AND " & Trim(obj.Tag) & Trim(obj.BoundText)
                        End If
                    End If
                Case "TextBox":
                    If Trim(obj.Text) <> "" Then
                     strWhere = strWhere & " AND " & Trim(obj.Tag) & " LIKE '" & Trim(obj.Text) & "%'"
                    End If
            End Select
        End If
    Next obj

    If (QueryType = 4) Then
        If (QueryType3chk.Value) Then
            strWhere = strWhere & " AND " & Trim(QueryType3chk.Tag) & (IIf(optCalled(0).Value, "True", "False") And 1)
        End If
        
    End If

    QueryWhere = strWhere
    
End Function

