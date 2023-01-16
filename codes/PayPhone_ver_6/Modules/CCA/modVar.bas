Attribute VB_Name = "modVar"
'Public strName As String
'Public fso As New FileSystemObject
Public OutgoHandler As Byte
Public OutgoSerialNumber As Long
Public OutgoTelNumber As String

'Public EmergencyEventCode As Byte
'Public EmergencyLNUM  As Byte
'Public EmergencyPPNUM  As Long
'Public EmergencyPSNUM  As Long

Option Base 0

Public FileBlockTemp As FileBlock

Public cnn As New ADODB.Connection
Public rs As New ADODB.Recordset

Public strConnectionString As String

Public strSkinPath As String

Public Const MaxRecord = 4464

Public UserID As Long
Public maxUsersID As Long
Public MaxFontNo As Integer
    
Public SheetRow As Integer, SheetCol As Integer, SheetStartCol As Integer

Public MaxYearInPhoneCall As Integer

Public HeightTemp, WidthTemp As Long

Public PortNumber(16) As Byte
Public IncomHandler As Byte
'-----------------------------

Public Type MyTelNo
    TelNo(11) As Byte
End Type
'-----------------------------

Public Type MyLong
    a As Byte
    b As Byte
    c As Byte
    d As Byte
End Type
'-----------------------------
Public Type MyCardSerialType
    a As Byte
    b As Byte
    c As Byte
    'd As Byte
    'e As Byte
    'f As Byte
End Type
'-----------------------------
Public Type MyPayphoneXD
    a As Byte
    b As Byte
    c As Byte
    d As Byte
    e As Byte
    'f As Byte
End Type
'-----------------------------

Public Type MyInteger
    a As Byte
    b As Byte
End Type
'-----------------------------

Public Type HeaderBlock
    'HeaderEventType As Byte '''''''''''''''''''''''''''''''''''''''
    HeaderPhoneStationSerial As MyLong
    HeaderDay As Byte
    HeaderMonth As Byte
    HeaderYear As Byte
    HeaderHour As Byte
    HeaderMinute As Byte
End Type
'-----------------------------
Public Type CallBlock
    CallCode As Byte
    CallHour As Byte
    CallMinute As Byte
    CallCardSerialNo As MyLong
    
    CallDuration As MyInteger
    CallInitialPrice As MyInteger
    CallDay As Byte
    CallMonth As Byte
    CallFinalPrice As MyInteger
    
    CallDistinationNumber As MyTelNo
    CallPalsCount As MyInteger
End Type
'-----------------------------

Public Type RingEventBlock
    RingEventCode As Byte
    RingEventHour As Byte
    RingEventMinute As Byte
    RingEventTelNo As MyTelNo
End Type
'-----------------------------

Public Type OtherEventBlock
    OtherEventCode As Byte
    OtherEventHour As Byte
    OtherEventMinute As Byte
End Type
'-----------------------------

Public Type PMSTelNoBlock
    PMSTelNo As MyTelNo
End Type
'-----------------------------

Public Type FreeTelNoBlock
    FreeTelNo As MyTelNo
End Type
'-----------------------------

Public Type CharggingBlock
    CharggingPreNo As MyLong
    CharggingBlockTime As Byte
    CharggingPalsPerBlockZone1 As Byte
    CharggingPalsPerBlockZone2 As Byte
    CharggingPalsPerBlockZone3 As Byte
    CharggingPalsPerBlockZone4 As Byte
    CharggingPalsPerBlockZone5 As Byte
    CharggingPalsPerBlockZone6 As Byte
    CharggingPalsPerBlockZone7 As Byte
    CharggingPalsPerBlockZone8 As Byte
    CharggingPalsPerBlockZone9 As Byte
    CharggingPalsPerBlockZone10 As Byte
End Type
'-----------------------------

Public Type BlackListBlock
    BlackListF1 As Byte
    BlackListF2F3 As Byte
    BlackListF4F5 As Byte
    BlackListF6F7 As Byte
    
    BlackListFromNo As MyCardSerialType
    BlackListToNo As MyCardSerialType
End Type
'-----------------------------
Public Type WhiteListBlock
    WhiteListF1 As Byte
    WhiteListF2F3 As Byte
    WhiteListF4F5 As Byte
    WhiteListF6F7 As Byte

    WhiteListFromNo As MyCardSerialType
    WhiteListToNo As MyCardSerialType
End Type
'-----------------------------
Public Type MessageBlock
    MessageText(511) As Byte
End Type
'-----------------------------

Public Type SetTimeBlock
    SetTimeHourSwitch As Byte
    SetTimeHourNo As Byte
    SetTimeMinuteSwitch As Byte
    SetTimeMinuteNo As Byte
End Type
'-----------------------------

Public Type AlarmBlock
    AlarmSwitch As Byte
    AlarmHour As Byte
    AlarmMinute As Byte
End Type
'-----------------------------

Public Type SetDateBlock
    SetDateDaySwitch As Byte
    SetDateDayNo As Byte
    SetDateMonthSwitch As Byte
    SetDateMonthNo As Byte
End Type
'-----------------------------

Public Type PalsPriceBlock
    PalsPriceSwitch As Byte
    PalsPriceNo As MyInteger
End Type
'-----------------------------
Public Type ChargeSchedullerBlock
    toHour1 As Byte
    toMinute1 As Byte
    UsedZone1 As Byte
    
    toHour2 As Byte
    toMinute2 As Byte
    UsedZone2 As Byte
    
    toHour3 As Byte
    toMinute3 As Byte
    UsedZone3 As Byte
    
    toHour4 As Byte
    toMinute4 As Byte
    UsedZone4 As Byte
    
    toHour5 As Byte
    toMinute5 As Byte
    UsedZone5 As Byte
    
    UsedZone6 As Byte
    
End Type
'-----------------------------

Public Type SamSettingBlock
    SamSerial(9) As Byte
    SamPinCode(9) As Byte
    SamType As Byte
End Type
'-----------------------------

Public Type FileBlock
    FileHeaderBlock  As HeaderBlock
    
    CallHeader As Integer
    FileCallBlock(199) As CallBlock
    
    RingHeader As Integer
    FileRingEventBlock(9) As RingEventBlock
    
    OtherHeader As Integer
    FileOtherEventBlock(9) As OtherEventBlock
    
    
    PayPhoneSoftwareVersion As Byte
    FileGap As String * 1
    
    FileUpdatePolicyHi As Byte
    FileUpdatePolicyLo As Byte
    
    FileChangeSW As Byte
    
    PMSHeader As Integer
    FilePMSTelNoBlock(15) As PMSTelNoBlock
    
    FreeHeader As Integer
    FileFreeTelNoBlock(19) As FreeTelNoBlock
    
    CharggingHeader As Integer
    FileCharggingBlock(299) As CharggingBlock
    
    CharggingSchedullerHeader As Integer
    FileChargeSchedullerBlock(4) As ChargeSchedullerBlock
    
    'DayTypeHeader As Integer
    FileDayTypeBlock(364) As Byte
    'BlackListHeader As Integer
    FileBlackListBlock(119) As BlackListBlock
    'WhiteListHeader As Integer
    FileWhiteListBlock(119) As WhiteListBlock
    
    SamHeader As Integer
    FileSamSettingBlock(3) As SamSettingBlock
    
    FileMessageBlock As MessageBlock
    
    FileSetTimeBlock As SetTimeBlock
    FileAlarmBlock As AlarmBlock
    FileSetDateBlock As SetDateBlock
    FilePalsPriceBlock As PalsPriceBlock
    FileNothing As Byte
    FileCharggingType As Byte
    FileCharggingRoutin As Byte
    FileAnswerTime As Byte
    FileRingCount As Byte
    FileRingManageRoutin As Byte
    FileRinger As Byte
    FileDialingRule As Byte
    FileEmergencyEvents As Byte
    FilePhoneAccessLevel As Byte
    FileDialingType As Byte
    FileReportScheduling As Byte
    FileDialWaitTime As Byte
    FileCardChangeWait As Byte
    FileCardCheckPolicy As Byte
    FileBackLightHourFrom As Byte
    FileBackLightHourTo As Byte
    FileCityCodeLen As Byte
    FileDefaultLanguage As Byte
    FilePhoneGroup As Byte
    FileChargePriority  As Byte
    FilePayphoneXD  As MyPayphoneXD
    EndGap(5) As Byte
End Type
'-----------------------------

