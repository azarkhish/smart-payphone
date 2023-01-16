VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmDataEntry 
   ClientHeight    =   9840
   ClientLeft      =   1725
   ClientTop       =   1050
   ClientWidth     =   12795
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
   ScaleHeight     =   9840
   ScaleWidth      =   12795
   WindowState     =   2  'Maximized
   Begin VB.Frame fraDataEntry 
      Height          =   9615
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   12675
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Õ–›"
         Height          =   495
         Left            =   720
         RightToLeft     =   -1  'True
         TabIndex        =   4
         Top             =   9000
         Width           =   1635
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "Œ—ÊÃ"
         Height          =   495
         Left            =   9720
         RightToLeft     =   -1  'True
         TabIndex        =   3
         Top             =   9000
         Width           =   1635
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "«‰’—«›"
         Height          =   495
         Left            =   6120
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   9000
         Width           =   1635
      End
      Begin TabDlg.SSTab sstDataEntry 
         Height          =   8595
         Left            =   315
         TabIndex        =   7
         Top             =   240
         Width           =   12165
         _ExtentX        =   21458
         _ExtentY        =   15161
         _Version        =   393216
         Tabs            =   13
         Tab             =   1
         TabsPerRow      =   13
         TabHeight       =   1764
         BackColor       =   14737632
         TabCaption(0)   =   "PMS ‘„«—Â  ·›‰Â«Ì"
         TabPicture(0)   =   "frmDataEntry.frx":0000
         Tab(0).ControlEnabled=   0   'False
         Tab(0).Control(0)=   "dtgPMS"
         Tab(0).Control(1)=   "fraPmsNum"
         Tab(0).ControlCount=   2
         TabCaption(1)   =   "·Ì”  ”Ì«Â ò«— Â«"
         TabPicture(1)   =   "frmDataEntry.frx":001C
         Tab(1).ControlEnabled=   -1  'True
         Tab(1).Control(0)=   "dtgBlackList"
         Tab(1).Control(0).Enabled=   0   'False
         Tab(1).Control(1)=   "fraBlackList"
         Tab(1).Control(1).Enabled=   0   'False
         Tab(1).ControlCount=   2
         TabCaption(2)   =   " ·›‰Â«Ì —«Ìê«‰"
         TabPicture(2)   =   "frmDataEntry.frx":0038
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "dtgFreeTel"
         Tab(2).Control(1)=   "fraFreeNum"
         Tab(2).ControlCount=   2
         TabCaption(3)   =   "ÃœÊ·  ⁄—›Â Â«"
         TabPicture(3)   =   "frmDataEntry.frx":0054
         Tab(3).ControlEnabled=   0   'False
         Tab(3).Control(0)=   "dtgChargging"
         Tab(3).Control(0).Enabled=   0   'False
         Tab(3).Control(1)=   "fraChrging"
         Tab(3).Control(1).Enabled=   0   'False
         Tab(3).ControlCount=   2
         TabCaption(4)   =   "ÅÌ«„Â«"
         TabPicture(4)   =   "frmDataEntry.frx":0070
         Tab(4).ControlEnabled=   0   'False
         Tab(4).Control(0)=   "dtgMessage"
         Tab(4).Control(1)=   "fraMessage"
         Tab(4).Control(2)=   "Frame10"
         Tab(4).Control(3)=   "cmdAddToShowMessege"
         Tab(4).Control(4)=   "dtgShowMessage"
         Tab(4).Control(5)=   "cmdDeleteFromShowMessege"
         Tab(4).Control(6)=   "cmdSaveMessegeBlock"
         Tab(4).Control(7)=   "txtTotalLength"
         Tab(4).ControlCount=   8
         TabCaption(5)   =   "œ” ê«ÂÂ«Ì  ·›‰"
         TabPicture(5)   =   "frmDataEntry.frx":008C
         Tab(5).ControlEnabled=   0   'False
         Tab(5).Control(0)=   "SSTab1"
         Tab(5).ControlCount=   1
         TabCaption(6)   =   " ‰ŸÌ„«  ‘Â—Â« Ê „‰«ÿﬁ"
         TabPicture(6)   =   "frmDataEntry.frx":00A8
         Tab(6).ControlEnabled=   0   'False
         Tab(6).Control(0)=   "sstCityAreaSetting"
         Tab(6).ControlCount=   1
         TabCaption(7)   =   "À»  «ÿ·«⁄«  œ— œ” ê«ÂÂ«"
         TabPicture(7)   =   "frmDataEntry.frx":00C4
         Tab(7).ControlEnabled=   0   'False
         Tab(7).Control(0)=   "fraUpdateInfo"
         Tab(7).Control(0).Enabled=   0   'False
         Tab(7).Control(1)=   "fraRegisterInPhone"
         Tab(7).Control(1).Enabled=   0   'False
         Tab(7).ControlCount=   2
         TabCaption(8)   =   "·Ì”  ”›Ìœ ò«— Â«"
         TabPicture(8)   =   "frmDataEntry.frx":00E0
         Tab(8).ControlEnabled=   0   'False
         Tab(8).Control(0)=   "dtgWhiteList"
         Tab(8).Control(0).Enabled=   0   'False
         Tab(8).Control(1)=   "fraWhiteList"
         Tab(8).Control(1).Enabled=   0   'False
         Tab(8).ControlCount=   2
         TabCaption(9)   =   "SAM ‰ŸÌ„«  "
         TabPicture(9)   =   "frmDataEntry.frx":00FC
         Tab(9).ControlEnabled=   0   'False
         Tab(9).Control(0)=   "SkinLabel1"
         Tab(9).Control(1)=   "dtgSamSetting"
         Tab(9).ControlCount=   2
         TabCaption(10)  =   "ÃœÊ· “„«‰Ì «” ›«œÂ «“ —Ê‘ Â«Ì ‘«—éÌ‰ê"
         TabPicture(10)  =   "frmDataEntry.frx":0118
         Tab(10).ControlEnabled=   0   'False
         Tab(10).Control(0)=   "dtgCharggingScheduller"
         Tab(10).Control(1)=   "Frame1"
         Tab(10).ControlCount=   2
         TabCaption(11)  =   " ‰ŸÌ„«  —Ê“Â«Ì ”«·"
         TabPicture(11)  =   "frmDataEntry.frx":0134
         Tab(11).ControlEnabled=   0   'False
         Tab(11).Control(0)=   "DataGrid1"
         Tab(11).Control(1)=   "Frame3"
         Tab(11).ControlCount=   2
         TabCaption(12)  =   "—œÂ ‘«—éÌ‰ê"
         TabPicture(12)  =   "frmDataEntry.frx":0150
         Tab(12).ControlEnabled=   0   'False
         Tab(12).Control(0)=   "Frame11"
         Tab(12).Control(1)=   "dtgChargeLevel"
         Tab(12).ControlCount=   2
         Begin VB.Frame Frame1 
            Height          =   3495
            Left            =   -74520
            TabIndex        =   466
            Top             =   4320
            Width           =   11175
            Begin VB.Frame Frame9 
               Height          =   555
               Left            =   1380
               TabIndex        =   520
               Top             =   2880
               Width           =   8415
               Begin VB.TextBox fromMinute5 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5820
                  TabIndex        =   523
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromHour5 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5340
                  TabIndex        =   522
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox UsedZone6 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   1320
                  TabIndex        =   521
                  Top             =   180
                  Width           =   375
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   15
                  Left            =   6420
                  OleObjectBlob   =   "frmDataEntry.frx":016C
                  TabIndex        =   524
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   16
                  Left            =   4440
                  OleObjectBlob   =   "frmDataEntry.frx":01D1
                  TabIndex        =   525
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   17
                  Left            =   1800
                  OleObjectBlob   =   "frmDataEntry.frx":0236
                  TabIndex        =   526
                  Top             =   180
                  Width           =   1275
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel23 
                  Height          =   315
                  Left            =   3540
                  OleObjectBlob   =   "frmDataEntry.frx":02AD
                  TabIndex        =   527
                  Top             =   180
                  Width           =   555
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   27
                  Left            =   5700
                  OleObjectBlob   =   "frmDataEntry.frx":0317
                  TabIndex        =   528
                  Top             =   180
                  Width           =   135
               End
            End
            Begin VB.Frame Frame8 
               Height          =   555
               Left            =   1380
               TabIndex        =   509
               Top             =   2340
               Width           =   8415
               Begin VB.TextBox toMinute5 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3780
                  TabIndex        =   514
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox toHour5 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3300
                  TabIndex        =   513
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromMinute4 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5820
                  TabIndex        =   512
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromHour4 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5340
                  TabIndex        =   511
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox UsedZone5 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   1320
                  TabIndex        =   510
                  Top             =   180
                  Width           =   375
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   12
                  Left            =   6420
                  OleObjectBlob   =   "frmDataEntry.frx":0372
                  TabIndex        =   515
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   13
                  Left            =   4440
                  OleObjectBlob   =   "frmDataEntry.frx":03D7
                  TabIndex        =   516
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   14
                  Left            =   1800
                  OleObjectBlob   =   "frmDataEntry.frx":043C
                  TabIndex        =   517
                  Top             =   180
                  Width           =   1275
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   22
                  Left            =   3660
                  OleObjectBlob   =   "frmDataEntry.frx":04B3
                  TabIndex        =   518
                  Top             =   180
                  Width           =   135
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   26
                  Left            =   5700
                  OleObjectBlob   =   "frmDataEntry.frx":050E
                  TabIndex        =   519
                  Top             =   180
                  Width           =   135
               End
            End
            Begin VB.Frame Frame7 
               Height          =   555
               Left            =   1380
               TabIndex        =   498
               Top             =   1740
               Width           =   8415
               Begin VB.TextBox toMinute4 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3780
                  TabIndex        =   503
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox toHour4 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3300
                  TabIndex        =   502
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromMinute3 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5820
                  TabIndex        =   501
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromHour3 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5340
                  TabIndex        =   500
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox UsedZone4 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   1320
                  TabIndex        =   499
                  Top             =   180
                  Width           =   375
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   9
                  Left            =   6420
                  OleObjectBlob   =   "frmDataEntry.frx":0569
                  TabIndex        =   504
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   10
                  Left            =   4440
                  OleObjectBlob   =   "frmDataEntry.frx":05CE
                  TabIndex        =   505
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   11
                  Left            =   1800
                  OleObjectBlob   =   "frmDataEntry.frx":0633
                  TabIndex        =   506
                  Top             =   180
                  Width           =   1275
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   21
                  Left            =   3660
                  OleObjectBlob   =   "frmDataEntry.frx":06AA
                  TabIndex        =   507
                  Top             =   180
                  Width           =   135
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   25
                  Left            =   5700
                  OleObjectBlob   =   "frmDataEntry.frx":0705
                  TabIndex        =   508
                  Top             =   180
                  Width           =   135
               End
            End
            Begin VB.Frame Frame6 
               Height          =   555
               Left            =   1380
               TabIndex        =   487
               Top             =   1200
               Width           =   8415
               Begin VB.TextBox toMinute3 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3780
                  TabIndex        =   492
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox toHour3 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3300
                  TabIndex        =   491
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromMinute2 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5820
                  TabIndex        =   490
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromHour2 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5340
                  TabIndex        =   489
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox UsedZone3 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   1320
                  TabIndex        =   488
                  Top             =   180
                  Width           =   375
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   6
                  Left            =   6420
                  OleObjectBlob   =   "frmDataEntry.frx":0760
                  TabIndex        =   493
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   7
                  Left            =   4440
                  OleObjectBlob   =   "frmDataEntry.frx":07C5
                  TabIndex        =   494
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   8
                  Left            =   1800
                  OleObjectBlob   =   "frmDataEntry.frx":082A
                  TabIndex        =   495
                  Top             =   180
                  Width           =   1275
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   20
                  Left            =   3660
                  OleObjectBlob   =   "frmDataEntry.frx":08A1
                  TabIndex        =   496
                  Top             =   180
                  Width           =   135
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   24
                  Left            =   5700
                  OleObjectBlob   =   "frmDataEntry.frx":08FC
                  TabIndex        =   497
                  Top             =   180
                  Width           =   135
               End
            End
            Begin VB.Frame Frame5 
               Height          =   555
               Left            =   1380
               TabIndex        =   476
               Top             =   660
               Width           =   8415
               Begin VB.TextBox toMinute2 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3780
                  TabIndex        =   481
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox toHour2 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3300
                  TabIndex        =   480
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromMinute1 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5820
                  TabIndex        =   479
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox fromHour1 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   5340
                  TabIndex        =   478
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox UsedZone2 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   1320
                  TabIndex        =   477
                  Top             =   180
                  Width           =   375
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   3
                  Left            =   6420
                  OleObjectBlob   =   "frmDataEntry.frx":0957
                  TabIndex        =   482
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   4
                  Left            =   4440
                  OleObjectBlob   =   "frmDataEntry.frx":09BC
                  TabIndex        =   483
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   5
                  Left            =   1800
                  OleObjectBlob   =   "frmDataEntry.frx":0A21
                  TabIndex        =   484
                  Top             =   180
                  Width           =   1275
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   19
                  Left            =   3660
                  OleObjectBlob   =   "frmDataEntry.frx":0A98
                  TabIndex        =   485
                  Top             =   180
                  Width           =   135
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   23
                  Left            =   5700
                  OleObjectBlob   =   "frmDataEntry.frx":0AF3
                  TabIndex        =   486
                  Top             =   180
                  Width           =   135
               End
            End
            Begin VB.Frame Frame4 
               Height          =   555
               Left            =   1380
               TabIndex        =   467
               Top             =   120
               Width           =   8415
               Begin VB.TextBox toMinute1 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3780
                  TabIndex        =   470
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox toHour1 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   3300
                  TabIndex        =   469
                  Top             =   180
                  Width           =   375
               End
               Begin VB.TextBox UsedZone1 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   285
                  Left            =   1320
                  TabIndex        =   468
                  Top             =   180
                  Width           =   375
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel22 
                  Height          =   195
                  Left            =   5520
                  OleObjectBlob   =   "frmDataEntry.frx":0B4E
                  TabIndex        =   471
                  Top             =   180
                  Width           =   495
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   0
                  Left            =   6420
                  OleObjectBlob   =   "frmDataEntry.frx":0BB8
                  TabIndex        =   472
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   1
                  Left            =   4440
                  OleObjectBlob   =   "frmDataEntry.frx":0C1D
                  TabIndex        =   473
                  Top             =   180
                  Width           =   675
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   2
                  Left            =   1800
                  OleObjectBlob   =   "frmDataEntry.frx":0C82
                  TabIndex        =   474
                  Top             =   180
                  Width           =   1275
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel21 
                  Height          =   255
                  Index           =   18
                  Left            =   3660
                  OleObjectBlob   =   "frmDataEntry.frx":0CF9
                  TabIndex        =   475
                  Top             =   180
                  Width           =   135
               End
            End
         End
         Begin TabDlg.SSTab sstCityAreaSetting 
            Height          =   6600
            Left            =   -73470
            TabIndex        =   450
            Top             =   1620
            Width           =   9735
            _ExtentX        =   17171
            _ExtentY        =   11642
            _Version        =   393216
            Tabs            =   2
            Tab             =   1
            TabsPerRow      =   2
            TabHeight       =   520
            TabCaption(0)   =   " ‰ŸÌ„«  ‘Â—Â«"
            TabPicture(0)   =   "frmDataEntry.frx":0D54
            Tab(0).ControlEnabled=   0   'False
            Tab(0).Control(0)=   "dtgCitySetting"
            Tab(0).Control(1)=   "fraRepair"
            Tab(0).ControlCount=   2
            TabCaption(1)   =   " ⁄—Ì› „‰«ÿﬁ ‘«—éÌ‰ê"
            TabPicture(1)   =   "frmDataEntry.frx":0D70
            Tab(1).ControlEnabled=   -1  'True
            Tab(1).Control(0)=   "dtgChargeAreaSetting"
            Tab(1).Control(0).Enabled=   0   'False
            Tab(1).Control(1)=   "Frame2"
            Tab(1).Control(1).Enabled=   0   'False
            Tab(1).ControlCount=   2
            Begin VB.Frame Frame2 
               Height          =   1560
               Left            =   1200
               TabIndex        =   457
               Top             =   4320
               Width           =   7800
               Begin VB.TextBox txtAreaName 
                  Height          =   285
                  Left            =   4080
                  TabIndex        =   459
                  Top             =   360
                  Width           =   1695
               End
               Begin VB.TextBox txtAreaNumber 
                  Height          =   285
                  Left            =   4080
                  TabIndex        =   458
                  Top             =   840
                  Width           =   1695
               End
               Begin ACTIVESKINLibCtl.SkinLabel slbl 
                  Height          =   375
                  Index           =   18
                  Left            =   5880
                  OleObjectBlob   =   "frmDataEntry.frx":0D8C
                  TabIndex        =   460
                  Top             =   360
                  Width           =   1395
               End
               Begin ACTIVESKINLibCtl.SkinLabel slbl 
                  Height          =   375
                  Index           =   19
                  Left            =   5880
                  OleObjectBlob   =   "frmDataEntry.frx":0DF5
                  TabIndex        =   461
                  Top             =   840
                  Width           =   1755
               End
            End
            Begin VB.Frame fraRepair 
               Height          =   1560
               Left            =   -73920
               TabIndex        =   451
               Top             =   4320
               Width           =   7800
               Begin VB.TextBox txtCityNumber 
                  Height          =   285
                  Left            =   4200
                  TabIndex        =   453
                  Top             =   840
                  Width           =   1695
               End
               Begin VB.TextBox txtCityName 
                  Height          =   285
                  Left            =   4200
                  TabIndex        =   452
                  Top             =   360
                  Width           =   1695
               End
               Begin ACTIVESKINLibCtl.SkinLabel slbl 
                  Height          =   375
                  Index           =   15
                  Left            =   6000
                  OleObjectBlob   =   "frmDataEntry.frx":0E72
                  TabIndex        =   454
                  Top             =   360
                  Width           =   1395
               End
               Begin ACTIVESKINLibCtl.SkinLabel slbl 
                  Height          =   375
                  Index           =   42
                  Left            =   6000
                  OleObjectBlob   =   "frmDataEntry.frx":0ED7
                  TabIndex        =   455
                  Top             =   840
                  Width           =   1635
               End
               Begin ACTIVESKINLibCtl.SkinLabel slbl 
                  Height          =   225
                  Index           =   20
                  Left            =   2640
                  OleObjectBlob   =   "frmDataEntry.frx":0F50
                  TabIndex        =   463
                  Top             =   840
                  Width           =   1095
               End
               Begin MSDataListLib.DataCombo dtcAreaSelection 
                  Bindings        =   "frmDataEntry.frx":0FC1
                  Height          =   360
                  Left            =   480
                  TabIndex        =   464
                  Top             =   720
                  Width           =   2055
                  _ExtentX        =   3625
                  _ExtentY        =   635
                  _Version        =   393216
                  ListField       =   "AreaName"
                  BoundColumn     =   "AreaNumber"
                  Text            =   ""
                  RightToLeft     =   -1  'True
                  Object.DataMember      =   "cmdCharggingArea"
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
            Begin MSDataGridLib.DataGrid dtgCitySetting 
               Bindings        =   "frmDataEntry.frx":0FD3
               Height          =   3195
               Left            =   -73680
               TabIndex        =   456
               Top             =   720
               Width           =   7395
               _ExtentX        =   13044
               _ExtentY        =   5636
               _Version        =   393216
               AllowUpdate     =   -1  'True
               HeadLines       =   1
               RowHeight       =   19
               FormatLocked    =   -1  'True
               AllowDelete     =   -1  'True
               RightToLeft     =   -1  'True
               BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               DataMember      =   "cmdCity"
               Caption         =   " ⁄«—Ì› ‘Â—Â« "
               ColumnCount     =   4
               BeginProperty Column00 
                  DataField       =   "CityName"
                  Caption         =   "‰«„ ‘Â—"
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
                  DataField       =   "Index"
                  Caption         =   "—œÌ›"
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
                  DataField       =   "CityNumber"
                  Caption         =   "‘„«—Â ‘‰«”«ÌÌ ‘Â—"
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
                  DataField       =   "ChargeArea"
                  Caption         =   "„‰ÿﬁÂ ‘«—éÌ‰ê"
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
                     ColumnWidth     =   2429.858
                  EndProperty
                  BeginProperty Column01 
                     ColumnWidth     =   1275.024
                  EndProperty
                  BeginProperty Column02 
                     ColumnWidth     =   1995.024
                  EndProperty
                  BeginProperty Column03 
                     ColumnWidth     =   1275.024
                  EndProperty
               EndProperty
            End
            Begin MSDataGridLib.DataGrid dtgChargeAreaSetting 
               Bindings        =   "frmDataEntry.frx":0FE4
               Height          =   3195
               Left            =   1800
               TabIndex        =   462
               Top             =   720
               Width           =   6675
               _ExtentX        =   11774
               _ExtentY        =   5636
               _Version        =   393216
               AllowUpdate     =   -1  'True
               HeadLines       =   1
               RowHeight       =   19
               FormatLocked    =   -1  'True
               AllowDelete     =   -1  'True
               RightToLeft     =   -1  'True
               BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               DataMember      =   "cmdCharggingArea"
               Caption         =   " ⁄«—Ì› „‰«ÿﬁ ‘«—éÌ‰ê"
               ColumnCount     =   3
               BeginProperty Column00 
                  DataField       =   "AreaName"
                  Caption         =   "‰«„ „‰ÿﬁÂ"
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
                  DataField       =   "Index"
                  Caption         =   "—œÌ›"
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
                  DataField       =   "AreaNumber"
                  Caption         =   "‘„«—Â ‘‰«”«ÌÌ „‰ÿﬁÂ"
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
                     ColumnWidth     =   2429.858
                  EndProperty
                  BeginProperty Column01 
                     ColumnWidth     =   1275.024
                  EndProperty
                  BeginProperty Column02 
                     ColumnWidth     =   1995.024
                  EndProperty
               EndProperty
            End
         End
         Begin VB.Frame Frame11 
            Height          =   3855
            Left            =   -74520
            TabIndex        =   418
            Top             =   4200
            Width           =   11295
            Begin VB.TextBox txtChargeLevel 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   9240
               TabIndex        =   530
               Top             =   900
               Width           =   735
            End
            Begin VB.Frame Frame17 
               Caption         =   "’œ„ À«‰ÌÂ"
               Height          =   3255
               Left            =   5760
               RightToLeft     =   -1  'True
               TabIndex        =   424
               Top             =   360
               Width           =   1335
               Begin VB.TextBox txtChargeTenMiliSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   5
                  Left            =   360
                  TabIndex        =   435
                  Top             =   2760
                  Width           =   615
               End
               Begin VB.TextBox txtChargeTenMiliSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   4
                  Left            =   360
                  TabIndex        =   434
                  Top             =   2280
                  Width           =   615
               End
               Begin VB.TextBox txtChargeTenMiliSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   3
                  Left            =   360
                  TabIndex        =   433
                  Top             =   1800
                  Width           =   615
               End
               Begin VB.TextBox txtChargeTenMiliSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   2
                  Left            =   360
                  TabIndex        =   432
                  Top             =   1320
                  Width           =   615
               End
               Begin VB.TextBox txtChargeTenMiliSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   1
                  Left            =   360
                  TabIndex        =   431
                  Top             =   840
                  Width           =   615
               End
               Begin VB.TextBox txtChargeTenMiliSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   0
                  Left            =   360
                  TabIndex        =   425
                  Top             =   360
                  Width           =   615
               End
            End
            Begin VB.Frame Frame16 
               Caption         =   "À«‰ÌÂ"
               Height          =   3255
               Left            =   4320
               RightToLeft     =   -1  'True
               TabIndex        =   422
               Top             =   360
               Width           =   1335
               Begin VB.TextBox txtChargeSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   5
                  Left            =   360
                  TabIndex        =   440
                  Top             =   2760
                  Width           =   615
               End
               Begin VB.TextBox txtChargeSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   4
                  Left            =   360
                  TabIndex        =   439
                  Top             =   2280
                  Width           =   615
               End
               Begin VB.TextBox txtChargeSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   3
                  Left            =   360
                  TabIndex        =   438
                  Top             =   1800
                  Width           =   615
               End
               Begin VB.TextBox txtChargeSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   2
                  Left            =   360
                  TabIndex        =   437
                  Top             =   1320
                  Width           =   615
               End
               Begin VB.TextBox txtChargeSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   1
                  Left            =   360
                  TabIndex        =   436
                  Top             =   840
                  Width           =   615
               End
               Begin VB.TextBox txtChargeSec 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   0
                  Left            =   360
                  TabIndex        =   423
                  Top             =   360
                  Width           =   615
               End
            End
            Begin VB.Frame Frame15 
               Caption         =   " ⁄œ«œ Å«·”"
               Height          =   3255
               Left            =   2880
               RightToLeft     =   -1  'True
               TabIndex        =   421
               Top             =   360
               Width           =   1335
               Begin VB.TextBox txtChargePulseCoef 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   0
                  Left            =   360
                  TabIndex        =   529
                  Top             =   360
                  Width           =   615
               End
               Begin VB.TextBox txtChargePulseCoef 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   5
                  Left            =   360
                  TabIndex        =   445
                  Top             =   2760
                  Width           =   615
               End
               Begin VB.TextBox txtChargePulseCoef 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   4
                  Left            =   360
                  TabIndex        =   444
                  Top             =   2280
                  Width           =   615
               End
               Begin VB.TextBox txtChargePulseCoef 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   3
                  Left            =   360
                  TabIndex        =   443
                  Top             =   1800
                  Width           =   615
               End
               Begin VB.TextBox txtChargePulseCoef 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   2
                  Left            =   360
                  TabIndex        =   442
                  Top             =   1320
                  Width           =   615
               End
               Begin VB.TextBox txtChargePulseCoef 
                  BeginProperty Font 
                     Name            =   "Tahoma"
                     Size            =   9.75
                     Charset         =   178
                     Weight          =   700
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  Height          =   375
                  Index           =   1
                  Left            =   360
                  TabIndex        =   441
                  Top             =   840
                  Width           =   615
               End
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   0
               Left            =   10080
               OleObjectBlob   =   "frmDataEntry.frx":0FF5
               TabIndex        =   419
               Top             =   960
               Width           =   975
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   4
               Left            =   7200
               OleObjectBlob   =   "frmDataEntry.frx":1062
               TabIndex        =   420
               Top             =   720
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   1
               Left            =   7200
               OleObjectBlob   =   "frmDataEntry.frx":10C3
               TabIndex        =   426
               Top             =   1200
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   2
               Left            =   7200
               OleObjectBlob   =   "frmDataEntry.frx":1124
               TabIndex        =   427
               Top             =   1680
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   3
               Left            =   7200
               OleObjectBlob   =   "frmDataEntry.frx":1185
               TabIndex        =   428
               Top             =   2160
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   5
               Left            =   7200
               OleObjectBlob   =   "frmDataEntry.frx":11E6
               TabIndex        =   429
               Top             =   2640
               Width           =   615
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel18 
               Height          =   255
               Index           =   6
               Left            =   7200
               OleObjectBlob   =   "frmDataEntry.frx":1247
               TabIndex        =   430
               Top             =   3120
               Width           =   615
            End
         End
         Begin TabDlg.SSTab SSTab1 
            Height          =   7215
            Left            =   -74880
            TabIndex        =   299
            Top             =   1080
            Width           =   11655
            _ExtentX        =   20558
            _ExtentY        =   12726
            _Version        =   393216
            Tabs            =   2
            TabsPerRow      =   2
            TabHeight       =   520
            TabCaption(0)   =   " ‰ŸÌ„«   òÌ"
            TabPicture(0)   =   "frmDataEntry.frx":12A8
            Tab(0).ControlEnabled=   -1  'True
            Tab(0).Control(0)=   "SSTabPhone"
            Tab(0).Control(0).Enabled=   0   'False
            Tab(0).Control(1)=   "dtgPhoneStation"
            Tab(0).Control(1).Enabled=   0   'False
            Tab(0).ControlCount=   2
            TabCaption(1)   =   " ‰ŸÌ„«  „”·”·"
            TabPicture(1)   =   "frmDataEntry.frx":12C4
            Tab(1).ControlEnabled=   0   'False
            Tab(1).Control(0)=   "SSTab2"
            Tab(1).ControlCount=   1
            Begin MSDataGridLib.DataGrid dtgPhoneStation 
               Bindings        =   "frmDataEntry.frx":12E0
               Height          =   2415
               Left            =   180
               TabIndex        =   300
               Top             =   480
               Width           =   11055
               _ExtentX        =   19500
               _ExtentY        =   4260
               _Version        =   393216
               HeadLines       =   1
               RowHeight       =   19
               FormatLocked    =   -1  'True
               RightToLeft     =   -1  'True
               BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               DataMember      =   "cmdPhoneStation"
               ColumnCount     =   30
               BeginProperty Column00 
                  DataField       =   "ID"
                  Caption         =   "”—Ì«·"
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
                  DataField       =   "TelNO"
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
                  DataField       =   "Address"
                  Caption         =   "¬œ—”"
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
                  DataField       =   "DESFunc"
                  Caption         =   "DESFunc"
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
               BeginProperty Column04 
                  DataField       =   "SendDataHour"
                  Caption         =   "”«⁄   „«”"
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
               BeginProperty Column05 
                  DataField       =   "SendDataMinute"
                  Caption         =   "œﬁÌﬁÂ  „«”"
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
               BeginProperty Column06 
                  DataField       =   "Ringer"
                  Caption         =   "Ringer"
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
               BeginProperty Column07 
                  DataField       =   "LastUpdateYear"
                  Caption         =   "LastUpdateYear"
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
               BeginProperty Column08 
                  DataField       =   "LastUpdateMonth"
                  Caption         =   "LastUpdateMonth"
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
               BeginProperty Column09 
                  DataField       =   "LastUpdateDay"
                  Caption         =   "LastUpdateDay"
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
               BeginProperty Column10 
                  DataField       =   "CharggingType"
                  Caption         =   "CharggingType"
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
               BeginProperty Column11 
                  DataField       =   "DialingRule"
                  Caption         =   "DialingRule"
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
               BeginProperty Column12 
                  DataField       =   "charggingRoutin"
                  Caption         =   "charggingRoutin"
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
               BeginProperty Column13 
                  DataField       =   "Called"
                  Caption         =   "Called"
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
               BeginProperty Column14 
                  DataField       =   "PhoneAccessLevel"
                  Caption         =   "PhoneAccessLevel"
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
               BeginProperty Column15 
                  DataField       =   "DialingType"
                  Caption         =   "DialingType"
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
               BeginProperty Column16 
                  DataField       =   "ReportScheduling"
                  Caption         =   "ReportScheduling"
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
               BeginProperty Column17 
                  DataField       =   "PhoneGroup"
                  Caption         =   "ê—ÊÂ  ·›‰"
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
               BeginProperty Column18 
                  DataField       =   "Sam1Serial"
                  Caption         =   "Sam1Serial"
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
               BeginProperty Column19 
                  DataField       =   "Sam1Pin"
                  Caption         =   "Sam1Pin"
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
               BeginProperty Column20 
                  DataField       =   "Sam1Type"
                  Caption         =   "Sam1Type"
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
               BeginProperty Column21 
                  DataField       =   "Sam2Serial"
                  Caption         =   "Sam2Serial"
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
               BeginProperty Column22 
                  DataField       =   "Sam2Pin"
                  Caption         =   "Sam2Pin"
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
               BeginProperty Column23 
                  DataField       =   "Sam2Type"
                  Caption         =   "Sam2Type"
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
               BeginProperty Column24 
                  DataField       =   "Sam3Serial"
                  Caption         =   "Sam3Serial"
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
               BeginProperty Column25 
                  DataField       =   "Sam3Pin"
                  Caption         =   "Sam3Pin"
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
               BeginProperty Column26 
                  DataField       =   "Sam3Type"
                  Caption         =   "Sam3Type"
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
               BeginProperty Column27 
                  DataField       =   "Sam4Serial"
                  Caption         =   "Sam4Serial"
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
               BeginProperty Column28 
                  DataField       =   "Sam4Pin"
                  Caption         =   "Sam4Pin"
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
               BeginProperty Column29 
                  DataField       =   "Sam4Type"
                  Caption         =   "Sam4Type"
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
                     ColumnWidth     =   1065.26
                  EndProperty
                  BeginProperty Column01 
                     ColumnWidth     =   1289.764
                  EndProperty
                  BeginProperty Column02 
                     Object.Visible         =   -1  'True
                     ColumnWidth     =   4995.213
                  EndProperty
                  BeginProperty Column03 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   780.095
                  EndProperty
                  BeginProperty Column04 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1305.071
                  EndProperty
                  BeginProperty Column05 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1484.787
                  EndProperty
                  BeginProperty Column06 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   915.024
                  EndProperty
                  BeginProperty Column07 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1440
                  EndProperty
                  BeginProperty Column08 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1590.236
                  EndProperty
                  BeginProperty Column09 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1379.906
                  EndProperty
                  BeginProperty Column10 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1349.858
                  EndProperty
                  BeginProperty Column11 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1019.906
                  EndProperty
                  BeginProperty Column12 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1470.047
                  EndProperty
                  BeginProperty Column13 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   764.787
                  EndProperty
                  BeginProperty Column14 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1635.024
                  EndProperty
                  BeginProperty Column15 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1065.26
                  EndProperty
                  BeginProperty Column16 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1574.929
                  EndProperty
                  BeginProperty Column17 
                     Object.Visible         =   -1  'True
                     ColumnWidth     =   1110.047
                  EndProperty
                  BeginProperty Column18 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column19 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column20 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   975.118
                  EndProperty
                  BeginProperty Column21 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column22 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column23 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   975.118
                  EndProperty
                  BeginProperty Column24 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column25 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column26 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   975.118
                  EndProperty
                  BeginProperty Column27 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column28 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   1739.906
                  EndProperty
                  BeginProperty Column29 
                     Object.Visible         =   0   'False
                     ColumnWidth     =   975.118
                  EndProperty
               EndProperty
            End
            Begin TabDlg.SSTab SSTabPhone 
               Height          =   3885
               Left            =   120
               TabIndex        =   301
               Top             =   3120
               Width           =   11265
               _ExtentX        =   19870
               _ExtentY        =   6853
               _Version        =   393216
               Tabs            =   4
               TabsPerRow      =   4
               TabHeight       =   1058
               TabCaption(0)   =   " ‰ŸÌ„«  ”Ì” „ "
               TabPicture(0)   =   "frmDataEntry.frx":12F1
               Tab(0).ControlEnabled=   -1  'True
               Tab(0).Control(0)=   "fraSystemSetting"
               Tab(0).Control(0).Enabled=   0   'False
               Tab(0).ControlCount=   1
               TabCaption(1)   =   "“„«‰»‰œÌ «—”«· ê“«—‘"
               TabPicture(1)   =   "frmDataEntry.frx":130D
               Tab(1).ControlEnabled=   0   'False
               Tab(1).Control(0)=   "fraReportSchedule"
               Tab(1).ControlCount=   1
               TabCaption(2)   =   "„‘Œ’«  ”Ì” „"
               TabPicture(2)   =   "frmDataEntry.frx":1329
               Tab(2).ControlEnabled=   0   'False
               Tab(2).Control(0)=   "fraPhoneInfo"
               Tab(2).ControlCount=   1
               TabCaption(3)   =   "SAM  ‰ŸÌ„«  "
               TabPicture(3)   =   "frmDataEntry.frx":1345
               Tab(3).ControlEnabled=   0   'False
               Tab(3).Control(0)=   "SkinLabel3"
               Tab(3).Control(1)=   "fraSam"
               Tab(3).ControlCount=   2
               Begin VB.Frame fraPhoneInfo 
                  Height          =   2490
                  Left            =   -73440
                  TabIndex        =   345
                  Top             =   960
                  Width           =   7935
                  Begin VB.TextBox txtSoftwareVersion 
                     Enabled         =   0   'False
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   375
                     Left            =   720
                     TabIndex        =   346
                     Top             =   315
                     Width           =   825
                  End
                  Begin VB.TextBox txtPhoneStationAddress 
                     Alignment       =   1  'Right Justify
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   705
                     Left            =   45
                     MaxLength       =   150
                     MultiLine       =   -1  'True
                     TabIndex        =   351
                     Top             =   1650
                     Width           =   7245
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel20 
                     Height          =   330
                     Left            =   1620
                     OleObjectBlob   =   "frmDataEntry.frx":1361
                     TabIndex        =   347
                     Top             =   360
                     Width           =   1500
                  End
                  Begin MSMask.MaskEdBox mtxtPhoneStationDESFunc 
                     Height          =   375
                     Left            =   720
                     TabIndex        =   352
                     Top             =   720
                     Width           =   1995
                     _ExtentX        =   3519
                     _ExtentY        =   661
                     _Version        =   393216
                     MaxLength       =   5
                     BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Mask            =   "#####"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox mtxtPhoneStationSerial 
                     Height          =   375
                     Left            =   4560
                     TabIndex        =   348
                     Top             =   315
                     Width           =   1995
                     _ExtentX        =   3519
                     _ExtentY        =   661
                     _Version        =   393216
                     MaxLength       =   7
                     BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Mask            =   "#######"
                     PromptChar      =   "_"
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   9
                     Left            =   6840
                     OleObjectBlob   =   "frmDataEntry.frx":13E4
                     TabIndex        =   353
                     Top             =   315
                     Width           =   1035
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   10
                     Left            =   6720
                     OleObjectBlob   =   "frmDataEntry.frx":1451
                     TabIndex        =   354
                     Top             =   1320
                     Width           =   885
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   11
                     Left            =   2760
                     OleObjectBlob   =   "frmDataEntry.frx":14BC
                     TabIndex        =   355
                     Top             =   840
                     Width           =   1035
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   14
                     Left            =   7380
                     OleObjectBlob   =   "frmDataEntry.frx":152D
                     TabIndex        =   356
                     Top             =   1875
                     Width           =   495
                  End
                  Begin MSMask.MaskEdBox mtxtPhoneStationTelNo 
                     Height          =   375
                     Left            =   4560
                     TabIndex        =   350
                     Top             =   1200
                     Width           =   1995
                     _ExtentX        =   3519
                     _ExtentY        =   661
                     _Version        =   393216
                     MaxLength       =   12
                     BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Mask            =   "############"
                     PromptChar      =   "_"
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   41
                     Left            =   6600
                     OleObjectBlob   =   "frmDataEntry.frx":158C
                     TabIndex        =   357
                     Top             =   840
                     Width           =   1275
                  End
                  Begin MSMask.MaskEdBox mtxtPayphoneXD 
                     Height          =   375
                     Left            =   4560
                     TabIndex        =   349
                     Top             =   720
                     Width           =   1995
                     _ExtentX        =   3519
                     _ExtentY        =   661
                     _Version        =   393216
                     MaxLength       =   12
                     BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Mask            =   "############"
                     PromptChar      =   "_"
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   16
                     Left            =   2910
                     OleObjectBlob   =   "frmDataEntry.frx":15FD
                     TabIndex        =   446
                     Top             =   1260
                     Width           =   1335
                  End
                  Begin MSDataListLib.DataCombo dtcPhoneCitySelect 
                     Bindings        =   "frmDataEntry.frx":165A
                     Height          =   360
                     Left            =   720
                     TabIndex        =   447
                     Top             =   1200
                     Width           =   2055
                     _ExtentX        =   3625
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
               Begin VB.Frame fraReportSchedule 
                  Height          =   1680
                  Left            =   -73200
                  TabIndex        =   336
                  Top             =   1440
                  Width           =   7305
                  Begin VB.ComboBox cboReportScheduling 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":166C
                     Left            =   720
                     List            =   "frmDataEntry.frx":1685
                     RightToLeft     =   -1  'True
                     TabIndex        =   341
                     Top             =   390
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboPhoneGroup 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":16C3
                     Left            =   720
                     List            =   "frmDataEntry.frx":16FA
                     RightToLeft     =   -1  'True
                     TabIndex        =   343
                     Top             =   1020
                     Width           =   2025
                  End
                  Begin MSMask.MaskEdBox mtxtPhoneStationMinute 
                     Height          =   375
                     Left            =   4800
                     TabIndex        =   339
                     Top             =   840
                     Width           =   525
                     _ExtentX        =   926
                     _ExtentY        =   661
                     _Version        =   393216
                     MaxLength       =   2
                     BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Mask            =   "##"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox mtxtPhoneStationHour 
                     Height          =   375
                     Left            =   4800
                     TabIndex        =   337
                     Top             =   360
                     Width           =   525
                     _ExtentX        =   926
                     _ExtentY        =   661
                     _Version        =   393216
                     MaxLength       =   2
                     BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Mask            =   "##"
                     PromptChar      =   "_"
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   12
                     Left            =   5400
                     OleObjectBlob   =   "frmDataEntry.frx":176D
                     TabIndex        =   338
                     Top             =   510
                     Width           =   1515
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   13
                     Left            =   5460
                     OleObjectBlob   =   "frmDataEntry.frx":17EA
                     TabIndex        =   340
                     Top             =   930
                     Width           =   1455
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   28
                     Left            =   2820
                     OleObjectBlob   =   "frmDataEntry.frx":1869
                     TabIndex        =   342
                     Top             =   450
                     Width           =   1545
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   31
                     Left            =   2880
                     OleObjectBlob   =   "frmDataEntry.frx":18E8
                     TabIndex        =   344
                     Top             =   1080
                     Width           =   795
                  End
               End
               Begin VB.Frame fraSystemSetting 
                  Height          =   2190
                  Left            =   1560
                  TabIndex        =   322
                  Top             =   960
                  Width           =   7800
                  Begin VB.ComboBox cboAntiTapActivate 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1951
                     Left            =   240
                     List            =   "frmDataEntry.frx":195F
                     RightToLeft     =   -1  'True
                     TabIndex        =   333
                     Top             =   1680
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboCharggingRoutin 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1973
                     Left            =   4035
                     List            =   "frmDataEntry.frx":1986
                     RightToLeft     =   -1  'True
                     TabIndex        =   324
                     Top             =   855
                     Width           =   1995
                  End
                  Begin VB.ComboBox cboCharggingType 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":19AB
                     Left            =   4035
                     List            =   "frmDataEntry.frx":19B9
                     RightToLeft     =   -1  'True
                     TabIndex        =   323
                     Top             =   435
                     Width           =   1995
                  End
                  Begin VB.ComboBox cboDialingRule 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":19CE
                     Left            =   4035
                     List            =   "frmDataEntry.frx":19E1
                     RightToLeft     =   -1  'True
                     TabIndex        =   326
                     Top             =   1275
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboRinger 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":19FF
                     Left            =   225
                     List            =   "frmDataEntry.frx":1A0D
                     RightToLeft     =   -1  'True
                     TabIndex        =   332
                     Top             =   1245
                     Width           =   1995
                  End
                  Begin VB.ComboBox cboDialingType 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1A1E
                     Left            =   225
                     List            =   "frmDataEntry.frx":1A2C
                     RightToLeft     =   -1  'True
                     TabIndex        =   330
                     Top             =   825
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboPhoneAccessLevel 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1A3D
                     Left            =   225
                     List            =   "frmDataEntry.frx":1A55
                     RightToLeft     =   -1  'True
                     TabIndex        =   328
                     Top             =   405
                     Width           =   2025
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   25
                     Left            =   2445
                     OleObjectBlob   =   "frmDataEntry.frx":1A9C
                     TabIndex        =   325
                     Top             =   1305
                     Width           =   675
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   24
                     Left            =   6195
                     OleObjectBlob   =   "frmDataEntry.frx":1B01
                     TabIndex        =   327
                     Top             =   1335
                     Width           =   1545
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   22
                     Left            =   6255
                     OleObjectBlob   =   "frmDataEntry.frx":1B7C
                     TabIndex        =   329
                     Top             =   495
                     Width           =   1035
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   23
                     Left            =   6255
                     OleObjectBlob   =   "frmDataEntry.frx":1BE9
                     TabIndex        =   331
                     Top             =   915
                     Width           =   1155
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   26
                     Left            =   2415
                     OleObjectBlob   =   "frmDataEntry.frx":1C5C
                     TabIndex        =   334
                     Top             =   885
                     Width           =   1185
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   27
                     Left            =   2415
                     OleObjectBlob   =   "frmDataEntry.frx":1CCF
                     TabIndex        =   335
                     Top             =   465
                     Width           =   1335
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   49
                     Left            =   2400
                     OleObjectBlob   =   "frmDataEntry.frx":1D44
                     TabIndex        =   403
                     Top             =   1680
                     Width           =   1275
                  End
               End
               Begin VB.Frame fraSam 
                  Height          =   2730
                  Left            =   -74910
                  TabIndex        =   302
                  Top             =   855
                  Width           =   10800
                  Begin VB.ComboBox cboSam1Type 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1DB7
                     Left            =   7380
                     List            =   "frmDataEntry.frx":1DC4
                     RightToLeft     =   -1  'True
                     TabIndex        =   303
                     Top             =   540
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSam3Type 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1DEB
                     Left            =   7380
                     List            =   "frmDataEntry.frx":1DF8
                     RightToLeft     =   -1  'True
                     TabIndex        =   307
                     Top             =   1560
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSam4Type 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1E1F
                     Left            =   7380
                     List            =   "frmDataEntry.frx":1E2C
                     RightToLeft     =   -1  'True
                     TabIndex        =   309
                     Top             =   2040
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSam2Type 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":1E53
                     Left            =   7380
                     List            =   "frmDataEntry.frx":1E60
                     RightToLeft     =   -1  'True
                     TabIndex        =   305
                     Top             =   1020
                     Width           =   2025
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   0
                     Left            =   1200
                     OleObjectBlob   =   "frmDataEntry.frx":1E87
                     TabIndex        =   304
                     Top             =   240
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   1
                     Left            =   4860
                     OleObjectBlob   =   "frmDataEntry.frx":1EF4
                     TabIndex        =   306
                     Top             =   180
                     Width           =   795
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   2
                     Left            =   8160
                     OleObjectBlob   =   "frmDataEntry.frx":1F5B
                     TabIndex        =   308
                     Top             =   180
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   3
                     Left            =   9570
                     OleObjectBlob   =   "frmDataEntry.frx":1FC2
                     TabIndex        =   318
                     Top             =   585
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   4
                     Left            =   9570
                     OleObjectBlob   =   "frmDataEntry.frx":202F
                     TabIndex        =   319
                     Top             =   1020
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   5
                     Left            =   9570
                     OleObjectBlob   =   "frmDataEntry.frx":209C
                     TabIndex        =   320
                     Top             =   1560
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   6
                     Left            =   9570
                     OleObjectBlob   =   "frmDataEntry.frx":2109
                     TabIndex        =   321
                     Top             =   2040
                     Width           =   1005
                  End
                  Begin MSMask.MaskEdBox txtSam1Pin 
                     Height          =   315
                     Left            =   3840
                     TabIndex        =   310
                     Tag             =   "2type"
                     Top             =   540
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam3Pin 
                     Height          =   315
                     Left            =   3840
                     TabIndex        =   312
                     Tag             =   "2type"
                     Top             =   1560
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam4Pin 
                     Height          =   315
                     Left            =   3840
                     TabIndex        =   313
                     Tag             =   "2type"
                     Top             =   2040
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam1Serial 
                     BeginProperty DataFormat 
                        Type            =   0
                        Format          =   "hh:mm:ss AMPM"
                        HaveTrueFalseNull=   0
                        FirstDayOfWeek  =   0
                        FirstWeekOfYear =   0
                        LCID            =   1065
                        SubFormatType   =   0
                     EndProperty
                     Height          =   315
                     Left            =   180
                     TabIndex        =   314
                     Tag             =   "2type"
                     Top             =   540
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam2Serial 
                     Height          =   315
                     Left            =   180
                     TabIndex        =   315
                     Tag             =   "2type"
                     Top             =   1020
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam3Serial 
                     Height          =   315
                     Left            =   180
                     TabIndex        =   316
                     Tag             =   "2type"
                     Top             =   1560
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam4Serial 
                     Height          =   315
                     Left            =   180
                     TabIndex        =   317
                     Tag             =   "2type"
                     Top             =   2040
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
                  Begin MSMask.MaskEdBox txtSam2Pin 
                     Height          =   315
                     Left            =   3840
                     TabIndex        =   311
                     Tag             =   "2type"
                     Top             =   1020
                     Width           =   2955
                     _ExtentX        =   5212
                     _ExtentY        =   556
                     _Version        =   393216
                     AllowPrompt     =   -1  'True
                     MaxLength       =   29
                     Mask            =   "&& && && && && && && && && &&"
                     PromptChar      =   "_"
                  End
               End
               Begin ACTIVESKINLibCtl.SkinLabel SkinLabel3 
                  Height          =   285
                  Left            =   -71760
                  OleObjectBlob   =   "frmDataEntry.frx":2176
                  TabIndex        =   358
                  Top             =   1845
                  Width           =   1320
               End
            End
            Begin TabDlg.SSTab SSTab2 
               Height          =   5535
               Left            =   -74160
               TabIndex        =   361
               Top             =   960
               Width           =   10575
               _ExtentX        =   18653
               _ExtentY        =   9763
               _Version        =   393216
               Tab             =   2
               TabHeight       =   520
               TabCaption(0)   =   " ‰ŸÌ„«  ”Ì” „ "
               TabPicture(0)   =   "frmDataEntry.frx":21F0
               Tab(0).ControlEnabled=   0   'False
               Tab(0).Control(0)=   "cmdSaveSettingAll"
               Tab(0).Control(1)=   "Frame14"
               Tab(0).ControlCount=   2
               TabCaption(1)   =   " ‰ŸÌ„«  ”«⁄   „«”"
               TabPicture(1)   =   "frmDataEntry.frx":220C
               Tab(1).ControlEnabled=   0   'False
               Tab(1).Control(0)=   "Frame12"
               Tab(1).Control(1)=   "cmdSetCallTimeAll"
               Tab(1).ControlCount=   2
               TabCaption(2)   =   "SAM  ‰ŸÌ„« "
               TabPicture(2)   =   "frmDataEntry.frx":2228
               Tab(2).ControlEnabled=   -1  'True
               Tab(2).Control(0)=   "cmdSaveSAMAll"
               Tab(2).Control(0).Enabled=   0   'False
               Tab(2).Control(1)=   "Frame13"
               Tab(2).Control(1).Enabled=   0   'False
               Tab(2).ControlCount=   2
               Begin VB.CommandButton cmdSetCallTimeAll 
                  Caption         =   "À»  œ—  ·›‰Â«"
                  Height          =   495
                  Left            =   -71280
                  TabIndex        =   402
                  Top             =   3900
                  Width           =   3615
               End
               Begin VB.Frame Frame12 
                  Height          =   2535
                  Left            =   -74100
                  TabIndex        =   390
                  Top             =   780
                  Width           =   9255
                  Begin VB.TextBox txtStarCallTime 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   375
                     Index           =   1
                     Left            =   6000
                     TabIndex        =   391
                     Top             =   780
                     Width           =   495
                  End
                  Begin VB.TextBox txtTimeSlotAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   375
                     Left            =   6960
                     TabIndex        =   395
                     Top             =   1380
                     Width           =   495
                  End
                  Begin VB.TextBox txtStarCallTime 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   375
                     Index           =   0
                     Left            =   6720
                     TabIndex        =   393
                     Top             =   780
                     Width           =   495
                  End
                  Begin VB.ComboBox cboCallTimeGroupAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":2244
                     Left            =   480
                     List            =   "frmDataEntry.frx":227B
                     RightToLeft     =   -1  'True
                     TabIndex        =   399
                     Top             =   810
                     Width           =   2025
                  End
                  Begin VB.OptionButton optCallTimeSetAll 
                     Caption         =   "ê—ÊÂ"
                     Height          =   255
                     Index           =   0
                     Left            =   3720
                     TabIndex        =   397
                     Top             =   840
                     Width           =   1095
                  End
                  Begin VB.OptionButton optCallTimeSetAll 
                     Caption         =   "Â„Â  ·›‰Â«"
                     Height          =   255
                     Index           =   1
                     Left            =   3720
                     TabIndex        =   401
                     Top             =   1320
                     Width           =   1335
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   15
                     Left            =   2640
                     OleObjectBlob   =   "frmDataEntry.frx":22EE
                     TabIndex        =   392
                     Top             =   840
                     Width           =   765
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   16
                     Left            =   7440
                     OleObjectBlob   =   "frmDataEntry.frx":2357
                     TabIndex        =   394
                     Top             =   840
                     Width           =   1365
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   17
                     Left            =   7560
                     OleObjectBlob   =   "frmDataEntry.frx":23C8
                     TabIndex        =   396
                     Top             =   1440
                     Width           =   765
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   18
                     Left            =   6360
                     OleObjectBlob   =   "frmDataEntry.frx":2435
                     TabIndex        =   398
                     Top             =   1440
                     Width           =   525
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   12
                     Left            =   6600
                     OleObjectBlob   =   "frmDataEntry.frx":2496
                     TabIndex        =   400
                     Top             =   840
                     Width           =   165
                  End
               End
               Begin VB.Frame Frame14 
                  Height          =   2655
                  Left            =   -74700
                  TabIndex        =   374
                  Top             =   1500
                  Width           =   9615
                  Begin VB.ComboBox cboCharggingRoutinAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":24EF
                     Left            =   4770
                     List            =   "frmDataEntry.frx":2502
                     RightToLeft     =   -1  'True
                     TabIndex        =   376
                     Top             =   960
                     Width           =   1995
                  End
                  Begin VB.ComboBox cboCharggingTypeAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":2527
                     Left            =   4770
                     List            =   "frmDataEntry.frx":2535
                     RightToLeft     =   -1  'True
                     TabIndex        =   375
                     Top             =   510
                     Width           =   1995
                  End
                  Begin VB.ComboBox cboDialingRuleAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":254A
                     Left            =   4770
                     List            =   "frmDataEntry.frx":255D
                     RightToLeft     =   -1  'True
                     TabIndex        =   378
                     Top             =   1350
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboRingerAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":257B
                     Left            =   960
                     List            =   "frmDataEntry.frx":2589
                     RightToLeft     =   -1  'True
                     TabIndex        =   384
                     Top             =   1320
                     Width           =   1995
                  End
                  Begin VB.ComboBox cboDialingTypeAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":259A
                     Left            =   960
                     List            =   "frmDataEntry.frx":25A8
                     RightToLeft     =   -1  'True
                     TabIndex        =   382
                     Top             =   900
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboPhoneAccessLevelAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":25B9
                     Left            =   960
                     List            =   "frmDataEntry.frx":25D1
                     RightToLeft     =   -1  'True
                     TabIndex        =   380
                     Top             =   480
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboGroupSettingAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":2618
                     Left            =   3240
                     List            =   "frmDataEntry.frx":264F
                     RightToLeft     =   -1  'True
                     TabIndex        =   386
                     Top             =   2040
                     Width           =   2025
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   255
                     Index           =   43
                     Left            =   3180
                     OleObjectBlob   =   "frmDataEntry.frx":26C2
                     TabIndex        =   377
                     Top             =   1380
                     Width           =   675
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   44
                     Left            =   6930
                     OleObjectBlob   =   "frmDataEntry.frx":2727
                     TabIndex        =   379
                     Top             =   1410
                     Width           =   1545
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   45
                     Left            =   6990
                     OleObjectBlob   =   "frmDataEntry.frx":27A2
                     TabIndex        =   381
                     Top             =   570
                     Width           =   1035
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   46
                     Left            =   6990
                     OleObjectBlob   =   "frmDataEntry.frx":280F
                     TabIndex        =   383
                     Top             =   990
                     Width           =   1155
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   47
                     Left            =   3150
                     OleObjectBlob   =   "frmDataEntry.frx":2882
                     TabIndex        =   385
                     Top             =   960
                     Width           =   1185
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel slbl 
                     Height          =   225
                     Index           =   48
                     Left            =   3150
                     OleObjectBlob   =   "frmDataEntry.frx":28F5
                     TabIndex        =   387
                     Top             =   540
                     Width           =   1335
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   19
                     Left            =   5400
                     OleObjectBlob   =   "frmDataEntry.frx":296A
                     TabIndex        =   389
                     Top             =   2040
                     Width           =   765
                  End
               End
               Begin VB.CommandButton cmdSaveSettingAll 
                  Caption         =   "À»  œ—  ·›‰Â«"
                  Height          =   615
                  Left            =   -71520
                  TabIndex        =   388
                  Top             =   4620
                  Width           =   3255
               End
               Begin VB.Frame Frame13 
                  Height          =   2895
                  Left            =   600
                  TabIndex        =   363
                  Top             =   540
                  Width           =   9135
                  Begin VB.ComboBox cboSaveSAMAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     ItemData        =   "frmDataEntry.frx":29D3
                     Left            =   240
                     List            =   "frmDataEntry.frx":2A0A
                     RightToLeft     =   -1  'True
                     TabIndex        =   371
                     Top             =   1320
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSAMAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     Index           =   0
                     ItemData        =   "frmDataEntry.frx":2A7D
                     Left            =   5040
                     List            =   "frmDataEntry.frx":2A8A
                     RightToLeft     =   -1  'True
                     TabIndex        =   364
                     Top             =   600
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSAMAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     Index           =   1
                     ItemData        =   "frmDataEntry.frx":2AB1
                     Left            =   5040
                     List            =   "frmDataEntry.frx":2ABE
                     RightToLeft     =   -1  'True
                     TabIndex        =   366
                     Top             =   1080
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSAMAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     Index           =   2
                     ItemData        =   "frmDataEntry.frx":2AE5
                     Left            =   5040
                     List            =   "frmDataEntry.frx":2AF2
                     RightToLeft     =   -1  'True
                     TabIndex        =   368
                     Top             =   1560
                     Width           =   2025
                  End
                  Begin VB.ComboBox cboSAMAll 
                     BeginProperty Font 
                        Name            =   "Tahoma"
                        Size            =   9.75
                        Charset         =   178
                        Weight          =   700
                        Underline       =   0   'False
                        Italic          =   0   'False
                        Strikethrough   =   0   'False
                     EndProperty
                     Height          =   360
                     Index           =   3
                     ItemData        =   "frmDataEntry.frx":2B19
                     Left            =   5040
                     List            =   "frmDataEntry.frx":2B26
                     RightToLeft     =   -1  'True
                     TabIndex        =   370
                     Top             =   2040
                     Width           =   2025
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   7
                     Left            =   7320
                     OleObjectBlob   =   "frmDataEntry.frx":2B4D
                     TabIndex        =   365
                     Top             =   645
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   8
                     Left            =   7320
                     OleObjectBlob   =   "frmDataEntry.frx":2BBA
                     TabIndex        =   367
                     Top             =   1080
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   9
                     Left            =   7320
                     OleObjectBlob   =   "frmDataEntry.frx":2C27
                     TabIndex        =   369
                     Top             =   1620
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   10
                     Left            =   7320
                     OleObjectBlob   =   "frmDataEntry.frx":2C94
                     TabIndex        =   372
                     Top             =   2100
                     Width           =   1005
                  End
                  Begin ACTIVESKINLibCtl.SkinLabel SkinLabel2 
                     Height          =   255
                     Index           =   11
                     Left            =   2280
                     OleObjectBlob   =   "frmDataEntry.frx":2D01
                     TabIndex        =   373
                     Top             =   1320
                     Width           =   765
                  End
               End
               Begin VB.CommandButton cmdSaveSAMAll 
                  Caption         =   "À»  œ—  ·›‰Â«"
                  Height          =   495
                  Left            =   3480
                  TabIndex        =   362
                  Top             =   4140
                  Width           =   3375
               End
            End
         End
         Begin VB.TextBox txtTotalLength 
            Height          =   495
            Left            =   -70800
            TabIndex        =   247
            Top             =   2685
            Width           =   495
         End
         Begin VB.CommandButton cmdSaveMessegeBlock 
            BackColor       =   &H0080FF80&
            Caption         =   "À» "
            Height          =   495
            Left            =   -70800
            MaskColor       =   &H00808080&
            Style           =   1  'Graphical
            TabIndex        =   245
            Top             =   2085
            Width           =   495
         End
         Begin VB.CommandButton cmdDeleteFromShowMessege 
            Caption         =   "->"
            Height          =   495
            Left            =   -70800
            TabIndex        =   244
            ToolTipText     =   "Delete"
            Top             =   1485
            Width           =   495
         End
         Begin MSDataGridLib.DataGrid dtgShowMessage 
            Bindings        =   "frmDataEntry.frx":2D6A
            Height          =   1935
            Left            =   -74640
            TabIndex        =   243
            Top             =   1245
            Width           =   3735
            _ExtentX        =   6588
            _ExtentY        =   3413
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            AllowDelete     =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdShowMessege"
            Caption         =   "‰„«Ì‘"
            ColumnCount     =   3
            BeginProperty Column00 
               DataField       =   "ID"
               Caption         =   "‘„«—Â"
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
               DataField       =   "Index"
               Caption         =   "Index"
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
               DataField       =   "Length"
               Caption         =   "ÿÊ·"
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
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column01 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column02 
                  ColumnWidth     =   615.118
               EndProperty
            EndProperty
         End
         Begin VB.CommandButton cmdAddToShowMessege 
            Caption         =   "<-"
            Height          =   495
            Left            =   -70800
            TabIndex        =   242
            ToolTipText     =   "Add"
            Top             =   1005
            Width           =   495
         End
         Begin VB.Frame Frame10 
            Height          =   3615
            Left            =   -74400
            TabIndex        =   92
            Top             =   4440
            Width           =   10425
            Begin VB.CommandButton Command35 
               Caption         =   "Space"
               Height          =   375
               Index           =   11
               Left            =   6240
               TabIndex        =   295
               Top             =   2520
               Width           =   735
            End
            Begin VB.CommandButton Command35 
               Caption         =   "ê·"
               Height          =   375
               Index           =   10
               Left            =   5760
               TabIndex        =   294
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command1 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":2D7B
               Style           =   1  'Graphical
               TabIndex        =   246
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton cmdRefresh 
               Caption         =   "Refresh"
               Height          =   615
               Left            =   8280
               TabIndex        =   240
               Top             =   2760
               Width           =   1215
            End
            Begin VB.CommandButton Command2 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":2E05
               Style           =   1  'Graphical
               TabIndex        =   239
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command2 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":2E8F
               Style           =   1  'Graphical
               TabIndex        =   238
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command2 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":2F19
               Style           =   1  'Graphical
               TabIndex        =   237
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command3 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":2FA3
               Style           =   1  'Graphical
               TabIndex        =   236
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command3 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":302D
               Style           =   1  'Graphical
               TabIndex        =   235
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command3 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":30B7
               Style           =   1  'Graphical
               TabIndex        =   234
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command3 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":3141
               Style           =   1  'Graphical
               TabIndex        =   233
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command4 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":31CB
               Style           =   1  'Graphical
               TabIndex        =   232
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command4 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":3255
               Style           =   1  'Graphical
               TabIndex        =   231
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command4 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":32DF
               Style           =   1  'Graphical
               TabIndex        =   230
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command4 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":3369
               Style           =   1  'Graphical
               TabIndex        =   229
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command5 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":33F3
               Style           =   1  'Graphical
               TabIndex        =   228
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command5 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":347D
               Style           =   1  'Graphical
               TabIndex        =   227
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command5 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":3507
               Style           =   1  'Graphical
               TabIndex        =   226
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command5 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":3591
               Style           =   1  'Graphical
               TabIndex        =   225
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command6 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":361B
               Style           =   1  'Graphical
               TabIndex        =   224
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command6 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":36A5
               Style           =   1  'Graphical
               TabIndex        =   223
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command6 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":372F
               Style           =   1  'Graphical
               TabIndex        =   222
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command6 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":37B9
               Style           =   1  'Graphical
               TabIndex        =   221
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command7 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":3843
               Style           =   1  'Graphical
               TabIndex        =   220
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command7 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":38CD
               Style           =   1  'Graphical
               TabIndex        =   219
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command7 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":3957
               Style           =   1  'Graphical
               TabIndex        =   218
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command7 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":39E1
               Style           =   1  'Graphical
               TabIndex        =   217
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command8 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":3A6B
               Style           =   1  'Graphical
               TabIndex        =   216
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command8 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":3AF5
               Style           =   1  'Graphical
               TabIndex        =   215
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command8 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":3B7F
               Style           =   1  'Graphical
               TabIndex        =   214
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command8 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":3C09
               Style           =   1  'Graphical
               TabIndex        =   213
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command9 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":3C93
               Style           =   1  'Graphical
               TabIndex        =   212
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command9 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":3D1D
               Style           =   1  'Graphical
               TabIndex        =   211
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command9 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":3DA7
               Style           =   1  'Graphical
               TabIndex        =   210
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command9 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":3E31
               Style           =   1  'Graphical
               TabIndex        =   209
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command10 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":3EBB
               Style           =   1  'Graphical
               TabIndex        =   208
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command10 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":3F45
               Style           =   1  'Graphical
               TabIndex        =   207
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command11 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":3FCF
               Style           =   1  'Graphical
               TabIndex        =   206
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command11 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":4059
               Style           =   1  'Graphical
               TabIndex        =   205
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command12 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":40E3
               Style           =   1  'Graphical
               TabIndex        =   204
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command13 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":416D
               Style           =   1  'Graphical
               TabIndex        =   203
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command13 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":41F7
               Style           =   1  'Graphical
               TabIndex        =   202
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command14 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":4281
               Style           =   1  'Graphical
               TabIndex        =   201
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command14 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":430B
               Style           =   1  'Graphical
               TabIndex        =   200
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command15 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":4395
               Style           =   1  'Graphical
               TabIndex        =   199
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command15 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":441F
               Style           =   1  'Graphical
               TabIndex        =   198
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command15 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":44A9
               Style           =   1  'Graphical
               TabIndex        =   197
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command15 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":4533
               Style           =   1  'Graphical
               TabIndex        =   196
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command16 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":45BD
               Style           =   1  'Graphical
               TabIndex        =   195
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command16 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":4647
               Style           =   1  'Graphical
               TabIndex        =   194
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command16 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":46D1
               Style           =   1  'Graphical
               TabIndex        =   193
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command16 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":475B
               Style           =   1  'Graphical
               TabIndex        =   192
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command17 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":47E5
               Style           =   1  'Graphical
               TabIndex        =   191
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command17 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":486F
               Style           =   1  'Graphical
               TabIndex        =   190
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command17 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":48F9
               Style           =   1  'Graphical
               TabIndex        =   189
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command17 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":4983
               Style           =   1  'Graphical
               TabIndex        =   188
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command18 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":4A0D
               Style           =   1  'Graphical
               TabIndex        =   187
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command18 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":4A97
               Style           =   1  'Graphical
               TabIndex        =   186
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command18 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":4B21
               Style           =   1  'Graphical
               TabIndex        =   185
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command18 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":4BAB
               Style           =   1  'Graphical
               TabIndex        =   184
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command19 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":4C35
               Style           =   1  'Graphical
               TabIndex        =   183
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command19 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":4CBF
               Style           =   1  'Graphical
               TabIndex        =   182
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command19 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":4D49
               Style           =   1  'Graphical
               TabIndex        =   181
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command19 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":4DD3
               Style           =   1  'Graphical
               TabIndex        =   180
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command20 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":4E5D
               Style           =   1  'Graphical
               TabIndex        =   179
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command20 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":4EE7
               Style           =   1  'Graphical
               TabIndex        =   178
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command20 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":4F71
               Style           =   1  'Graphical
               TabIndex        =   177
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command20 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":4FFB
               Style           =   1  'Graphical
               TabIndex        =   176
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command21 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":5085
               Style           =   1  'Graphical
               TabIndex        =   175
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command21 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":510F
               Style           =   1  'Graphical
               TabIndex        =   174
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command21 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":5199
               Style           =   1  'Graphical
               TabIndex        =   173
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command21 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":5223
               Style           =   1  'Graphical
               TabIndex        =   172
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command22 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":52AD
               Style           =   1  'Graphical
               TabIndex        =   171
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command22 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":5337
               Style           =   1  'Graphical
               TabIndex        =   170
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command22 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":53C1
               Style           =   1  'Graphical
               TabIndex        =   169
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command22 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":544B
               Style           =   1  'Graphical
               TabIndex        =   168
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command23 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":54D5
               Style           =   1  'Graphical
               TabIndex        =   167
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command23 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":555F
               Style           =   1  'Graphical
               TabIndex        =   166
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command23 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":55E9
               Style           =   1  'Graphical
               TabIndex        =   165
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command23 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":5673
               Style           =   1  'Graphical
               TabIndex        =   164
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command24 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":56FD
               Style           =   1  'Graphical
               TabIndex        =   163
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command24 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":5787
               Style           =   1  'Graphical
               TabIndex        =   162
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command24 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":5811
               Style           =   1  'Graphical
               TabIndex        =   161
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command24 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":589B
               Style           =   1  'Graphical
               TabIndex        =   160
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command25 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":5925
               Style           =   1  'Graphical
               TabIndex        =   159
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command25 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":59AF
               Style           =   1  'Graphical
               TabIndex        =   158
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command25 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":5A39
               Style           =   1  'Graphical
               TabIndex        =   157
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command25 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":5AC3
               Style           =   1  'Graphical
               TabIndex        =   156
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command26 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":5B4D
               Style           =   1  'Graphical
               TabIndex        =   155
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command26 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":5BD7
               Style           =   1  'Graphical
               TabIndex        =   154
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command26 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":5C61
               Style           =   1  'Graphical
               TabIndex        =   153
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command26 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":5CEB
               Style           =   1  'Graphical
               TabIndex        =   152
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command27 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":5D75
               Style           =   1  'Graphical
               TabIndex        =   151
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command27 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":5DFF
               Style           =   1  'Graphical
               TabIndex        =   150
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command27 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":5E89
               Style           =   1  'Graphical
               TabIndex        =   149
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command27 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":5F13
               Style           =   1  'Graphical
               TabIndex        =   148
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command28 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":5F9D
               Style           =   1  'Graphical
               TabIndex        =   147
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command28 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":6027
               Style           =   1  'Graphical
               TabIndex        =   146
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command28 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":60B1
               Style           =   1  'Graphical
               TabIndex        =   145
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command28 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":613B
               Style           =   1  'Graphical
               TabIndex        =   144
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command29 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":61C5
               Style           =   1  'Graphical
               TabIndex        =   143
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command29 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":624F
               Style           =   1  'Graphical
               TabIndex        =   142
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command29 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":62D9
               Style           =   1  'Graphical
               TabIndex        =   141
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command29 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":6363
               Style           =   1  'Graphical
               TabIndex        =   140
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command30 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":63ED
               Style           =   1  'Graphical
               TabIndex        =   139
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command30 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":6477
               Style           =   1  'Graphical
               TabIndex        =   138
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command31 
               Height          =   375
               Index           =   0
               Left            =   0
               Picture         =   "frmDataEntry.frx":6501
               Style           =   1  'Graphical
               TabIndex        =   137
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command31 
               Height          =   375
               Index           =   1
               Left            =   0
               Picture         =   "frmDataEntry.frx":658B
               Style           =   1  'Graphical
               TabIndex        =   136
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command31 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":6615
               Style           =   1  'Graphical
               TabIndex        =   135
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command31 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":669F
               Style           =   1  'Graphical
               TabIndex        =   134
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command1 
               Height          =   375
               Index           =   3
               Left            =   0
               Picture         =   "frmDataEntry.frx":6729
               Style           =   1  'Graphical
               TabIndex        =   133
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command1 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":67B3
               Style           =   1  'Graphical
               TabIndex        =   132
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command1 
               Height          =   375
               Index           =   2
               Left            =   0
               Picture         =   "frmDataEntry.frx":683D
               Style           =   1  'Graphical
               TabIndex        =   131
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command32 
               Height          =   375
               Index           =   0
               Left            =   120
               Picture         =   "frmDataEntry.frx":68C7
               Style           =   1  'Graphical
               TabIndex        =   130
               Top             =   240
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command32 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":6951
               Style           =   1  'Graphical
               TabIndex        =   129
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command32 
               Height          =   375
               Index           =   2
               Left            =   120
               Picture         =   "frmDataEntry.frx":69DB
               Style           =   1  'Graphical
               TabIndex        =   128
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command32 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":6A65
               Style           =   1  'Graphical
               TabIndex        =   127
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command2 
               Height          =   375
               Index           =   3
               Left            =   120
               Picture         =   "frmDataEntry.frx":6AEF
               Style           =   1  'Graphical
               TabIndex        =   126
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton Command12 
               Height          =   375
               Index           =   1
               Left            =   120
               Picture         =   "frmDataEntry.frx":6B79
               Style           =   1  'Graphical
               TabIndex        =   125
               Top             =   120
               Visible         =   0   'False
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "»"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   1
               Left            =   1440
               TabIndex        =   124
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Å"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   2
               Left            =   1920
               TabIndex        =   123
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   " "
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   3
               Left            =   2400
               TabIndex        =   122
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "À"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   4
               Left            =   2880
               TabIndex        =   121
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Ã"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   5
               Left            =   3360
               TabIndex        =   120
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "ç"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   6
               Left            =   3840
               TabIndex        =   119
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Õ"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   7
               Left            =   4320
               TabIndex        =   118
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Œ"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   8
               Left            =   4800
               TabIndex        =   117
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "œ"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   9
               Left            =   5280
               TabIndex        =   116
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "–"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   10
               Left            =   5760
               TabIndex        =   115
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "—"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   11
               Left            =   6240
               TabIndex        =   114
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "“"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   12
               Left            =   6720
               TabIndex        =   113
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "é"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   13
               Left            =   7200
               TabIndex        =   112
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "”"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   14
               Left            =   7680
               TabIndex        =   111
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "‘"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   15
               Left            =   8160
               TabIndex        =   110
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "’"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   16
               Left            =   8640
               TabIndex        =   109
               Top             =   360
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "÷"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   17
               Left            =   960
               TabIndex        =   108
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "ÿ"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   18
               Left            =   1440
               TabIndex        =   107
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Ÿ"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   19
               Left            =   1920
               TabIndex        =   106
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "⁄"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   20
               Left            =   2400
               TabIndex        =   105
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "€"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   21
               Left            =   2880
               TabIndex        =   104
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "›"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   22
               Left            =   3360
               TabIndex        =   103
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "ﬁ"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   23
               Left            =   3840
               TabIndex        =   102
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "ò"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   24
               Left            =   4320
               TabIndex        =   101
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "ê"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   25
               Left            =   4800
               TabIndex        =   100
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "·"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   26
               Left            =   5280
               TabIndex        =   99
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "„"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   27
               Left            =   5760
               TabIndex        =   98
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "‰"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   28
               Left            =   6240
               TabIndex        =   97
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Ê"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   29
               Left            =   6720
               TabIndex        =   96
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Â"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   30
               Left            =   7200
               TabIndex        =   95
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "Ì"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   31
               Left            =   7680
               TabIndex        =   94
               Top             =   720
               Width           =   495
            End
            Begin VB.CommandButton key 
               Caption         =   "«"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   14.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Index           =   0
               Left            =   960
               TabIndex        =   93
               Top             =   360
               Width           =   495
            End
            Begin VB.TextBox txtMessege 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   8.25
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   960
               TabIndex        =   241
               Top             =   3000
               Width           =   6375
            End
            Begin VB.CommandButton Command33 
               Caption         =   "A"
               Height          =   375
               Index           =   0
               Left            =   960
               TabIndex        =   248
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "B"
               Height          =   375
               Index           =   1
               Left            =   1440
               TabIndex        =   249
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "C"
               Height          =   375
               Index           =   2
               Left            =   1920
               TabIndex        =   250
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "D"
               Height          =   375
               Index           =   3
               Left            =   2400
               TabIndex        =   251
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "E"
               Height          =   375
               Index           =   4
               Left            =   2880
               TabIndex        =   252
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "F"
               Height          =   375
               Index           =   5
               Left            =   3360
               TabIndex        =   253
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "G"
               Height          =   375
               Index           =   6
               Left            =   3840
               TabIndex        =   254
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "H"
               Height          =   375
               Index           =   7
               Left            =   4320
               TabIndex        =   255
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "I"
               Height          =   375
               Index           =   8
               Left            =   4800
               TabIndex        =   256
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "J"
               Height          =   375
               Index           =   9
               Left            =   5280
               TabIndex        =   257
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "K"
               Height          =   375
               Index           =   10
               Left            =   5760
               TabIndex        =   258
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "L"
               Height          =   375
               Index           =   11
               Left            =   6240
               TabIndex        =   259
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "M"
               Height          =   375
               Index           =   12
               Left            =   6720
               TabIndex        =   260
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "N"
               Height          =   375
               Index           =   13
               Left            =   7200
               TabIndex        =   261
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "O"
               Height          =   375
               Index           =   14
               Left            =   7680
               TabIndex        =   262
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "P"
               Height          =   375
               Index           =   15
               Left            =   8160
               TabIndex        =   263
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "Q"
               Height          =   375
               Index           =   16
               Left            =   8640
               TabIndex        =   264
               Top             =   1200
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "R"
               Height          =   375
               Index           =   17
               Left            =   960
               TabIndex        =   265
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "S"
               Height          =   375
               Index           =   18
               Left            =   1440
               TabIndex        =   266
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "T"
               Height          =   375
               Index           =   19
               Left            =   1920
               TabIndex        =   267
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "U"
               Height          =   375
               Index           =   20
               Left            =   2400
               TabIndex        =   268
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "V"
               Height          =   375
               Index           =   21
               Left            =   2880
               TabIndex        =   269
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "W"
               Height          =   375
               Index           =   22
               Left            =   3360
               TabIndex        =   270
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "X"
               Height          =   375
               Index           =   23
               Left            =   3840
               TabIndex        =   271
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "Y"
               Height          =   375
               Index           =   24
               Left            =   4320
               TabIndex        =   272
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command33 
               Caption         =   "Z"
               Height          =   375
               Index           =   25
               Left            =   4800
               TabIndex        =   273
               Top             =   1560
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "1"
               Height          =   375
               Index           =   0
               Left            =   960
               TabIndex        =   274
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "2"
               Height          =   375
               Index           =   1
               Left            =   1440
               TabIndex        =   275
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "3"
               Height          =   375
               Index           =   2
               Left            =   1920
               TabIndex        =   276
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "4"
               Height          =   375
               Index           =   3
               Left            =   2400
               TabIndex        =   277
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "5"
               Height          =   375
               Index           =   4
               Left            =   2880
               TabIndex        =   278
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "6"
               Height          =   375
               Index           =   5
               Left            =   3360
               TabIndex        =   279
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "7"
               Height          =   375
               Index           =   6
               Left            =   3840
               TabIndex        =   280
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "8"
               Height          =   375
               Index           =   7
               Left            =   4320
               TabIndex        =   281
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "9"
               Height          =   375
               Index           =   8
               Left            =   4800
               TabIndex        =   282
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command34 
               Caption         =   "0"
               Height          =   375
               Index           =   9
               Left            =   5280
               TabIndex        =   283
               Top             =   2040
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "("
               Height          =   375
               Index           =   0
               Left            =   960
               TabIndex        =   284
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   ")"
               Height          =   375
               Index           =   1
               Left            =   1440
               TabIndex        =   285
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   """"
               Height          =   375
               Index           =   2
               Left            =   1920
               TabIndex        =   286
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "*"
               Height          =   375
               Index           =   3
               Left            =   2400
               TabIndex        =   287
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "#"
               Height          =   375
               Index           =   4
               Left            =   2880
               TabIndex        =   288
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "@"
               Height          =   375
               Index           =   5
               Left            =   3360
               TabIndex        =   289
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "="
               Height          =   375
               Index           =   6
               Left            =   3840
               TabIndex        =   290
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "-"
               Height          =   375
               Index           =   7
               Left            =   4320
               TabIndex        =   291
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "+"
               Height          =   375
               Index           =   8
               Left            =   4800
               TabIndex        =   292
               Top             =   2520
               Width           =   495
            End
            Begin VB.CommandButton Command35 
               Caption         =   "/"
               Height          =   375
               Index           =   9
               Left            =   5280
               TabIndex        =   293
               Top             =   2520
               Width           =   495
            End
         End
         Begin VB.Frame Frame3 
            Height          =   915
            Left            =   -73320
            TabIndex        =   84
            Top             =   7320
            Width           =   8355
            Begin VB.TextBox txtDayMonth 
               Height          =   495
               Left            =   5580
               TabIndex        =   88
               Top             =   240
               Width           =   795
            End
            Begin VB.TextBox txtDayDay 
               Height          =   495
               Left            =   3780
               TabIndex        =   87
               Top             =   240
               Width           =   795
            End
            Begin VB.TextBox txtDayType 
               Height          =   495
               Left            =   1620
               TabIndex        =   86
               Top             =   240
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel24 
               Height          =   375
               Index           =   0
               Left            =   6480
               OleObjectBlob   =   "frmDataEntry.frx":6C03
               TabIndex        =   85
               Top             =   300
               Width           =   315
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel24 
               Height          =   375
               Index           =   1
               Left            =   4740
               OleObjectBlob   =   "frmDataEntry.frx":6C60
               TabIndex        =   89
               Top             =   300
               Width           =   435
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel24 
               Height          =   375
               Index           =   2
               Left            =   2820
               OleObjectBlob   =   "frmDataEntry.frx":6CBD
               TabIndex        =   90
               Top             =   300
               Width           =   555
            End
         End
         Begin VB.Frame fraRegisterInPhone 
            Caption         =   "  „Õ· À»   "
            Height          =   3015
            Left            =   -72750
            RightToLeft     =   -1  'True
            TabIndex        =   61
            Top             =   4440
            Width           =   8295
            Begin VB.ComboBox cboSavePhoneGroup 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   360
               ItemData        =   "frmDataEntry.frx":6D22
               Left            =   960
               List            =   "frmDataEntry.frx":6D59
               RightToLeft     =   -1  'True
               TabIndex        =   360
               Top             =   1560
               Width           =   3705
            End
            Begin VB.OptionButton optUpdateType 
               Caption         =   "ê—ÊÂ  ·›‰"
               Height          =   255
               Index           =   4
               Left            =   5400
               RightToLeft     =   -1  'True
               TabIndex        =   359
               Top             =   1560
               Width           =   1815
            End
            Begin VB.OptionButton optUpdateType 
               Caption         =   "œ” ê«Â Œ«’"
               Height          =   255
               Index           =   0
               Left            =   5400
               RightToLeft     =   -1  'True
               TabIndex        =   69
               Top             =   300
               Value           =   -1  'True
               Width           =   1815
            End
            Begin VB.OptionButton optUpdateType 
               Caption         =   "»«“Â «Ì «“  ·›‰Â«"
               Height          =   255
               Index           =   1
               Left            =   5400
               RightToLeft     =   -1  'True
               TabIndex        =   68
               Top             =   720
               Width           =   1815
            End
            Begin VB.OptionButton optUpdateType 
               Caption         =   "„Ã„Ê⁄Â «Ì «“  ·›‰Â«"
               Height          =   255
               Index           =   2
               Left            =   5400
               RightToLeft     =   -1  'True
               TabIndex        =   67
               Top             =   1140
               Width           =   1815
            End
            Begin VB.TextBox txtPhoneStationFrom 
               Alignment       =   1  'Right Justify
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   2760
               RightToLeft     =   -1  'True
               TabIndex        =   66
               Top             =   720
               Width           =   1335
            End
            Begin VB.TextBox txtPhoneStationSet 
               Alignment       =   1  'Right Justify
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   960
               RightToLeft     =   -1  'True
               TabIndex        =   65
               ToolTipText     =   "‘„«—Â  ·›‰Â« —« »« "","" «“ Â„œÌê— Ãœ« ò‰Ìœ"
               Top             =   1140
               Width           =   3135
            End
            Begin VB.TextBox txtPhoneStationTo 
               Alignment       =   1  'Right Justify
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   960
               RightToLeft     =   -1  'True
               TabIndex        =   64
               Top             =   720
               Width           =   1335
            End
            Begin VB.OptionButton optUpdateType 
               Caption         =   " „«„Ì  ·›‰Â«"
               Height          =   255
               Index           =   3
               Left            =   5400
               RightToLeft     =   -1  'True
               TabIndex        =   63
               Top             =   1920
               Width           =   1815
            End
            Begin VB.CommandButton cmdRegisterInFile 
               Caption         =   "À»  œ— œ” ê«ÂÂ«Ì  ·›‰ "
               Height          =   495
               Left            =   3240
               RightToLeft     =   -1  'True
               TabIndex        =   62
               Top             =   2400
               Width           =   1935
            End
            Begin MSDataListLib.DataCombo dtcPhoneStation 
               Bindings        =   "frmDataEntry.frx":6DCC
               Height          =   360
               Left            =   960
               TabIndex        =   70
               Top             =   300
               Width           =   3135
               _ExtentX        =   5530
               _ExtentY        =   635
               _Version        =   393216
               ListField       =   "PayphoneXD"
               BoundColumn     =   "ID"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdPhoneStation"
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
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   14
               Left            =   4200
               OleObjectBlob   =   "frmDataEntry.frx":6DDD
               TabIndex        =   71
               Top             =   300
               Width           =   1095
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   15
               Left            =   4320
               OleObjectBlob   =   "frmDataEntry.frx":6E4A
               TabIndex        =   72
               Top             =   720
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   16
               Left            =   1800
               OleObjectBlob   =   "frmDataEntry.frx":6EB5
               TabIndex        =   73
               Top             =   720
               Width           =   795
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   17
               Left            =   4080
               OleObjectBlob   =   "frmDataEntry.frx":6F10
               TabIndex        =   74
               Top             =   1140
               Width           =   1035
            End
         End
         Begin VB.Frame fraUpdateInfo 
            Height          =   2490
            Left            =   -72750
            TabIndex        =   50
            Top             =   1440
            Width           =   8295
            Begin VB.CheckBox chkSynchronize 
               Caption         =   "Â„“„«‰Ì"
               Height          =   240
               Left            =   5760
               TabIndex        =   297
               Top             =   1920
               Width           =   1215
            End
            Begin VB.CheckBox chkProgramUpdate 
               Caption         =   "«— ﬁ« ‰—„ «›“«—  ·›‰ "
               Height          =   240
               Left            =   1200
               TabIndex        =   296
               Top             =   1920
               Width           =   1695
            End
            Begin VB.CheckBox chkDayTypeUpdate 
               Caption         =   "‰Ê⁄ —Ê“Â«Ì ”«· "
               Height          =   240
               Left            =   5760
               TabIndex        =   91
               Top             =   1560
               Width           =   1485
            End
            Begin VB.CheckBox chkBlackListUpdate 
               Caption         =   "·Ì”  ”Ì«Â"
               Height          =   240
               Left            =   5760
               TabIndex        =   60
               Top             =   585
               Width           =   1230
            End
            Begin VB.CheckBox chkSamUpdate 
               Caption         =   " SAM  ‰ŸÌ„«  "
               Height          =   240
               Left            =   5760
               TabIndex        =   59
               Top             =   900
               Width           =   1320
            End
            Begin VB.CheckBox chkChargeSchedullerUpdate 
               Caption         =   "“„«‰»‰œÌ  ⁄—›Â Â«"
               Height          =   240
               Left            =   1200
               TabIndex        =   58
               Top             =   1200
               Width           =   1545
            End
            Begin VB.CheckBox chkChargingUpdate 
               Caption         =   "ÃœÊ·  ⁄—›Â Â«"
               Height          =   240
               Left            =   1200
               TabIndex        =   57
               Top             =   1560
               Width           =   1455
            End
            Begin VB.CheckBox chkPmsNumUpdate 
               Caption         =   "PMS‘„«—Â Â«Ì "
               Height          =   240
               Left            =   1215
               TabIndex        =   56
               Top             =   585
               Width           =   1500
            End
            Begin VB.CheckBox chkFreeNumUpdate 
               Caption         =   "‘„«—Â Â«Ì —«Ìê«‰"
               Height          =   240
               Left            =   1215
               TabIndex        =   55
               Top             =   900
               Width           =   1635
            End
            Begin VB.CheckBox chkWhiteListUpdate 
               Caption         =   "·Ì”  ”›Ìœ"
               Height          =   240
               Left            =   5760
               TabIndex        =   54
               Top             =   270
               Width           =   1230
            End
            Begin VB.CheckBox chkSettingUpdate 
               Caption         =   " ‰ŸÌ„«   ·›‰   "
               Height          =   240
               Left            =   5760
               TabIndex        =   53
               Top             =   1200
               Width           =   1365
            End
            Begin VB.CheckBox chkMessageUpdate 
               Caption         =   "¬êÂÌ Â«"
               Height          =   240
               Left            =   1215
               TabIndex        =   52
               Top             =   270
               Width           =   1005
            End
            Begin VB.CommandButton cmdSaveInDb 
               Caption         =   "À»  œ— »«‰ò «ÿ·«⁄« Ì"
               Height          =   420
               Left            =   3105
               TabIndex        =   51
               Top             =   1920
               Width           =   2040
            End
         End
         Begin VB.Frame fraMessage 
            Height          =   855
            Left            =   -74280
            TabIndex        =   45
            Top             =   3360
            Width           =   10425
            Begin VB.TextBox txtDescription 
               Height          =   375
               Left            =   360
               MaxLength       =   50
               MultiLine       =   -1  'True
               TabIndex        =   46
               Top             =   240
               Width           =   4935
            End
            Begin MSMask.MaskEdBox mtxtMessageSerial 
               Height          =   315
               Left            =   7800
               TabIndex        =   47
               Top             =   240
               Width           =   1155
               _ExtentX        =   2037
               _ExtentY        =   556
               _Version        =   393216
               MaxLength       =   4
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "####"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   3
               Left            =   9120
               OleObjectBlob   =   "frmDataEntry.frx":6F79
               TabIndex        =   48
               Top             =   240
               Width           =   1035
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   4
               Left            =   5400
               OleObjectBlob   =   "frmDataEntry.frx":6FE6
               TabIndex        =   49
               Top             =   240
               Width           =   1155
            End
         End
         Begin VB.Frame fraChrging 
            Height          =   3450
            Left            =   -74640
            TabIndex        =   44
            Top             =   4560
            Width           =   11025
            Begin MSMask.MaskEdBox mtxtPreNoFrom 
               Height          =   315
               Left            =   6360
               TabIndex        =   411
               Top             =   735
               Width           =   1155
               _ExtentX        =   2037
               _ExtentY        =   556
               _Version        =   393216
               MaxLength       =   6
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "######"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   0
               Left            =   7680
               OleObjectBlob   =   "frmDataEntry.frx":704B
               TabIndex        =   414
               Top             =   705
               Width           =   1455
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   2
               Left            =   2640
               OleObjectBlob   =   "frmDataEntry.frx":70C0
               TabIndex        =   415
               Top             =   705
               Width           =   915
            End
            Begin MSMask.MaskEdBox mtxtChargeLevel 
               Height          =   315
               Left            =   1440
               TabIndex        =   413
               Top             =   735
               Width           =   1155
               _ExtentX        =   2037
               _ExtentY        =   556
               _Version        =   393216
               MaxLength       =   2
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "##"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   1
               Left            =   5400
               OleObjectBlob   =   "frmDataEntry.frx":7131
               TabIndex        =   416
               Top             =   705
               Width           =   195
            End
            Begin MSMask.MaskEdBox mtxtPreNoTo 
               Height          =   315
               Left            =   4200
               TabIndex        =   412
               Top             =   735
               Width           =   1155
               _ExtentX        =   2037
               _ExtentY        =   556
               _Version        =   393216
               MaxLength       =   6
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "######"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   225
               Index           =   17
               Left            =   8520
               OleObjectBlob   =   "frmDataEntry.frx":7190
               TabIndex        =   448
               Top             =   1560
               Width           =   1215
            End
            Begin MSDataListLib.DataCombo dtcCharggingArea 
               Bindings        =   "frmDataEntry.frx":7201
               Height          =   360
               Left            =   6360
               TabIndex        =   449
               Top             =   1560
               Width           =   2055
               _ExtentX        =   3625
               _ExtentY        =   635
               _Version        =   393216
               ListField       =   "AreaName"
               BoundColumn     =   "AreaNumber"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdCharggingArea"
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
         Begin VB.Frame fraPmsNum 
            Height          =   1095
            Left            =   -71880
            TabIndex        =   42
            Top             =   5280
            Width           =   6255
            Begin VB.TextBox mtxtPMSTelNo 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   1680
               TabIndex        =   298
               Top             =   360
               Width           =   2295
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   8
               Left            =   4080
               OleObjectBlob   =   "frmDataEntry.frx":7213
               TabIndex        =   43
               Top             =   420
               Width           =   915
            End
         End
         Begin VB.Frame fraFreeNum 
            Height          =   915
            Left            =   -72180
            TabIndex        =   39
            Top             =   6000
            Width           =   6255
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   5
               Left            =   3975
               OleObjectBlob   =   "frmDataEntry.frx":7280
               TabIndex        =   40
               Top             =   375
               Width           =   915
            End
            Begin MSMask.MaskEdBox mtxtFreeTelNo 
               Height          =   375
               Left            =   1575
               TabIndex        =   41
               Top             =   315
               Width           =   2295
               _ExtentX        =   4048
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "##########"
               PromptChar      =   "_"
            End
         End
         Begin VB.Frame fraWhiteList 
            Height          =   4365
            Left            =   -72578
            TabIndex        =   27
            Top             =   3840
            Width           =   7950
            Begin VB.TextBox txtwf4 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   33
               Top             =   2400
               Width           =   1095
            End
            Begin VB.TextBox txtwf3 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   32
               Top             =   1920
               Width           =   1095
            End
            Begin VB.TextBox txtwf7 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   36
               Top             =   3840
               Width           =   1095
            End
            Begin VB.TextBox txtwf6 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   35
               Top             =   3360
               Width           =   1095
            End
            Begin VB.TextBox txtwf5 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   34
               Top             =   2880
               Width           =   1095
            End
            Begin VB.TextBox txtwf2 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   31
               Top             =   1440
               Width           =   1095
            End
            Begin VB.TextBox txtwf1 
               BeginProperty DataFormat 
                  Type            =   0
                  Format          =   "0"
                  HaveTrueFalseNull=   0
                  FirstDayOfWeek  =   0
                  FirstWeekOfYear =   0
                  LCID            =   1065
                  SubFormatType   =   0
               EndProperty
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2970
               TabIndex        =   30
               Top             =   975
               Width           =   1095
            End
            Begin MSMask.MaskEdBox mtxtWCardNoFrom 
               Height          =   375
               Left            =   3810
               TabIndex        =   28
               Top             =   300
               Width           =   1935
               _ExtentX        =   3413
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "##########"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   29
               Left            =   5820
               OleObjectBlob   =   "frmDataEntry.frx":72EB
               TabIndex        =   37
               Top             =   360
               Width           =   1095
            End
            Begin MSMask.MaskEdBox mtxtWCardNoTo 
               Height          =   375
               Left            =   1170
               TabIndex        =   29
               Top             =   300
               Width           =   1935
               _ExtentX        =   3413
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "##########"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   30
               Left            =   3360
               OleObjectBlob   =   "frmDataEntry.frx":735E
               TabIndex        =   38
               Top             =   330
               Width           =   255
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel11 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":73B9
               TabIndex        =   404
               Top             =   3840
               Width           =   2340
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel12 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":7446
               TabIndex        =   405
               Top             =   3360
               Width           =   2040
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel13 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":74D1
               TabIndex        =   406
               Top             =   2880
               Width           =   3210
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel14 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":7570
               TabIndex        =   407
               Top             =   1920
               Width           =   2010
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel15 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":75F1
               TabIndex        =   408
               Top             =   2400
               Width           =   1305
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel16 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":7664
               TabIndex        =   409
               Top             =   960
               Width           =   1920
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel17 
               Height          =   240
               Left            =   4440
               OleObjectBlob   =   "frmDataEntry.frx":76E3
               TabIndex        =   410
               Top             =   1440
               Width           =   2325
            End
         End
         Begin VB.Frame fraBlackList 
            Height          =   4425
            Left            =   1920
            TabIndex        =   8
            Top             =   3960
            Width           =   8025
            Begin VB.TextBox txtbf1 
               BeginProperty DataFormat 
                  Type            =   1
                  Format          =   "0"
                  HaveTrueFalseNull=   0
                  FirstDayOfWeek  =   0
                  FirstWeekOfYear =   0
                  LCID            =   1065
                  SubFormatType   =   1
               EndProperty
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   17
               Top             =   1035
               Width           =   1095
            End
            Begin VB.TextBox txtbf2 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   18
               Top             =   1515
               Width           =   1095
            End
            Begin VB.TextBox txtbf5 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   21
               Top             =   2955
               Width           =   1095
            End
            Begin VB.TextBox txtbf6 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   22
               Top             =   3435
               Width           =   1095
            End
            Begin VB.TextBox txtbf7 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   23
               Top             =   3915
               Width           =   1095
            End
            Begin VB.TextBox txtbf3 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   19
               Top             =   1995
               Width           =   1095
            End
            Begin VB.TextBox txtbf4 
               BeginProperty Font 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   330
               Left            =   2760
               TabIndex        =   20
               Top             =   2475
               Width           =   1095
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel10 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":7772
               TabIndex        =   9
               Top             =   3960
               Width           =   2340
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel9 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":77FF
               TabIndex        =   10
               Top             =   3480
               Width           =   2040
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel8 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":788A
               TabIndex        =   11
               Top             =   3000
               Width           =   3210
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel7 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":7929
               TabIndex        =   12
               Top             =   2040
               Width           =   2010
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel5 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":79AA
               TabIndex        =   13
               Top             =   2520
               Width           =   1305
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel4 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":7A1D
               TabIndex        =   14
               Top             =   1080
               Width           =   1920
            End
            Begin MSMask.MaskEdBox mtxtCardNoFrom 
               Height          =   375
               Left            =   3480
               TabIndex        =   15
               Top             =   420
               Width           =   1935
               _ExtentX        =   3413
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "##########"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   6
               Left            =   5640
               OleObjectBlob   =   "frmDataEntry.frx":7A9C
               TabIndex        =   24
               Top             =   480
               Width           =   1530
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   375
               Index           =   7
               Left            =   3120
               OleObjectBlob   =   "frmDataEntry.frx":7B1B
               TabIndex        =   25
               Top             =   480
               Width           =   165
            End
            Begin MSMask.MaskEdBox mtxtCardNoTo 
               Height          =   375
               Left            =   960
               TabIndex        =   16
               Top             =   420
               Width           =   1935
               _ExtentX        =   3413
               _ExtentY        =   661
               _Version        =   393216
               MaxLength       =   10
               BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
                  Name            =   "Tahoma"
                  Size            =   9.75
                  Charset         =   178
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Mask            =   "##########"
               PromptChar      =   "_"
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel6 
               Height          =   240
               Left            =   3960
               OleObjectBlob   =   "frmDataEntry.frx":7B76
               TabIndex        =   26
               Top             =   1560
               Width           =   2325
            End
         End
         Begin MSDataGridLib.DataGrid dtgMessage 
            Bindings        =   "frmDataEntry.frx":7C05
            Height          =   1905
            Left            =   -70200
            TabIndex        =   75
            Top             =   1245
            Width           =   6375
            _ExtentX        =   11245
            _ExtentY        =   3360
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            AllowDelete     =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdMessage"
            Caption         =   "ÅÌ«„Â«"
            ColumnCount     =   2
            BeginProperty Column00 
               DataField       =   "ID"
               Caption         =   "‘„«—Â ”—Ì«·"
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
               DataField       =   "Description"
               Caption         =   " Ê÷ÌÕ« "
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
                  ColumnWidth     =   1500.095
               EndProperty
               BeginProperty Column01 
                  ColumnWidth     =   4440.189
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgChargging 
            Bindings        =   "frmDataEntry.frx":7C16
            Height          =   3135
            Left            =   -74640
            TabIndex        =   76
            Top             =   1200
            Width           =   11025
            _ExtentX        =   19447
            _ExtentY        =   5530
            _Version        =   393216
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdChargging"
            Caption         =   " ⁄—›Â Â«"
            ColumnCount     =   5
            BeginProperty Column00 
               DataField       =   "PreNoFrom"
               Caption         =   "«“ ÅÌ‘ ‘„«—Â"
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
               DataField       =   "PreNoTo"
               Caption         =   " « ÅÌ‘ ‘„«—Â"
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
               DataField       =   "ChargeLevel"
               Caption         =   "ChargeLevel"
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
               DataField       =   "index"
               Caption         =   "—œÌ›"
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
            BeginProperty Column04 
               DataField       =   "CharggingArea"
               Caption         =   "„‰ÿﬁÂ ‘«—éÌ‰ê"
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
                  ColumnWidth     =   1800
               EndProperty
               BeginProperty Column01 
                  ColumnWidth     =   1800
               EndProperty
               BeginProperty Column02 
                  ColumnWidth     =   1214.929
               EndProperty
               BeginProperty Column03 
                  ColumnWidth     =   1005.165
               EndProperty
               BeginProperty Column04 
                  ColumnWidth     =   1470.047
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgFreeTel 
            Bindings        =   "frmDataEntry.frx":7C27
            Height          =   4005
            Left            =   -72180
            TabIndex        =   77
            Top             =   1560
            Width           =   6255
            _ExtentX        =   11033
            _ExtentY        =   7064
            _Version        =   393216
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdFreeTelNo"
            Caption         =   " ·›‰Â«Ì —«Ìê«‰"
            ColumnCount     =   1
            BeginProperty Column00 
               DataField       =   "ID"
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
            SplitCount      =   1
            BeginProperty Split0 
               BeginProperty Column00 
                  ColumnWidth     =   5685.166
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgBlackList 
            Bindings        =   "frmDataEntry.frx":7C38
            Height          =   2535
            Left            =   1920
            TabIndex        =   78
            Top             =   1200
            Width           =   8025
            _ExtentX        =   14155
            _ExtentY        =   4471
            _Version        =   393216
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdBlackList"
            Caption         =   "·Ì”  ”Ì«Â ò«— Â«"
            ColumnCount     =   10
            BeginProperty Column00 
               DataField       =   "FromNo"
               Caption         =   "«“ ‘„«—Â"
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
               DataField       =   "ToNo"
               Caption         =   " « ‘„«—Â"
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
               DataField       =   "index"
               Caption         =   "index"
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
               DataField       =   "f1"
               Caption         =   "f1"
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
            BeginProperty Column04 
               DataField       =   "f2"
               Caption         =   "f2"
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
            BeginProperty Column05 
               DataField       =   "f3"
               Caption         =   "f3"
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
            BeginProperty Column06 
               DataField       =   "f4"
               Caption         =   "f4"
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
            BeginProperty Column07 
               DataField       =   "f5"
               Caption         =   "f5"
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
            BeginProperty Column08 
               DataField       =   "f6"
               Caption         =   "f6"
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
            BeginProperty Column09 
               DataField       =   "f7"
               Caption         =   "f7"
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
                  ColumnWidth     =   1604.976
               EndProperty
               BeginProperty Column01 
                  ColumnWidth     =   1604.976
               EndProperty
               BeginProperty Column02 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column03 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column04 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column05 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column06 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column07 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column08 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column09 
                  ColumnWidth     =   615.118
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgPMS 
            Bindings        =   "frmDataEntry.frx":7C49
            Height          =   3585
            Left            =   -71880
            TabIndex        =   79
            Top             =   1320
            Width           =   6255
            _ExtentX        =   11033
            _ExtentY        =   6324
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdPMSTelNo"
            Caption         =   "‘„«—Â  ·›‰Â«Ì PMS"
            ColumnCount     =   1
            BeginProperty Column00 
               DataField       =   "ID"
               Caption         =   "‘„«—Â  ·›‰ PMS"
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
                  ColumnWidth     =   5699.906
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgWhiteList 
            Bindings        =   "frmDataEntry.frx":7C5A
            Height          =   2295
            Left            =   -72578
            TabIndex        =   80
            Top             =   1440
            Width           =   7935
            _ExtentX        =   13996
            _ExtentY        =   4048
            _Version        =   393216
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdWhiteList"
            Caption         =   "·Ì”  ”›Ìœ ò«— Â«"
            ColumnCount     =   10
            BeginProperty Column00 
               DataField       =   "FromNo"
               Caption         =   "«“ ‘„«—Â"
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
               DataField       =   "ToNo"
               Caption         =   " « ‘„«—Â"
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
               DataField       =   "index"
               Caption         =   "index"
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
               DataField       =   "f1"
               Caption         =   "f1"
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
            BeginProperty Column04 
               DataField       =   "f2"
               Caption         =   "f2"
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
            BeginProperty Column05 
               DataField       =   "f3"
               Caption         =   "f3"
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
            BeginProperty Column06 
               DataField       =   "f4"
               Caption         =   "f4"
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
            BeginProperty Column07 
               DataField       =   "f5"
               Caption         =   "f5"
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
            BeginProperty Column08 
               DataField       =   "f6"
               Caption         =   "f6"
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
            BeginProperty Column09 
               DataField       =   "f7"
               Caption         =   "f7"
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
                  ColumnWidth     =   1604.976
               EndProperty
               BeginProperty Column01 
                  ColumnWidth     =   1604.976
               EndProperty
               BeginProperty Column02 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column03 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column04 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column05 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column06 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column07 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column08 
                  ColumnWidth     =   615.118
               EndProperty
               BeginProperty Column09 
                  ColumnWidth     =   615.118
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgSamSetting 
            Bindings        =   "frmDataEntry.frx":7C6B
            Height          =   2235
            Left            =   -72630
            TabIndex        =   81
            Top             =   2445
            Width           =   8055
            _ExtentX        =   14208
            _ExtentY        =   3942
            _Version        =   393216
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdSamSetting"
            Caption         =   " ‰ŸÌ„«  SAM"
            ColumnCount     =   4
            BeginProperty Column00 
               DataField       =   "ID"
               Caption         =   "ID"
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
               DataField       =   "Name"
               Caption         =   "Name"
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
               DataField       =   "User"
               Caption         =   "User"
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
               DataField       =   "SamType"
               Caption         =   "SamType"
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
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column01 
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column02 
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column03 
                  ColumnWidth     =   870.236
               EndProperty
            EndProperty
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   285
            Left            =   -71175
            OleObjectBlob   =   "frmDataEntry.frx":7C7C
            TabIndex        =   82
            Top             =   3915
            Width           =   1320
         End
         Begin MSDataGridLib.DataGrid DataGrid1 
            Bindings        =   "frmDataEntry.frx":7CF6
            Height          =   5955
            Left            =   -72765
            TabIndex        =   83
            Top             =   1320
            Width           =   8325
            _ExtentX        =   14684
            _ExtentY        =   10504
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   22
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   12
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdDayType"
            ColumnCount     =   4
            BeginProperty Column00 
               DataField       =   "DayIndex"
               Caption         =   "‘„«—Â —Ê“"
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
               DataField       =   "DayMonth"
               Caption         =   "„«Â"
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
               DataField       =   "DayDay"
               Caption         =   "—Ê“"
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
               DataField       =   "DayType"
               Caption         =   "‰Ê⁄ —Ê“"
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
                  ColumnWidth     =   1005.165
               EndProperty
               BeginProperty Column01 
                  Locked          =   -1  'True
                  ColumnWidth     =   794.835
               EndProperty
               BeginProperty Column02 
                  Locked          =   -1  'True
                  ColumnWidth     =   794.835
               EndProperty
               BeginProperty Column03 
                  ColumnWidth     =   794.835
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgChargeLevel 
            Bindings        =   "frmDataEntry.frx":7D07
            Height          =   2835
            Left            =   -74520
            TabIndex        =   417
            Top             =   1200
            Width           =   11325
            _ExtentX        =   19976
            _ExtentY        =   5001
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   22
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   12
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdChargeLevel"
            ColumnCount     =   20
            BeginProperty Column00 
               DataField       =   "TimeSlotHiZ1"
               Caption         =   "TimeSlotHiZ1"
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
               DataField       =   "TimeSlotLoZ1"
               Caption         =   "TimeSlotLoZ1"
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
               DataField       =   "PulseCoefZ1"
               Caption         =   "PulseCoefZ1"
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
               DataField       =   "TimeSlotHiZ2"
               Caption         =   "TimeSlotHiZ2"
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
            BeginProperty Column04 
               DataField       =   "TimeSlotloZ2"
               Caption         =   "TimeSlotloZ2"
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
            BeginProperty Column05 
               DataField       =   "PulseCoefZ2"
               Caption         =   "PulseCoefZ2"
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
            BeginProperty Column06 
               DataField       =   "TimeSlotHiZ3"
               Caption         =   "TimeSlotHiZ3"
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
            BeginProperty Column07 
               DataField       =   "TimeSlotLoZ3"
               Caption         =   "TimeSlotLoZ3"
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
            BeginProperty Column08 
               DataField       =   "PulseCoefZ3"
               Caption         =   "PulseCoefZ3"
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
            BeginProperty Column09 
               DataField       =   "TimeSlotHiZ4"
               Caption         =   "TimeSlotHiZ4"
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
            BeginProperty Column10 
               DataField       =   "TimeSlotLoZ4"
               Caption         =   "TimeSlotLoZ4"
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
            BeginProperty Column11 
               DataField       =   "PulseCoefZ4"
               Caption         =   "PulseCoefZ4"
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
            BeginProperty Column12 
               DataField       =   "TimeSlotHiZ5"
               Caption         =   "TimeSlotHiZ5"
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
            BeginProperty Column13 
               DataField       =   "TimeSlotLoZ5"
               Caption         =   "TimeSlotLoZ5"
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
            BeginProperty Column14 
               DataField       =   "PulseCoefZ5"
               Caption         =   "PulseCoefZ5"
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
            BeginProperty Column15 
               DataField       =   "TimeSlotHiZ6"
               Caption         =   "TimeSlotHiZ6"
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
            BeginProperty Column16 
               DataField       =   "TimeSlotLoZ6"
               Caption         =   "TimeSlotLoZ6"
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
            BeginProperty Column17 
               DataField       =   "PulseCoefZ6"
               Caption         =   "PulseCoefZ6"
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
            BeginProperty Column18 
               DataField       =   "index"
               Caption         =   "—œÌ›"
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
            BeginProperty Column19 
               DataField       =   "ChargeLevel"
               Caption         =   "—œÂ ‘«—éÌ‰ê"
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
                  Object.Visible         =   0   'False
                  ColumnWidth     =   929.764
               EndProperty
               BeginProperty Column01 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   959.811
               EndProperty
               BeginProperty Column02 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column03 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   929.764
               EndProperty
               BeginProperty Column04 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column05 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column06 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   929.764
               EndProperty
               BeginProperty Column07 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   959.811
               EndProperty
               BeginProperty Column08 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column09 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   929.764
               EndProperty
               BeginProperty Column10 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   959.811
               EndProperty
               BeginProperty Column11 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column12 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   929.764
               EndProperty
               BeginProperty Column13 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   959.811
               EndProperty
               BeginProperty Column14 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column15 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   929.764
               EndProperty
               BeginProperty Column16 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   959.811
               EndProperty
               BeginProperty Column17 
                  ColumnAllowSizing=   0   'False
                  Object.Visible         =   0   'False
                  ColumnWidth     =   915.024
               EndProperty
               BeginProperty Column18 
                  ColumnWidth     =   1200.189
               EndProperty
               BeginProperty Column19 
                  ColumnWidth     =   1995.024
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgCharggingScheduller 
            Bindings        =   "frmDataEntry.frx":7D18
            Height          =   2835
            Left            =   -74640
            TabIndex        =   465
            Top             =   1320
            Width           =   11325
            _ExtentX        =   19976
            _ExtentY        =   5001
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   19
            FormatLocked    =   -1  'True
            RightToLeft     =   -1  'True
            BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdCharggingScheduller"
            ColumnCount     =   18
            BeginProperty Column00 
               DataField       =   "DayType"
               Caption         =   "‰Ê⁄ —Ê“ "
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
               DataField       =   "ToHour1"
               Caption         =   "ToHour1"
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
               DataField       =   "ToMinute1"
               Caption         =   "ToMinute1"
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
               DataField       =   "SelectedZone1"
               Caption         =   "SelectedZone1"
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
            BeginProperty Column04 
               DataField       =   "ToHour2"
               Caption         =   "ToHour2"
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
            BeginProperty Column05 
               DataField       =   "ToMinute2"
               Caption         =   "ToMinute2"
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
            BeginProperty Column06 
               DataField       =   "SelectedZone2"
               Caption         =   "SelectedZone2"
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
            BeginProperty Column07 
               DataField       =   "ToHour3"
               Caption         =   "ToHour3"
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
            BeginProperty Column08 
               DataField       =   "ToMinute3"
               Caption         =   "ToMinute3"
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
            BeginProperty Column09 
               DataField       =   "SelectedZone3"
               Caption         =   "SelectedZone3"
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
            BeginProperty Column10 
               DataField       =   "ToHour4"
               Caption         =   "ToHour4"
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
            BeginProperty Column11 
               DataField       =   "ToMinute4"
               Caption         =   "ToMinute4"
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
            BeginProperty Column12 
               DataField       =   "SelectedZone4"
               Caption         =   "SelectedZone4"
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
            BeginProperty Column13 
               DataField       =   "ToHour5"
               Caption         =   "ToHour5"
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
            BeginProperty Column14 
               DataField       =   "ToMinute5"
               Caption         =   "ToMinute5"
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
            BeginProperty Column15 
               DataField       =   "SelectedZone5"
               Caption         =   "SelectedZone5"
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
            BeginProperty Column16 
               DataField       =   "SelectedZone6"
               Caption         =   "SelectedZone6"
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
            BeginProperty Column17 
               DataField       =   "Comment"
               Caption         =   " Ê÷ÌÕ« "
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
                  ColumnWidth     =   1140.095
               EndProperty
               BeginProperty Column01 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   629.858
               EndProperty
               BeginProperty Column02 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   764.787
               EndProperty
               BeginProperty Column03 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1080
               EndProperty
               BeginProperty Column04 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   629.858
               EndProperty
               BeginProperty Column05 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   764.787
               EndProperty
               BeginProperty Column06 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1080
               EndProperty
               BeginProperty Column07 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   629.858
               EndProperty
               BeginProperty Column08 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   764.787
               EndProperty
               BeginProperty Column09 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1080
               EndProperty
               BeginProperty Column10 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   629.858
               EndProperty
               BeginProperty Column11 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   764.787
               EndProperty
               BeginProperty Column12 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1080
               EndProperty
               BeginProperty Column13 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   629.858
               EndProperty
               BeginProperty Column14 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   764.787
               EndProperty
               BeginProperty Column15 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1080
               EndProperty
               BeginProperty Column16 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1080
               EndProperty
               BeginProperty Column17 
                  Object.Visible         =   -1  'True
                  ColumnWidth     =   7994.835
               EndProperty
            EndProperty
         End
      End
      Begin VB.CommandButton cmdEdit 
         Caption         =   "ÊÌ—«Ì‘"
         Height          =   495
         Left            =   7920
         RightToLeft     =   -1  'True
         TabIndex        =   5
         Top             =   9000
         Width           =   1635
      End
      Begin VB.CommandButton cmdOK 
         Caption         =   " «ÌÌœ"
         Height          =   495
         Left            =   2520
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Top             =   9000
         Width           =   1635
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "ÃœÌœ"
         Height          =   495
         Left            =   4320
         RightToLeft     =   -1  'True
         TabIndex        =   6
         Top             =   9000
         Width           =   1635
      End
   End
End
Attribute VB_Name = "frmDataEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
Dim EditState As Boolean
Dim PrevTab As Integer
    Dim MsgMap(511) As Byte
    Dim CharCount As Integer
    Dim TotalMessegeLength As Integer
    Dim CalcMinute As Integer
    Dim CalcHour As Integer

Private Sub cmdAddToShowMessege_Click()
Dim strSql As String
                With de.rscmdShowMessege
                    strSql = "Select * From ShowMessege"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdShowMessege, strSql
                    End If
                    
                    .AddNew
                     de.rscmdShowMessege!ID = de.rscmdMessage!ID
                     de.rscmdShowMessege!length = de.rscmdMessage!length
                     
                    
                    .Update
                    
                End With
RefreshSaveMessegeControls
End Sub

Private Sub cmdDeleteFromShowMessege_Click()
            With de.rscmdShowMessege
                
                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
RefreshSaveMessegeControls
End Sub

'
'
'Private Sub chkBlackListUpdate_Click()
'SetUpdateInfo
'
'End Sub
'
'Private Sub chkChargeSchedullerUpdate_Click()
'SetUpdateInfo
'End Sub
'
'Private Sub chkChargingUpdate_Click()
'SetUpdateInfo
'End Sub
'
'Private Sub chkFreeNumUpdate_Click()
'SetUpdateInfo
'End Sub
'Private Sub chkMessageUpdate_Click()
'SetUpdateInfo
'End Sub
'
'Private Sub chkPmsNumUpdate_Click()
'SetUpdateInfo
'End Sub
'
'Private Sub chkSamUpdate_Click()
'SetUpdateInfo
'
'End Sub
'
'Private Sub chkSettingUpdate_Click()
'SetUpdateInfo
'End Sub
'
'Private Sub chkWhiteListUpdate_Click()
'SetUpdateInfo
'End Sub


Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdOKDayType_Click()
setDayType
End Sub



Private Sub cmdRefresh_Click()
RefreshMessege
End Sub

Private Sub cmdRegisterInFile_Click()
    Dim optIndex As Byte
    Dim indexCounter As Integer
    Dim strQuery As String

'On Error GoTo EH


If RegisterInPhoneAccessSW = True Then
    
frmReportWait.Show
DoEvents
    
    For optIndex = 0 To 3
        If (optUpdateType(optIndex).Value = True) Then Exit For
    Next optIndex
    
    Select Case optIndex
        Case 0:
            If (dtcPhoneStation.MatchedWithList) Then
                SendDataToFile dtcPhoneStation.BoundText, 2
                Unload frmReportWait
                MsgBox "»« „Ê›ﬁÌ  «‰Ã«„ ‘œ", vbOKOnly, "–ŒÌ—Â œ— ›«Ì·"

            Else
                Unload frmReportWait
                MsgBox "‘„«—Â  ·›‰ „Ê—œ ‰Ÿ— œ— ·Ì”  ÊÃÊœ ‰œ«—œ", vbOKOnly, "Œÿ«"
                Exit Sub
            End If
            
        Case 1:
            If (Not IsNumeric(txtPhoneStationFrom.Text) Or Not IsNumeric(txtPhoneStationTo.Text)) Then
                Unload frmReportWait
                  MsgBox "‘„«—Â  ·›‰Â«Ì Ê—ÊœÌ ‰«œ—”  «” ", vbOKOnly, "Œÿ«"
                  Exit Sub
            End If
            
            strQuery = "SELECT PhoneStation.ID AS ID " & _
                       "From PhoneStation " & _
                       "WHERE PhoneStation.PayphoneXD>=" & Val(txtPhoneStationFrom.Text) & _
                       " And PhoneStation.PayphoneXD<" & Val(txtPhoneStationTo.Text) & ";"
            
            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount < 0) Then
            rs.Close
            Set rs = Nothing
            Unload frmReportWait
            Exit Sub
           End If
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
            '   DoEvents
                SendDataToFile rs!ID, 2
                rs.MoveNext
            Next indexCounter
           Unload frmReportWait
            MsgBox "œ—" + Str(rs.RecordCount) + "œ” ê«Â  ·›‰ À»  ‘œ", vbOKOnly, "–ŒÌ—Â œ— ›«Ì·"
                            
            rs.Close
            Set rs = Nothing
        
        Case 2:
            strQuery = "SELECT PhoneStation.ID AS ID " & _
                       "From PhoneStation " & _
                       "WHERE PhoneStation.PayphoneXD IN (" & Trim(txtPhoneStationSet.Text) & ") ;"
                       
            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount < 0) Then
            rs.Close
            Set rs = Nothing
            Unload frmReportWait
            Exit Sub
            End If
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
            'DoEvents
                SendDataToFile rs!ID, 2
           rs.MoveNext
            Next indexCounter
            Unload frmReportWait
            MsgBox "œ—" + Str(rs.RecordCount) + "œ” ê«Â  ·›‰ À»  ‘œ", vbOKOnly, "–ŒÌ—Â œ— ›«Ì·"
            rs.Close
            Set rs = Nothing
        
        Case 3:
            strQuery = "SELECT ID from PhoneStation;"

            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount < 0) Then
            rs.Close
            Set rs = Nothing
            Unload frmReportWait
            Exit Sub
           End If
            rs.MoveFirst
            
          ''''''''''''''''''''
           For indexCounter = 1 To rs.RecordCount
          'DoEvents
                SendDataToFile rs!ID, 2
                rs.MoveNext
            Next indexCounter
            Unload frmReportWait
            MsgBox "œ—" + Str(rs.RecordCount) + "œ” ê«Â  ·›‰ À»  ‘œ", vbOKOnly, "–ŒÌ—Â œ— ›«Ì·"
            rs.Close
            Set rs = Nothing
''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Case 4:
            strQuery = "SELECT PhoneStation.ID AS ID " & _
                       "From PhoneStation " & _
                       "WHERE PhoneStation.PhoneGroup=" & Val(cboSavePhoneGroup.ItemData(cboSavePhoneGroup.ListIndex))
            
            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount <= 0) Then
            Unload frmReportWait
            rs.Close
            Set rs = Nothing
            Exit Sub
            End If
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
              ' DoEvents
                SendDataToFile rs!ID, 2
                rs.MoveNext
            Next indexCounter
            Unload frmReportWait
            MsgBox "œ—" + Str(rs.RecordCount) + "œ” ê«Â  ·›‰ À»  ‘œ", vbOKOnly, "–ŒÌ—Â œ— ›«Ì·"
            rs.Close
            Set rs = Nothing

    End Select
    Else
    MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â À»  œ—  ·›‰Â«")
    End If

Unload frmReportWait
Exit Sub
EH:
Set rs = Nothing
Unload frmReportWait
MsgBox "Œÿ« œ— Ê—Êœ «ÿ·«⁄« "
End Sub


Private Sub cmdSaveInDb_Click()
SetUpdateInfo
End Sub

Private Sub setDayType()
'On Error GoTo EH
Dim strSql As String
            strSql = "SELECT * From DayType " & _
                       "WHERE DayType.DayMonth = " & _
                       txtDayMonth & _
                       "AND DayType.DayDay = " & _
                       txtDayDay & _
                       ";"
                With de.rscmdDayType
                    If (.State = adStateOpen) Then .Close
                    If (.State = adStateClosed) Then
                       OpenRecordset de.rscmdDayType, strSql
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then GoTo EH 'Exit Sub
                    
                   !DayType = CByte(txtDayType)
                    .UpdateBatch
                    .Close
                          strSql = "SELECT * From DayType"
                
                    If (.State = adStateClosed) Then
                       OpenRecordset de.rscmdDayType, strSql
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                End With

DataGrid1.DataMember = "cmdDayType"
DataGrid1.ReBind

Exit Sub

EH:
MsgBox "⁄„·Ì«  «‰Ã«„ ‰‘œ"

End Sub

Private Sub cmdSaveMessegeBlock_Click()
Dim FileBlockTempFrom(511) As Byte
Dim FileBlockTempTo(511) As Byte
Dim CurrentAddress As Integer
Dim I As Integer
        
        For I = 0 To 511
          FileBlockTempTo(I) = 255
        Next I

            With de.rscmdShowMessege
                If (.State = adStateClosed) Then .Open
                
                If (.RecordCount > 0) Then
                    .MoveFirst
                    CurrentAddress = 0
                    For indexCounter = 1 To .RecordCount
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
     
     Open App.Path & "\Data\Messages\M" & Trim(Str(!ID)) & ".bin" For Random Access Read As #1 Len = 512
        Get #1, 1, FileBlockTempFrom
        Close #1
        For I = 0 To (!length) - 1
          FileBlockTempTo(CurrentAddress + I) = FileBlockTempFrom(I)
        Next I
        FileBlockTempTo(CurrentAddress + I) = 255
        CurrentAddress = CurrentAddress + !length + 1
                        .MoveNext
                    Next indexCounter
                End If
            End With
            
    Open App.Path & "\Data\Messages\MAIN.bin" For Random Access Write As #1 Len = 512
    Put #1, 1, FileBlockTempTo
    Close #1

End Sub

Private Sub cmdSaveSAMAll_Click()
    

     Dim strSql As String
            
''''''''''''
      '  On Error GoTo EH
                       strSql = "SELECT * From PhoneStation " & _
                       "WHERE PhoneStation.PhoneGroup = " & _
                       Val(cboSaveSAMAll.ItemData(cboSaveSAMAll.ListIndex))
                       
   
                With de.rscmdPhoneStation
                    If (.State = adStateOpen) Then .Close
                    If (.State = adStateClosed) Then
                       OpenRecordset de.rscmdPhoneStation, strSql
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                    MsgBox "ê—ÊÂ «‰ Œ«»Ì —òÊ—œÌ ‰œ«—œ"
                    Exit Sub
                    End If

                    
'
            
            For indexCounter = 1 To .RecordCount
                
          !SAm1Type = cboSAMAll(0).ListIndex
          !SAm2Type = cboSAMAll(1).ListIndex
          !SAm3Type = cboSAMAll(2).ListIndex
          !SAm4Type = cboSAMAll(3).ListIndex

                
                .Update
                .MoveNext
            Next indexCounter
             .Close
           End With
Exit Sub
EH:
MsgBox "Œÿ« œ— Ê—Êœ «ÿ·«⁄« "
Exit Sub

End Sub

Private Sub cmdSaveSettingAll_Click()
     Dim strSql As String
            
''''''''''''
   'On Error GoTo EH
                       strSql = "SELECT * From PhoneStation " & _
                       "WHERE PhoneStation.PhoneGroup = " & _
                       Val(cboGroupSettingAll.ItemData(cboGroupSettingAll.ListIndex))
                       
   
                With de.rscmdPhoneStation
                    If (.State = adStateOpen) Then .Close
                    If (.State = adStateClosed) Then
                       OpenRecordset de.rscmdPhoneStation, strSql
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                     MsgBox "ê—ÊÂ «‰ Œ«»Ì —òÊ—œÌ ‰œ«—œ"
                    Exit Sub
                    End If


                    
'
            
            For indexCounter = 1 To .RecordCount
                
            !CharggingType = Val(cboCharggingTypeAll.ItemData(cboCharggingTypeAll.ListIndex))
            !charggingRoutin = Val(cboCharggingRoutinAll.ItemData(cboCharggingRoutinAll.ListIndex))
            !DialingType = Val(cboDialingTypeAll.ItemData(cboDialingTypeAll.ListIndex))
            !PhoneAccessLevel = Val(cboPhoneAccessLevelAll.ItemData(cboPhoneAccessLevelAll.ListIndex))
            !Ringer = Val(cboRingerAll.ItemData(cboRingerAll.ListIndex))
            !DialingRule = Val(cboDialingRuleAll.ItemData(cboDialingRuleAll.ListIndex))

                
                .Update
                .MoveNext
            Next indexCounter
             .Close
           End With
Exit Sub
EH:
MsgBox "Œÿ« œ— Ê—Êœ «ÿ·«⁄« "

End Sub

Private Sub cmdSetCallTimeAll_Click()
Dim I As Integer
Dim j As Integer
Dim StartHour As Integer
Dim StartMinute As Integer
Dim LineCount As Integer
Dim PhoneCount As Integer
Dim TimeSlice As Integer
Dim AcceptCounter As Integer
Dim strSql As String
Dim PhonePerLineCount As Integer

' On Error GoTo EH
   
   StartHour = Val(txtStarCallTime(1).Text)
   StartMinute = Val(txtStarCallTime(0).Text)
    TimeSlice = Val(txtTimeSlotAll.Text)
    StartMinute = StartMinute - TimeSlice
    AcceptCounter = 0
              '''''''''''''''''''''''''''''''''''''''
                       strSql = "SELECT * From Connections " & _
                       "WHERE Connections.Activate = 1 AND Connections.kind = 1 "
                With de.rscmdConnections
                    If (.State = adStateOpen) Then .Close
                    
                    If (.State = adStateClosed) Then
                       OpenRecordset de.rscmdConnections, strSql
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then GoTo EH 'Exit Sub
                    LineCount = .RecordCount
                    .Close
                End With

                  ''''''''''''''''''''''''''''''''''''''''''''''''
                    If optCallTimeSetAll(0).Value = True Then
                       strSql = "SELECT * From PhoneStation " & _
                       "WHERE PhoneStation.PhoneGroup = " & _
                       Val(cboCallTimeGroupAll.ItemData(cboCallTimeGroupAll.ListIndex))
                      Else
                        strSql = "SELECT * From PhoneStation "
                    End If
                
                With de.rscmdPhoneStation
                    If (.State = adStateOpen) Then .Close
                    If (.State = adStateClosed) Then
                       OpenRecordset de.rscmdPhoneStation, strSql
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      MsgBox "ê—ÊÂ «‰ Œ«»Ì —òÊ—œÌ ‰œ«—œ"
                    Exit Sub
                    End If

                    PhoneCount = .RecordCount
                    
                   PhonePerLineCount = (PhoneCount \ LineCount)
                   If (PhoneCount Mod LineCount) > 0 Then PhonePerLineCount = PhonePerLineCount + 1
                    '''''''''''''''''''''
                For I = 1 To LineCount
                    For j = 1 To PhonePerLineCount
                    ''''''''
                    AcceptCounter = AcceptCounter + 1
                    If AcceptCounter > PhoneCount Then Exit For
                    
                   CalculateCallTime StartMinute, StartHour, TimeSlice, j
                    
                    !SendDataHour = CByte("&H" + Trim(Str(CalcHour)))
                    !SendDataMinute = CByte("&H" + Trim(Str(CalcMinute)))
                      
                    .Update
                    
                    .MoveNext
                    '''''''''
                    Next j
                Next I
                    '''''''''''''''''''''
             .Close
           End With
Exit Sub
EH:
MsgBox "Œÿ« œ— Ê—Êœ «ÿ·«⁄« "

End Sub
Private Sub CalculateCallTime(minute As Integer, hour As Integer, slice As Integer, m As Integer)
Dim TotalMinute As Integer
TotalMinute = minute + (hour * 60) + (m * slice)
CalcHour = TotalMinute \ 60
CalcMinute = TotalMinute Mod 60
End Sub
Private Sub Command33_Click(Index As Integer)

invisible_all_keys

Select Case Index
Case 0:
MsgMap(CharCount) = 116
txtMessege.Text = txtMessege.Text + " " + "A" + " "
Case 1:
MsgMap(CharCount) = 117
txtMessege.Text = txtMessege.Text + " " + "B" + " "
Case 2:
MsgMap(CharCount) = 118
txtMessege.Text = txtMessege.Text + " " + "C" + " "
Case 3:
MsgMap(CharCount) = 119
txtMessege.Text = txtMessege.Text + " " + "D" + " "
Case 4:
MsgMap(CharCount) = 120
txtMessege.Text = txtMessege.Text + " " + "E" + " "
Case 5:
MsgMap(CharCount) = 121
txtMessege.Text = txtMessege.Text + " " + "F" + " "
Case 6:
MsgMap(CharCount) = 122
txtMessege.Text = txtMessege.Text + " " + "G" + " "
Case 7:
MsgMap(CharCount) = 123
txtMessege.Text = txtMessege.Text + " " + "H" + " "
Case 8:
MsgMap(CharCount) = 124
txtMessege.Text = txtMessege.Text + " " + "I" + " "
Case 9:
MsgMap(CharCount) = 125
txtMessege.Text = txtMessege.Text + " " + "J" + " "
Case 10:
MsgMap(CharCount) = 126
txtMessege.Text = txtMessege.Text + " " + "K" + " "
Case 11:
MsgMap(CharCount) = 127
txtMessege.Text = txtMessege.Text + " " + "L" + " "
Case 12:
MsgMap(CharCount) = 128
txtMessege.Text = txtMessege.Text + " " + "M" + " "
Case 13:
MsgMap(CharCount) = 129
txtMessege.Text = txtMessege.Text + " " + "N" + " "
Case 14:
MsgMap(CharCount) = 130
txtMessege.Text = txtMessege.Text + " " + "O" + " "
Case 15:
MsgMap(CharCount) = 131
txtMessege.Text = txtMessege.Text + " " + "P" + " "
Case 16:
MsgMap(CharCount) = 132
txtMessege.Text = txtMessege.Text + " " + "Q" + " "
Case 17:
MsgMap(CharCount) = 133
txtMessege.Text = txtMessege.Text + " " + "R" + " "
Case 18:
MsgMap(CharCount) = 134
txtMessege.Text = txtMessege.Text + " " + "S" + " "
Case 19:
MsgMap(CharCount) = 135
txtMessege.Text = txtMessege.Text + " " + "T" + " "
Case 20:
MsgMap(CharCount) = 136
txtMessege.Text = txtMessege.Text + " " + "U" + " "
Case 21:
MsgMap(CharCount) = 137
txtMessege.Text = txtMessege.Text + " " + "V" + " "
Case 22:
MsgMap(CharCount) = 138
txtMessege.Text = txtMessege.Text + " " + "W" + " "
Case 23:
MsgMap(CharCount) = 139
txtMessege.Text = txtMessege.Text + " " + "X" + " "
Case 24:
MsgMap(CharCount) = 140
txtMessege.Text = txtMessege.Text + " " + "Y" + " "
Case 25:
MsgMap(CharCount) = 141
txtMessege.Text = txtMessege.Text + " " + "Z" + " "
End Select
CharCount = CharCount + 1
End Sub


Private Sub Command34_Click(Index As Integer)
invisible_all_keys

Select Case Index
Case 0:
MsgMap(CharCount) = 142
txtMessege.Text = txtMessege.Text + " " + "1" + " "

Case 1:
MsgMap(CharCount) = 143
txtMessege.Text = txtMessege.Text + " " + "2" + " "

Case 2:
MsgMap(CharCount) = 144
txtMessege.Text = txtMessege.Text + " " + "3" + " "

Case 3:
MsgMap(CharCount) = 145
txtMessege.Text = txtMessege.Text + " " + "4" + " "

Case 4:
MsgMap(CharCount) = 146
txtMessege.Text = txtMessege.Text + " " + "5" + " "

Case 5:
MsgMap(CharCount) = 147
txtMessege.Text = txtMessege.Text + " " + "6" + " "

Case 6:
MsgMap(CharCount) = 148
txtMessege.Text = txtMessege.Text + " " + "7" + " "

Case 7:
MsgMap(CharCount) = 149
txtMessege.Text = txtMessege.Text + " " + "8" + " "

Case 8:
MsgMap(CharCount) = 150
txtMessege.Text = txtMessege.Text + " " + "9" + " "

Case 9:
MsgMap(CharCount) = 151
txtMessege.Text = txtMessege.Text + " " + "0" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command35_Click(Index As Integer)
invisible_all_keys

Select Case Index
Case 0:
MsgMap(CharCount) = 152
txtMessege.Text = txtMessege.Text + " " + "(" + " "

Case 1:
MsgMap(CharCount) = 153
txtMessege.Text = txtMessege.Text + " " + ")" + " "

Case 2:
MsgMap(CharCount) = 154
txtMessege.Text = txtMessege.Text + " " + "''" + " "

Case 3:
MsgMap(CharCount) = 155
txtMessege.Text = txtMessege.Text + " " + "*" + " "

Case 4:
MsgMap(CharCount) = 156
txtMessege.Text = txtMessege.Text + " " + "#" + " "

Case 5:
MsgMap(CharCount) = 157
txtMessege.Text = txtMessege.Text + " " + "@" + " "

Case 6:
MsgMap(CharCount) = 158
txtMessege.Text = txtMessege.Text + " " + "=" + " "

Case 7:
MsgMap(CharCount) = 159
txtMessege.Text = txtMessege.Text + " " + "-" + " "

Case 8:
MsgMap(CharCount) = 160
txtMessege.Text = txtMessege.Text + " " + "+" + " "

Case 9:
MsgMap(CharCount) = 161
txtMessege.Text = txtMessege.Text + " " + "/" + " "

Case 10:
MsgMap(CharCount) = 162
txtMessege.Text = txtMessege.Text + " " + "&&" + " "

Case 11:
MsgMap(CharCount) = 115
txtMessege.Text = txtMessege.Text + " " + " " + " "

End Select
CharCount = CharCount + 1
End Sub





Private Sub DataGrid1_Click()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:

End Sub

Private Sub dtgBlackList_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
EH:
End Sub



Private Sub dtgChargeAreaSetting_Click()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:

End Sub

Private Sub dtgChargeLevel_Click()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:

End Sub


Private Sub dtgCitySetting_Click()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:

End Sub

Private Sub dtgWhiteList_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub
Private Sub dtgChargging_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub


Private Sub dtgFreeTel_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub

Private Sub dtgMessage_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub

Private Sub dtgPhoneStation_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub

Private Sub dtgPhoneStationRepairing_Click()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub

Private Sub dtgPMS_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub

Private Sub dtgCharggingScheduller_DblClick()
'On Error GoTo EH
    SetText
    EnableDisableControls False
    EditState = True
    
EH:
End Sub


Private Sub Form_Load()
'On Error Resume Next
SetAccessCondition
    SetSkin Me
    
    sstDataEntry.Tab = 0
    PrevTab = 100
    EditState = False
    ShowUpdateInfo
    RefreshSaveMessegeControls
End Sub

Private Sub Form_Resize()
 '   On Error Resume Next
    
    With fraDataEntry
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
    End With

End Sub












Private Sub sstDataEntry_Click(PreviousTab As Integer)
'''       Select Case sstDataEntry.Tab
'''
'''        Case 0:
'''        Case 1:
'''        Case 2:
'''        Case 3:
'''        Case 4:
'''        Case 5:
'''        Case 6:
'''        Case 7:
'''        Case 8:
'''        Case 9:
'''        Case 10:
'''        Case 11:
'''
'''   End Select
'
'If sstDataEntry.Tab = 11 Then
'cmdDelete.Visible = False
'cmdEdit.Visible = False
'cmdNew.Visible = False
'cmdOK.Visible = False
'cmdOKDayType.Visible = True
'cmdExit.Visible = True
'Else
'cmdDelete.Visible = True
'cmdEdit.Visible = True
'cmdNew.Visible = True
'cmdOK.Visible = True
'
'cmdOKDayType.Visible = False
'
'End If
End Sub

Private Sub sstDataEntry_DblClick()
    If (EditState And PrevTab = 100) Then
        'PrevTab = PreviousTab
        'sstDataEntry.Tab = PreviousTab
    Else
        PrevTab = 100
      End If
End Sub

Private Sub cmdDelete_Click()
Dim UserActivityPack As UserDBActivity
        
       ' On Error GoTo EH
        UserActivityPack.ActivityCode = 2

       Select Case sstDataEntry.Tab
        Case 0:
            If PmsNumTableAccessSW = True Then
            
                If MsgBox("¬Ì« „«Ì·Ìœ ‘„«—Â  ·›‰ „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
                    Exit Sub
                End If
                
                
                With de.rscmdPMSTelNo
             '   UserActivityPack.TableName = "PMSNum Table"
             '   UserActivityPack.F1 = !ID
             ' RegisterUserActivity UserActivityPack
                    If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                        .Delete
                        .Update
                    End If
                End With
            Else
            MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
            End If
        Case 1:
            If CardListTableAccessSW = True Then
           If MsgBox("¬Ì« „«Ì·Ìœ ò«— Â«Ì „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
             Exit Sub
            End If

            With de.rscmdBlackList
             ' UserActivityPack.TableName = "BlackList Table"
             '   UserActivityPack.F1 = !FromNo
             '   UserActivityPack.F2 = !ToNo
                
             ' RegisterUserActivity UserActivityPack
                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
            Else
            MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
            End If
        
        Case 2:
            If FreeNumTableAccessSW = True Then
           If MsgBox("¬Ì« „«Ì·Ìœ  ·›‰ „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
             Exit Sub
            End If

            With de.rscmdFreeTelNo
             ' UserActivityPack.TableName = "FreeTelNum Table"
             '   UserActivityPack.F1 = !ID
               
             ' RegisterUserActivity UserActivityPack
                
                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
          Else
          MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
          End If
        Case 3:
            If CharggingTableAccessSW = True Then
           If MsgBox("¬Ì« „«Ì·Ìœ  ⁄—›Â „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
             Exit Sub
            End If

            With de.rscmdChargging
             '   UserActivityPack.TableName = "Chargging Table"
             '   UserActivityPack.F1 = !PreNo
             '   UserActivityPack.F2 = !TimeBlock
                
             '   UserActivityPack.F3 = !TimeBlockPalseZone1
             '   UserActivityPack.F4 = !TimeBlockPalseZone2
             '   UserActivityPack.F5 = !TimeBlockPalseZone3
             '
             ' RegisterUserActivity UserActivityPack

                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
          Else
          MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
          End If
        Case 4:
            If MessageTableAccessSW = True Then
            If MsgBox("¬Ì« „«Ì·Ìœ ¬êÂÌ „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
             Exit Sub
            End If

            With de.rscmdMessage
             '   UserActivityPack.TableName = "Message Table"
             '   UserActivityPack.F1 = !ID
             '   UserActivityPack.F2 = Mid(!Description, 1, 10)
                
             ' RegisterUserActivity UserActivityPack
                
                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
            Else
            MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
            End If
         
        Case 5:
            If PhoneStationTableAccessSW = True Then
            If MsgBox("¬Ì« „«Ì·Ìœ œ” ê«Â  ·›‰ „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
             Exit Sub
            End If

            With de.rscmdPhoneStation
             '   UserActivityPack.TableName = "PhoneStation Table"
             '   UserActivityPack.F1 = !ID
             '   UserActivityPack.F2 = !TelNo
             '   UserActivityPack.F3 = !Address
             '   UserActivityPack.F4 = !DESFunc
             '   UserActivityPack.F5 = !SendDataHour
             '   UserActivityPack.F6 = !SendDataMinute
             '   UserActivityPack.F7 = !Ringer
             '   UserActivityPack.F8 = !LastUpdateYear
             '   UserActivityPack.F9 = !LastUpdateMonth
             '   UserActivityPack.F10 = !LastUpdateDay
             '   UserActivityPack.F11 = !CharggingType
             '   UserActivityPack.F12 = !DialingRule
             '   UserActivityPack.F13 = !charggingRoutin
             '   UserActivityPack.F14 = !Called
             '   UserActivityPack.F15 = !PhoneAccessLevel
             '   UserActivityPack.F16 = !DialingType
             '   UserActivityPack.F17 = !ReportScheduling
             '   UserActivityPack.F18 = !PhoneGroup
             '   UserActivityPack.F19 = !Sam1Serial
             '   UserActivityPack.F20 = !Sam1Pin
             '   UserActivityPack.F21 = !SAm1Type
             '   UserActivityPack.F22 = !Sam2Serial
             '   UserActivityPack.F23 = !Sam2Pin
             '   UserActivityPack.F24 = !SAm2Type
             '   UserActivityPack.F25 = !Sam3Serial
             '   UserActivityPack.F26 = !Sam3Pin
             '   UserActivityPack.F27 = !SAm3Type
             '   UserActivityPack.F28 = !Sam4Serial
             '   UserActivityPack.F29 = !Sam4Pin
             '   UserActivityPack.F30 = !SAm4Type
             '
             ' RegisterUserActivity UserActivityPack

                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
            Else
            MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
            End If
         
        Case 8:
            If CardListTableAccessSW = True Then
           If MsgBox("¬Ì« „«Ì·Ìœ ò«— Â«Ì „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = vbNo Then
             Exit Sub
            End If

            With de.rscmdWhiteList
             '   UserActivityPack.TableName = "WhiteList Table"
             '   UserActivityPack.F1 = !FromNo
             '   UserActivityPack.F2 = !ToNo
             '
             ' RegisterUserActivity UserActivityPack

                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                      .Delete
                      .Update
                   End If
            End With
            Else
            MsgBox ("„ÕœÊœÌ  œ” —”Ì »Â Õ–› —òÊ—œ")
            End If
   End Select
   Exit Sub
EH:
   MsgBox ("⁄„·Ì«  Õ–› «‰Ã«„ ‰‘œ")
End Sub

Private Sub cmdEdit_Click()
    SetText
    EditState = True
    EnableDisableControls False
End Sub
Private Sub cmdNew_Click()
Dim UserActivityPack As UserDBActivity

    ' On Error GoTo EH
     Dim strSql As String
            UserActivityPack.ActivityCode = 1

    If (CheckData) Then
        Select Case sstDataEntry.Tab
            Case 0:
            If PmsNumTableAccessSW = True Then
                With de.rscmdPMSTelNo
                    strSql = "Select * From PMSTelNo"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdPMSTelNo, strSql
                    End If
                    
                    .AddNew
                    SetRecordset
                    .Update
                
'                UserActivityPack.TableName = "PMSNum Table"
'                UserActivityPack.F1 = !ID
'              RegisterUserActivity UserActivityPack

                End With
                Else
                MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
                End If

            Case 1:
            If CardListTableAccessSW = True Then
                With de.rscmdBlackList
                    strSql = "Select * From BlackList"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdBlackList, strSql
                    End If
                    
                    If (.RecordCount >= 150) Then
                        MsgBox "·Ì”  „Ê—œ ‰Ÿ— Å— ‘œÂ «” ", vbOKOnly, "Â‘œ«—"
                        Exit Sub
                    End If
                    
                    .AddNew
                     SetRecordset
                    .UpdateBatch
'              UserActivityPack.TableName = "BlackList Table"
'                UserActivityPack.F1 = !FromNo
'                UserActivityPack.F2 = !ToNo
'
'              RegisterUserActivity UserActivityPack
            
              End With
                Else
                MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")

                End If
            Case 2:
                If FreeNumTableAccessSW = True Then
                With de.rscmdFreeTelNo
                    strSql = "Select * From FreeTelNo"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdFreeTelNo, strSql
                    End If
                    
                    If (.RecordCount >= 20) Then
                        MsgBox "·Ì”  „Ê—œ ‰Ÿ— Å— ‘œÂ «” ", vbOKOnly, "Â‘œ«—"
                        Exit Sub
                    End If

                    .AddNew
                    SetRecordset
                    .Update
'              UserActivityPack.TableName = "FreeTelNum Table"
'                UserActivityPack.F1 = !ID
'
'              RegisterUserActivity UserActivityPack
                
                End With
               Else
                MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
                End If

                
            Case 3:
            If CharggingTableAccessSW = True Then
                With de.rscmdChargging
                    strSql = "Select * From Chargging"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdChargging, strSql
                    End If
                    
'                    If (.RecordCount >= 120) Then
'                        MsgBox "·Ì”  „Ê—œ ‰Ÿ— Å— ‘œÂ «” ", vbOKOnly, "Â‘œ«—"
'                        Exit Sub
'                    End If
                    
                    .AddNew
                    SetRecordset
                    .Update
'                UserActivityPack.TableName = "Chargging Table"
'                UserActivityPack.F1 = !PreNo
'                UserActivityPack.F2 = !TimeBlock
'
'                UserActivityPack.F3 = !TimeBlockPalseZone1
'                UserActivityPack.F4 = !TimeBlockPalseZone2
'                UserActivityPack.F5 = !TimeBlockPalseZone3
'
'              RegisterUserActivity UserActivityPack
                
                End With
                Else
                 MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
                End If
            Case 4:
                If MessageTableAccessSW = True Then
                With de.rscmdMessage
                    strSql = "Select * From Message"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdMessage, strSql
                    End If
                    
                    .AddNew
                    SetRecordset
                    .Update
                    
                    SaveTextMessege
                    
'                UserActivityPack.TableName = "Message Table"
'                UserActivityPack.F1 = !ID
'                UserActivityPack.F2 = Mid(!Description, 1, 10)
'
'              RegisterUserActivity UserActivityPack
                
                End With
                Else
                 MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
                End If
            Case 5:
                If PhoneStationTableAccessSW = True Then
                With de.rscmdPhoneStation
                    strSql = "Select * From PhoneStation"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdPhoneStation, strSql
                    End If
                    
                    .AddNew
                    SetRecordset
                    .Update
'                UserActivityPack.TableName = "PhoneStation Table"
'                UserActivityPack.F1 = !ID
'                UserActivityPack.F2 = !TelNo
'                UserActivityPack.F3 = !Address
'                UserActivityPack.F4 = !DESFunc
'                UserActivityPack.F5 = !SendDataHour
'                UserActivityPack.F6 = !SendDataMinute
'                UserActivityPack.F7 = !Ringer
'                UserActivityPack.F8 = !LastUpdateYear
'                UserActivityPack.F9 = !LastUpdateMonth
'                UserActivityPack.F10 = !LastUpdateDay
'                UserActivityPack.F11 = !CharggingType
'                UserActivityPack.F12 = !DialingRule
'                UserActivityPack.F13 = !charggingRoutin
'                UserActivityPack.F14 = !Called
'                UserActivityPack.F15 = !PhoneAccessLevel
'                UserActivityPack.F16 = !DialingType
'                UserActivityPack.F17 = !ReportScheduling
'                UserActivityPack.F18 = !PhoneGroup
'                UserActivityPack.F19 = !Sam1Serial
'                UserActivityPack.F20 = !Sam1Pin
'                UserActivityPack.F21 = !SAm1Type
'                UserActivityPack.F22 = !Sam2Serial
'                UserActivityPack.F23 = !Sam2Pin
'                UserActivityPack.F24 = !SAm2Type
'                UserActivityPack.F25 = !Sam3Serial
'                UserActivityPack.F26 = !Sam3Pin
'                UserActivityPack.F27 = !SAm3Type
'                UserActivityPack.F28 = !Sam4Serial
'                UserActivityPack.F29 = !Sam4Pin
'                UserActivityPack.F30 = !SAm4Type
'
'              RegisterUserActivity UserActivityPack
                    
                    SendDataToFile !ID, 1

                End With
                Else
                 MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
                End If
            Case 6:
            
                Select Case sstCityAreaSetting.Tab
                    Case 0:
        
                    If PhoneRepairTableAccessSW = True Then
                        With de.rscmdCity
                            strSql = "Select * From City"
                            If (.State = adStateClosed) Then
                                OpenRecordset de.rscmdCity, strSql
                            End If
                            
                            .AddNew
                            SetRecordset
                            .Update
                        End With
                        Else
                        MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
                        End If
                        
                    Case 1:
                    
                End Select
            Case 8:
            If CardListTableAccessSW = True Then
                With de.rscmdWhiteList
                    strSql = "Select * From WhiteList"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdWhiteList, strSql
                    End If
                    
                    If (.RecordCount >= 150) Then
                        MsgBox "·Ì”  „Ê—œ ‰Ÿ— Å— ‘œÂ «” ", vbOKOnly, "Â‘œ«—"
                        Exit Sub
                    End If
                    
                    .AddNew
                     SetRecordset
                    .UpdateBatch
'                UserActivityPack.TableName = "WhiteList Table"
'                UserActivityPack.F1 = !FromNo
'                UserActivityPack.F2 = !ToNo
'
'              RegisterUserActivity UserActivityPack
            
              End With
                Else
                MsgBox ("„ÕœÊœÌ  œ” —”Ì »—«Ì «÷«› ò—œ‰ —òÊ—œ ÃœÌœ")
              End If
              
           End Select
      ClearText
      End If
     Exit Sub
EH:
MsgBox ("⁄„·Ì«  ”«Œ  —òÊ—œ ÃœÌœ ò«„· ‰‘œ!")
End Sub

Private Sub cmdOK_Click()
'On Error Resume Next
    Dim strSql As String
    
    If (CheckData) Then
        Select Case sstDataEntry.Tab
            Case 0:
                With de.rscmdPMSTelNo
                    strSql = "Select * From PMSTelNo"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdPMSTelNo, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetRecordset
                    .Update
                End With

            Case 1:
                With de.rscmdBlackList
                    strSql = "Select * From BlackList"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdBlackList, strSql
                        Exit Sub
                    End If
                
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                     SetRecordset
                    .UpdateBatch
            
              End With
                
            Case 2:
                With de.rscmdFreeTelNo
                    strSql = "Select * From FreeTelNo"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdFreeTelNo, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetRecordset
                    .Update
                End With

                
            Case 3:
                With de.rscmdChargging
                    strSql = "Select * From Chargging"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdChargging, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetRecordset
                    .Update
                End With

            Case 4:
                With de.rscmdMessage
                    strSql = "Select * From Message"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdMessage, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetRecordset
                    .Update
                End With

            Case 5:
                With de.rscmdPhoneStation
                    strSql = "Select * From PhoneStation"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdPhoneStation, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetRecordset
                    .Update
                    SendDataToFile !ID, 1
                End With

            Case 6:
                Select Case sstCityAreaSetting.Tab
                    Case 0:
    
                        With de.rscmdCity
                            strSql = "Select * From City"
                            If (.State = adStateClosed) Then
                                OpenRecordset de.rscmdCity, strSql
                            End If
                            
                            If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                             
                             SetRecordset
                            .Update
                        End With

                    Case 1:
    
                        With de.rscmdCharggingArea
                            strSql = "Select * From CharggingArea"
                            If (.State = adStateClosed) Then
                                OpenRecordset de.rscmdCharggingArea, strSql
                            End If
                            
                            If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                             
                             SetRecordset
                            .Update
                        End With
                    
                End Select
             Case 8:
                With de.rscmdWhiteList
                    strSql = "Select * From WhiteList"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdWhiteList, strSql
                        Exit Sub
                    End If
                
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                     SetRecordset
                    .UpdateBatch
            
              End With
             Case 9:
                With de.rscmdSamSetting
                    strSql = "Select * From SamSetting"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdSamSetting, strSql
                        Exit Sub
                    End If
                
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                     SetRecordset
                    .UpdateBatch
            
              End With
             
             Case 10:
                With de.rscmdCharggingScheduller
                    strSql = "Select * CharggingScheduller"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdCharggingScheduller, strSql
                        Exit Sub
                    End If
                
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                     SetRecordset
                    .UpdateBatch
            
              End With
                         
             Case 11:
                setDayType
             
             Case 12:
                    With de.rscmdChargeLevel
                    strSql = "Select * From ChargeLevel"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdChargeLevel, strSql
                        Exit Sub
                    End If
                    
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    SetRecordset
                    .Update
                End With
    
            End Select
                     
        
        ClearText
        EnableDisableControls True
        
    End If
End Sub

Private Sub EnableDisableControls(ED As Boolean)
'    Select Case Index
'        Case 0:
'            dtgPMS.Enabled = ED
'        Case 1:
'            dtgBlackList.Enabled = ED
'        Case 2:
'            dtgFreeTel.Enabled = ED
'        Case 3:
'            dtgChargging.Enabled = ED
'        Case 4:
'            dtgMessage.Enabled = ED
'        Case 5:
'            dtgPhoneStation.Enabled = ED
'        Case 6:
'            dtgPhoneStationRepairing.Enabled = ED
'        Case 8:
'            dtgWhiteList.Enabled = ED
'        Case 9:
'            dtgSamSetting.Enabled = ED
'        Case 10:
'            dtgCharggingScheduller.Enabled = ED
'    End Select
'
'    cmdDelete.Visible = ED
'    cmdCancel.Visible = Not ED
'    cmdOK.Visible = Not ED
'    cmdExit.Visible = ED
'
'    cmdDelete.Enabled = ED
'    cmdCancel.Enabled = Not ED
'    cmdOK.Enabled = Not ED
'    cmdExit.Enabled = ED

End Sub

Private Sub cmdCancel_Click()
    EditState = False
    EnableDisableControls True
    ClearText
End Sub

Private Sub ClearText()
    Dim obj As Object
    
    For Each obj In Controls
     
        Select Case TypeName(obj)
            
            Case "DataCombo", "ComboBox", "TextBox":
                obj.Text = ""
                       
            Case "MaskEdBox":
            If (obj.Tag = "2type") Then
             obj.Text = Replace(obj.Mask, "&", obj.PromptChar)
            Else
              obj.Text = Replace(obj.Mask, "#", obj.PromptChar)
            End If
        
        End Select
    Next obj
End Sub

Private Function CheckData() As Boolean
'On Error GoTo EH
    CheckData = True
    
    Select Case sstDataEntry.Tab
        Case 0:
            If (Len(Trim(mtxtPMSTelNo.Text)) > 12 Or Not IsNumeric(mtxtPMSTelNo.Text)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â  ·›‰ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtPMSTelNo.SetFocus
                Exit Function
            End If
         
         Case 1:
            If (Not IsNumeric(mtxtCardNoFrom.ClipText)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â ò«—  —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtCardNoFrom.SetFocus
                Exit Function
            End If

            If (Not IsNumeric(mtxtCardNoTo.ClipText)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â ò«—  —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtCardNoTo.SetFocus
                Exit Function
            End If

        Case 2:
            If (Not IsNumeric(mtxtFreeTelNo.ClipText)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â  ·›‰ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtFreeTelNo.SetFocus
                Exit Function
            End If


        Case 3:
'            If Val(mtxtPreNoFrom.ClipText) = 0 Or Val(mtxtPreNoTo.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›« ÅÌ‘ ‘„«—Â  ·›‰ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtPreNo.SetFocus
'                Exit Function
'            End If
'
'            If Val(mtxtTimeBlockPalsZone1.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone1.SetFocus
'                Exit Function
'            End If
'
'            If Val(mtxtTimeBlockPalsZone2.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone2.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone3.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone3.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone4.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone5.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone6.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone6.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone7.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone7.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone8.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone8.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone9.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone9.SetFocus
'                Exit Function
'            End If
'            If Val(mtxtTimeBlockPalsZone10.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›«  ⁄œ«œ Å«·” —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlockPalsZone10.SetFocus
'                Exit Function
'            End If
'
'            If Val(mtxtTimeBlock.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›« »·«ò “„«‰Ì —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtTimeBlock.SetFocus
'                Exit Function
'            End If
            
        Case 4:
            If Val(mtxtMessageSerial.ClipText) = 0 Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â ÅÌ€«„ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtMessageSerial.SetFocus
                Exit Function
            End If
            
        Case 5:
            If Len(Trim(mtxtPhoneStationSerial.ClipText)) < 7 Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â ”—Ì«·  ·›‰ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtPhoneStationSerial.SetFocus
                Exit Function
            End If
            
            If (Len(Trim(mtxtPhoneStationTelNo.ClipText)) > 12 Or Not IsNumeric(mtxtPhoneStationTelNo.ClipText)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â  ·›‰ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtPhoneStationTelNo.SetFocus
                Exit Function
            End If
            
        Case 6:
'            If Len(Trim(mtxtRepairStartYear.ClipText)) < 4 Then
'                CheckData = False
'                MsgBox "·ÿ›« ”«· —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtRepairStartYear.SetFocus
'                Exit Function
'            End If
'
'            If Val(mtxtRepairStartMonth.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›« „«Â —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtRepairStartMonth.SetFocus
'                Exit Function
'            End If
'
'            If Val(mtxtRepairStartDay.ClipText) = 0 Then
'                CheckData = False
'                MsgBox "·ÿ›« —Ê“ —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                mtxtRepairStartDay.SetFocus
'                Exit Function
'            End If
'
'            If (Not dtcPhoneStationRef.MatchedWithList) Then
'                CheckData = False
'                MsgBox "·ÿ›« ‘„«—Â ”—Ì«·  ·›‰ —« œ—”  «‰ Œ«» ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                dtcPhoneStationRef.SetFocus
'                Exit Function
'            End If
'
'            If (Not dtcPhoneStationRepairTypeRef.MatchedWithList) Then
'                CheckData = False
'                MsgBox "·ÿ›« ‰Ê⁄  ⁄„Ì— —« œ—”  «‰ Œ«» ò‰Ìœ", vbOKOnly, "         Œÿ«"
'                dtcPhoneStationRepairTypeRef.SetFocus
'                Exit Function
'            End If
         Case 8:
            If (Not IsNumeric(mtxtWCardNoFrom.ClipText)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â ò«—  —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtWCardNoFrom.SetFocus
                Exit Function
            End If

            If (Not IsNumeric(mtxtWCardNoTo.ClipText)) Then
                CheckData = False
                MsgBox "·ÿ›« ‘„«—Â ò«—  —« œ—”  Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                mtxtWCardNoTo.SetFocus
                Exit Function
            End If
        
    End Select
    Exit Function
EH:
    MsgBox ("Œÿ« œ— œ«œÂ Â«Ì Ê—ÊœÌ")
End Function

Private Sub SetRecordset()
Dim TmpStr As String
'On Error Resume Next
    Select Case sstDataEntry.Tab
        Case 0:
            de.rscmdPMSTelNo!ID = Trim(mtxtPMSTelNo.Text)
        Case 1:
            de.rscmdBlackList!FromNo = mtxtCardNoFrom.ClipText
            de.rscmdBlackList!ToNo = mtxtCardNoTo.ClipText
            de.rscmdBlackList!F1 = CByte("&H" + Trim(Str(txtbf1)))
            de.rscmdBlackList!F2 = CByte("&H" + Trim(Str(txtbf2)))
            de.rscmdBlackList!F3 = CByte(txtbf3)
            de.rscmdBlackList!F4 = CByte(txtbf4)
            de.rscmdBlackList!F5 = CByte(txtbf5)
            de.rscmdBlackList!F6 = CByte(txtbf6)
            de.rscmdBlackList!F7 = CByte(txtbf7)

        Case 2:
            de.rscmdFreeTelNo!ID = mtxtFreeTelNo.ClipText
        Case 3:
            de.rscmdChargging!PreNoFrom = mtxtPreNoFrom.ClipText
            de.rscmdChargging!PreNoTo = mtxtPreNoTo.ClipText
            de.rscmdChargging!ChargeLevel = mtxtChargeLevel.ClipText
            de.rscmdChargging!CharggingArea = Int(Val(dtcCharggingArea.BoundText))
        Case 4:
            de.rscmdMessage!ID = mtxtMessageSerial.ClipText
            de.rscmdMessage!Description = Trim(txtDescription.Text)
            de.rscmdMessage!length = CharCount
            'RefreshMessege
        Case 5:
            de.rscmdPhoneStation!ID = mtxtPhoneStationSerial.ClipText
          de.rscmdPhoneStation!PayphoneXD = mtxtPayphoneXD.ClipText
          
            de.rscmdPhoneStation!TelNo = mtxtPhoneStationTelNo.ClipText
           ' de.rscmdPhoneStation!DESFunc = mtxtPhoneStationDESFunc.ClipText
            de.rscmdPhoneStation!SendDataHour = CByte("&H" + mtxtPhoneStationHour.ClipText)
            de.rscmdPhoneStation!SendDataMinute = CByte("&H" + mtxtPhoneStationMinute.ClipText)
            de.rscmdPhoneStation!Address = Trim(txtPhoneStationAddress.Text)
            de.rscmdPhoneStation!CharggingType = Val(cboCharggingType.ItemData(cboCharggingType.ListIndex))
            de.rscmdPhoneStation!charggingRoutin = Val(cboCharggingRoutin.ItemData(cboCharggingRoutin.ListIndex))
        
            de.rscmdPhoneStation!DialingType = Val(cboDialingType.ItemData(cboDialingType.ListIndex))
            de.rscmdPhoneStation!PhoneAccessLevel = Val(cboPhoneAccessLevel.ItemData(cboPhoneAccessLevel.ListIndex))
            de.rscmdPhoneStation!Ringer = Val(cboRinger.ItemData(cboRinger.ListIndex))
            de.rscmdPhoneStation!AntiTapActivate = Val(cboAntiTapActivate.ItemData(cboAntiTapActivate.ListIndex))
            de.rscmdPhoneStation!DialingRule = Val(cboDialingRule.ItemData(cboDialingRule.ListIndex))
            de.rscmdPhoneStation!ReportScheduling = Val(cboReportScheduling.ItemData(cboReportScheduling.ListIndex))
            de.rscmdPhoneStation!PhoneGroup = Val(cboPhoneGroup.ItemData(cboPhoneGroup.ListIndex))
            de.rscmdPhoneStation!phoneCity = Int(Val(dtcPhoneCitySelect.BoundText))
            de.rscmdPhoneStation!SoftwareVersion = 0

If (Len(txtSam1Serial.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam1Serial.ClipText + "0"
Else
TmpStr = txtSam1Serial.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I
          de.rscmdPhoneStation!Sam1Serial = TmpStr
          
If (Len(txtSam2Serial.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam2Serial.ClipText + "0"
Else
TmpStr = txtSam2Serial.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I
          
          de.rscmdPhoneStation!Sam2Serial = TmpStr
If (Len(txtSam3Serial.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam3Serial.ClipText + "0"
Else
TmpStr = txtSam3Serial.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I

          de.rscmdPhoneStation!Sam3Serial = TmpStr
If (Len(txtSam4Serial.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam4Serial.ClipText + "0"
Else
TmpStr = txtSam4Serial.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I

          de.rscmdPhoneStation!Sam4Serial = TmpStr
        
If (Len(txtSam1Pin.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam1Pin.ClipText + "0"
Else
TmpStr = txtSam1Pin.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I
          de.rscmdPhoneStation!Sam1Pin = TmpStr

If (Len(txtSam2Pin.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam2Pin.ClipText + "0"
Else
TmpStr = txtSam2Pin.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I
          de.rscmdPhoneStation!Sam2Pin = TmpStr

If (Len(txtSam3Pin.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam3Pin.ClipText + "0"
Else
TmpStr = txtSam3Pin.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I
          de.rscmdPhoneStation!Sam3Pin = TmpStr

If (Len(txtSam4Pin.ClipText) Mod 2 <> 0) Then
TmpStr = txtSam4Pin.ClipText + "0"
Else
TmpStr = txtSam4Pin.ClipText
End If
For I = 1 To (20 - Len(TmpStr))
TmpStr = "0" + TmpStr
Next I
          de.rscmdPhoneStation!Sam4Pin = TmpStr
        
        
          de.rscmdPhoneStation!SAm1Type = cboSam1Type.ListIndex
          de.rscmdPhoneStation!SAm2Type = cboSam2Type.ListIndex
          de.rscmdPhoneStation!SAm3Type = cboSam3Type.ListIndex
          de.rscmdPhoneStation!SAm4Type = cboSam4Type.ListIndex
           de.rscmdPhoneStation!Called = 0
        Case 6:
            Select Case sstCityAreaSetting.Tab
               Case 0:
                    de.rscmdCity!CityName = txtCityName.Text
                    de.rscmdCity!CityNumber = Int(Val(txtCityNumber.Text))
                    de.rscmdCity!ChargeArea = Int(Val(dtcAreaSelection.BoundText))
            
               Case 1:
                    de.rscmdCharggingArea!AreaName = txtAreaName.Text
                    de.rscmdCharggingArea!AreaNumber = Int(Val(txtAreaNumber.Text))

            End Select
        Case 8:
            de.rscmdWhiteList!FromNo = mtxtWCardNoFrom.ClipText
            de.rscmdWhiteList!ToNo = mtxtWCardNoTo.ClipText
            de.rscmdWhiteList!F1 = CByte("&H" + Trim(Str(txtwf1)))
            de.rscmdWhiteList!F2 = CByte("&H" + Trim(Str(txtwf2)))
            de.rscmdWhiteList!F3 = CByte(txtwf3)
            de.rscmdWhiteList!F4 = CByte(txtwf4)
            de.rscmdWhiteList!F5 = CByte(txtwf5)
            de.rscmdWhiteList!F6 = CByte(txtwf6)
            de.rscmdWhiteList!F7 = CByte(txtwf7)

   '         SetWhiteListRecordSet
        Case 10:
            de.rscmdCharggingScheduller!toHour1 = CByte(toHour1.Text)
          de.rscmdCharggingScheduller!toMinute1 = CByte(toMinute1.Text)
          de.rscmdCharggingScheduller!SelectedZone1 = CByte(UsedZone1.Text)
            
            de.rscmdCharggingScheduller!toHour2 = CByte(toHour2.Text)
          de.rscmdCharggingScheduller!toMinute2 = CByte(toMinute2.Text)
          de.rscmdCharggingScheduller!SelectedZone2 = CByte(UsedZone2.Text)
            
            de.rscmdCharggingScheduller!toHour3 = CByte(toHour3.Text)
          de.rscmdCharggingScheduller!toMinute3 = CByte(toMinute3.Text)
          de.rscmdCharggingScheduller!SelectedZone3 = CByte(UsedZone3.Text)
            
            de.rscmdCharggingScheduller!toHour4 = CByte(toHour4.Text)
          de.rscmdCharggingScheduller!toMinute4 = CByte(toMinute4.Text)
          de.rscmdCharggingScheduller!SelectedZone4 = CByte(UsedZone4.Text)
            
            de.rscmdCharggingScheduller!toHour5 = CByte(toHour5.Text)
          de.rscmdCharggingScheduller!toMinute5 = CByte(toMinute5.Text)
          de.rscmdCharggingScheduller!SelectedZone5 = CByte(UsedZone5.Text)
          
          de.rscmdCharggingScheduller!SelectedZone6 = CByte(UsedZone6.Text)
            
            Case 12:
            SetChargeLevelData
            
     End Select
     
End Sub

Private Sub SetText()
'On Error Resume Next
    Select Case sstDataEntry.Tab
        Case 0:
            mtxtPMSTelNo.Text = de.rscmdPMSTelNo!ID
        Case 1:
          ' SetTextBlackList
           mtxtCardNoFrom.Text = MyFormat(de.rscmdBlackList!FromNo, mtxtCardNoFrom.Mask)
            mtxtCardNoTo.Text = MyFormat(de.rscmdBlackList!ToNo, mtxtCardNoTo.Mask)
            txtbf1.Text = Hex(de.rscmdBlackList!F1)
            txtbf2.Text = Hex(de.rscmdBlackList!F2)
            txtbf3.Text = de.rscmdBlackList!F3
            txtbf4.Text = de.rscmdBlackList!F4
            txtbf5.Text = de.rscmdBlackList!F5
            txtbf6.Text = de.rscmdBlackList!F6
            txtbf7.Text = de.rscmdBlackList!F7

        Case 2:
            mtxtFreeTelNo.Text = MyFormat(de.rscmdFreeTelNo!ID, mtxtFreeTelNo.Mask)
        Case 3:
            mtxtPreNoFrom.Text = MyFormat(de.rscmdChargging!PreNoFrom, mtxtPreNoFrom.Mask)
            mtxtPreNoTo.Text = MyFormat(de.rscmdChargging!PreNoTo, mtxtPreNoTo.Mask)
            mtxtChargeLevel.Text = MyFormat(de.rscmdChargging!ChargeLevel, mtxtChargeLevel.Mask)
            
             dtcCharggingArea.BoundText = de.rscmdChargging!CharggingArea
        
        Case 4:
            mtxtMessageSerial.Text = MyFormat(de.rscmdMessage!ID, mtxtMessageSerial.Mask)
            txtDescription.Text = de.rscmdMessage!Description
        Case 5:
            mtxtPhoneStationSerial.Text = MyFormat(de.rscmdPhoneStation!ID, mtxtPhoneStationSerial.Mask)
        
            mtxtPayphoneXD.Text = MyFormat(de.rscmdPhoneStation!PayphoneXD, mtxtPayphoneXD.Mask)
            
            mtxtPhoneStationTelNo.Text = MyFormat(de.rscmdPhoneStation!TelNo, mtxtPhoneStationTelNo.Mask)
          '  mtxtPhoneStationDESFunc.Text = MyFormat(de.rscmdPhoneStation!DESFunc, mtxtPhoneStationDESFunc.Mask)
            mtxtPhoneStationHour.Text = MyFormat(Hex(de.rscmdPhoneStation!SendDataHour), mtxtPhoneStationHour.Mask)
            mtxtPhoneStationMinute.Text = MyFormat(Hex(de.rscmdPhoneStation!SendDataMinute), mtxtPhoneStationMinute.Mask)
            txtPhoneStationAddress.Text = de.rscmdPhoneStation!Address
            cboCharggingType.ListIndex = (Val(de.rscmdPhoneStation!CharggingType) - 160) \ 10
            cboCharggingRoutin.ListIndex = (Val(de.rscmdPhoneStation!charggingRoutin) - 160) \ 10
        
        txtSam1Serial.Text = MyFormat2(de.rscmdPhoneStation!Sam1Serial, txtSam1Serial.Mask)
        txtSam2Serial.Text = MyFormat2(de.rscmdPhoneStation!Sam2Serial, txtSam2Serial.Mask)
        txtSam3Serial.Text = MyFormat2(de.rscmdPhoneStation!Sam3Serial, txtSam3Serial.Mask)
        txtSam4Serial.Text = MyFormat2(de.rscmdPhoneStation!Sam4Serial, txtSam4Serial.Mask)
        
        txtSam1Pin.Text = MyFormat2(de.rscmdPhoneStation!Sam1Pin, txtSam1Pin.Mask)
        txtSam2Pin.Text = MyFormat2(de.rscmdPhoneStation!Sam2Pin, txtSam2Pin.Mask)
        txtSam3Pin.Text = MyFormat2(de.rscmdPhoneStation!Sam3Pin, txtSam3Pin.Mask)
        txtSam4Pin.Text = MyFormat2(de.rscmdPhoneStation!Sam4Pin, txtSam4Pin.Mask)
        
        cboSam1Type.ListIndex = Val(de.rscmdPhoneStation!SAm1Type)
        cboSam2Type.ListIndex = Val(de.rscmdPhoneStation!SAm2Type)
        cboSam3Type.ListIndex = Val(de.rscmdPhoneStation!SAm3Type)
        cboSam4Type.ListIndex = Val(de.rscmdPhoneStation!SAm4Type)
        
        cboDialingRule.ListIndex = (Val(de.rscmdPhoneStation!DialingRule) - 160) \ 10
       cboPhoneAccessLevel.ListIndex = (Val(de.rscmdPhoneStation!PhoneAccessLevel) - 160) \ 10
       cboDialingType.ListIndex = (Val(de.rscmdPhoneStation!DialingType) - 160) \ 10
       cboRinger.ListIndex = (Val(de.rscmdPhoneStation!Ringer) - 160) \ 10
       cboAntiTapActivate.ListIndex = (Val(de.rscmdPhoneStation!AntiTapActivate) - 160) \ 10
       
       cboReportScheduling.ListIndex = Val(de.rscmdPhoneStation!ReportScheduling) - 1
       cboPhoneGroup.ListIndex = Val(de.rscmdPhoneStation!PhoneGroup) - 1
        txtSoftwareVersion.Text = Val(de.rscmdPhoneStation!SoftwareVersion)
        dtcPhoneCitySelect.BoundText = Val(de.rscmdPhoneStation!phoneCity)
        Case 6:
            Select Case sstCityAreaSetting.Tab
               Case 0:
                   txtCityName.Text = de.rscmdCity!CityName
                   txtCityNumber.Text = de.rscmdCity!CityNumber
                   dtcAreaSelection.BoundText = de.rscmdCity!ChargeArea

               Case 1:
                   txtAreaName.Text = de.rscmdCharggingArea!AreaName
                   txtAreaNumber.Text = de.rscmdCharggingArea!AreaNumber
                    
            End Select
        Case 8:
   '    SetTextWhiteList
         
            mtxtWCardNoFrom.Text = MyFormat(de.rscmdWhiteList!FromNo, mtxtWCardNoFrom.Mask)
            mtxtWCardNoTo.Text = MyFormat(de.rscmdWhiteList!ToNo, mtxtWCardNoTo.Mask)
            txtwf1.Text = Hex(de.rscmdWhiteList!F1)
            txtwf2.Text = Hex(de.rscmdWhiteList!F2)
            txtwf3.Text = de.rscmdWhiteList!F3
            txtwf4.Text = de.rscmdWhiteList!F4
            txtwf5.Text = de.rscmdWhiteList!F5
            txtwf6.Text = de.rscmdWhiteList!F6
            txtwf7.Text = de.rscmdWhiteList!F7
 
        Case 9:
        
        Case 10:
        toHour1.Text = de.rscmdCharggingScheduller!toHour1
        toMinute1.Text = de.rscmdCharggingScheduller!toMinute1
        UsedZone1.Text = de.rscmdCharggingScheduller!SelectedZone1
        fromHour1.Text = toHour1.Text
        fromMinute1.Text = Val(toMinute1.Text) + 1
        If Val(fromMinute1.Text) > 59 Then
                fromMinute1.Text = 0
        fromHour1.Text = Val(fromHour1.Text) + 1
        End If
        
        toHour2.Text = de.rscmdCharggingScheduller!toHour2
        toMinute2.Text = de.rscmdCharggingScheduller!toMinute2
        UsedZone2.Text = de.rscmdCharggingScheduller!SelectedZone2
        fromHour2.Text = toHour2.Text
        fromMinute2.Text = Val(toMinute2.Text) + 1
        If Val(fromMinute2.Text) > 59 Then
                fromMinute2.Text = 0
        fromHour2.Text = Val(fromHour2.Text) + 1
        End If
 
        toHour3.Text = de.rscmdCharggingScheduller!toHour3
        toMinute3.Text = de.rscmdCharggingScheduller!toMinute3
        UsedZone3.Text = de.rscmdCharggingScheduller!SelectedZone3
        fromHour3.Text = toHour3.Text
        fromMinute3.Text = Val(toMinute3.Text) + 1
        If Val(fromMinute3.Text) > 59 Then
                fromMinute3.Text = 0
        fromHour3.Text = Val(fromHour3.Text) + 1
        End If
        
        toHour4.Text = de.rscmdCharggingScheduller!toHour4
        toMinute4.Text = de.rscmdCharggingScheduller!toMinute4
        UsedZone4.Text = de.rscmdCharggingScheduller!SelectedZone4
        fromHour4.Text = toHour4.Text
        fromMinute4.Text = Val(toMinute4.Text) + 1
        If Val(fromMinute4.Text) > 59 Then
                fromMinute4.Text = 0
        fromHour4.Text = Val(fromHour4.Text) + 1
        End If
        
        toHour5.Text = de.rscmdCharggingScheduller!toHour5
        toMinute5.Text = de.rscmdCharggingScheduller!toMinute5
        UsedZone5.Text = de.rscmdCharggingScheduller!SelectedZone5
        fromHour5.Text = toHour5.Text
        fromMinute5.Text = Val(toMinute5.Text) + 1
        If Val(fromMinute5.Text) > 59 Then
                fromMinute5.Text = 0
        fromHour5.Text = Val(fromHour5.Text) + 1
        End If
        
        UsedZone6.Text = de.rscmdCharggingScheduller!SelectedZone6
        
        Case 11:
        txtDayType.Text = de.rscmdDayType!DayType
        txtDayMonth.Text = de.rscmdDayType!DayMonth
        txtDayDay.Text = de.rscmdDayType!DayDay
        
        Case 12:
        SetTextChargeLevel
     End Select
End Sub

Private Sub SetTextChargeLevel()
Dim tmpTenMiliSec As Integer
Dim tmpSec As Integer
Dim tmpTimeSlotHi As Integer
Dim tmpTimeSlotLo As Integer
Dim tmpTimeSlot As Integer

       txtChargeLevel = de.rscmdChargeLevel!ChargeLevel
      '''''''''''
       txtChargePulseCoef(0) = de.rscmdChargeLevel!PulseCoefZ1
       tmpTimeSlotHi = de.rscmdChargeLevel!TimeSlotHiZ1
       tmpTimeSlotLo = de.rscmdChargeLevel!TimeSlotLoZ1
       tmpTimeSlot = ((tmpTimeSlotHi * 256) Or tmpTimeSlotLo)
       txtChargeSec(0) = tmpTimeSlot \ 100
       txtChargeTenMiliSec(0) = tmpTimeSlot Mod 100
          '''''''''''
       txtChargePulseCoef(1) = de.rscmdChargeLevel!PulseCoefZ2
       tmpTimeSlotHi = de.rscmdChargeLevel!TimeSlotHiZ2
       tmpTimeSlotLo = de.rscmdChargeLevel!TimeSlotLoZ2
       tmpTimeSlot = ((tmpTimeSlotHi * 256) Or tmpTimeSlotLo)
       txtChargeSec(1) = tmpTimeSlot \ 100
       txtChargeTenMiliSec(1) = tmpTimeSlot Mod 100
          '''''''''''
       txtChargePulseCoef(2) = de.rscmdChargeLevel!PulseCoefZ3
       tmpTimeSlotHi = de.rscmdChargeLevel!TimeSlotHiZ3
       tmpTimeSlotLo = de.rscmdChargeLevel!TimeSlotLoZ3
       tmpTimeSlot = ((tmpTimeSlotHi * 256) Or tmpTimeSlotLo)
       txtChargeSec(2) = tmpTimeSlot \ 100
       txtChargeTenMiliSec(2) = tmpTimeSlot Mod 100
          '''''''''''
       txtChargePulseCoef(3) = de.rscmdChargeLevel!PulseCoefZ4
       tmpTimeSlotHi = de.rscmdChargeLevel!TimeSlotHiZ4
       tmpTimeSlotLo = de.rscmdChargeLevel!TimeSlotLoZ4
       tmpTimeSlot = ((tmpTimeSlotHi * 256) Or tmpTimeSlotLo)
       txtChargeSec(3) = tmpTimeSlot \ 100
       txtChargeTenMiliSec(3) = tmpTimeSlot Mod 100
          '''''''''''
       txtChargePulseCoef(4) = de.rscmdChargeLevel!PulseCoefZ5
       tmpTimeSlotHi = de.rscmdChargeLevel!TimeSlotHiZ5
       tmpTimeSlotLo = de.rscmdChargeLevel!TimeSlotLoZ5
       tmpTimeSlot = ((tmpTimeSlotHi * 256) Or tmpTimeSlotLo)
       txtChargeSec(4) = tmpTimeSlot \ 100
       txtChargeTenMiliSec(4) = tmpTimeSlot Mod 100
          '''''''''''
       txtChargePulseCoef(5) = de.rscmdChargeLevel!PulseCoefZ6
       tmpTimeSlotHi = de.rscmdChargeLevel!TimeSlotHiZ6
       tmpTimeSlotLo = de.rscmdChargeLevel!TimeSlotLoZ6
       tmpTimeSlot = ((tmpTimeSlotHi * 256) Or tmpTimeSlotLo)
       txtChargeSec(5) = tmpTimeSlot \ 100
       txtChargeTenMiliSec(5) = tmpTimeSlot Mod 100

End Sub
Private Sub SetChargeLevelData()

Dim tmpTenMiliSec As Integer
Dim tmpSec As Integer
Dim tmpTimeSlotHi As Integer
Dim tmpTimeSlotLo As Integer
Dim tmpTimeSlot As Integer

        de.rscmdChargeLevel!ChargeLevel = txtChargeLevel
        
       de.rscmdChargeLevel!PulseCoefZ1 = txtChargePulseCoef(0)
       de.rscmdChargeLevel!PulseCoefZ2 = txtChargePulseCoef(1)
       de.rscmdChargeLevel!PulseCoefZ3 = txtChargePulseCoef(2)
       de.rscmdChargeLevel!PulseCoefZ4 = txtChargePulseCoef(3)
       de.rscmdChargeLevel!PulseCoefZ5 = txtChargePulseCoef(4)
       de.rscmdChargeLevel!PulseCoefZ6 = txtChargePulseCoef(5)
''''''''''''''''''
        tmpTenMiliSec = txtChargeTenMiliSec(0)
        tmpSec = txtChargeSec(0)
        tmpTimeSlot = ((tmpSec * 100) + tmpTenMiliSec)
        tmpTimeSlotLo = tmpTimeSlot And 255
        tmpTimeSlotHi = (tmpTimeSlot And 65280) / 256
        de.rscmdChargeLevel!TimeSlotHiZ1 = CByte(tmpTimeSlotHi)
        de.rscmdChargeLevel!TimeSlotLoZ1 = CByte(tmpTimeSlotLo)
''''''''''''''''''
        tmpTenMiliSec = txtChargeTenMiliSec(1)
        tmpSec = txtChargeSec(1)
        tmpTimeSlot = ((tmpSec * 100) + tmpTenMiliSec)
        tmpTimeSlotLo = tmpTimeSlot And 255
        tmpTimeSlotHi = (tmpTimeSlot And 65280) / 256
        de.rscmdChargeLevel!TimeSlotHiZ2 = CByte(tmpTimeSlotHi)
        de.rscmdChargeLevel!TimeSlotLoZ2 = CByte(tmpTimeSlotLo)
''''''''''''''''''
        tmpTenMiliSec = txtChargeTenMiliSec(2)
        tmpSec = txtChargeSec(2)
        tmpTimeSlot = ((tmpSec * 100) + tmpTenMiliSec)
        tmpTimeSlotLo = tmpTimeSlot And 255
        tmpTimeSlotHi = (tmpTimeSlot And 65280) / 256
        de.rscmdChargeLevel!TimeSlotHiZ3 = CByte(tmpTimeSlotHi)
        de.rscmdChargeLevel!TimeSlotLoZ3 = CByte(tmpTimeSlotLo)
''''''''''''''''''
        tmpTenMiliSec = txtChargeTenMiliSec(3)
        tmpSec = txtChargeSec(3)
        tmpTimeSlot = ((tmpSec * 100) + tmpTenMiliSec)
        tmpTimeSlotLo = tmpTimeSlot And 255
        tmpTimeSlotHi = (tmpTimeSlot And 65280) / 256
        de.rscmdChargeLevel!TimeSlotHiZ4 = CByte(tmpTimeSlotHi)
        de.rscmdChargeLevel!TimeSlotLoZ4 = CByte(tmpTimeSlotLo)
''''''''''''''''''
        tmpTenMiliSec = txtChargeTenMiliSec(4)
        tmpSec = txtChargeSec(4)
        tmpTimeSlot = ((tmpSec * 100) + tmpTenMiliSec)
        tmpTimeSlotLo = tmpTimeSlot And 255
        tmpTimeSlotHi = (tmpTimeSlot And 65280) / 256
        de.rscmdChargeLevel!TimeSlotHiZ5 = CByte(tmpTimeSlotHi)
        de.rscmdChargeLevel!TimeSlotLoZ5 = CByte(tmpTimeSlotLo)
''''''''''''''''''
        tmpTenMiliSec = txtChargeTenMiliSec(5)
        tmpSec = txtChargeSec(5)
        tmpTimeSlot = ((tmpSec * 100) + tmpTenMiliSec)
        tmpTimeSlotLo = tmpTimeSlot And 255
        tmpTimeSlotHi = (tmpTimeSlot And 65280) / 256
        de.rscmdChargeLevel!TimeSlotHiZ6 = CByte(tmpTimeSlotHi)
        de.rscmdChargeLevel!TimeSlotLoZ6 = CByte(tmpTimeSlotLo)

End Sub
Private Function MyFormat(No, Mask As String) As String
    Dim MaskLen, NoLen As Integer
    
    MaskLen = Len(Mask)
    NoLen = Len(Trim(Str(No)))
    
    MyFormat = Trim(Str(No)) & String(MaskLen - NoLen, "_")
End Function
Private Function MyFormat2(No As String, Mask As String) As String
    Dim MaskLen, NoLen As Integer
    
    MaskLen = Len(Mask) - 9
    NoLen = Len(No)
    For I = 1 To NoLen
        
        MyFormat2 = MyFormat2 + Mid(No, I, 1)
        If (I Mod 2 = 0) And (I <> NoLen) Then MyFormat2 = MyFormat2 + " "
        
    Next I
If (NoLen <> MaskLen) Then
 If (MaskLen - NoLen = 1) Then
        MyFormat2 = MyFormat2 + "_"
 
 Else
 
    If ((MaskLen - NoLen) Mod 2 = 0) Then
        MyFormat2 = MyFormat2 + " "
    
        For I = 1 To (MaskLen - NoLen)

        MyFormat2 = MyFormat2 + "_"
        If (I Mod 2 = 0) And (I <> (MaskLen - NoLen)) Then MyFormat2 = MyFormat2 + " "

        Next I

     Else
        MyFormat2 = MyFormat2 + "_ "
        For I = 1 To (MaskLen - NoLen - 1)
            MyFormat2 = MyFormat2 + "_"
            If (I Mod 2 = 0) And (I <> (MaskLen - NoLen - 1)) Then MyFormat2 = MyFormat2 + " "
        Next I
    End If
End If
End If

End Function


Private Sub optUpdateType_Click(Index As Integer)
    If (optUpdateType(Index).Value = True) Then
        Select Case Index
            Case 0:
                dtcPhoneStation.Enabled = True
                txtPhoneStationFrom.Enabled = False
                txtPhoneStationTo.Enabled = False
                txtPhoneStationSet.Enabled = False
                 cboSavePhoneGroup.Enabled = False
            Case 1:
                dtcPhoneStation.Enabled = False
                txtPhoneStationFrom.Enabled = True
                txtPhoneStationTo.Enabled = True
                txtPhoneStationSet.Enabled = False
                 cboSavePhoneGroup.Enabled = False
            Case 2:
                dtcPhoneStation.Enabled = False
                txtPhoneStationFrom.Enabled = False
                txtPhoneStationTo.Enabled = False
                txtPhoneStationSet.Enabled = True
                 cboSavePhoneGroup.Enabled = False
            Case 3:
                dtcPhoneStation.Enabled = False
                txtPhoneStationFrom.Enabled = False
                txtPhoneStationTo.Enabled = False
                txtPhoneStationSet.Enabled = False
                cboSavePhoneGroup.Enabled = False

            Case 4:
                dtcPhoneStation.Enabled = False
                txtPhoneStationFrom.Enabled = False
                txtPhoneStationTo.Enabled = False
                txtPhoneStationSet.Enabled = False
                cboSavePhoneGroup.Enabled = True
        End Select
    End If
End Sub

Private Sub timSendDataToFile_Timer()

End Sub

Private Sub ShowUpdateInfo()
    Dim strSql As String
                    strSql = "Select * From UpdateInfo"
                     OpenRecordset de.rscmdUpdateInfo, strSql
        
        With de.rscmdUpdateInfo
            chkPmsNumUpdate.Value = (!PMSNumUpdateSw And 1)
            chkFreeNumUpdate.Value = (!FreeNumUpdateSw And 1)
            chkChargingUpdate.Value = (!ChargingUpdateSw And 1)
            chkChargeSchedullerUpdate.Value = (!ChargeSchedullerUpdateSw And 1)
            chkBlackListUpdate.Value = (!BlackListUpdateSw And 1)
            chkWhiteListUpdate.Value = (!WhiteListUpdateSw And 1)
            chkSamUpdate.Value = (!SamUpdateSw And 1)
            chkMessageUpdate.Value = (!MessageUpdateSw And 1)
            chkSettingUpdate.Value = (!SettingUpdateSw And 1)
            chkDayTypeUpdate.Value = (!DayTypeUpdateSw And 1)
         chkProgramUpdate.Value = (!ProgramUpdateSw And 1)
         chkSynchronize.Value = (!SynchronizeSw And 1)
        
        End With
        de.rscmdUpdateInfo.Close

End Sub

Private Sub SetUpdateInfo()
    Dim strSql As String
                        strSql = "Select * From UpdateInfo"
                  OpenRecordset de.rscmdUpdateInfo, strSql

        With de.rscmdUpdateInfo

              de.rscmdUpdateInfo!PMSNumUpdateSw = chkPmsNumUpdate.Value
          de.rscmdUpdateInfo!FreeNumUpdateSw = chkFreeNumUpdate.Value
         de.rscmdUpdateInfo!ChargingUpdateSw = chkChargingUpdate.Value
        de.rscmdUpdateInfo!ChargeSchedullerUpdateSw = chkChargeSchedullerUpdate.Value
      de.rscmdUpdateInfo!BlackListUpdateSw = chkBlackListUpdate.Value
      de.rscmdUpdateInfo!WhiteListUpdateSw = chkWhiteListUpdate.Value
      de.rscmdUpdateInfo!SamUpdateSw = chkSamUpdate.Value
         de.rscmdUpdateInfo!MessageUpdateSw = chkMessageUpdate.Value
         de.rscmdUpdateInfo!SettingUpdateSw = chkSettingUpdate.Value
         de.rscmdUpdateInfo!DayTypeUpdateSw = chkDayTypeUpdate.Value
         de.rscmdUpdateInfo!ProgramUpdateSw = chkProgramUpdate.Value
        de.rscmdUpdateInfo!SynchronizeSw = chkSynchronize.Value
             .Update
        End With
        de.rscmdUpdateInfo.Close

End Sub
Private Sub SetAccessCondition()

If (PhoneStationTableAccessSW = False) Then
fraSam.Visible = False
fraPhoneInfo.Enabled = False
fraReportSchedule.Enabled = False
fraSystemSetting.Enabled = False
End If


If MessageTableAccessSW = False Then
fraMessage.Visible = False
End If

If CharggingTableAccessSW = False Then
fraChrging.Enabled = False
End If

If UpdateInfoTableAccessSW = False Then
fraUpdateInfo.Enabled = False
End If

If SamSettingTableAccessSW = False Then
dtgSamSetting.Visible = False
End If

If RegisterInPhoneAccessSW = False Then
End If

If PmsNumTableAccessSW = False Then
fraPmsNum.Enabled = False
End If

If FreeNumTableAccessSW = False Then
fraFreeNum.Enabled = False
End If

If CardListTableAccessSW = False Then
fraWhiteList.Enabled = False
fraBlackList.Enabled = False
End If

If PhoneRepairTableAccessSW = False Then
fraRepair.Enabled = False
End If
End Sub
Private Sub RegisterUserActivity(APack As UserDBActivity)
Dim strSql As String


                With de.rscmdUserDBOrientedActivity
                    strSql = "Select * From UserDBOrientedActivity"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdUserDBOrientedActivity, strSql
                    End If
                    
                    .AddNew
                    
                    !UserId = UserId
                    !Time = Str(Time)
                    !Date = Str(Date)
    Select Case APack.ActivityCode
        Case 1: 'New
                        !ActivityCodeRef = "New"
        Case 2: 'Delete
                        !ActivityCodeRef = "Delete"
        Case 3: 'Edit
                        !ActivityCodeRef = "Edit"
        
    End Select
                    !TableName = APack.TableName
                    !F1 = APack.F1
                    !F2 = APack.F2
                    !F3 = APack.F3
                    !F4 = APack.F4
                    !F5 = APack.F5
                    !F6 = APack.F6
                    !F7 = APack.F7
                    !F8 = APack.F8
                    !F9 = APack.F9
                    !F10 = APack.F10
                    !F11 = APack.F11
                    !F12 = APack.F12
                    !F13 = APack.F13
                    !F14 = APack.F14
                    !F15 = APack.F15
                    !F16 = APack.F16
                    !F17 = APack.F17
                    !F18 = APack.F18
                    !F19 = APack.F19
                    !F20 = APack.F20
                    !F21 = APack.F21
                    !F22 = APack.F22
                    !F23 = APack.F23
                    !F24 = APack.F24
                    !F25 = APack.F25
                    !F26 = APack.F26
                    !F27 = APack.F27
                    !F28 = APack.F28
                    !F29 = APack.F29
                    !F30 = APack.F30
                    
                    .Update
                End With
    
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Private Sub RefreshMessege()
txtMessege.Text = ""
For I = 0 To 511
MsgMap(I) = 255
Next I
CharCount = 0
End Sub


Private Sub Command1_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 0
txtMessege.Text = txtMessege.Text + "«" + " "
Case 1:
MsgMap(CharCount) = 1
txtMessege.Text = txtMessege.Text + "«"
Case 2:
MsgMap(CharCount) = 2
txtMessege.Text = txtMessege.Text + " " + "¬" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command10_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 35
txtMessege.Text = txtMessege.Text + " " + "œ"
Case 1:
MsgMap(CharCount) = 36
txtMessege.Text = txtMessege.Text + "œ"
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command11_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 37
txtMessege.Text = txtMessege.Text + " " + "–"
Case 1:
MsgMap(CharCount) = 38
txtMessege.Text = txtMessege.Text + "–"
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command12_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 39
txtMessege.Text = txtMessege.Text + " " + "—"
Case 1:
MsgMap(CharCount) = 40
txtMessege.Text = txtMessege.Text + "—"
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command13_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 41
txtMessege.Text = txtMessege.Text + " " + "“"
Case 1:
MsgMap(CharCount) = 42
txtMessege.Text = txtMessege.Text + "“"
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command14_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 43
txtMessege.Text = txtMessege.Text + " " + "é"
Case 1:
MsgMap(CharCount) = 44
txtMessege.Text = txtMessege.Text + "é"
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command15_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 45
txtMessege.Text = txtMessege.Text + " " + "”"
Case 1:
MsgMap(CharCount) = 46
txtMessege.Text = txtMessege.Text + "”"
Case 2:
MsgMap(CharCount) = 47
txtMessege.Text = txtMessege.Text + "”" + " "
Case 3:
MsgMap(CharCount) = 48
txtMessege.Text = txtMessege.Text + " " + "”" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command16_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 49
txtMessege.Text = txtMessege.Text + " " + "‘"
Case 1:
MsgMap(CharCount) = 50
txtMessege.Text = txtMessege.Text + "‘"
Case 2:
MsgMap(CharCount) = 51
txtMessege.Text = txtMessege.Text + "‘" + " "
Case 3:
MsgMap(CharCount) = 52
txtMessege.Text = txtMessege.Text + " " + "‘" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command17_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 53
txtMessege.Text = txtMessege.Text + " " + "’"
Case 1:
MsgMap(CharCount) = 54
txtMessege.Text = txtMessege.Text + "’"
Case 2:
MsgMap(CharCount) = 55
txtMessege.Text = txtMessege.Text + "’" + " "
Case 3:
MsgMap(CharCount) = 56
txtMessege.Text = txtMessege.Text + " " + "’" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command18_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 57
txtMessege.Text = txtMessege.Text + " " + "÷"
Case 1:
MsgMap(CharCount) = 58
txtMessege.Text = txtMessege.Text + "÷"
Case 2:
MsgMap(CharCount) = 59
txtMessege.Text = txtMessege.Text + "÷" + " "
Case 3:
MsgMap(CharCount) = 60
txtMessege.Text = txtMessege.Text + " " + "÷" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command19_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 61
txtMessege.Text = txtMessege.Text + " " + "ÿ"
Case 1:
MsgMap(CharCount) = 62
txtMessege.Text = txtMessege.Text + "ÿ"
Case 2:
MsgMap(CharCount) = 63
txtMessege.Text = txtMessege.Text + "ÿ" + " "
Case 3:
MsgMap(CharCount) = 64
txtMessege.Text = txtMessege.Text + " " + "ÿ" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command2_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 3
txtMessege.Text = txtMessege.Text + " " + "»"
Case 1:
MsgMap(CharCount) = 4
txtMessege.Text = txtMessege.Text + "»"
Case 2:
MsgMap(CharCount) = 5
txtMessege.Text = txtMessege.Text + "»" + " "
Case 3:
MsgMap(CharCount) = 6
txtMessege.Text = txtMessege.Text + " " + "»" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command20_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 65
txtMessege.Text = txtMessege.Text + " " + "Ÿ"
Case 1:
MsgMap(CharCount) = 66
txtMessege.Text = txtMessege.Text + "Ÿ"
Case 2:
MsgMap(CharCount) = 67
txtMessege.Text = txtMessege.Text + "Ÿ" + " "
Case 3:
MsgMap(CharCount) = 68
txtMessege.Text = txtMessege.Text + " " + "Ÿ" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command21_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 69
txtMessege.Text = txtMessege.Text + " " + "⁄"
Case 1:
MsgMap(CharCount) = 70
txtMessege.Text = txtMessege.Text + "⁄"
Case 2:
MsgMap(CharCount) = 71
txtMessege.Text = txtMessege.Text + "⁄" + " "
Case 3:
MsgMap(CharCount) = 72
txtMessege.Text = txtMessege.Text + " " + "⁄" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command22_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 73
txtMessege.Text = txtMessege.Text + " " + "€"
Case 1:
MsgMap(CharCount) = 74
txtMessege.Text = txtMessege.Text + "€"
Case 2:
MsgMap(CharCount) = 75
txtMessege.Text = txtMessege.Text + "€" + " "
Case 3:
MsgMap(CharCount) = 76
txtMessege.Text = txtMessege.Text + " " + "€" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command23_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 77
txtMessege.Text = txtMessege.Text + " " + "›"
Case 1:
MsgMap(CharCount) = 78
txtMessege.Text = txtMessege.Text + "›"
Case 2:
MsgMap(CharCount) = 79
txtMessege.Text = txtMessege.Text + "›" + " "
Case 3:
MsgMap(CharCount) = 80
txtMessege.Text = txtMessege.Text + " " + "›" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command24_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 81
txtMessege.Text = txtMessege.Text + " " + "ﬁ"
Case 1:
MsgMap(CharCount) = 82
txtMessege.Text = txtMessege.Text + "ﬁ"
Case 2:
MsgMap(CharCount) = 83
txtMessege.Text = txtMessege.Text + "ﬁ" + " "
Case 3:
MsgMap(CharCount) = 84
txtMessege.Text = txtMessege.Text + " " + "ﬁ" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command25_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 85
txtMessege.Text = txtMessege.Text + " " + "ò"
Case 1:
MsgMap(CharCount) = 86
txtMessege.Text = txtMessege.Text + "ò"
Case 2:
MsgMap(CharCount) = 87
txtMessege.Text = txtMessege.Text + "ò" + " "
Case 3:
MsgMap(CharCount) = 88
txtMessege.Text = txtMessege.Text + " " + "ò" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command26_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 89
txtMessege.Text = txtMessege.Text + " " + "ê"
Case 1:
MsgMap(CharCount) = 90
txtMessege.Text = txtMessege.Text + "ê"
Case 2:
MsgMap(CharCount) = 91
txtMessege.Text = txtMessege.Text + "ê" + " "
Case 3:
MsgMap(CharCount) = 92
txtMessege.Text = txtMessege.Text + " " + "ê" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command27_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 93
txtMessege.Text = txtMessege.Text + " " + "·"
Case 1:
MsgMap(CharCount) = 94
txtMessege.Text = txtMessege.Text + "·"
Case 2:
MsgMap(CharCount) = 95
txtMessege.Text = txtMessege.Text + "·" + " "
Case 3:
MsgMap(CharCount) = 96
txtMessege.Text = txtMessege.Text + " " + "·" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command28_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 97
txtMessege.Text = txtMessege.Text + " " + "„"
Case 1:
MsgMap(CharCount) = 98
txtMessege.Text = txtMessege.Text + "„"
Case 2:
MsgMap(CharCount) = 99
txtMessege.Text = txtMessege.Text + "„" + " "
Case 3:
MsgMap(CharCount) = 100
txtMessege.Text = txtMessege.Text + " " + "„" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command29_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 101
txtMessege.Text = txtMessege.Text + " " + "‰"
Case 1:
MsgMap(CharCount) = 102
txtMessege.Text = txtMessege.Text + "‰"
Case 2:
MsgMap(CharCount) = 103
txtMessege.Text = txtMessege.Text + "‰" + " "
Case 3:
MsgMap(CharCount) = 104
txtMessege.Text = txtMessege.Text + " " + "‰" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command3_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 7
txtMessege.Text = txtMessege.Text + " " + "Å"
Case 1:
MsgMap(CharCount) = 8
txtMessege.Text = txtMessege.Text + "Å"
Case 2:
MsgMap(CharCount) = 9
txtMessege.Text = txtMessege.Text + "Å" + " "
Case 3:
MsgMap(CharCount) = 10
txtMessege.Text = txtMessege.Text + " " + "Å" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command30_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 105
txtMessege.Text = txtMessege.Text + " " + "Ê"
Case 1:
MsgMap(CharCount) = 106
txtMessege.Text = txtMessege.Text + "Ê"
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command31_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 107
txtMessege.Text = txtMessege.Text + " " + "Â"
Case 1:
MsgMap(CharCount) = 108
txtMessege.Text = txtMessege.Text + "Â"
Case 2:
MsgMap(CharCount) = 109
txtMessege.Text = txtMessege.Text + "Â" + " "
Case 3:
MsgMap(CharCount) = 110
txtMessege.Text = txtMessege.Text + " " + "Â" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command32_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 111
txtMessege.Text = txtMessege.Text + " " + "Ì"
Case 1:
MsgMap(CharCount) = 112
txtMessege.Text = txtMessege.Text + "Ì"
Case 2:
MsgMap(CharCount) = 113
txtMessege.Text = txtMessege.Text + "Ì" + " "
Case 3:
MsgMap(CharCount) = 114
txtMessege.Text = txtMessege.Text + " " + "Ì" + " "
End Select
CharCount = CharCount + 1
End Sub



Private Sub Command4_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 11
txtMessege.Text = txtMessege.Text + " " + " "
Case 1:
MsgMap(CharCount) = 12
txtMessege.Text = txtMessege.Text + " "
Case 2:
MsgMap(CharCount) = 13
txtMessege.Text = txtMessege.Text + " " + " "
Case 3:
MsgMap(CharCount) = 14
txtMessege.Text = txtMessege.Text + " " + " " + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command5_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 15
txtMessege.Text = txtMessege.Text + " " + "À"
Case 1:
MsgMap(CharCount) = 16
txtMessege.Text = txtMessege.Text + "À"
Case 2:
MsgMap(CharCount) = 17
txtMessege.Text = txtMessege.Text + "À" + " "
Case 3:
MsgMap(CharCount) = 18
txtMessege.Text = txtMessege.Text + " " + "À" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command6_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 19
txtMessege.Text = txtMessege.Text + " " + "Ã"
Case 1:
MsgMap(CharCount) = 20
txtMessege.Text = txtMessege.Text + "Ã"
Case 2:
MsgMap(CharCount) = 21
txtMessege.Text = txtMessege.Text + "Ã" + " "
Case 3:
MsgMap(CharCount) = 22
txtMessege.Text = txtMessege.Text + " " + "Ã" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command7_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 23
txtMessege.Text = txtMessege.Text + " " + "ç"
Case 1:
MsgMap(CharCount) = 24
txtMessege.Text = txtMessege.Text + "ç"
Case 2:
MsgMap(CharCount) = 25
txtMessege.Text = txtMessege.Text + "ç" + " "
Case 3:
MsgMap(CharCount) = 26
txtMessege.Text = txtMessege.Text + " " + "ç" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command8_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 27
txtMessege.Text = txtMessege.Text + " " + "Õ"
Case 1:
MsgMap(CharCount) = 28
txtMessege.Text = txtMessege.Text + "Õ"
Case 2:
MsgMap(CharCount) = 29
txtMessege.Text = txtMessege.Text + "Õ" + " "
Case 3:
MsgMap(CharCount) = 30
txtMessege.Text = txtMessege.Text + " " + "Õ" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub Command9_Click(Index As Integer)
Select Case Index
Case 0:
MsgMap(CharCount) = 31
txtMessege.Text = txtMessege.Text + " " + "Œ"
Case 1:
MsgMap(CharCount) = 32
txtMessege.Text = txtMessege.Text + "Œ"
Case 2:
MsgMap(CharCount) = 33
txtMessege.Text = txtMessege.Text + "Œ" + " "
Case 3:
MsgMap(CharCount) = 34
txtMessege.Text = txtMessege.Text + " " + "Œ" + " "
End Select
CharCount = CharCount + 1
End Sub

Private Sub key_Click(Index As Integer)
invisible_all_keys
Select Case Index
Case 0:
For I = 0 To 2
Command1(I).Visible = True
Next I

Command1(0).Left = key(Index).Left
Command1(1).Left = Command1(0).Left
Command1(2).Left = Command1(0).Left

Command1(0).Top = key(Index).Top
Command1(1).Top = Command1(0).Top + Command1(0).Height
Command1(2).Top = Command1(1).Top + Command1(0).Height

Case 1:
For I = 0 To 3
Command2(I).Visible = True
Next I
Command2(0).Left = key(Index).Left
Command2(0).Top = key(Index).Top
For I = 1 To 3
Command2(I).Left = Command2(I - 1).Left
Command2(I).Top = Command2(I - 1).Top + Command2(I - 1).Height
Next I

Case 2:

For I = 0 To 3
Command3(I).Visible = True
Next I
Command3(0).Left = key(Index).Left
Command3(0).Top = key(Index).Top
For I = 1 To 3
Command3(I).Left = Command3(I - 1).Left
Command3(I).Top = Command3(I - 1).Top + Command3(I - 1).Height
Next I

Case 3:
For I = 0 To 3
Command4(I).Visible = True
Next I
Command4(0).Left = key(Index).Left
Command4(0).Top = key(Index).Top
For I = 1 To 3
Command4(I).Left = Command4(I - 1).Left
Command4(I).Top = Command4(I - 1).Top + Command4(I - 1).Height
Next I

Case 4:
For I = 0 To 3
Command5(I).Visible = True
Next I
Command5(0).Left = key(Index).Left
Command5(0).Top = key(Index).Top
For I = 1 To 3
Command5(I).Left = Command5(I - 1).Left
Command5(I).Top = Command5(I - 1).Top + Command5(I - 1).Height
Next I

Case 5:
For I = 0 To 3
Command6(I).Visible = True
Next I
Command6(0).Left = key(Index).Left
Command6(0).Top = key(Index).Top
For I = 1 To 3
Command6(I).Left = Command6(I - 1).Left
Command6(I).Top = Command6(I - 1).Top + Command6(I - 1).Height
Next I

Case 6:
For I = 0 To 3
Command7(I).Visible = True
Next I
Command7(0).Left = key(Index).Left
Command7(0).Top = key(Index).Top
For I = 1 To 3
Command7(I).Left = Command7(I - 1).Left
Command7(I).Top = Command7(I - 1).Top + Command7(I - 1).Height
Next I

Case 7:
For I = 0 To 3
Command8(I).Visible = True
Next I
Command8(0).Left = key(Index).Left
Command8(0).Top = key(Index).Top
For I = 1 To 3
Command8(I).Left = Command8(I - 1).Left
Command8(I).Top = Command8(I - 1).Top + Command8(I - 1).Height
Next I

Case 8:
For I = 0 To 3
Command9(I).Visible = True
Next I
Command9(0).Left = key(Index).Left
Command9(0).Top = key(Index).Top
For I = 1 To 3
Command9(I).Left = Command9(I - 1).Left
Command9(I).Top = Command9(I - 1).Top + Command9(I - 1).Height
Next I

Case 9:
For I = 0 To 1
Command10(I).Visible = True
Next I
Command10(0).Left = key(Index).Left
Command10(0).Top = key(Index).Top
For I = 1 To 1
Command10(I).Left = Command10(I - 1).Left
Command10(I).Top = Command10(I - 1).Top + Command10(I - 1).Height
Next I

Case 10:
For I = 0 To 1
Command11(I).Visible = True
Next I
Command11(0).Left = key(Index).Left
Command11(0).Top = key(Index).Top
For I = 1 To 1
Command11(I).Left = Command11(I - 1).Left
Command11(I).Top = Command11(I - 1).Top + Command11(I - 1).Height
Next I

Case 11:
For I = 0 To 1
Command12(I).Visible = True
Next I
Command12(0).Left = key(Index).Left
Command12(0).Top = key(Index).Top
For I = 1 To 1
Command12(I).Left = Command12(I - 1).Left
Command12(I).Top = Command12(I - 1).Top + Command12(I - 1).Height
Next I

Case 12:
For I = 0 To 1
Command13(I).Visible = True
Next I
Command13(0).Left = key(Index).Left
Command13(0).Top = key(Index).Top
For I = 1 To 1
Command13(I).Left = Command13(I - 1).Left
Command13(I).Top = Command13(I - 1).Top + Command13(I - 1).Height
Next I

Case 13:
For I = 0 To 1
Command14(I).Visible = True
Next I
Command14(0).Left = key(Index).Left
Command14(0).Top = key(Index).Top
For I = 1 To 1
Command14(I).Left = Command14(I - 1).Left
Command14(I).Top = Command14(I - 1).Top + Command14(I - 1).Height
Next I

Case 14:
For I = 0 To 3
Command15(I).Visible = True
Next I
Command15(0).Left = key(Index).Left
Command15(0).Top = key(Index).Top
For I = 1 To 3
Command15(I).Left = Command15(I - 1).Left
Command15(I).Top = Command15(I - 1).Top + Command15(I - 1).Height
Next I

Case 15:
For I = 0 To 3
Command16(I).Visible = True
Next I
Command16(0).Left = key(Index).Left
Command16(0).Top = key(Index).Top
For I = 1 To 3
Command16(I).Left = Command16(I - 1).Left
Command16(I).Top = Command16(I - 1).Top + Command16(I - 1).Height
Next I

Case 16:
For I = 0 To 3
Command17(I).Visible = True
Next I
Command17(0).Left = key(Index).Left
Command17(0).Top = key(Index).Top
For I = 1 To 3
Command17(I).Left = Command17(I - 1).Left
Command17(I).Top = Command17(I - 1).Top + Command17(I - 1).Height
Next I

Case 17:
For I = 0 To 3
Command18(I).Visible = True
Next I
Command18(0).Left = key(Index).Left
Command18(0).Top = key(Index).Top
For I = 1 To 3
Command18(I).Left = Command18(I - 1).Left
Command18(I).Top = Command18(I - 1).Top + Command18(I - 1).Height
Next I

Case 18:
For I = 0 To 3
Command19(I).Visible = True
Next I
Command19(0).Left = key(Index).Left
Command19(0).Top = key(Index).Top
For I = 1 To 3
Command19(I).Left = Command19(I - 1).Left
Command19(I).Top = Command19(I - 1).Top + Command19(I - 1).Height
Next I

Case 19:
For I = 0 To 3
Command20(I).Visible = True
Next I
Command20(0).Left = key(Index).Left
Command20(0).Top = key(Index).Top
For I = 1 To 3
Command20(I).Left = Command20(I - 1).Left
Command20(I).Top = Command20(I - 1).Top + Command20(I - 1).Height
Next I

Case 20:
For I = 0 To 3
Command21(I).Visible = True
Next I
Command21(0).Left = key(Index).Left
Command21(0).Top = key(Index).Top
For I = 1 To 3
Command21(I).Left = Command21(I - 1).Left
Command21(I).Top = Command21(I - 1).Top + Command21(I - 1).Height
Next I

Case 21:
For I = 0 To 3
Command22(I).Visible = True
Next I
Command22(0).Left = key(Index).Left
Command22(0).Top = key(Index).Top
For I = 1 To 3
Command22(I).Left = Command22(I - 1).Left
Command22(I).Top = Command22(I - 1).Top + Command22(I - 1).Height
Next I

Case 22:
For I = 0 To 3
Command23(I).Visible = True
Next I
Command23(0).Left = key(Index).Left
Command23(0).Top = key(Index).Top
For I = 1 To 3
Command23(I).Left = Command23(I - 1).Left
Command23(I).Top = Command23(I - 1).Top + Command23(I - 1).Height
Next I

Case 23:
For I = 0 To 3
Command24(I).Visible = True
Next I
Command24(0).Left = key(Index).Left
Command24(0).Top = key(Index).Top
For I = 1 To 3
Command24(I).Left = Command24(I - 1).Left
Command24(I).Top = Command24(I - 1).Top + Command24(I - 1).Height
Next I

Case 24:
For I = 0 To 3
Command25(I).Visible = True
Next I
Command25(0).Left = key(Index).Left
Command25(0).Top = key(Index).Top
For I = 1 To 3
Command25(I).Left = Command25(I - 1).Left
Command25(I).Top = Command25(I - 1).Top + Command25(I - 1).Height
Next I

Case 25:
For I = 0 To 3
Command26(I).Visible = True
Next I
Command26(0).Left = key(Index).Left
Command26(0).Top = key(Index).Top
For I = 1 To 3
Command26(I).Left = Command26(I - 1).Left
Command26(I).Top = Command26(I - 1).Top + Command26(I - 1).Height
Next I

Case 26:
For I = 0 To 3
Command27(I).Visible = True
Next I
Command27(0).Left = key(Index).Left
Command27(0).Top = key(Index).Top
For I = 1 To 3
Command27(I).Left = Command27(I - 1).Left
Command27(I).Top = Command27(I - 1).Top + Command27(I - 1).Height
Next I

Case 27:
For I = 0 To 3
Command28(I).Visible = True
Next I
Command28(0).Left = key(Index).Left
Command28(0).Top = key(Index).Top
For I = 1 To 3
Command28(I).Left = Command28(I - 1).Left
Command28(I).Top = Command28(I - 1).Top + Command28(I - 1).Height
Next I

Case 28:
For I = 0 To 3
Command29(I).Visible = True
Next I
Command29(0).Left = key(Index).Left
Command29(0).Top = key(Index).Top
For I = 1 To 3
Command29(I).Left = Command29(I - 1).Left
Command29(I).Top = Command29(I - 1).Top + Command29(I - 1).Height
Next I

Case 29:
For I = 0 To 1
Command30(I).Visible = True
Next I
Command30(0).Left = key(Index).Left
Command30(0).Top = key(Index).Top
For I = 1 To 1
Command30(I).Left = Command30(I - 1).Left
Command30(I).Top = Command30(I - 1).Top + Command30(I - 1).Height
Next I

Case 30:
For I = 0 To 3
Command31(I).Visible = True
Next I
Command31(0).Left = key(Index).Left
Command31(0).Top = key(Index).Top
For I = 1 To 3
Command31(I).Left = Command31(I - 1).Left
Command31(I).Top = Command31(I - 1).Top + Command31(I - 1).Height
Next I

Case 31:
For I = 0 To 3
Command32(I).Visible = True
Next I
Command32(0).Left = key(Index).Left
Command32(0).Top = key(Index).Top
For I = 1 To 3
Command32(I).Left = Command32(I - 1).Left
Command32(I).Top = Command32(I - 1).Top + Command32(I - 1).Height
Next I


End Select
End Sub
Sub invisible_all_keys()
For I = 0 To 2
Command1(I).Visible = False
Next I
For I = 0 To 3
Command2(I).Visible = False
Next I
For I = 0 To 3
Command3(I).Visible = False
Next I
For I = 0 To 3
Command4(I).Visible = False
Next I
For I = 0 To 3
Command5(I).Visible = False
Next I
For I = 0 To 3
Command6(I).Visible = False
Next I
For I = 0 To 3
Command7(I).Visible = False
Next I
For I = 0 To 3
Command8(I).Visible = False
Next I
For I = 0 To 3
Command9(I).Visible = False
Next I
For I = 0 To 1
Command10(I).Visible = False
Next I
For I = 0 To 1
Command11(I).Visible = False
Next I
For I = 0 To 1
Command12(I).Visible = False
Next I
For I = 0 To 1
Command13(I).Visible = False
Next I
For I = 0 To 1
Command14(I).Visible = False
Next I
For I = 0 To 3
Command15(I).Visible = False
Next I
For I = 0 To 3
Command16(I).Visible = False
Next I
For I = 0 To 3
Command17(I).Visible = False
Next I
For I = 0 To 3
Command18(I).Visible = False
Next I
For I = 0 To 3
Command19(I).Visible = False
Next I
For I = 0 To 3
Command20(I).Visible = False
Next I
For I = 0 To 3
Command21(I).Visible = False
Next I
For I = 0 To 3
Command22(I).Visible = False
Next I
For I = 0 To 3
Command23(I).Visible = False
Next I
For I = 0 To 3
Command24(I).Visible = False
Next I
For I = 0 To 3
Command25(I).Visible = False
Next I
For I = 0 To 3
Command26(I).Visible = False
Next I
For I = 0 To 3
Command27(I).Visible = False
Next I
For I = 0 To 3
Command28(I).Visible = False
Next I
For I = 0 To 3
Command29(I).Visible = False
Next I
For I = 0 To 1
Command30(I).Visible = False
Next I
For I = 0 To 3
Command31(I).Visible = False
Next I
For I = 0 To 3
Command32(I).Visible = False
Next I
End Sub

Private Sub SaveTextMessege()
    Open App.Path & "\Data\Messages\M" & Trim(Str(mtxtMessageSerial.ClipText)) & ".bin" For Random Access Write As #1 Len = 512
    Put #1, 1, MsgMap
    Close #1

End Sub

Private Sub RefreshSaveMessegeControls()
TotalMessegeLength = 0
            With de.rscmdShowMessege
                If (.State = adStateClosed) Then .Open
                
                If (.RecordCount > 0) Then
                    .MoveFirst
                    For indexCounter = 1 To .RecordCount
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                        TotalMessegeLength = TotalMessegeLength + Val(!length)
                        .MoveNext
                    Next indexCounter
                End If
            End With
txtTotalLength.Text = TotalMessegeLength
    
    If TotalMessegeLength > 512 Then
        cmdSaveMessegeBlock.BackColor = vbRed
    Else
        cmdSaveMessegeBlock.BackColor = vbGreen
    End If
End Sub
