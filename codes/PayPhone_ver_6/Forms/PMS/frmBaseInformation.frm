VERSION 5.00
Object = "{74848F95-A02A-4286-AF0C-A3C755E4A5B3}#1.0#0"; "actskn43.ocx"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmBaseInformation 
   ClientHeight    =   8880
   ClientLeft      =   2655
   ClientTop       =   2640
   ClientWidth     =   10395
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
   ScaleWidth      =   10395
   WindowState     =   2  'Maximized
   Begin VB.Frame fraBaseInformation 
      Height          =   8685
      Left            =   180
      RightToLeft     =   -1  'True
      TabIndex        =   0
      Top             =   60
      Width           =   10095
      Begin VB.CommandButton cmdRegisterInFile 
         Caption         =   "ËÈÊ ÏÑ ÏÓÊÇååÇí ÊáÝä "
         Enabled         =   0   'False
         Height          =   495
         Left            =   720
         RightToLeft     =   -1  'True
         TabIndex        =   30
         Top             =   8100
         Width           =   1935
      End
      Begin VB.CommandButton cmdRegisterInDataBase 
         Caption         =   "ËÈÊ ÏÑ ÈÇä˜ ÇØáÇÚÇÊí"
         Height          =   495
         Left            =   2760
         RightToLeft     =   -1  'True
         TabIndex        =   29
         Top             =   8100
         Width           =   1935
      End
      Begin VB.Frame Fra 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   5325
         Index           =   0
         Left            =   135
         RightToLeft     =   -1  'True
         TabIndex        =   11
         Top             =   585
         Width           =   9795
         Begin VB.Frame Frame4 
            Height          =   1725
            Left            =   1170
            RightToLeft     =   -1  'True
            TabIndex        =   67
            Top             =   2100
            Width           =   3225
            Begin VB.TextBox txtCurrentYear 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   630
               RightToLeft     =   -1  'True
               TabIndex        =   75
               Top             =   1260
               Width           =   765
            End
            Begin VB.ComboBox cboCardCheckPolicy 
               Height          =   315
               ItemData        =   "frmBaseInformation.frx":0000
               Left            =   120
               List            =   "frmBaseInformation.frx":000E
               RightToLeft     =   -1  'True
               TabIndex        =   73
               Top             =   840
               Width           =   1695
            End
            Begin VB.TextBox txtCityCode 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   630
               RightToLeft     =   -1  'True
               TabIndex        =   71
               Top             =   480
               Width           =   765
            End
            Begin VB.TextBox txtNewPlasPrice 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   630
               RightToLeft     =   -1  'True
               TabIndex        =   68
               Top             =   120
               Width           =   765
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   0
               Left            =   1350
               OleObjectBlob   =   "frmBaseInformation.frx":0034
               TabIndex        =   69
               Top             =   120
               Width           =   1065
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   2
               Left            =   210
               OleObjectBlob   =   "frmBaseInformation.frx":00A5
               TabIndex        =   70
               Top             =   120
               Width           =   345
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   29
               Left            =   1350
               OleObjectBlob   =   "frmBaseInformation.frx":0104
               TabIndex        =   72
               Top             =   480
               Width           =   1785
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   27
               Left            =   1800
               OleObjectBlob   =   "frmBaseInformation.frx":0185
               TabIndex        =   74
               Top             =   960
               Width           =   1485
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   13
               Left            =   1410
               OleObjectBlob   =   "frmBaseInformation.frx":01FC
               TabIndex        =   76
               Top             =   1230
               Width           =   735
            End
         End
         Begin VB.Frame Frame3 
            Height          =   1725
            Left            =   5520
            RightToLeft     =   -1  'True
            TabIndex        =   50
            Top             =   2100
            Width           =   3225
            Begin VB.ListBox lstNewMonthSign 
               Height          =   255
               ItemData        =   "frmBaseInformation.frx":0263
               Left            =   720
               List            =   "frmBaseInformation.frx":026F
               RightToLeft     =   -1  'True
               TabIndex        =   62
               Top             =   1080
               Width           =   495
            End
            Begin VB.ListBox lstNewMinuteSign 
               Height          =   255
               ItemData        =   "frmBaseInformation.frx":0279
               Left            =   720
               List            =   "frmBaseInformation.frx":0285
               RightToLeft     =   -1  'True
               TabIndex        =   61
               Top             =   780
               Width           =   495
            End
            Begin VB.TextBox txtMonthShift 
               Alignment       =   1  'Right Justify
               Height          =   285
               Left            =   1230
               RightToLeft     =   -1  'True
               TabIndex        =   60
               Top             =   1080
               Width           =   375
            End
            Begin VB.TextBox txtNewMinute 
               Alignment       =   1  'Right Justify
               Height          =   285
               Left            =   1230
               RightToLeft     =   -1  'True
               TabIndex        =   59
               Top             =   780
               Width           =   375
            End
            Begin VB.TextBox txtNewHour 
               Alignment       =   1  'Right Justify
               Height          =   285
               Left            =   1230
               RightToLeft     =   -1  'True
               TabIndex        =   58
               Top             =   180
               Width           =   375
            End
            Begin VB.ListBox lstNewDaySign 
               Height          =   255
               ItemData        =   "frmBaseInformation.frx":028F
               Left            =   720
               List            =   "frmBaseInformation.frx":029B
               RightToLeft     =   -1  'True
               TabIndex        =   53
               Top             =   480
               Width           =   495
            End
            Begin VB.ListBox lstNewHourSign 
               Height          =   255
               ItemData        =   "frmBaseInformation.frx":02A5
               Left            =   720
               List            =   "frmBaseInformation.frx":02B1
               RightToLeft     =   -1  'True
               TabIndex        =   52
               Top             =   210
               Width           =   495
            End
            Begin VB.TextBox txtDayShift 
               Alignment       =   1  'Right Justify
               Height          =   285
               Left            =   1230
               RightToLeft     =   -1  'True
               TabIndex        =   51
               Top             =   480
               Width           =   375
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   1
               Left            =   1560
               OleObjectBlob   =   "frmBaseInformation.frx":02BB
               TabIndex        =   54
               Top             =   180
               Width           =   1515
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   6
               Left            =   180
               OleObjectBlob   =   "frmBaseInformation.frx":033A
               TabIndex        =   55
               Top             =   210
               Width           =   495
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   9
               Left            =   1560
               OleObjectBlob   =   "frmBaseInformation.frx":0399
               TabIndex        =   56
               Top             =   480
               Width           =   1215
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   10
               Left            =   330
               OleObjectBlob   =   "frmBaseInformation.frx":0416
               TabIndex        =   57
               Top             =   480
               Width           =   345
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   7
               Left            =   1590
               OleObjectBlob   =   "frmBaseInformation.frx":0473
               TabIndex        =   63
               Top             =   780
               Width           =   1425
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   8
               Left            =   240
               OleObjectBlob   =   "frmBaseInformation.frx":04F4
               TabIndex        =   64
               Top             =   780
               Width           =   405
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   11
               Left            =   1590
               OleObjectBlob   =   "frmBaseInformation.frx":0555
               TabIndex        =   65
               Top             =   1080
               Width           =   1275
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   12
               Left            =   420
               OleObjectBlob   =   "frmBaseInformation.frx":05D2
               TabIndex        =   66
               Top             =   1080
               Width           =   225
            End
         End
         Begin VB.Frame Frame2 
            Height          =   1725
            Left            =   1170
            RightToLeft     =   -1  'True
            TabIndex        =   44
            Top             =   210
            Width           =   3225
            Begin VB.ComboBox cboRingManageRoutine 
               Height          =   315
               ItemData        =   "frmBaseInformation.frx":062F
               Left            =   300
               List            =   "frmBaseInformation.frx":0642
               RightToLeft     =   -1  'True
               TabIndex        =   81
               Top             =   210
               Width           =   1035
            End
            Begin VB.TextBox txtBackLightHourFrom 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   960
               RightToLeft     =   -1  'True
               TabIndex        =   80
               Top             =   1260
               Width           =   375
            End
            Begin VB.TextBox txtRingCount 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   570
               RightToLeft     =   -1  'True
               TabIndex        =   79
               Top             =   570
               Width           =   765
            End
            Begin VB.ComboBox cboDefaultLanguage 
               Height          =   315
               ItemData        =   "frmBaseInformation.frx":065E
               Left            =   300
               List            =   "frmBaseInformation.frx":0676
               RightToLeft     =   -1  'True
               TabIndex        =   78
               Top             =   900
               Width           =   1035
            End
            Begin VB.TextBox txtBackLightHourTo 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   330
               RightToLeft     =   -1  'True
               TabIndex        =   47
               Top             =   1260
               Width           =   375
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   21
               Left            =   1560
               OleObjectBlob   =   "frmBaseInformation.frx":0698
               TabIndex        =   45
               Top             =   570
               Width           =   1575
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   30
               Left            =   1590
               OleObjectBlob   =   "frmBaseInformation.frx":0719
               TabIndex        =   46
               Top             =   900
               Width           =   1185
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   18
               Left            =   1380
               OleObjectBlob   =   "frmBaseInformation.frx":0790
               TabIndex        =   48
               Top             =   1260
               Width           =   1725
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   28
               Left            =   780
               OleObjectBlob   =   "frmBaseInformation.frx":0811
               TabIndex        =   49
               Top             =   1260
               Width           =   135
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   26
               Left            =   1470
               OleObjectBlob   =   "frmBaseInformation.frx":086C
               TabIndex        =   77
               Top             =   210
               Width           =   1305
            End
         End
         Begin VB.Frame Frame1 
            Height          =   1725
            Left            =   5550
            RightToLeft     =   -1  'True
            TabIndex        =   32
            Top             =   180
            Width           =   3225
            Begin VB.TextBox txtAnswerTime 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   780
               RightToLeft     =   -1  'True
               TabIndex        =   41
               Top             =   1230
               Width           =   765
            End
            Begin VB.ComboBox cboChargePriority 
               Height          =   315
               ItemData        =   "frmBaseInformation.frx":08E1
               Left            =   90
               List            =   "frmBaseInformation.frx":08EB
               RightToLeft     =   -1  'True
               TabIndex        =   39
               Top             =   870
               Width           =   1455
            End
            Begin VB.TextBox txtCardChangeWait 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   780
               RightToLeft     =   -1  'True
               TabIndex        =   34
               Top             =   180
               Width           =   765
            End
            Begin VB.TextBox txtDialWaitTime 
               Alignment       =   1  'Right Justify
               Height          =   315
               Left            =   780
               RightToLeft     =   -1  'True
               TabIndex        =   33
               Top             =   540
               Width           =   765
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   22
               Left            =   1500
               OleObjectBlob   =   "frmBaseInformation.frx":0902
               TabIndex        =   35
               Top             =   180
               Width           =   1515
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   285
               Index           =   23
               Left            =   330
               OleObjectBlob   =   "frmBaseInformation.frx":097B
               TabIndex        =   36
               Top             =   180
               Width           =   285
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   24
               Left            =   1530
               OleObjectBlob   =   "frmBaseInformation.frx":09DC
               TabIndex        =   37
               Top             =   540
               Width           =   1365
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   285
               Index           =   25
               Left            =   360
               OleObjectBlob   =   "frmBaseInformation.frx":0A51
               TabIndex        =   38
               Top             =   540
               Width           =   375
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   315
               Index           =   3
               Left            =   1560
               OleObjectBlob   =   "frmBaseInformation.frx":0AB2
               TabIndex        =   40
               Top             =   870
               Width           =   1185
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   20
               Left            =   390
               OleObjectBlob   =   "frmBaseInformation.frx":0B23
               TabIndex        =   42
               Top             =   1260
               Width           =   375
            End
            Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
               Height          =   255
               Index           =   19
               Left            =   1590
               OleObjectBlob   =   "frmBaseInformation.frx":0B84
               TabIndex        =   43
               Top             =   1230
               Width           =   1005
            End
         End
         Begin VB.Frame Fra 
            Caption         =   "ÑæíÏÇÏåÇí ÇÖØÑÇÑí"
            Height          =   1275
            Index           =   1
            Left            =   330
            RightToLeft     =   -1  'True
            TabIndex        =   12
            Top             =   3960
            Width           =   8895
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   0
               Left            =   6960
               RightToLeft     =   -1  'True
               TabIndex        =   20
               Top             =   420
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   1
               Left            =   6990
               RightToLeft     =   -1  'True
               TabIndex        =   19
               Top             =   780
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   2
               Left            =   4980
               RightToLeft     =   -1  'True
               TabIndex        =   18
               Top             =   420
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   3
               Left            =   4980
               RightToLeft     =   -1  'True
               TabIndex        =   17
               Top             =   780
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   4
               Left            =   2550
               RightToLeft     =   -1  'True
               TabIndex        =   16
               Top             =   390
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   5
               Left            =   2550
               RightToLeft     =   -1  'True
               TabIndex        =   15
               Top             =   750
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   6
               Left            =   180
               RightToLeft     =   -1  'True
               TabIndex        =   14
               Top             =   420
               Width           =   225
            End
            Begin VB.CheckBox Check1 
               Alignment       =   1  'Right Justify
               Caption         =   "Check1"
               Height          =   285
               Index           =   7
               Left            =   150
               RightToLeft     =   -1  'True
               TabIndex        =   13
               Top             =   780
               Width           =   225
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   0
               Left            =   7410
               OleObjectBlob   =   "frmBaseInformation.frx":0BF1
               TabIndex        =   21
               Top             =   420
               Width           =   1275
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   1
               Left            =   7410
               OleObjectBlob   =   "frmBaseInformation.frx":0C6A
               TabIndex        =   22
               Top             =   780
               Width           =   1275
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   2
               Left            =   5220
               OleObjectBlob   =   "frmBaseInformation.frx":0CD5
               TabIndex        =   23
               Top             =   420
               Width           =   1275
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   3
               Left            =   5250
               OleObjectBlob   =   "frmBaseInformation.frx":0D4A
               TabIndex        =   24
               Top             =   780
               Width           =   1275
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   4
               Left            =   2820
               OleObjectBlob   =   "frmBaseInformation.frx":0DB1
               TabIndex        =   25
               Top             =   390
               Width           =   1785
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   5
               Left            =   2880
               OleObjectBlob   =   "frmBaseInformation.frx":0E32
               TabIndex        =   26
               Top             =   780
               Width           =   1185
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   6
               Left            =   450
               OleObjectBlob   =   "frmBaseInformation.frx":0EA7
               TabIndex        =   27
               Top             =   420
               Width           =   1215
            End
            Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
               Height          =   315
               Index           =   7
               Left            =   480
               OleObjectBlob   =   "frmBaseInformation.frx":0F1A
               TabIndex        =   28
               Top             =   780
               Width           =   1935
            End
         End
      End
      Begin VB.Frame Fra 
         Caption         =   "  ãÍá ËÈÊ  "
         Height          =   2085
         Index           =   2
         Left            =   600
         RightToLeft     =   -1  'True
         TabIndex        =   2
         Top             =   5940
         Width           =   8685
         Begin VB.OptionButton optUpdateType 
            Caption         =   "Ñæå ÊáÝä"
            Height          =   255
            Index           =   4
            Left            =   6480
            RightToLeft     =   -1  'True
            TabIndex        =   89
            Top             =   1440
            Width           =   1815
         End
         Begin VB.ComboBox cboSavePhoneGroup 
            Height          =   315
            ItemData        =   "frmBaseInformation.frx":0F97
            Left            =   660
            List            =   "frmBaseInformation.frx":0FCE
            RightToLeft     =   -1  'True
            TabIndex        =   88
            Top             =   1440
            Width           =   3105
         End
         Begin VB.OptionButton optUpdateType 
            Caption         =   "ÏÓÊÇå ÎÇÕ"
            Height          =   255
            Index           =   0
            Left            =   6480
            RightToLeft     =   -1  'True
            TabIndex        =   87
            Top             =   390
            Value           =   -1  'True
            Width           =   1815
         End
         Begin VB.OptionButton optUpdateType 
            Caption         =   "ÈÇÒå Çí ÇÒ ÊáÝäåÇ"
            Height          =   255
            Index           =   1
            Left            =   6480
            RightToLeft     =   -1  'True
            TabIndex        =   86
            Top             =   720
            Width           =   1815
         End
         Begin VB.OptionButton optUpdateType 
            Caption         =   "ãÌãæÚå Çí ÇÒ ÊáÝäåÇ"
            Height          =   255
            Index           =   2
            Left            =   6480
            RightToLeft     =   -1  'True
            TabIndex        =   85
            Top             =   1050
            Width           =   1815
         End
         Begin VB.OptionButton optUpdateType 
            Caption         =   "ÊãÇãí ÊáÝäåÇ"
            Height          =   255
            Index           =   3
            Left            =   6480
            RightToLeft     =   -1  'True
            TabIndex        =   84
            Top             =   1800
            Width           =   1815
         End
         Begin VB.TextBox txtPhoneStationTo 
            Alignment       =   1  'Right Justify
            Enabled         =   0   'False
            Height          =   315
            Left            =   660
            RightToLeft     =   -1  'True
            TabIndex        =   5
            Top             =   720
            Width           =   1335
         End
         Begin VB.TextBox txtPhoneStationSet 
            Alignment       =   1  'Right Justify
            Enabled         =   0   'False
            Height          =   315
            Left            =   660
            RightToLeft     =   -1  'True
            TabIndex        =   4
            ToolTipText     =   "ÔãÇÑå ÊáÝäåÇ ÑÇ ÈÇ "","" ÇÒ åãÏíÑ ÌÏÇ ˜äíÏ"
            Top             =   1050
            Width           =   3135
         End
         Begin VB.TextBox txtPhoneStationFrom 
            Alignment       =   1  'Right Justify
            Enabled         =   0   'False
            Height          =   315
            Left            =   2460
            RightToLeft     =   -1  'True
            TabIndex        =   3
            Top             =   720
            Width           =   1335
         End
         Begin MSDataListLib.DataCombo dtcPhoneStation 
            Bindings        =   "frmBaseInformation.frx":1041
            Height          =   315
            Left            =   660
            TabIndex        =   6
            Top             =   390
            Width           =   3135
            _ExtentX        =   5530
            _ExtentY        =   556
            _Version        =   393216
            ListField       =   "PayphoneXD"
            BoundColumn     =   "ID"
            Text            =   ""
            RightToLeft     =   -1  'True
            Object.DataMember      =   "cmdPhoneStation"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
            Height          =   315
            Index           =   14
            Left            =   3900
            OleObjectBlob   =   "frmBaseInformation.frx":1052
            TabIndex        =   7
            Top             =   390
            Width           =   1095
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
            Height          =   315
            Index           =   15
            Left            =   4020
            OleObjectBlob   =   "frmBaseInformation.frx":10BF
            TabIndex        =   8
            Top             =   720
            Width           =   795
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
            Height          =   315
            Index           =   16
            Left            =   1500
            OleObjectBlob   =   "frmBaseInformation.frx":112A
            TabIndex        =   9
            Top             =   720
            Width           =   795
         End
         Begin ACTIVESKINLibCtl.SkinLabel SkinLabel 
            Height          =   315
            Index           =   17
            Left            =   3780
            OleObjectBlob   =   "frmBaseInformation.frx":1185
            TabIndex        =   10
            Top             =   1050
            Width           =   1035
         End
         Begin ACTIVESKINLibCtl.SkinLabel slbl 
            Height          =   225
            Index           =   31
            Left            =   3960
            OleObjectBlob   =   "frmBaseInformation.frx":11EE
            TabIndex        =   83
            Top             =   1440
            Width           =   795
         End
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "ÎÑæÌ"
         Height          =   495
         Left            =   7440
         RightToLeft     =   -1  'True
         TabIndex        =   1
         Top             =   8100
         Width           =   1935
      End
      Begin ACTIVESKINLibCtl.SkinLabel lblemerg 
         Height          =   285
         Index           =   8
         Left            =   4410
         OleObjectBlob   =   "frmBaseInformation.frx":1257
         TabIndex        =   31
         Top             =   300
         Width           =   1005
      End
      Begin ACTIVESKINLibCtl.SkinLabel SkinLabel1 
         Height          =   285
         Left            =   4365
         OleObjectBlob   =   "frmBaseInformation.frx":12C6
         TabIndex        =   82
         Top             =   6525
         Width           =   1320
      End
   End
End
Attribute VB_Name = "frmBaseInformation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim EditState As Boolean






Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdRegisterInDataBase_Click()
    On Error GoTo EH
    
    If (MsgBox("ÂíÇ ãÇíáíÏ ÇÚãÇá ÊÛííÑÇÊ ÕæÑÊ íÑÏ ¿", vbYesNo, "åÔÏÇÑ") = vbNo) Then
        Exit Sub
    End If
    
    OpenRecordset de.rscmdBaseInformation
            

    SetBaseInformation
    
    MsgBox "ÇØáÇÚÇÊ ÈÇ ãæÝÞíÊ ËÈÊ ÔÏ", vbOKOnly, "ÐÎíÑå ÇØáÇÚÇÊ"
    cmdRegisterInFile.Enabled = True
    
    Exit Sub
    
EH:
    MsgBox "ÎØÇ ÏÑ ÐÎíÑå ÇØáÇÚÇÊ", vbOKOnly, "åÔÏÇÑ"

End Sub

Private Sub cmdRegisterInFile_Click()
On Error GoTo EH
    Dim optIndex As Byte
    Dim indexCounter As Integer
    Dim strQuery As String
    
    For optIndex = 0 To 3
        If (optUpdateType(optIndex).Value = True) Then Exit For
    Next optIndex
    
    Select Case optIndex
        Case 0:
            If (dtcPhoneStation.MatchedWithList) Then
                SendDataToFile dtcPhoneStation.BoundText, 1
                    MsgBox "ÈÇ ãæÝÞíÊ ÇäÌÇã ÔÏ", vbOKOnly, "ÐÎíÑå ÏÑ ÝÇíá"

            Else
                MsgBox "ÔãÇÑå ÊáÝä ãæÑÏ äÙÑ ÏÑ áíÓÊ æÌæÏ äÏÇÑÏ", vbOKOnly, "ÎØÇ"
                Exit Sub
            End If
            
        Case 1:
            On Error GoTo EH

            If (Not IsNumeric(txtPhoneStationFrom.Text) Or Not IsNumeric(txtPhoneStationTo.Text)) Then
                  MsgBox "ÔãÇÑå ÊáÝäåÇí æÑæÏí äÇÏÑÓÊ ÇÓÊ", vbOKOnly, "ÎØÇ"
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
 
            Exit Sub
           End If
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
                SendDataToFile rs!ID, 1
                rs.MoveNext
            Next indexCounter
            MsgBox "ÏÑ" + Str(rs.RecordCount) + "ÏÓÊÇå ÊáÝä ËÈÊ ÔÏ", vbOKOnly, "ÐÎíÑå ÏÑ ÝÇíá"
                
            rs.Close
            Set rs = Nothing
        
        Case 2:
        On Error GoTo EH
            strQuery = "SELECT PhoneStation.ID AS ID " & _
                       "From PhoneStation " & _
                       "WHERE PhoneStation.PayphoneXD IN (" & Trim(txtPhoneStationSet.Text) & ") ;"
                       
            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount < 0) Then
                      rs.Close
            Set rs = Nothing
            Exit Sub
           End If
            
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
                SendDataToFile rs!ID, 1
                rs.MoveNext
            Next indexCounter
            MsgBox "ÏÑ" + Str(rs.RecordCount) + "ÏÓÊÇå ÊáÝä ËÈÊ ÔÏ", vbOKOnly, "ÐÎíÑå ÏÑ ÝÇíá"
            rs.Close
            Set rs = Nothing
        
        Case 3:
            strQuery = "SELECT ID from PhoneStation;"
                       
            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount < 0) Then
                       rs.Close
            Set rs = Nothing
            Exit Sub
           End If
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
                SendDataToFile rs!ID, 1
                rs.MoveNext
            Next indexCounter
            MsgBox "ÏÑ" + Str(rs.RecordCount) + "ÏÓÊÇå ÊáÝä ËÈÊ ÔÏ", vbOKOnly, "ÐÎíÑå ÏÑ ÝÇíá"
           
            rs.Close
            Set rs = Nothing
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Case 4:
            strQuery = "SELECT PhoneStation.ID AS ID " & _
                       "From PhoneStation " & _
                       "WHERE PhoneStation.PhoneGroup=" & Val(cboSavePhoneGroup.ItemData(cboSavePhoneGroup.ListIndex))
            
            rs.Open strQuery, de.cnnTelephone, adOpenKeyset, adLockOptimistic
            
            If (rs.RecordCount <= 0) Then
            rs.Close
            Set rs = Nothing
            Exit Sub
            End If
            
            rs.MoveFirst
            
            For indexCounter = 1 To rs.RecordCount
                SendDataToFile rs!ID, 1
                rs.MoveNext
            Next indexCounter
            MsgBox "ÏÑ" + Str(rs.RecordCount) + "ÏÓÊÇå ÊáÝä ËÈÊ ÔÏ", vbOKOnly, "ÐÎíÑå ÏÑ ÝÇíá"
           
            rs.Close
            Set rs = Nothing

    End Select
Exit Sub
EH:
 MsgBox "ÎØÇ ÏÑ æÑæÏ ÏÇÏå åÇ", vbOKOnly, "ÎØÇ"

End Sub




Private Sub Form_Load()
    SetAccessCondition
    SetSkin frmBaseInformation
    SetBaseInformationText
    'PrevTab = 100
    EditState = False
End Sub


Private Sub Form_Resize()
    On Error Resume Next
    
    With fraBaseInformation
        .Top = (Height - .Height) / 2
        .Left = (Width - .Width) / 2
        
    End With
End Sub






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



Private Sub SetBaseInformationText()
'On Error Resume Next

    OpenRecordset de.rscmdBaseInformation, "Select * From BaseInformation"
    
    With de.rscmdBaseInformation
        txtCurrentYear.Text = !CurrentYear
        txtNewPlasPrice.Text = !NewPalsPrice
        txtMonthShift.Text = !MonthShift And 127
        txtDayShift.Text = !DayShift And 127
        txtNewHour.Text = !HourShift And 127
        txtNewMinute.Text = !MinuteShift And 127
        
        lstNewHourSign.ListIndex = (!HourShift And 128) \ 128
        lstNewMinuteSign.ListIndex = (!MinuteShift And 128) \ 128
        lstNewMonthSign.ListIndex = (!MonthShift And 128) \ 128
        lstNewDaySign.ListIndex = (!DayShift And 128) \ 128

        txtBackLightHourFrom.Text = Hex(!BackLightHourFrom)
        txtBackLightHourTo.Text = Hex(!BackLightHourTo)
        
        txtAnswerTime.Text = !AnswerWaitTime
        cboRingManageRoutine.ListIndex = (Val(!RingManageRoutine) - 160) \ 10
        cboCardCheckPolicy.ListIndex = (Val(!CardCheckPolicy) - 160) \ 10
        cboDefaultLanguage.ListIndex = (Val(!DefaultLanguage) - 160) \ 10

         txtRingCount.Text = !RingCount
         txtDialWaitTime.Text = !DialWaitTime
         txtCardChangeWait.Text = !CardChangeWait
         txtCityCode.Text = !CityCode
         'txtChargePriority.Text = !ChargePriority
        cboChargePriority.ListIndex = Val(!ChargePriority)

         SetEmergencyEventsText
    End With
End Sub

Private Sub SetBaseInformation()
'On Error Resume Next

    OpenRecordset de.rscmdBaseInformation, "Select * From BaseInformation"
    
    With de.rscmdBaseInformation
    
    
        !CurrentYear = Val(txtCurrentYear.Text)
        !NewPalsPrice = Val(txtNewPlasPrice.Text)
        !MonthShift = Val(txtMonthShift.Text) Or Val(lstNewMonthSign.ItemData(lstNewMonthSign.ListIndex))
        !DayShift = Val(txtDayShift.Text) Or Val(lstNewDaySign.ItemData(lstNewDaySign.ListIndex))
        !HourShift = Val(txtNewHour.Text) Or Val(lstNewHourSign.ItemData(lstNewHourSign.ListIndex))
        !MinuteShift = Val(txtNewMinute.Text) Or Val(lstNewMinuteSign.ItemData(lstNewMinuteSign.ListIndex))
        !BackLightHourFrom = CByte("&H" + txtBackLightHourFrom.Text)
        !BackLightHourTo = CByte("&H" + txtBackLightHourTo.Text)
        !AnswerWaitTime = Val(txtAnswerTime.Text)
        !RingManageRoutine = Val(cboRingManageRoutine.ItemData(cboRingManageRoutine.ListIndex))
        !CardCheckPolicy = Val(cboCardCheckPolicy.ItemData(cboCardCheckPolicy.ListIndex))
        !RingCount = Val(txtRingCount.Text)
        !DialWaitTime = Val(txtDialWaitTime.Text)
        !CardChangeWait = Val(txtCardChangeWait.Text)
        
        !CityCode = txtCityCode.Text
        !CityCodeLen = Len(txtCityCode.Text)
        !DefaultLanguage = Val(cboDefaultLanguage.ItemData(cboDefaultLanguage.ListIndex))
               
         !ChargePriority = Val(cboChargePriority.ItemData(cboChargePriority.ListIndex))
 
        SetEmergencyEvents
        .Update
    End With
End Sub

Private Sub SetEmergencyEvents()
Dim a As Byte
a = 0

    If (Check1(0).Value = 1) Then a = a Or 1
    If (Check1(1).Value = 1) Then a = a Or 2
    If (Check1(2).Value = 1) Then a = a Or 4
    If (Check1(3).Value = 1) Then a = a Or 8
    If (Check1(4).Value = 1) Then a = a Or 16
    If (Check1(5).Value = 1) Then a = a Or 32
    If (Check1(6).Value = 1) Then a = a Or 64
    If (Check1(7).Value = 1) Then a = a Or 128
de.rscmdBaseInformation!EmergencyEvents = a
End Sub

Private Sub SetEmergencyEventsText()
Dim a As Byte
a = de.rscmdBaseInformation!EmergencyEvents
If ((a And 1) <> 0) Then Check1(0).Value = 1
If ((a And 2) <> 0) Then Check1(1).Value = 1
If ((a And 4) <> 0) Then Check1(2).Value = 1
If ((a And 8) <> 0) Then Check1(3).Value = 1
If ((a And 16) <> 0) Then Check1(4).Value = 1
If ((a And 32) <> 0) Then Check1(5).Value = 1
If ((a And 64) <> 0) Then Check1(6).Value = 1
If ((a And 128) <> 0) Then Check1(7).Value = 1

End Sub
Private Sub SetAccessCondition()
    If BaseInfoTableAccessSW = False Then
        Fra(0).Enabled = False
        Fra(2).Visible = False
        cmdRegisterInDataBase.Enabled = False
        cmdRegisterInFile.Enabled = False
    End If
End Sub

