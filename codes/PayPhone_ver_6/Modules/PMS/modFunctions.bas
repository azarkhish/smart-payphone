Attribute VB_Name = "modFunctions"
Option Base 0

'This Module contains the functions called in the threads.
'They have to be in a module because you have to use the AddressOf-
'function which will only work with public functions

'API Declarations
Private Declare Function timeGetTime Lib "winmm.dll" () As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'Option Explicit


Public FormSkin As New ACTIVESKINLib.Skin

Public Sub Main()
   '  For SQL Server
   strConnectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=dbTelephone;Data Source=(local)"
    
    
    With de.cnnTelephone
        If (.State = adStateOpen) Then .Close
        .ConnectionString = strConnectionString
        .Open
    End With
    

    'GetMaxYearInPhoneCall
    
    
        strSkinPath = App.Path & "\Scin\STUDIO.skn"
        FormSkin.LoadSkin strSkinPath
        
        'SetMaxVariables
        'SetUserAccessLevel
        frmLogin.Show
End Sub

Public Sub SetSkin(frm As Object)
'    FormSkin.RemoveSkin frm.hWnd
    FormSkin.ApplySkin frm.hwnd
End Sub

'Public Sub SetMaxVariables()
'    Dim strSql As String
'    Dim rs As New ADODB.Recordset
'
'    strSql = "Select MAX(ID) AS MaxID From ZaribSarneshin"
'    rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
'    MaxZaribSarneshinID = IIf(IsNull(rs!MaxID), 1, rs!MaxID + 1)
'    rs.Close
'
'    strSql = "Select MAX(ID) AS MaxID From ZaribTafkik"
'    rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
'    MaxZaribTafkikID = IIf(IsNull(rs!MaxID), 1, rs!MaxID + 1)
'    rs.Close
'
'    strSql = "Select MAX(ID) AS MaxID From YearMonth"
'    rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
'    MaxYearMonthID = IIf(IsNull(rs!MaxID), 1, rs!MaxID + 1)
'    rs.Close
'
'    strSql = "Select MAX(ID) AS MaxID From CGate"
'    rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
'    MaxCGateID = IIf(IsNull(rs!MaxID), 1, rs!MaxID + 1)
'    rs.Close
'
'    Set rs = Nothing
'End Sub

Public Function QueryFrom(Optional QueryType As Byte = 1) As String
    
    Select Case QueryType
        Case 1:
            QueryFrom = "FROM PhoneStation INNER JOIN " & _
                        "(DayInWeek INNER JOIN " & _
                        "(CMonth INNER JOIN " & _
                        "(CallEventCode INNER JOIN " & _
                        "PhoneCall " & _
                        "ON CallEventCode.ID = PhoneCall.CallEventCodeRef) " & _
                        "ON CMonth.ID = PhoneCall.CallMonth) " & _
                        "ON DayInWeek.ID = PhoneCall.DayInWeekRef) " & _
                        "ON PhoneStation.ID = PhoneCall.PhoneStationRef"
        Case 2:
            QueryFrom = "FROM (PhoneStationRepairType INNER JOIN " & _
                        "(PhoneStation INNER JOIN PhoneStationRepairing " & _
                        "ON PhoneStation.ID = PhoneStationRepairing.PhoneStationRef) " & _
                        "ON PhoneStationRepairType.ID = PhoneStationRepairing.PhoneStationRepairTypeRef) " & _
                        "INNER JOIN CMonth ON PhoneStationRepairing.RepairStartMonth = CMonth.ID"
        Case 3:
            QueryFrom = "FROM OtherEventCode INNER JOIN " & _
                        "((RingEventCode INNER JOIN " & _
                        "(PhoneStation INNER JOIN " & _
                        "RingEvent ON PhoneStation.ID = RingEvent.PhoneStationRef) " & _
                        "ON RingEventCode.ID = RingEvent.RingEventCodeRef) INNER JOIN " & _
                        "OtherEvent ON PhoneStation.ID = OtherEvent.PhoneStationRef) " & _
                        "ON OtherEventCode.ID = OtherEvent.OtherEventCodeRef"
        Case 5:
            QueryFrom = "FROM RingEvent INNER JOIN " & _
                        "RingEventCode " & _
                        "ON RingEventCode.ID = RingEvent.RingEventCodeRef"
                     
    
    
        Case 6:
            QueryFrom = "FROM OtherEvent INNER JOIN " & _
                        "OtherEventCode " & _
                        "ON OtherEventCode.ID = OtherEvent.OtherEventCodeRef"
        
    End Select
End Function
'
'Public Function CheckFileExist(FilePath As String) As Boolean
'On Error GoTo EH
'    Dim L As Long
'
'    L = FileLen(FilePath)
'    CheckFileExist = True
'    Exit Function
'EH:
'    CheckFileExist = False
'End Function

Public Sub OpenRecordset(ByRef rs As ADODB.Recordset, Optional strSql As String = "")
    With rs
        If .State = adStateOpen Then .Close

       If (VBA.Trim(strSql) = "") Then
            rs.Open ', de.cnnTelephone, adOpenKeyset, adLockOptimistic
        Else
            rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        End If
    End With

'    If (rs.State = adStateClosed) Then rs.Open
End Sub

Public Function CardIDIsInTheList(CardID As Long) As Boolean
    CardIDIsInTheList = False
    
End Function
''
'''Public Function CodeDecodeLong(ByVal Code As Long) As Long
'''    Dim CodedDecodedLong As Long
'''    Dim ByteCounter As Integer
'''
'''    CodedDecodedLong = 0
'''
'''    For ByteCounter = 0 To 3
'''        CodedDecodedLong = CodedDecodedLong * 256 + (Code Mod 256)
'''        Code = Code \ 256
'''    Next ByteCounter
'''
'''    CodeDecodeLong = CodedDecodedLong
'''End Function
'''
'''Public Function CodeDecodeInt(ByVal Code As Integer) As Integer
'''    Dim CodedDecodedInt As Long
'''    Dim ByteCounter As Integer
'''
'''    CodedDecodedInt = 0
'''
'''    For ByteCounter = 0 To 1
'''        CodedDecodedInt = CodedDecodedInt * 256 + (Code Mod 256)
'''        Code = Code \ 256
'''    Next ByteCounter
'''
'''    CodeDecodeInt = CodedDecodedInt
'''End Function

Public Function DecodeBCD(ByVal Code As Byte, DecodeType As Integer) As Byte
    Select Case DecodeType
        Case 0: 'Common Decode
            DecodeBCD = (Code \ 16) * 10 + (Code Mod 16)
        Case 1: 'Month Decode
            Code = Code Mod 32
            DecodeBCD = (Code \ 16) * 10 + (Code Mod 16)
        Case 2: 'WeekDay Decode
            Code = Code \ 32
            DecodeBCD = (Code \ 16) * 10 + (Code Mod 16)
    End Select
End Function

Public Function CodeBCD(ByVal Code As Byte, DecodeType As Integer) As Byte
    Select Case DecodeType
        Case 0: 'Common Decode
            CodeBCD = (Code \ 10) * 16 + (Code Mod 10)
        Case 1: 'Month Decode
            
        Case 2: 'WeekDay Decode
    End Select
End Function
'
Public Function GetPayphoneXDfromDataBase(PhoneStationSerialNo As Long)
      
      With de.rscmdPhoneStation
        If .State = adStateClosed Then .Open "SELECT * FROM PhoneStation"
        .MoveFirst
        .Find "ID='" & Str(PhoneStationSerialNo) & "'", 0, adSearchForward, 0
    GetPayphoneXDfromDataBase = !PayphoneXD
    .Close
      End With
      
End Function
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Public Sub ReadDataFromFile(PhoneStationSerialNo As Long)
'    Dim indexCounter As Integer
'    Dim PhoneStationID As Long
'    Dim CardState As Byte
'    Dim strQuery As String
'
'    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Read As #1 Len = Len(FileBlockTemp)
'
'    Get #1, 1, FileBlockTemp
'
'    Close #1
'
'    PhoneStationID = DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
'
'    'If (Not IsInPhoneStations(PhoneStationID)) Then Exit Sub
'
'
'    ' for Call Block
'    OpenRecordset de.rscmdPhoneCall
'
'    With de.rscmdPhoneCall
'
'        For indexCounter = 0 To 199
'            If (FileBlockTemp.FileCallBlock(indexCounter).CallCode = 255) Then
'                Exit For
'            End If
'
'
'            PhoneCardSerialNo = (DecodeLong(FileBlockTemp.FileCallBlock(indexCounter).CallCardSerialNo))
'            FinalPrice = DecodeInt(FileBlockTemp.FileCallBlock(indexCounter).CallFinalPrice)
'
'            If (FinalPrice = 0) Then
'                CardState = 1
'            Else
'                CardState = 0
'            End If
'
'            If (Not checkPhoneCard(PhoneCardSerialNo)) Then
'                AddUpdateCardList PhoneCardSerialNo, CardState, True
'            Else
'                If (CardState = 1 And FileBlockTemp.FileCallBlock(indexCounter).CallCode <> 160) Then
'                    AddUpdateCardList PhoneCardSerialNo, CardState, False
'                End If
'            End If
'
'            .AddNew
'
'            !PhoneCardRef = DecodeLong(FileBlockTemp.FileCallBlock(indexCounter).CallCardSerialNo)
'            !PhoneStationRef = PhoneStationID ' DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
'            !CallEventCodeRef = FileBlockTemp.FileCallBlock(indexCounter).CallCode
'            !InitialPrice = 10 * DecodeInt(FileBlockTemp.FileCallBlock(indexCounter).CallInitialPrice)
'            !FinalPrice = 10 * DecodeInt(FileBlockTemp.FileCallBlock(indexCounter).CallFinalPrice)
'            !CallDuration = DecodeInt(FileBlockTemp.FileCallBlock(indexCounter).CallDuration)
'            !PalsCount = DecodeInt(FileBlockTemp.FileCallBlock(indexCounter).CallPalsCount)
'            !CallYear = CByte(Year(Now))
'            !CallMonth = DecodeBCD(FileBlockTemp.FileCallBlock(indexCounter).CallMonth, 0)
'            !CallDay = DecodeBCD(FileBlockTemp.FileCallBlock(indexCounter).CallDay, 0)
'            !CallHour = DecodeBCD(FileBlockTemp.FileCallBlock(indexCounter).CallHour, 0)
'            !CallMinute = DecodeBCD(FileBlockTemp.FileCallBlock(indexCounter).CallMinute, 0)
'            !DayInWeekRef = CByte(Weekday(Now)) 'DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderMonth, 2)
'             If (de.rscmdBaseInformation.State = adStateClosed) Then de.rscmdBaseInformation.Open
'            !PalsPrice = de.rscmdBaseInformation!NewPalsPrice
'            !DistinationNumber = DecodeTelNo(FileBlockTemp.FileCallBlock(indexCounter).CallDistinationNumber)
'            .Update
'        Next indexCounter
'    End With
'
'
'    'for Ring Block
'    OpenRecordset de.rscmdRingEvent
'
'    With de.rscmdRingEvent
'
'        For indexCounter = 0 To 9
'            If (FileBlockTemp.FileRingEventBlock(indexCounter).RingEventCode = 255) Then
'                Exit For
'            End If
'
'            .AddNew
'
'            !PhoneStationRef = PhoneStationID 'DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
'            !RingEventCodeRef = FileBlockTemp.FileRingEventBlock(indexCounter).RingEventCode
'            !RingEventHour = DecodeBCD(FileBlockTemp.FileRingEventBlock(indexCounter).RingEventHour, 0)
'            !RingEventMinute = DecodeBCD(FileBlockTemp.FileRingEventBlock(indexCounter).RingEventMinute, 0)
'            !RingEventTelNo = DecodeTelNo(FileBlockTemp.FileRingEventBlock(indexCounter).RingEventTelNo)
'
'            .Update
'        Next indexCounter
'    End With
'
'
'
'    'for OtherEvent Block
'    OpenRecordset de.rscmdOtherEvent
'
'    With de.rscmdOtherEvent
'
'        For indexCounter = 0 To 9
'            If (FileBlockTemp.FileOtherEventBlock(indexCounter).OtherEventCode = 255) Then
'                Exit For
'            End If
'
'            .AddNew
'
'            !PhoneStationRef = PhoneStationID ' DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
'            !OtherEventCodeRef = FileBlockTemp.FileOtherEventBlock(indexCounter).OtherEventCode
'            !OtherEventHour = DecodeBCD(FileBlockTemp.FileOtherEventBlock(indexCounter).OtherEventHour, 0)
'            !OtherEventMinute = DecodeBCD(FileBlockTemp.FileOtherEventBlock(indexCounter).OtherEventMinute, 0)
'            !OtherEventYear = CalculateYear(FileBlockTemp.FileHeaderBlock.HeaderYear)
'            !OtherEventMonth = DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderMonth, 1)
'            !OtherEventDay = DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderDay, 0)
'            .Update
'        Next indexCounter
'    End With
'
'            With de.rscmdPhoneStation
'                strQuery = "SELECT * From PhoneStation " & _
'                "WHERE PhoneStation.ID = " + Str(PhoneStationSerialNo) + " ;"
'                OpenRecordset de.rscmdPhoneStation, strQuery
'                de.rscmdPhoneStation!SoftwareVersion = FileBlockTemp.PayPhoneSoftwareVersion
'                .Update
'            End With
'
'End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub SaveTapEvent(PhoneStationSerialNo As Long)
   On Error Resume Next
    OpenRecordset de.rscmdOtherEvent
    
    With de.rscmdOtherEvent
                       
            .AddNew
            
            !PhoneStationRef = PhoneStationSerialNo
            !OtherEventCodeRef = 162 'line tap
            !OtherEventHour = hour(Time)
            !OtherEventMinute = minute(Time)
            !OtherEventDay = Day(Now)
            !OtherEventMonth = Month(Now)
            !OtherEventYear = Year(Now)
            
            .Update
    End With
End Sub
Public Sub SendDataToFile(PhoneStationSerialNo As Long, DataType As Byte)
    Dim strQuery As String
    Dim indexCounter As Integer
    Dim ByteCounter As Integer
    Dim strFileName As String
    Dim UpdatePolicyLoTmp As Byte
    Dim UpdatePolicyHiTmp As Byte
    Dim tmpPhoneCity As Integer
    Dim tmpPhoneArea As Integer
    
    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Read Write As #1 Len = Len(FileBlockTemp)
    Get #1, 1, FileBlockTemp

    With de.rscmdPhoneStation
        If (.State = adStateClosed) Then .Open
        .MoveFirst
        .Find "ID=" & PhoneStationSerialNo
        
        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
           '.Close
            Close #1
            Exit Sub
        End If
        tmpPhoneCity = Int(Val(!phoneCity))
    End With
    
    With de.rscmdCity
        If (.State = adStateClosed) Then .Open
        .MoveFirst
        .Find "CityNumber=" & tmpPhoneCity
        
        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
           '.Close
           Close #1
            Exit Sub
        End If
        tmpPhoneArea = Int(Val(!ChargeArea))
    End With
    
   FileBlockTemp.PMSHeader = 2570
   FileBlockTemp.FreeHeader = 2827
   FileBlockTemp.CharggingHeader = 3084
   FileBlockTemp.SamHeader = 3341
    
    
    With de.rscmdUpdateInfo
            If (.State = adStateClosed) Then .Open
                   UpdatePolicyLoTmp = 0
                   UpdatePolicyHiTmp = 0
                   If (!PMSNumUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 1)
                   If (!FreeNumUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 2)
                   If (!ChargingUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 4)
                   If (!ChargeSchedullerUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 8)
                   If (!DayTypeUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 16)
                   If (!BlackListUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 32)
                   If (!WhiteListUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 64)
                   If (!SamUpdateSw = True) Then UpdatePolicyLoTmp = (UpdatePolicyLoTmp Or 128)
                          
            
                   If (!MessageUpdateSw = True) Then UpdatePolicyHiTmp = (UpdatePolicyHiTmp Or 1)
                   If (!SettingUpdateSw = True) Then UpdatePolicyHiTmp = (UpdatePolicyHiTmp Or 2)
                   If (!ProgramUpdateSw = True) Then UpdatePolicyHiTmp = (UpdatePolicyHiTmp Or 4)
                   If (!SynchronizeSw = True) Then UpdatePolicyHiTmp = (UpdatePolicyHiTmp Or 8)
            
            FileBlockTemp.FileUpdatePolicyHi = UpdatePolicyHiTmp
            FileBlockTemp.FileUpdatePolicyLo = UpdatePolicyLoTmp
    End With
    
    FileBlockTemp.FileChangeSW = 161
    
    Select Case DataType
        Case 1: 'Common Data
            With de.rscmdBaseInformation
                If (.State = adStateClosed) Then .Open
                
                
                ' for Time
                FileBlockTemp.FileSetTimeBlock.SetTimeHourSwitch = 161
                FileBlockTemp.FileSetTimeBlock.SetTimeHourNo = !HourShift
                FileBlockTemp.FileSetTimeBlock.SetTimeMinuteSwitch = 161
                FileBlockTemp.FileSetTimeBlock.SetTimeMinuteNo = !MinuteShift
                
               
                ' for Date
                FileBlockTemp.FileSetDateBlock.SetDateDaySwitch = 161
                FileBlockTemp.FileSetDateBlock.SetDateDayNo = !DayShift
                FileBlockTemp.FileSetDateBlock.SetDateMonthSwitch = 161
                FileBlockTemp.FileSetDateBlock.SetDateMonthNo = !MonthShift
                
                ' for Pals Price
                FileBlockTemp.FilePalsPriceBlock.PalsPriceSwitch = 161
                FileBlockTemp.FilePalsPriceBlock.PalsPriceNo = CodeInt(!NewPalsPrice)
                FileBlockTemp.FileBackLightHourFrom = !BackLightHourFrom
                FileBlockTemp.FileBackLightHourTo = !BackLightHourTo
                
                
                ' for Ring Manage
                FileBlockTemp.FileRingCount = !RingCount
                FileBlockTemp.FileRingManageRoutin = !RingManageRoutine
                
                FileBlockTemp.FileEmergencyEvents = !EmergencyEvents
                FileBlockTemp.FileDialWaitTime = !DialWaitTime
                FileBlockTemp.FileAnswerTime = !AnswerWaitTime
                FileBlockTemp.FileCardChangeWait = !CardChangeWait
                FileBlockTemp.FileCardCheckPolicy = !CardCheckPolicy
                
                FileBlockTemp.FileCityCodeLen = !CityCodeLen
                FileBlockTemp.FileDefaultLanguage = !DefaultLanguage
                FileBlockTemp.FileChargePriority = !ChargePriority
                               
            End With
            
            
        Case 2: 'Block Data
        
            ' for PMS TelNo
            With de.rscmdPMSTelNo
                If (.State = adStateClosed) Then .Open
                    
                    For indexCounter = 0 To 15
                        For ByteCounter = 0 To 11
                            FileBlockTemp.FilePMSTelNoBlock(indexCounter).PMSTelNo.TelNo(ByteCounter) = 255
                        Next ByteCounter
                    Next indexCounter
                    
                     If (.RecordCount > 0) Then
                    .MoveFirst
 
                    For indexCounter = 0 To 15
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                        
                        FileBlockTemp.FilePMSTelNoBlock(indexCounter).PMSTelNo = CodeTelNo(!ID)
                        
                        .MoveNext
                    Next indexCounter
                End If
            End With
            
            
            ' for Free TelNo
            With de.rscmdFreeTelNo
                If (.State = adStateClosed) Then .Open
                
                    
                    For indexCounter = 0 To 19
                        For ByteCounter = 0 To 11
                            FileBlockTemp.FileFreeTelNoBlock(indexCounter).FreeTelNo.TelNo(ByteCounter) = 255
                        Next ByteCounter
                    Next indexCounter
                    
                  If (.RecordCount > 0) Then
                    .MoveFirst
                  
                    For indexCounter = 0 To 19
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                        
                        FileBlockTemp.FileFreeTelNoBlock(indexCounter).FreeTelNo = CodeTelNo(!ID)
                        .MoveNext
                    Next indexCounter
                End If
            End With
            
            ' for chargging
            With de.rscmdChargging
                If (.State = adStateClosed) Then .Open
                
                                          
                    For indexCounter = 0 To 299
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom.a = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom.b = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom.c = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom.d = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom.e = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom.f = 255
                        
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo.a = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo.b = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo.c = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo.d = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo.e = 255
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo.f = 255
                        
                        FileBlockTemp.FileCharggingBlock(indexCounter).CharggingChargeLevel = 255
                    
                    Next indexCounter
                If (.RecordCount > 0) Then
                
                    .MoveFirst
                
                    For indexCounter = 0 To 299
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                        
                            If (!CharggingArea = 0 Or !CharggingArea = tmpPhoneArea) Then
                                FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoFrom = CodePreNum(!PreNoFrom)
                                FileBlockTemp.FileCharggingBlock(indexCounter).CharggingPreNoTo = CodePreNum(!PreNoTo)
                                FileBlockTemp.FileCharggingBlock(indexCounter).CharggingChargeLevel = !ChargeLevel
                            Else
                                indexCounter = indexCounter - 1
                            End If
                            
                         .MoveNext
                    Next indexCounter
                End If
            End With
            
            
            
            ''*'''''''''''''''''''''''
            ' for charge Level
            With de.rscmdChargeLevel
                If (.State = adStateClosed) Then .Open
                
                                          
                    For indexCounter = 0 To 19
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ1 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ2 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ3 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ4 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ5 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ6 = 255
                                         
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ1 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ2 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ3 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ4 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ5 = 255
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ6 = 255
                      
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ1 = 255
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ2 = 255
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ3 = 255
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ4 = 255
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ5 = 255
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ6 = 255
                   
                    Next indexCounter
                If (.RecordCount > 0) Then
                
                    .MoveFirst
                
                    For indexCounter = 0 To 19
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                            
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ1 = de.rscmdChargeLevel!PulseCoefZ1
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ2 = de.rscmdChargeLevel!PulseCoefZ2
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ3 = de.rscmdChargeLevel!PulseCoefZ3
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ4 = de.rscmdChargeLevel!PulseCoefZ4
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ5 = de.rscmdChargeLevel!PulseCoefZ5
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).PulseCoefZ6 = de.rscmdChargeLevel!PulseCoefZ6
                                         
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ1 = de.rscmdChargeLevel!TimeSlotHiZ1
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ2 = de.rscmdChargeLevel!TimeSlotHiZ2
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ3 = de.rscmdChargeLevel!TimeSlotHiZ3
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ4 = de.rscmdChargeLevel!TimeSlotHiZ4
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ5 = de.rscmdChargeLevel!TimeSlotHiZ5
                        FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotHiZ6 = de.rscmdChargeLevel!TimeSlotHiZ6
                      
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ1 = de.rscmdChargeLevel!TimeSlotLoZ1
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ2 = de.rscmdChargeLevel!TimeSlotLoZ2
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ3 = de.rscmdChargeLevel!TimeSlotLoZ3
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ4 = de.rscmdChargeLevel!TimeSlotLoZ4
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ5 = de.rscmdChargeLevel!TimeSlotLoZ5
                       FileBlockTemp.FileChargeLevelBlock(indexCounter).TimeSlotLoZ6 = de.rscmdChargeLevel!TimeSlotLoZ6


                         
                         .MoveNext
                    Next indexCounter
                End If
            End With
            
            ''*'''''''''''''''''''''''
            
            ' for BlackList
            With de.rscmdBlackList
                If (.State = adStateClosed) Then .Open


                    For indexCounter = 0 To 119
                    
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListFromNo.a = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListFromNo.b = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListFromNo.c = 255

                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListToNo.a = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListToNo.b = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListToNo.c = 255
                    
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF1 = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF2F3 = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF4F5 = 255
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF6F7 = 255

                    Next indexCounter

                If (.RecordCount > 0) Then

                    .MoveFirst

                    For indexCounter = 0 To 119
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For

                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListFromNo = CodeCardSerial(!FromNo)
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListToNo = CodeCardSerial(!ToNo)
                        
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF1 = Rev8Bit(!F1)
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF2F3 = Rev8Bit(!F2)
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF4F5 = CByte(((Rev3Bit(!F3) * 32) And 224) Or ((Rev2Bit(!F4) * 8) And 24) Or (Rev3Bit(!F5) And 7))
                        FileBlockTemp.FileBlackListBlock(indexCounter).BlackListF6F7 = CByte(((Rev3Bit(!F6) * 32) And 224) Or (Rev5Bit(!F7) And 31))

                        .MoveNext
                    Next indexCounter
                End If
            End With
            
            ' for WhiteList
            With de.rscmdWhiteList
                If (.State = adStateClosed) Then .Open


                    For indexCounter = 0 To 119
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListFromNo.a = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListFromNo.b = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListFromNo.c = 255

                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListToNo.a = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListToNo.b = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListToNo.c = 255
                    
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF1 = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF2F3 = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF4F5 = 255
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF6F7 = 255
                    
                    Next indexCounter

                If (.RecordCount > 0) Then

                    .MoveFirst
                   
                    For indexCounter = 0 To 119
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For

                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListFromNo = CodeCardSerial(!FromNo)
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListToNo = CodeCardSerial(!ToNo)

                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF1 = Rev8Bit(!F1)
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF2F3 = Rev8Bit(!F2)
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF4F5 = CByte(((Rev3Bit(!F3) * 32) And 224) Or ((Rev2Bit(!F4) * 8) And 24) Or (Rev3Bit(!F5) And 7))
                        FileBlockTemp.FileWhiteListBlock(indexCounter).WhiteListF6F7 = CByte(((Rev3Bit(!F6) * 32) And 224) Or (Rev5Bit(!F7) And 31))

                        .MoveNext
                    Next indexCounter
                End If
            End With
''''''''''''''''''''''''''''''''''''''
            ' for day type
            With de.rscmdDayType
                If (.State = adStateClosed) Then .Open

                If (.RecordCount > 0) Then

                    .MoveFirst


                    For indexCounter = 0 To 364
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For

                        FileBlockTemp.FileDayTypeBlock(indexCounter) = !DayType

                        .MoveNext
                    Next indexCounter
                End If
            End With
''''''''''''''''''''''''''''''''''''''

            ' for Message
                  
                
                strFileName = App.Path & "\Data\Messages\MAIN.bin"
    
    
                Open strFileName For Random Access Read Write As #2 Len = Len(FileBlockTemp.FileMessageBlock)
                Get #2, 1, FileBlockTemp.FileMessageBlock
                Close #2
'''''''''''''''''''''''''''''''''''''''''''
          ' charge scheduller
            With de.rscmdCharggingScheduller
                If (.State = adStateClosed) Then .Open


                    For indexCounter = 0 To 4
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour1 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute1 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone1 = 255

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour2 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute2 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone2 = 255

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour3 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute3 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone3 = 255

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour4 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute4 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone4 = 255

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour5 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute5 = 255
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone5 = 255

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone6 = 255
                    Next indexCounter
                
                If (.RecordCount > 0) Then
                    .MoveFirst

                For indexCounter = 0 To 4
                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour1 = !toHour1
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute1 = !toMinute1
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone1 = !SelectedZone1

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour2 = !toHour2
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute2 = !toMinute2
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone2 = !SelectedZone2

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour3 = !toHour3
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute3 = !toMinute3
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone3 = !SelectedZone3

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour4 = !toHour4
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute4 = !toMinute4
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone4 = !SelectedZone4

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toHour5 = !toHour5
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).toMinute5 = !toMinute5
                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone5 = !SelectedZone5

                        FileBlockTemp.FileChargeSchedullerBlock(indexCounter).UsedZone6 = !SelectedZone6

                        .MoveNext
                Next indexCounter
                End If
            End With

' sam setting
            With de.rscmdPhoneStation
                            If (.State = adStateClosed) Then .Open
                               
                               For indexCounter = 0 To 3
                         For k = 0 To 9
                             FileBlockTemp.FileSamSettingBlock(indexCounter).SamPinCode(k) = 255
                             FileBlockTemp.FileSamSettingBlock(indexCounter).SamSerial(k) = 255
                         Next k
                             FileBlockTemp.FileSamSettingBlock(indexCounter).SamType = 255
                            Next indexCounter
                    
                
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(0) = CByte("&H" + Mid(!Sam1Pin, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(0) = CByte("&H" + Mid(!Sam1Serial, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(1) = CByte("&H" + Mid(!Sam1Pin, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(1) = CByte("&H" + Mid(!Sam1Serial, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(2) = CByte("&H" + Mid(!Sam1Pin, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(2) = CByte("&H" + Mid(!Sam1Serial, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(3) = CByte("&H" + Mid(!Sam1Pin, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(3) = CByte("&H" + Mid(!Sam1Serial, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(4) = CByte("&H" + Mid(!Sam1Pin, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(4) = CByte("&H" + Mid(!Sam1Serial, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(5) = CByte("&H" + Mid(!Sam1Pin, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(5) = CByte("&H" + Mid(!Sam1Serial, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(6) = CByte("&H" + Mid(!Sam1Pin, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(6) = CByte("&H" + Mid(!Sam1Serial, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(7) = CByte("&H" + Mid(!Sam1Pin, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(7) = CByte("&H" + Mid(!Sam1Serial, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(8) = CByte("&H" + Mid(!Sam1Pin, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(8) = CByte("&H" + Mid(!Sam1Serial, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamPinCode(9) = CByte("&H" + Mid(!Sam1Pin, 19, 2))
                             FileBlockTemp.FileSamSettingBlock(0).SamSerial(9) = CByte("&H" + Mid(!Sam1Serial, 19, 2))

                             FileBlockTemp.FileSamSettingBlock(0).SamType = Val(!SAm1Type)


                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(0) = CByte("&H" + Mid(!Sam2Pin, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(0) = CByte("&H" + Mid(!Sam2Serial, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(1) = CByte("&H" + Mid(!Sam2Pin, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(1) = CByte("&H" + Mid(!Sam2Serial, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(2) = CByte("&H" + Mid(!Sam2Pin, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(2) = CByte("&H" + Mid(!Sam2Serial, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(3) = CByte("&H" + Mid(!Sam2Pin, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(3) = CByte("&H" + Mid(!Sam2Serial, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(4) = CByte("&H" + Mid(!Sam2Pin, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(4) = CByte("&H" + Mid(!Sam2Serial, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(5) = CByte("&H" + Mid(!Sam2Pin, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(5) = CByte("&H" + Mid(!Sam2Serial, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(6) = CByte("&H" + Mid(!Sam2Pin, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(6) = CByte("&H" + Mid(!Sam2Serial, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(7) = CByte("&H" + Mid(!Sam2Pin, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(7) = CByte("&H" + Mid(!Sam2Serial, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(8) = CByte("&H" + Mid(!Sam2Pin, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(8) = CByte("&H" + Mid(!Sam2Serial, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamPinCode(9) = CByte("&H" + Mid(!Sam2Pin, 19, 2))
                             FileBlockTemp.FileSamSettingBlock(1).SamSerial(9) = CByte("&H" + Mid(!Sam2Serial, 19, 2))

                             FileBlockTemp.FileSamSettingBlock(1).SamType = Val(!SAm2Type)


                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(0) = CByte("&H" + Mid(!Sam3Pin, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(0) = CByte("&H" + Mid(!Sam3Serial, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(1) = CByte("&H" + Mid(!Sam3Pin, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(1) = CByte("&H" + Mid(!Sam3Serial, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(2) = CByte("&H" + Mid(!Sam3Pin, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(2) = CByte("&H" + Mid(!Sam3Serial, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(3) = CByte("&H" + Mid(!Sam3Pin, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(3) = CByte("&H" + Mid(!Sam3Serial, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(4) = CByte("&H" + Mid(!Sam3Pin, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(4) = CByte("&H" + Mid(!Sam3Serial, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(5) = CByte("&H" + Mid(!Sam3Pin, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(5) = CByte("&H" + Mid(!Sam3Serial, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(6) = CByte("&H" + Mid(!Sam3Pin, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(6) = CByte("&H" + Mid(!Sam3Serial, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(7) = CByte("&H" + Mid(!Sam3Pin, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(7) = CByte("&H" + Mid(!Sam3Serial, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(8) = CByte("&H" + Mid(!Sam3Pin, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(8) = CByte("&H" + Mid(!Sam3Serial, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamPinCode(9) = CByte("&H" + Mid(!Sam3Pin, 19, 2))
                             FileBlockTemp.FileSamSettingBlock(2).SamSerial(9) = CByte("&H" + Mid(!Sam3Serial, 19, 2))

                             FileBlockTemp.FileSamSettingBlock(2).SamType = Val(!SAm3Type)


                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(0) = CByte("&H" + Mid(!Sam4Pin, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(0) = CByte("&H" + Mid(!Sam4Serial, 1, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(1) = CByte("&H" + Mid(!Sam4Pin, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(1) = CByte("&H" + Mid(!Sam4Serial, 3, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(2) = CByte("&H" + Mid(!Sam4Pin, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(2) = CByte("&H" + Mid(!Sam4Serial, 5, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(3) = CByte("&H" + Mid(!Sam4Pin, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(3) = CByte("&H" + Mid(!Sam4Serial, 7, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(4) = CByte("&H" + Mid(!Sam4Pin, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(4) = CByte("&H" + Mid(!Sam4Serial, 9, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(5) = CByte("&H" + Mid(!Sam4Pin, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(5) = CByte("&H" + Mid(!Sam4Serial, 11, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(6) = CByte("&H" + Mid(!Sam4Pin, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(6) = CByte("&H" + Mid(!Sam4Serial, 13, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(7) = CByte("&H" + Mid(!Sam4Pin, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(7) = CByte("&H" + Mid(!Sam4Serial, 15, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(8) = CByte("&H" + Mid(!Sam4Pin, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(8) = CByte("&H" + Mid(!Sam4Serial, 17, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamPinCode(9) = CByte("&H" + Mid(!Sam4Pin, 19, 2))
                             FileBlockTemp.FileSamSettingBlock(3).SamSerial(9) = CByte("&H" + Mid(!Sam4Serial, 19, 2))

                             FileBlockTemp.FileSamSettingBlock(3).SamType = Val(!SAm4Type)
                        
 
                
                FileBlockTemp.FileAlarmBlock.AlarmSwitch = 161
                FileBlockTemp.FileAlarmBlock.AlarmHour = !SendDataHour
                FileBlockTemp.FileAlarmBlock.AlarmMinute = !SendDataMinute
                FileBlockTemp.FileCharggingType = !CharggingType
                FileBlockTemp.FileCharggingRoutin = !charggingRoutin
                FileBlockTemp.FileRinger = !Ringer
                FileBlockTemp.FileDialingRule = !DialingRule
                FileBlockTemp.FilePhoneAccessLevel = !PhoneAccessLevel
                FileBlockTemp.FileDialingType = !DialingType
                FileBlockTemp.FileReportScheduling = !ReportScheduling
                FileBlockTemp.FilePhoneGroup = !PhoneGroup
                FileBlockTemp.FilePayphoneXD = MakePayphoneXD(!PayphoneXD)
                FileBlockTemp.FileAntiTapActive = !AntiTapActivate
            
            End With
    End Select

    Put #1, 1, FileBlockTemp
    
    Close #1
    
End Sub

Public Function MakePayphoneXD(LongNo) As MyPayphoneXD
    lngno = LongNo
    
    MakePayphoneXD.e = MyMod(lngno, 256)
    lngno = MyDiv(lngno, 256)
    
    MakePayphoneXD.d = MyMod(lngno, 256)
    lngno = MyDiv(lngno, 256)
    
    MakePayphoneXD.c = MyMod(lngno, 256)
    lngno = MyDiv(lngno, 256)
    
    MakePayphoneXD.b = MyMod(lngno, 256)
    lngno = MyDiv(lngno, 256)
    
    MakePayphoneXD.a = CByte(lngno)
End Function

Public Sub GetMaxYearInPhoneCall()
On Error Resume Next

    OpenRecordset de.rsSQLMaxYearInPhoneCall
    
    If (IsNull(de.rsSQLMaxYearInPhoneCall!MaxYear)) Then
        OpenRecordset de.rscmdBaseInformation
        
        de.rscmdBaseInformation.MoveFirst
        MaxYearInPhoneCall = de.rscmdBaseInformation!CurrentYear
    Else
        de.rsSQLMaxYearInPhoneCall.MoveFirst
        MaxYearInPhoneCall = de.rsSQLMaxYearInPhoneCall!MaxYear
    End If
End Sub

Public Function CalculateYear(YearCode As Byte) As Integer
    If ((MaxYearInPhoneCall Mod 4) <> YearCode) Then
        OpenRecordset de.rscmdBaseInformation
        
        With de.rscmdBaseInformation
            .MoveFirst
            !CurrentYear = !CurrentYear + 1
            .Update
        End With
            
        MaxYearInPhoneCall = MaxYearInPhoneCall + 1
    End If
    
    CalculateYear = MaxYearInPhoneCall
End Function

Public Function DecodeLong(MyLongNo As MyLong)
    DecodeLong = MyLongNo.a
    DecodeLong = DecodeLong * 256 + MyLongNo.b
    DecodeLong = DecodeLong * 256 + MyLongNo.c
    DecodeLong = DecodeLong * 256 + MyLongNo.d
End Function

Public Function CodeLong(ByVal LongNo) As MyLong
    lngno = LongNo
    
    CodeLong.d = MyMod(lngno, 256)
    
    lngno = lngno \ 256
    
    CodeLong.c = MyMod(lngno, 256)
    lngno = lngno \ 256
    
    CodeLong.b = MyMod(lngno, 256)
    lngno = lngno \ 256
    
    CodeLong.a = CByte(lngno)
End Function
Public Function CodeCardSerial(ByVal LongNo) As MyCardSerialType
    lngno = LongNo
    
'    CodeCardSerial.f = MyMod(lngno, 256)
'    lngno = lngno \ 256
'
'    CodeCardSerial.e = MyMod(lngno, 256)
'    lngno = lngno \ 256
'
'    CodeCardSerial.d = MyMod(lngno, 256)
'    lngno = lngno \ 256
    
    CodeCardSerial.c = MyMod(lngno, 256)
    lngno = lngno \ 256

    CodeCardSerial.b = MyMod(lngno, 256)
    lngno = lngno \ 256

    CodeCardSerial.a = CByte(lngno)
'
    
'
'CodeCardSerial.a = 255
'CodeCardSerial.b = 255
'CodeCardSerial.c = 255
'CodeCardSerial.d = 255
'CodeCardSerial.e = 255
'CodeCardSerial.f = 255

End Function

Public Function DecodeInt(MyIntNo As MyInteger)
    DecodeInt = MyIntNo.a
    DecodeInt = DecodeInt * 256 + MyIntNo.b
End Function

Public Function CodeInt(IntNo) As MyInteger
    CodeInt.b = IntNo Mod 256
    IntNo = IntNo \ 256
    
    CodeInt.a = IntNo
End Function

Public Function DecodeTelNo(ArrayTelNo As MyTelNo)
    Dim indexCounter As Integer
    
    indexCounter = 0
    
    While ArrayTelNo.TelNo(indexCounter) < 10
        DecimalTelNo = DecimalTelNo * 10 + ArrayTelNo.TelNo(indexCounter)
        indexCounter = indexCounter + 1
    Wend
    
    DecodeTelNo = DecimalTelNo
End Function

Public Function CodeTelNo(DecimalTelNo) As MyTelNo
    Dim indexCounter As Integer
    Dim ShiftCounter As Integer
    Dim a As String
'    indexCounter = 11
'    MsgBox (Mid(DecimalTelNo, 1, 1))
'    While indexCounter >= 0
'
'         CodeTelNo.TelNo(indexCounter) = CByte(Mid(DecimalTelNo, (11 - indexCounter), 1))
'
''        CodeTelNo.TelNo(indexCounter) = MyMod(DecimalTelNo, 10)
''        DecimalTelNo = MyDiv(DecimalTelNo, 10)
'        indexCounter = indexCounter - 1
'    Wend
'
''    IndexCounter = IndexCounter + 1
'
'    While indexCounter >= 0
'        For ShiftCounter = 0 To 10
'            CodeTelNo.TelNo(ShiftCounter) = CodeTelNo.TelNo(ShiftCounter + 1)
'        Next ShiftCounter
'
'        CodeTelNo.TelNo(11) = 255
'        indexCounter = indexCounter - 1
'    Wend
indexCounter = 11
    While indexCounter >= 0

         CodeTelNo.TelNo(indexCounter) = 255
   indexCounter = indexCounter - 1
    Wend

indexCounter = Len(DecimalTelNo)
DecimalTelNo = Trim(DecimalTelNo)
    While indexCounter > 0

         CodeTelNo.TelNo((Len(DecimalTelNo) - indexCounter)) = CByte(Mid(DecimalTelNo, (1 + (Len(DecimalTelNo) - indexCounter)), 1))

'        CodeTelNo.TelNo(indexCounter) = MyMod(DecimalTelNo, 10)
'        DecimalTelNo = MyDiv(DecimalTelNo, 10)
        indexCounter = indexCounter - 1
    Wend

    
End Function

Public Function DecodeBCDLong(ml As MyLong) As Long
    DecodeBCDLong = 0
    
    If (ml.a = 255) Then Exit Function
    DecodeBCDLong = DecodeBCDLong * 10 + ml.a
    
    If (ml.b = 255) Then Exit Function
    DecodeBCDLong = DecodeBCDLong * 10 + ml.b
    
    If (ml.c = 255) Then Exit Function
    DecodeBCDLong = DecodeBCDLong * 10 + ml.c
    
    If (ml.d = 255) Then Exit Function
    DecodeBCDLong = DecodeBCDLong * 10 + ml.d
    
End Function

Public Function CodeBCDLong(l As Long) As MyLong
    
    If (l >= 1000) Then
        CodeBCDLong.d = l Mod 10
        l = l \ 10
        CodeBCDLong.c = l Mod 10
        l = l \ 10
        CodeBCDLong.b = l Mod 10
        l = l \ 10
        CodeBCDLong.a = l Mod 10
        
    ElseIf (l >= 100) Then
        CodeBCDLong.d = 255
        
        CodeBCDLong.c = l Mod 10
        l = l \ 10
        CodeBCDLong.b = l Mod 10
        l = l \ 10
        CodeBCDLong.a = l

    
    ElseIf (l > 10) Then
        CodeBCDLong.d = 255
        CodeBCDLong.c = 255

        CodeBCDLong.b = l Mod 10
        l = l \ 10
        CodeBCDLong.a = l

    
    Else
        CodeBCDLong.d = 255
        CodeBCDLong.c = 255
        CodeBCDLong.b = 255
        
        CodeBCDLong.a = l
    
    End If
End Function
Public Function CodePreNum(l As Long) As MyPreNum
    
        If (l >= 100000) Then
        CodePreNum.f = l Mod 10
        l = l \ 10
        CodePreNum.e = l Mod 10
        l = l \ 10
        CodePreNum.d = l Mod 10
        l = l \ 10
        CodePreNum.c = l Mod 10
        l = l \ 10
        CodePreNum.b = l Mod 10
        l = l \ 10
        CodePreNum.a = l Mod 10
    
        ElseIf (l >= 10000) Then
        CodePreNum.f = 255
        
        CodePreNum.e = l Mod 10
        l = l \ 10
        CodePreNum.d = l Mod 10
        l = l \ 10
        CodePreNum.c = l Mod 10
        l = l \ 10
        CodePreNum.b = l Mod 10
        l = l \ 10
        CodePreNum.a = l Mod 10
        

    ElseIf (l >= 1000) Then
        CodePreNum.f = 255
        CodePreNum.e = 255
        
        CodePreNum.d = l Mod 10
        l = l \ 10
        CodePreNum.c = l Mod 10
        l = l \ 10
        CodePreNum.b = l Mod 10
        l = l \ 10
        CodePreNum.a = l Mod 10
        
    ElseIf (l >= 100) Then
        CodePreNum.f = 255
        CodePreNum.e = 255
        CodePreNum.d = 255
        
        CodePreNum.c = l Mod 10
        l = l \ 10
        CodePreNum.b = l Mod 10
        l = l \ 10
        CodePreNum.a = l

    
    ElseIf (l > 10) Then
        CodePreNum.f = 255
        CodePreNum.e = 255
        CodePreNum.d = 255
        CodePreNum.c = 255

        CodePreNum.b = l Mod 10
        l = l \ 10
        CodePreNum.a = l

    
    Else
        CodePreNum.f = 255
        CodePreNum.e = 255
        CodePreNum.d = 255
        CodePreNum.c = 255
        CodePreNum.b = 255
        
        CodePreNum.a = l
    
    End If
End Function

Public Function CheckPhoneStation(ByVal PhoneStationSerialNo) As Boolean
    CheckPhoneStation = True

    If (PhoneStationSerialNo >= 10 ^ 7) Then
        CheckPhoneStation = False
        Exit Function
    End If
    
    With de.rscmdPhoneStation
        If (.State = adStateClosed) Then .Open
        
        If (.RecordCount = 0) Then
            CheckPhoneStation = False
            Exit Function
        End If
        
        .MoveFirst
        .Find "ID=" & PhoneStationSerialNo
        
        If (.EOF Or .BOF) Then
            CheckPhoneStation = False
        End If
    End With
End Function

Public Function checkPhoneCard(ByVal PhoneCardSerialNo) As Boolean
    checkPhoneCard = True

    With de.rscmdPhoneCard
        If (.State = adStateClosed) Then .Open
        
        If (.RecordCount = 0) Then
            checkPhoneCard = False
            Exit Function
        End If
        
        .MoveFirst
        .Find "ID=" & PhoneCardSerialNo
        
        If (.EOF Or .BOF) Then
            checkPhoneCard = False
        End If
    End With
End Function

Public Sub AddUpdateCardList(ByVal PhoneCardSerialNo, ByVal State As Byte, ByVal AddUpdate As Boolean)
    With de.rscmdPhoneCard
        If (.State = adStateClosed) Then .Open
        
        If (AddUpdate) Then
            .AddNew
            
            !ID = PhoneCardSerialNo
            !CardStateRef = State
            
            .Update
        Else
            .MoveFirst
            .Find "ID=" & PhoneCardSerialNo
            !CardStateRef = State
            .Update
        End If
    End With
    
 
End Sub

Public Function MyMod(ByVal a, b)
    s = 1048575
    
    While s > 1
        While a >= b
            a = a - s * b
        Wend
        
        If (a >= 0) Then
            s = 1
        Else
            a = a + s * b
            s = s \ 2
        End If
    Wend
    
    While a >= b
        a = a - b
    Wend
    
    MyMod = a
End Function
Public Function MyDiv(a, b)
     s = 1048575
    tmpMyDiv = 0
    While s > 1
        While a >= b
            a = a - s * b
         tmpMyDiv = tmpMyDiv + s
        Wend
        
        If (a >= 0) Then
            s = 1
        Else
                 tmpMyDiv = tmpMyDiv - s
            a = a + s * b
            s = s \ 2
        End If
    Wend
    
    While a >= b
        a = a - b
        tmpMyDiv = tmpMyDiv + 1
    Wend
    
    MyDiv = tmpMyDiv
       
End Function


Public Function IsInPhoneStations(PhoneStationID As Long) As Boolean

    If (rs.State = adStateOpen) Then rs.Close
    
    rs.Open "Select * From PhoneStation", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    
    rs.MoveFirst
    rs.Find "ID=" & Trim(Str(PhoneStationID))
    
    If (rs.EOF Or rs.AbsolutePosition = adPosUnknown) Then
        IsInPhoneStation = False
    Else
        IsInPhoneStation = True
    End If
    
    rs.Close
End Function

Public Sub SetUserAccessLevel(ByVal UserId As Integer)
    
    With de.rscmdUsers
        If .State = adStateClosed Then .Open "SELECT * FROM Users", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        .MoveFirst
        .Find "ID='" & Trim(Str(UserId)) & "'", 0, adSearchForward, 0
        
        BaseInfoTableAccessSW = !BaseInfoTableAccess
        ReportDefaultAccessSW = !ReportDefaultAccess
        ReportStatisticsAccessSW = !ReportStatisticsAccess
        ReportListAccessSW = !ReportListAccess
        
        RegisterInPhoneAccessSW = !RegisterInPhoneFile
        MessageTableAccessSW = 1 '!MessageTableAccess
        FreeNumTableAccessSW = !FreeNumTableAccess
        PmsNumTableAccessSW = !PmsNumTableAccess
        PhoneRepairTableAccessSW = !RepairTableAccess
        CardListTableAccessSW = !CardListTableAccess
        ConnectionTableAccessSW = !ConnectionTableAccess
        UserTableAccessSW = !UserTableAccess
        CharggingTableAccessSW = !CharggingTableAccess
        PhoneStationTableAccessSW = !PhoneStationTableAccess
        UpdateInfoTableAccessSW = !UpdateInfoTableAccess
        SamSettingTableAccessSW = !SamSettingTableAccess
        
    End With

    If (de.rscmdPhoneStation.State = adStateOpen) Then de.rscmdPhoneStation.Close
    If (de.rscmdPhoneStationRepairing.State = adStateOpen) Then de.rscmdPhoneStationRepairing.Close
    If (de.rscmdCity.State = adStateOpen) Then de.rscmdCity.Close
    If (de.rscmdCharggingArea.State = adStateOpen) Then de.rscmdCharggingArea.Close
    
    If (PhoneStationTableAccessSW = False) Then
        de.rscmdPhoneStation.Open "SELECT * FROM PhoneStation", de.cnnTelephone, adOpenKeyset, adLockReadOnly
        de.rscmdCity.Open "SELECT * FROM City", de.cnnTelephone, adOpenKeyset, adLockReadOnly
        de.rscmdCharggingArea.Open "SELECT * FROM CharggingArea", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    
    Else
        de.rscmdCity.Open "SELECT * FROM City", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        de.rscmdPhoneStation.Open "SELECT * FROM PhoneStation", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        de.rscmdCharggingArea.Open "SELECT * FROM CharggingArea", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    
    End If
     
    If (de.rscmdBaseInformation.State = adStateOpen) Then de.rscmdBaseInformation.Close
    If (BaseInfoTableAccessSW = False) Then
        de.rscmdBaseInformation.Open "SELECT * FROM BaseInformation", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdBaseInformation.Open "SELECT * FROM BaseInformation", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdBlackList.State = adStateOpen) Then de.rscmdBlackList.Close
    If (CardListTableAccessSW = False) Then
        de.rscmdBlackList.Open "SELECT * FROM BlackList", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdBlackList.Open "SELECT * FROM BlackList", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdWhiteList.State = adStateOpen) Then de.rscmdWhiteList.Close
    If (CardListTableAccessSW = False) Then
       de.rscmdWhiteList.Open "SELECT * FROM WhiteList", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
       de.rscmdWhiteList.Open "SELECT * FROM WhiteList", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdConnections.State = adStateOpen) Then de.rscmdConnections.Close
    If (ConnectionTableAccessSW = False) Then
        de.rscmdConnections.Open "SELECT * FROM Connections", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdConnections.Open "SELECT * FROM Connections", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdPMSTelNo.State = adStateOpen) Then de.rscmdPMSTelNo.Close
    If (PmsNumTableAccessSW = False) Then
        de.rscmdPMSTelNo.Open "SELECT * FROM PMSTelNo", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdPMSTelNo.Open "SELECT * FROM PMSTelNo", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdFreeTelNo.State = adStateOpen) Then de.rscmdFreeTelNo.Close
    If (FreeNumTableAccessSW = False) Then
        de.rscmdFreeTelNo.Open "SELECT * FROM FreeTelNo", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdFreeTelNo.Open "SELECT * FROM FreeTelNo", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdMessage.State = adStateOpen) Then de.rscmdMessage.Close
    If (de.rscmdShowMessege.State = adStateOpen) Then de.rscmdShowMessege.Close
 
    If (MessageTableAccessSW = False) Then
        de.rscmdMessage.Open "SELECT * FROM Message", de.cnnTelephone, adOpenKeyset, adLockReadOnly
        de.rscmdShowMessege.Open "SELECT * FROM ShowMessege", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdMessage.Open "SELECT * FROM Message", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        de.rscmdShowMessege.Open "SELECT * FROM ShowMessege", de.cnnTelephone, adOpenKeyset, adLockOptimistic
 
    End If
    
    If (de.rscmdUpdateInfo.State = adStateOpen) Then de.rscmdUpdateInfo.Close
    If (UpdateInfoTableAccessSW = False) Then
        de.rscmdUpdateInfo.Open "SELECT * FROM UpdateInfo", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdUpdateInfo.Open "SELECT * FROM UpdateInfo", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdSamSetting.State = adStateOpen) Then de.rscmdSamSetting.Close
    If (SamSettingTableAccessSW = False) Then
        de.rscmdSamSetting.Open "SELECT * FROM SamSetting", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdSamSetting.Open "SELECT * FROM SamSetting", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdChargging.State = adStateOpen) Then de.rscmdChargging.Close
    If (CharggingTableAccessSW = False) Then
        de.rscmdChargging.Open "SELECT * FROM Chargging", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdChargging.Open "SELECT * FROM Chargging", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    If (de.rscmdCharggingScheduller.State = adStateOpen) Then de.rscmdCharggingScheduller.Close
    If (de.rscmdChargeLevel.State = adStateOpen) Then de.rscmdChargeLevel.Close
    If (de.rscmdDayType.State = adStateOpen) Then de.rscmdDayType.Close
    If (de.rscmdCity.State = adStateOpen) Then de.rscmdCity.Close
    
    If (CharggingTableAccessSW = False) Then
        de.rscmdCharggingScheduller.Open "SELECT * FROM CharggingScheduller", de.cnnTelephone, adOpenKeyset, adLockReadOnly
        de.rscmdChargeLevel.Open "SELECT * FROM ChargeLevel", de.cnnTelephone, adOpenKeyset, adLockReadOnly
        de.rscmdDayType.Open "SELECT * FROM DayType", de.cnnTelephone, adOpenKeyset, adLockReadOnly
        de.rscmdCity.Open "SELECT * FROM City", de.cnnTelephone, adOpenKeyset, adLockReadOnly

    Else
        de.rscmdCharggingScheduller.Open "SELECT * FROM CharggingScheduller", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        de.rscmdChargeLevel.Open "SELECT * FROM ChargeLevel", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        de.rscmdDayType.Open "SELECT * FROM DayType", de.cnnTelephone, adOpenKeyset, adLockOptimistic
        de.rscmdCity.Open "SELECT * FROM City", de.cnnTelephone, adOpenKeyset, adLockOptimistic
 
    End If
    
    If (de.rscmdUsers.State = adStateOpen) Then de.rscmdUsers.Close
    If (UserTableAccessSW = False) Then
        de.rscmdUsers.Open "SELECT * FROM Users", de.cnnTelephone, adOpenKeyset, adLockReadOnly
    Else
        de.rscmdUsers.Open "SELECT * FROM Users", de.cnnTelephone, adOpenKeyset, adLockOptimistic
    End If
    
    
    
    
End Sub

Private Function Rev2Bit(b As Byte) As Byte
   a = CByte(((b And 1) * 2) Or ((b And 2) \ 2))
   Rev2Bit = CByte(a)
End Function

Private Function Rev3Bit(b As Byte) As Byte
   a = CByte(((b And 1) * 4) Or (((b And 2) \ 2) * 2) Or ((b And 4) \ 4))
   Rev3Bit = CByte(a)

End Function

Private Function Rev5Bit(b As Byte) As Byte

   a = CByte(((b And 1) * 16) Or (((b And 2) \ 2) * 8) Or (((b And 4) \ 4) * 4) Or (((b And 8) \ 8) * 2) Or ((b And 16) \ 16))
   Rev5Bit = CByte(a)

End Function

Private Function Rev8Bit(b As Byte) As Byte

   a = CByte(((b And 1) * 128) Or (((b And 2) \ 2) * 64) Or (((b And 4) \ 4) * 32) Or (((b And 8) \ 8) * 16) Or (((b And 16) \ 16) * 8) Or (((b And 32) \ 32) * 4) Or (((b And 64) \ 64) * 2) Or ((b And 128) \ 128))
   Rev8Bit = CByte(a)

End Function

