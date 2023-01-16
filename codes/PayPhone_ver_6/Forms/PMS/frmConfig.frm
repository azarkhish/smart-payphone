VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmConfig 
   ClientHeight    =   8880
   ClientLeft      =   2055
   ClientTop       =   1650
   ClientWidth     =   10230
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
   ScaleHeight     =   8880
   ScaleWidth      =   10230
   WindowState     =   2  'Maximized
   Begin VB.Frame fraConfig 
      Height          =   8235
      Left            =   270
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   240
      Width           =   9795
      Begin VB.CommandButton cmdExit 
         Caption         =   "Œ—ÊÃ"
         Height          =   495
         Left            =   4230
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Top             =   7605
         Width           =   1335
      End
      Begin TabDlg.SSTab sstBaseInformation 
         Height          =   7050
         Left            =   315
         TabIndex        =   2
         Top             =   360
         Width           =   9225
         _ExtentX        =   16272
         _ExtentY        =   12435
         _Version        =   393216
         TabHeight       =   520
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         TabCaption(0)   =   "ò«—»—«‰ ”Ì” „"
         TabPicture(0)   =   "frmConfig.frx":0000
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "lbl(1)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).Control(1)=   "SkinLabel1"
         Tab(0).Control(1).Enabled=   0   'False
         Tab(0).Control(2)=   "dtgUsers"
         Tab(0).Control(2).Enabled=   0   'False
         Tab(0).Control(3)=   "cmdCancel(0)"
         Tab(0).Control(3).Enabled=   0   'False
         Tab(0).Control(4)=   "cmdEdit(0)"
         Tab(0).Control(4).Enabled=   0   'False
         Tab(0).Control(5)=   "fraUser"
         Tab(0).Control(5).Enabled=   0   'False
         Tab(0).Control(6)=   "cmdDelete(0)"
         Tab(0).Control(6).Enabled=   0   'False
         Tab(0).Control(7)=   "cmdOK(0)"
         Tab(0).Control(7).Enabled=   0   'False
         Tab(0).Control(8)=   "cmdNew(0)"
         Tab(0).Control(8).Enabled=   0   'False
         Tab(0).Control(9)=   "cmdChangeUser"
         Tab(0).Control(9).Enabled=   0   'False
         Tab(0).ControlCount=   10
         TabCaption(1)   =   " ⁄—Ì› ›Ê‰ "
         TabPicture(1)   =   "frmConfig.frx":001C
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "cmdNew(1)"
         Tab(1).Control(1)=   "cmdEdit(1)"
         Tab(1).Control(2)=   "cmdOK(1)"
         Tab(1).Control(3)=   "cmdDelete(1)"
         Tab(1).Control(4)=   "fraFont"
         Tab(1).Control(5)=   "cmdCancel(1)"
         Tab(1).Control(6)=   "dtgFont"
         Tab(1).Control(7)=   "lbl(0)"
         Tab(1).ControlCount=   8
         TabCaption(2)   =   "Ÿ«Â— ‰—„ «›“«—"
         TabPicture(2)   =   "frmConfig.frx":0038
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "fraFormSkin"
         Tab(2).Control(1)=   "Frame1"
         Tab(2).ControlCount=   2
         Begin VB.CommandButton cmdChangeUser 
            Caption         =   " €ÌÌ— ò«—»—"
            Height          =   495
            Left            =   7320
            RightToLeft     =   -1  'True
            TabIndex        =   52
            Top             =   6120
            Width           =   1215
         End
         Begin VB.CommandButton cmdNew 
            Caption         =   "ÃœÌœ"
            Height          =   495
            Index           =   0
            Left            =   3360
            RightToLeft     =   -1  'True
            TabIndex        =   48
            Top             =   6120
            Width           =   1215
         End
         Begin VB.CommandButton cmdNew 
            Caption         =   "ÃœÌœ"
            Height          =   495
            Index           =   1
            Left            =   -71280
            RightToLeft     =   -1  'True
            TabIndex        =   47
            Top             =   5040
            Width           =   1695
         End
         Begin VB.CommandButton cmdEdit 
            Caption         =   "ÊÌ—«Ì‘"
            Height          =   495
            Index           =   1
            Left            =   -68940
            RightToLeft     =   -1  'True
            TabIndex        =   46
            Top             =   5040
            Width           =   1695
         End
         Begin VB.CommandButton cmdOK 
            Caption         =   " «ÌÌœ"
            Height          =   495
            Index           =   1
            Left            =   -71280
            RightToLeft     =   -1  'True
            TabIndex        =   45
            Top             =   5040
            Visible         =   0   'False
            Width           =   1695
         End
         Begin VB.CommandButton cmdOK 
            Caption         =   " «ÌÌœ"
            Height          =   495
            Index           =   0
            Left            =   2040
            RightToLeft     =   -1  'True
            TabIndex        =   44
            Top             =   6120
            Visible         =   0   'False
            Width           =   1215
         End
         Begin VB.CommandButton cmdDelete 
            Caption         =   "Õ–›"
            Height          =   495
            Index           =   1
            Left            =   -73650
            RightToLeft     =   -1  'True
            TabIndex        =   41
            Top             =   5040
            Width           =   1695
         End
         Begin VB.CommandButton cmdDelete 
            Caption         =   "Õ–›"
            Height          =   495
            Index           =   0
            Left            =   720
            RightToLeft     =   -1  'True
            TabIndex        =   40
            Top             =   6120
            Width           =   1215
         End
         Begin VB.Frame fraUser 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   3480
            Left            =   180
            RightToLeft     =   -1  'True
            TabIndex        =   19
            Top             =   2415
            Width           =   8640
            Begin VB.TextBox txtPassword 
               Alignment       =   1  'Right Justify
               Height          =   375
               IMEMode         =   3  'DISABLE
               Left            =   1470
               MaxLength       =   20
               PasswordChar    =   "*"
               RightToLeft     =   -1  'True
               TabIndex        =   37
               Top             =   240
               Width           =   1755
            End
            Begin VB.TextBox txtUserName 
               Alignment       =   1  'Right Justify
               Height          =   375
               Left            =   4290
               MaxLength       =   20
               RightToLeft     =   -1  'True
               TabIndex        =   36
               Top             =   240
               Width           =   1935
            End
            Begin VB.CheckBox chkUpdateInfoAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Tags To Update Table Access"
               ForeColor       =   &H0000FFFF&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   35
               Top             =   765
               Width           =   3435
            End
            Begin VB.CheckBox chkPhoneStationAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "PhoneStations Management Table Access"
               ForeColor       =   &H000000FF&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   34
               Top             =   1395
               Width           =   3435
            End
            Begin VB.CheckBox chkChargingAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Charging Management Tables Access"
               ForeColor       =   &H0000FFFF&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   33
               Top             =   1080
               Width           =   3435
            End
            Begin VB.CheckBox chkSamAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "SAM Settings Table Access"
               ForeColor       =   &H0000FFFF&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   32
               Top             =   1710
               Width           =   3435
            End
            Begin VB.CheckBox chkRepairAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "RepairTable Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   31
               Top             =   2025
               Width           =   3435
            End
            Begin VB.CheckBox chkStaticReportAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Statistics Reports Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   30
               Top             =   2655
               Width           =   3435
            End
            Begin VB.CheckBox chkDefaultReportAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Default Reports Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   29
               Top             =   2340
               Width           =   3435
            End
            Begin VB.CheckBox chkListReportAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "List Reports Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   540
               RightToLeft     =   -1  'True
               TabIndex        =   28
               Top             =   2970
               Width           =   3435
            End
            Begin VB.CheckBox chkPmsNumAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "PMS Number Table Access"
               ForeColor       =   &H0000FFFF&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   27
               Top             =   2025
               Width           =   3435
            End
            Begin VB.CheckBox chkFreeNumAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Free Number Table Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   26
               Top             =   2340
               Width           =   3435
            End
            Begin VB.CheckBox chkUserAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "User Management Table Access "
               ForeColor       =   &H000000FF&
               Height          =   240
               Left            =   4545
               RightToLeft     =   -1  'True
               TabIndex        =   25
               Top             =   2655
               Width           =   3525
            End
            Begin VB.CheckBox chkConnectionAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Nport Connections Table Access"
               ForeColor       =   &H0000FFFF&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   24
               Top             =   2970
               Width           =   3435
            End
            Begin VB.CheckBox chkMessageAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Message Table Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   23
               Top             =   1395
               Width           =   3435
            End
            Begin VB.CheckBox chkCardListAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "WhiteList/BlackList Table Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   22
               Top             =   1710
               Width           =   3435
            End
            Begin VB.CheckBox chkBaseInfoAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "BaseInformation Table Access"
               ForeColor       =   &H00008000&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   21
               Top             =   765
               Width           =   3435
            End
            Begin VB.CheckBox chkRegInPhoneAccess 
               Alignment       =   1  'Right Justify
               Caption         =   "Register In PayPhone Files Access"
               ForeColor       =   &H0000FFFF&
               Height          =   240
               Left            =   4635
               RightToLeft     =   -1  'True
               TabIndex        =   20
               Top             =   1080
               Width           =   3435
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   4
               Left            =   3390
               OleObjectBlob   =   "frmConfig.frx":0054
               TabIndex        =   38
               Top             =   300
               Width           =   735
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   3
               Left            =   6390
               OleObjectBlob   =   "frmConfig.frx":00BD
               TabIndex        =   39
               Top             =   300
               Width           =   735
            End
         End
         Begin VB.Frame fraFont 
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   735
            Left            =   -73650
            RightToLeft     =   -1  'True
            TabIndex        =   16
            Top             =   4170
            Width           =   6435
            Begin VB.TextBox txtFont 
               Alignment       =   1  'Right Justify
               Height          =   375
               Left            =   3420
               MaxLength       =   20
               RightToLeft     =   -1  'True
               TabIndex        =   17
               Top             =   240
               Width           =   1935
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   5
               Left            =   5580
               OleObjectBlob   =   "frmConfig.frx":0126
               TabIndex        =   18
               Top             =   300
               Width           =   735
            End
         End
         Begin VB.CommandButton cmdCancel 
            Caption         =   "«‰’—«›"
            Height          =   495
            Index           =   1
            Left            =   -68940
            RightToLeft     =   -1  'True
            TabIndex        =   15
            Top             =   5040
            Visible         =   0   'False
            Width           =   1695
         End
         Begin VB.CommandButton cmdEdit 
            Caption         =   "ÊÌ—«Ì‘"
            Height          =   495
            Index           =   0
            Left            =   6000
            RightToLeft     =   -1  'True
            TabIndex        =   14
            Top             =   6120
            Width           =   1215
         End
         Begin VB.CommandButton cmdCancel 
            Caption         =   "«‰’—«›"
            Height          =   495
            Index           =   0
            Left            =   4680
            RightToLeft     =   -1  'True
            TabIndex        =   13
            Top             =   6120
            Visible         =   0   'False
            Width           =   1215
         End
         Begin VB.Frame fraFormSkin 
            Caption         =   "   Ÿ«Â— ‰—„ «›“«—   "
            Height          =   1935
            Left            =   -73920
            RightToLeft     =   -1  'True
            TabIndex        =   5
            Top             =   1380
            Width           =   6885
            Begin VB.CheckBox chkDefaultSkin 
               Caption         =   "Ÿ«Â— ÅÌ‘ ›—÷"
               Height          =   255
               Left            =   240
               TabIndex        =   8
               Tag             =   "Users"
               Top             =   1560
               Visible         =   0   'False
               Width           =   1575
            End
            Begin VB.CommandButton cmdUnDo 
               Caption         =   "^^"
               Height          =   255
               Left            =   540
               Picture         =   "frmConfig.frx":018D
               TabIndex        =   7
               Top             =   390
               UseMaskColor    =   -1  'True
               Width           =   435
            End
            Begin VB.HScrollBar hscSkinColor 
               Height          =   315
               LargeChange     =   60
               Left            =   630
               Max             =   360
               SmallChange     =   10
               TabIndex        =   6
               Top             =   870
               Width           =   4575
            End
            Begin ACTIVESKINLibCtl.SkinLabel slblUnDo 
               Height          =   315
               Left            =   1020
               OleObjectBlob   =   "frmConfig.frx":05CF
               TabIndex        =   9
               Top             =   390
               Width           =   1395
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   0
               Left            =   5400
               OleObjectBlob   =   "frmConfig.frx":0648
               TabIndex        =   10
               Top             =   450
               Width           =   1095
            End
            Begin ACTIVESKINLibCtl.SkinLabel slbl 
               Height          =   255
               Index           =   1
               Left            =   5040
               OleObjectBlob   =   "frmConfig.frx":06BB
               TabIndex        =   11
               Top             =   960
               Width           =   1575
            End
            Begin MSDataListLib.DataCombo dtcSkinName 
               Bindings        =   "frmConfig.frx":0736
               Height          =   315
               Left            =   3630
               TabIndex        =   12
               Top             =   390
               Width           =   1575
               _ExtentX        =   2778
               _ExtentY        =   556
               _Version        =   393216
               Style           =   2
               ListField       =   "Name"
               BoundColumn     =   "FileName"
               Text            =   ""
               RightToLeft     =   -1  'True
               Object.DataMember      =   "cmdSkin"
            End
         End
         Begin VB.Frame Frame1 
            Height          =   1215
            Left            =   -73920
            RightToLeft     =   -1  'True
            TabIndex        =   3
            Top             =   3600
            Width           =   6885
            Begin VB.CommandButton cmdRegisterData 
               Caption         =   "À»  «ÿ·«⁄« "
               Enabled         =   0   'False
               Height          =   495
               Left            =   1710
               TabIndex        =   4
               Top             =   360
               Width           =   3495
            End
         End
         Begin MSDataGridLib.DataGrid dtgUsers 
            Bindings        =   "frmConfig.frx":0747
            Height          =   1395
            Left            =   1305
            TabIndex        =   42
            Top             =   915
            Width           =   6435
            _ExtentX        =   11351
            _ExtentY        =   2461
            _Version        =   393216
            AllowUpdate     =   -1  'True
            HeadLines       =   1
            RowHeight       =   15
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
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdUsers"
            ColumnCount     =   21
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
               DataField       =   "UserName"
               Caption         =   "UserName"
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
               DataField       =   "Password"
               Caption         =   "Password"
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
               DataField       =   "SkinName"
               Caption         =   "SkinName"
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
               DataField       =   "SkinColor"
               Caption         =   "SkinColor"
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
               DataField       =   "BaseInfoTableAccess"
               Caption         =   "BaseInfoTableAccess"
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
               DataField       =   "RegisterInPhoneFile"
               Caption         =   "RegisterInPhoneFile"
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
               DataField       =   "MessageTableAccess"
               Caption         =   "MessageTableAccess"
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
               DataField       =   "RepairTableAccess"
               Caption         =   "RepairTableAccess"
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
               DataField       =   "PhoneStationTableAccess"
               Caption         =   "PhoneStationTableAccess"
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
               DataField       =   "CardListTableAccess"
               Caption         =   "CardListTableAccess"
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
               DataField       =   "CharggingTableAccess"
               Caption         =   "CharggingTableAccess"
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
               DataField       =   "PmsNumTableAccess"
               Caption         =   "PmsNumTableAccess"
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
               DataField       =   "FreeNumTableAccess"
               Caption         =   "FreeNumTableAccess"
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
               DataField       =   "UserTableAccess"
               Caption         =   "UserTableAccess"
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
               DataField       =   "ConnectionTableAccess"
               Caption         =   "ConnectionTableAccess"
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
               DataField       =   "UpdateInfoTableAccess"
               Caption         =   "UpdateInfoTableAccess"
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
               DataField       =   "SamSettingTableAccess"
               Caption         =   "SamSettingTableAccess"
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
               DataField       =   "ReportDefaultAccess"
               Caption         =   "ReportDefaultAccess"
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
               DataField       =   "ReportListAccess"
               Caption         =   "ReportListAccess"
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
               DataField       =   "ReportStatisticsAccess"
               Caption         =   "ReportStatisticsAccess"
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
                  ColumnAllowSizing=   0   'False
                  ColumnWidth     =   1995.024
               EndProperty
               BeginProperty Column01 
                  ColumnAllowSizing=   0   'False
                  ColumnWidth     =   1995.024
               EndProperty
               BeginProperty Column02 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column03 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1739.906
               EndProperty
               BeginProperty Column04 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   675.213
               EndProperty
               BeginProperty Column05 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1544.882
               EndProperty
               BeginProperty Column06 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1454.74
               EndProperty
               BeginProperty Column07 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1530.142
               EndProperty
               BeginProperty Column08 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1365.165
               EndProperty
               BeginProperty Column09 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1860.095
               EndProperty
               BeginProperty Column10 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1484.787
               EndProperty
               BeginProperty Column11 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1635.024
               EndProperty
               BeginProperty Column12 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1500.095
               EndProperty
               BeginProperty Column13 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1544.882
               EndProperty
               BeginProperty Column14 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1230.236
               EndProperty
               BeginProperty Column15 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1709.858
               EndProperty
               BeginProperty Column16 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1725.165
               EndProperty
               BeginProperty Column17 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1709.858
               EndProperty
               BeginProperty Column18 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1530.142
               EndProperty
               BeginProperty Column19 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1244.976
               EndProperty
               BeginProperty Column20 
                  Object.Visible         =   0   'False
                  ColumnWidth     =   1649.764
               EndProperty
            EndProperty
         End
         Begin MSDataGridLib.DataGrid dtgFont 
            Bindings        =   "frmConfig.frx":0758
            Height          =   3195
            Left            =   -73650
            TabIndex        =   43
            Top             =   840
            Width           =   6435
            _ExtentX        =   11351
            _ExtentY        =   5636
            _Version        =   393216
            AllowUpdate     =   0   'False
            HeadLines       =   1
            RowHeight       =   15
            FormatLocked    =   -1  'True
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
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataMember      =   "cmdFont"
            ColumnCount     =   1
            BeginProperty Column00 
               DataField       =   "Name"
               Caption         =   "‰«„ ›Ê‰ "
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
                  ColumnWidth     =   3945.26
               EndProperty
            EndProperty
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
            Height          =   285
            Left            =   4005
            OleObjectBlob   =   "frmConfig.frx":0769
            TabIndex        =   49
            Top             =   1815
            Width           =   1320
         End
         Begin VB.Label lbl 
            Alignment       =   2  'Center
            Caption         =   "·Ì”  ò«—»—«‰"
            Height          =   255
            Index           =   1
            Left            =   3780
            RightToLeft     =   -1  'True
            TabIndex        =   51
            Top             =   600
            Width           =   1455
         End
         Begin VB.Label lbl 
            Alignment       =   2  'Center
            Caption         =   "·Ì”  ›Ê‰ "
            Height          =   255
            Index           =   0
            Left            =   -71010
            RightToLeft     =   -1  'True
            TabIndex        =   50
            Top             =   510
            Width           =   1455
         End
      End
   End
End
Attribute VB_Name = "frmConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cmdChangeUser_Click()
    Unload Me
    Unload frmMain
    Unload mfrmMain
    frmLogin.Show
End Sub



Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdRegisterData_Click()
       
    With de.rscmdUsers
        If (.State = adStateClosed) Then .Open
        If (.RecordCount = 0) Then .AddNew
        .MoveFirst
        .Find "ID=" & UserId
        If (chkDefaultSkin.Value = vbChecked) Then
            !SkinName = "Winaqua.skn"
            !SkinColor = 0
        Else
            !SkinName = dtcSkinName.BoundText
            !SkinColor = hscSkinColor.Value
        End If
        .Update
    End With
    
    cmdRegisterData.Enabled = False
End Sub

Private Sub cmdUnDo_Click()
     On Error Resume Next
    
    With de.rscmdUsers
        If (.State = adStateClosed) Then .Open
        .MoveFirst
        .Find "ID=" & UserId
        dtcSkinName.BoundText = !SkinName
        hscSkinColor.Value = !SkinColor
  
     End With
    
End Sub
Private Sub EnableDisableControls(ED As Boolean, Index As Integer)
    Select Case Index
        Case 0:
            dtgUsers.Enabled = ED
        Case 1:
            dtgFont.Enabled = ED
        End Select
    cmdDelete(Index).Visible = ED
    cmdCancel(Index).Visible = Not ED
    cmdOK(Index).Visible = Not ED
   ' cmdExit.Visible = ED
    
    cmdDelete(Index).Enabled = ED
    cmdCancel(Index).Enabled = Not ED
    cmdOK(Index).Enabled = Not ED
   ' cmdExit.Enabled = ED
    
End Sub

Private Sub dtcSkinName_Change()
On Error Resume Next
    FormSkin.Empty
    FormSkin.LoadSkin App.Path & "\Scin\" & dtcSkinName.BoundText
    FormSkin.GetImages.SetHue hscSkinColor.Value, False
    SetSkin frmMain
    SetSkin frmConfig
    cmdRegisterData.Enabled = True
End Sub

Private Sub Form_Load()
SetAccessCondition
    SetSkin frmConfig

End Sub

Private Sub cmdDelete_Click(Index As Integer)
        
       Select Case Index
        Case 0:
           If UserTableAccessSW = True Then
            If MsgBox("¬Ì« „«Ì·Ìœ ò«—»— „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = 7 Then
                Exit Sub
            End If
            With de.rscmdUsers
                If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                    .Delete
                    .Update
                       
                End If
            End With
          End If
        Case 1:
           If MsgBox("¬Ì« „«Ì·Ìœ ›Ê‰  „Ê—œ ‰Ÿ— —« Õ–› ò‰Ìœø", vbYesNo, "Â‘œ«—") = 7 Then
             Exit Sub
           End If

         With de.rscmdFont
             If Not (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
                   .Delete
                   .Update
                End If
         End With
        

   End Select
End Sub

Private Function CheckData(Index As Integer) As Boolean
    CheckData = True
    Select Case Index
        Case 0:
        If UserTableAccessSW = True Then
            If Trim(txtUserName.Text) = "" Then
                CheckData = False
                MsgBox "·ÿ›« ‰«„ ò«—»— —« Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                txtUserName.SetFocus
                Exit Function
            End If
            End If
         Case 1:
                If Trim(txtFont.Text) = "" Then
                CheckData = False
                MsgBox "·ÿ›« ‰«„ ›Ê‰  —« Ê«—œ ò‰Ìœ", vbOKOnly, "         Œÿ«"
                txtFont.SetFocus
                Exit Function
           End If
        
    End Select
    
End Function
Private Sub cmdEdit_Click(Index As Integer)
    SetText Index
    EditState = True
    EnableDisableControls False, Index
End Sub
Private Sub dtgFont_DblClick()
 On Error GoTo EH
    SetText 1
    EnableDisableControls False, 2
    EditState = True
EH:
End Sub
Private Sub dtgConnection_DblClick()
 On Error GoTo EH
    EditState = True
EH:
End Sub
Private Sub dtgUsers_DblClick()
    On Error GoTo EH
    SetText 0
    'EnableDisableControls False, 0
    EditState = True
EH:
End Sub

Private Sub SetText(Index As Integer)
    Select Case Index
        Case 0:
            With de.rscmdUsers
                txtUserName = !UserName
                txtPassword = !Password
                chkBaseInfoAccess.Value = !BaseInfoTableAccess And 1
                chkCardListAccess.Value = !CardListTableAccess And 1
                chkChargingAccess.Value = !CharggingTableAccess And 1
                chkConnectionAccess.Value = !ConnectionTableAccess And 1
                chkDefaultReportAccess = !ReportDefaultAccess And 1
                chkFreeNumAccess.Value = !FreeNumTableAccess And 1
                chkListReportAccess.Value = !ReportListAccess And 1
                chkMessageAccess.Value = !MessageTableAccess And 1
                chkPhoneStationAccess.Value = !PhoneStationTableAccess And 1
                chkPmsNumAccess.Value = !PmsNumTableAccess And 1
                chkRegInPhoneAccess.Value = !RegisterInPhoneFile And 1
                chkRepairAccess.Value = !RepairTableAccess And 1
                chkSamAccess.Value = !SamSettingTableAccess And 1
                chkStaticReportAccess.Value = !ReportStatisticsAccess And 1
                chkUpdateInfoAccess.Value = !UpdateInfoTableAccess And 1
                chkUserAccess.Value = !UserTableAccess And 1
            End With
        Case 1:
            With de.rscmdFont
                txtFont.Text = !Name
            End With
     End Select
     
End Sub

Private Sub cmdCancel_Click(Index As Integer)
    EditState = False
    EnableDisableControls True, Index
    ClearText Index
End Sub

Private Sub ClearText(Index As Integer)
    Select Case Index
        Case 0:
            txtUserName.Text = ""
            txtPassword.Text = ""
        Case 1:
            txtFont.Text = ""
     End Select
End Sub

Private Sub cmdNew_Click(Index As Integer)
     Dim strSql As String

    If (CheckData(Index)) Then
        Select Case Index
            Case 0:
            If UserTableAccessSW = True Then
                With de.rscmdUsers
                    strSql = "Select * From Users"
                    If (.State = adStateClosed) Then
                        OpenRecordset de.rscmdUsers, strSql
                    End If
                    
                    .AddNew
                    SetRecordset Index
                    .Update
                End With
                End If
              Case 1:
                With de.rscmdFont
                     strSql = "Select * From Font"
                     If (.State = adStateClosed) Then
                         OpenRecordset de.rscmdFont, strSql
                        Exit Sub
                    End If

                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                    .AddNew
                     SetRecordset Index
                    .Update
            
                End With
                     
           End Select
      End If
        
End Sub

Private Sub cmdOK_Click(Index As Integer)
    Dim strSql As String
    
    If (CheckData(Index)) Then
    Select Case Index
        
        Case 0:
        
            If UserTableAccessSW = True Then
            With de.rscmdUsers
                    strSql = "Select * From Users "
                    If (.State = adStateClosed) Then
                         OpenRecordset de.rscmdUsers, strSql
                        Exit Sub
                    End If

                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                
                     SetRecordset Index
                    .Update
                End With
         End If
         Case 1:
                With de.rscmdFont
                     strSql = "Select * From Font"
                     If (.State = adStateClosed) Then
                         OpenRecordset de.rscmdFont, strSql
                        Exit Sub
                    End If

                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit Sub
                    
                     SetRecordset Index
                    .Update
            
                End With
      End Select
      
      
   End If
End Sub


Private Sub SetRecordset(Index As Integer)
    Dim rs As New ADODB.Recordset
    Dim strSQL1 As String
    Dim strSQL2 As String
    
    strSQL1 = "Select Max(ID) AS M From Users"
                rs.Open strSQL1, de.cnnTelephone
                maxUsersID = IIf(Not IsNull(rs!m), rs!m + 1, 100)
                rs.Close
    strSQL2 = "Select Max(ID) AS M From Font"
                rs.Open strSQL2, de.cnnTelephone
                MaxFontNo = IIf(Not IsNull(rs!m), rs!m + 1, 1)
                rs.Close
    
    Select Case Index
        Case 0:
            With de.rscmdUsers
                !UserName = Trim(txtUserName)
                !Password = Trim(txtPassword)
                !SkinName = "WinAqua.skn"
                 !SkinColor = 0
                
                  !BaseInfoTableAccess = chkBaseInfoAccess.Value
                 !CardListTableAccess = chkCardListAccess.Value
                  !CharggingTableAccess = chkChargingAccess.Value
                 !ConnectionTableAccess = chkConnectionAccess.Value
                  !ReportDefaultAccess = chkDefaultReportAccess
                !FreeNumTableAccess = chkFreeNumAccess.Value
                  !ReportListAccess = chkListReportAccess.Value
                  !MessageTableAccess = chkMessageAccess.Value
                  !PhoneStationTableAccess = chkPhoneStationAccess.Value
                  !PmsNumTableAccess = chkPmsNumAccess.Value
                  !RegisterInPhoneFile = chkRegInPhoneAccess.Value
                  !RepairTableAccess = chkRepairAccess.Value
                 !SamSettingTableAccess = chkSamAccess.Value
                  !ReportStatisticsAccess = chkStaticReportAccess.Value
                !UpdateInfoTableAccess = chkUpdateInfoAccess.Value
                 !UserTableAccess = chkUserAccess.Value

               
                maxUsersID = maxUsersID + 1
                !ID = maxUsersID
                txtUserName.Text = ""
                txtPassword.Text = ""
            End With
            
         Case 1:
            With de.rscmdFont
                !Name = Trim(txtFont)
                !ID = MaxFontNo
                txtFont.Text = ""
            End With
            
    End Select
    
        EditState = False
        EnableDisableControls True, Index
       
End Sub

Private Sub Form_Resize()
    With fraConfig
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
    End With
End Sub

Private Sub hscSkinColor_Change()
     FormSkin.GetImages.SetHue hscSkinColor.Value, False
     
End Sub
Private Sub SetAccessCondition()
If UserTableAccessSW = False Then
  dtgUsers.Visible = False
  fraUser.Visible = False
  cmdOK(0).Visible = False
  cmdDelete(0).Visible = False
  cmdNew(0).Visible = False
  cmdCancel(0).Visible = False
  cmdEdit(0).Visible = False
  End If

End Sub
