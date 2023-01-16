Attribute VB_Name = "modFunc"
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Public Sub OpenRecordset(ByRef rs As ADODB.Recordset, Optional strSql As String = "")
    With rs
        If .State = adStateOpen Then .Close

        If (Trim(strSql) = "") Then
            rs.Open ', de.cnnTelephone, adOpenKeyset, adLockOptimistic
        Else
            rs.Open strSql, de.cnnTelephone, adOpenKeyset, adLockOptimistic
        End If
    End With

'    If (rs.State = adStateClosed) Then rs.Open
End Sub

Public Sub ReadDataFromFile(PhoneStationSerialNo As Long)
    Dim IndexCounter As Integer
    Dim PhoneStationID As Long
    Dim CardState As Byte
    
 
'    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Read As #1 Len = Len(FileBlockTemp)
    Open Form1.Text1.Text For Random Access Read As #1 Len = Len(FileBlockTemp)

    Get #1, 1, FileBlockTemp

    Close #1
   ' SetCalled PhoneStationSerialNo
    PhoneStationID = DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
   ' PhoneStationID = PhoneStationSerialNo
    'If (Not IsInPhoneStations(PhoneStationID)) Then Exit Sub
    
    
    ' for Call Block
    OpenRecordset de.rscmdPhoneCall

    With de.rscmdPhoneCall

        For IndexCounter = 0 To 199
            If (FileBlockTemp.FileCallBlock(IndexCounter).CallCode = 255) Then
                Exit For
            End If


            PhoneCardSerialNo = (DecodeLong(FileBlockTemp.FileCallBlock(IndexCounter).CallCardSerialNo))
            FinalPrice = DecodeLong(FileBlockTemp.FileCallBlock(IndexCounter).CallFinalPrice)

            If (FinalPrice = 0) Then
                CardState = 1
            Else
                CardState = 0
            End If

            If (Not checkPhoneCard(PhoneCardSerialNo)) Then
                AddUpdateCardList PhoneCardSerialNo, CardState, True
            Else
                If (CardState = 1 And FileBlockTemp.FileCallBlock(IndexCounter).CallCode <> 160) Then
                    AddUpdateCardList PhoneCardSerialNo, CardState, False
                End If
            End If

            .AddNew
            !PhoneCardRef = DecodeLong(FileBlockTemp.FileCallBlock(IndexCounter).CallCardSerialNo)
            !PhoneStationRef = PhoneStationID ' DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
            !CallEventCodeRef = FileBlockTemp.FileCallBlock(IndexCounter).CallCode
            !InitialPrice = 10 * DecodeLong(FileBlockTemp.FileCallBlock(IndexCounter).CallInitialPrice)
            !FinalPrice = 10 * DecodeLong(FileBlockTemp.FileCallBlock(IndexCounter).CallFinalPrice)
            !PalsCount = DecodeInt(FileBlockTemp.FileCallBlock(IndexCounter).CallPalsCount)
            !CallYear = CalculateYear(CByte(Year(Now) - 2006)) 'CalculateYear(FileBlockTemp.FileHeaderBlock.HeaderYear) '
            !CallMonth = CByte(Month(Now)) 'DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderMonth, 1) '
            !CallDay = CByte(Day(Now)) ' DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderDay, 0) '
            !CallHour = DecodeBCD(FileBlockTemp.FileCallBlock(IndexCounter).CallHour, 0)
            !CallMinute = DecodeBCD(FileBlockTemp.FileCallBlock(IndexCounter).CallMinute, 0)
            !DayInWeekRef = CByte(Weekday(Now)) 'DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderMonth, 2)
             If (de.rscmdBaseInformation.State = adStateClosed) Then de.rscmdBaseInformation.Open
            !PalsPrice = de.rscmdBaseInformation!NewPalsPrice
            !DistinationNumber = DecodeTelNo(FileBlockTemp.FileCallBlock(IndexCounter).CallDistinationNumber)
            .Update
        Next IndexCounter
    End With
    
    
    'for Ring Block
    OpenRecordset de.rscmdRingEvent

    With de.rscmdRingEvent

        For IndexCounter = 0 To 9
            If (FileBlockTemp.FileRingEventBlock(IndexCounter).RingEventCode = 255) Then
                Exit For
            End If

            .AddNew

            !PhoneStationRef = PhoneStationID 'DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
            !RingEventCodeRef = FileBlockTemp.FileRingEventBlock(IndexCounter).RingEventCode
            !RingEventHour = DecodeBCD(FileBlockTemp.FileRingEventBlock(IndexCounter).RingEventHour, 0)
            !RingEventMinute = DecodeBCD(FileBlockTemp.FileRingEventBlock(IndexCounter).RingEventMinute, 0)
            !RingEventTelNo = DecodeTelNo(FileBlockTemp.FileRingEventBlock(IndexCounter).RingEventTelNo)
            !RingEventDay = CByte(Day(Now)) '
            !RingEventMonth = CByte(Month(Now))  '
            !RingEventYear = CByte(Year(Now) - 2000) '
            
            .Update
        Next IndexCounter
    End With



    'for OtherEvent Block
    OpenRecordset de.rscmdOtherEvent

    With de.rscmdOtherEvent

        For IndexCounter = 0 To 9
            If (FileBlockTemp.FileOtherEventBlock(IndexCounter).OtherEventCode = 255) Then
                Exit For
            End If

            .AddNew

            !PhoneStationRef = PhoneStationID ' DecodeLong(FileBlockTemp.FileHeaderBlock.HeaderPhoneStationSerial)
            !OtherEventCodeRef = FileBlockTemp.FileOtherEventBlock(IndexCounter).OtherEventCode
            !OtherEventHour = DecodeBCD(FileBlockTemp.FileOtherEventBlock(IndexCounter).OtherEventHour, 0)
            !OtherEventMinute = DecodeBCD(FileBlockTemp.FileOtherEventBlock(IndexCounter).OtherEventMinute, 0)
            !OtherEventYear = CalculateYear(FileBlockTemp.FileHeaderBlock.HeaderYear)
            !OtherEventMonth = CByte(Month(Now)) ' DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderMonth, 1) '
            !OtherEventDay = CByte(Day(Now)) 'DecodeBCD(FileBlockTemp.FileHeaderBlock.HeaderDay, 0) '
            .Update
        Next IndexCounter
    End With
    
End Sub
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

Public Sub SaveTapEvent(PhoneStationSerialNo As Long)
   On Error Resume Next
    OpenRecordset de.rscmdOtherEvent
    
    With de.rscmdOtherEvent
                       
            .AddNew
            
            !PhoneStationRef = PhoneStationSerialNo
            !OtherEventCodeRef = 162 'line tap
            !OtherEventHour = Hour(Time)
            !OtherEventMinute = Minute(Time)
            !OtherEventDay = Day(Now)
            !OtherEventMonth = Month(Now)
            !OtherEventYear = Year(Now)
            
            .Update
    End With
End Sub


Public Sub SendDataToFile(PhoneStationSerialNo As Long, DataType As Byte)
    Dim strQuery As String
    Dim IndexCounter As Integer
    Dim ByteCounter As Integer
    Dim strFileName As String

    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Read Write As #1 Len = Len(FileBlockTemp)

    Get #1, 1, FileBlockTemp

    With de.rscmdPhoneStation
        If (.State = adStateClosed) Then .Open
        
        .Find "ID=" & PhoneStationSerialNo
        
        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then
            Close #1
            Exit Sub
        End If
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
                
                If (.RecordCount > 0) Then
                    .MoveFirst
                    
                    For IndexCounter = 0 To 15
                        For ByteCounter = 0 To 11
                            FileBlockTemp.FilePMSTelNoBlock(IndexCounter).PMSTelNo.TelNo(ByteCounter) = 255
                        Next ByteCounter
                    Next IndexCounter
                    
                    For IndexCounter = 0 To 15
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                        
                        FileBlockTemp.FilePMSTelNoBlock(IndexCounter).PMSTelNo = CodeTelNo(!ID)
                        
                        .MoveNext
                    Next IndexCounter
                End If
            End With
            
            
            ' for Free TelNo
            With de.rscmdFreeTelNo
                If (.State = adStateClosed) Then .Open
                
                If (.RecordCount > 0) Then
                    .MoveFirst
                    
                    For IndexCounter = 0 To 19
                        For ByteCounter = 0 To 11
                            FileBlockTemp.FileFreeTelNoBlock(IndexCounter).FreeTelNo.TelNo(ByteCounter) = 255
                        Next ByteCounter
                    Next IndexCounter
                    
                    For IndexCounter = 0 To 19
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                        
                        FileBlockTemp.FileFreeTelNoBlock(IndexCounter).FreeTelNo = CodeTelNo(!ID)
                        .MoveNext
                    Next IndexCounter
                End If
            End With
            
            ' for chargging
            With de.rscmdChargging
                If (.State = adStateClosed) Then .Open
                
                If (.RecordCount > 0) Then
                
                    .MoveFirst
                                          
                    For IndexCounter = 0 To 299
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPreNo.a = 255
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPreNo.b = 255
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPreNo.c = 255
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPreNo.d = 255
                        
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingBlockTime = 255
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPalsPerBlockZone1 = 255
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPalsPerBlockZone2 = 255
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPalsPerBlockZone3 = 255
                    
                    Next IndexCounter
                
                    For IndexCounter = 0 To 299
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
                            
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPreNo = CodeBCDLong(!PreNo)
                        
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingBlockTime = !TimeBlock
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPalsPerBlockZone1 = !TimeBlockPalsZone1
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPalsPerBlockZone2 = !TimeBlockPalsZone2
                        FileBlockTemp.FileCharggingBlock(IndexCounter).CharggingPalsPerBlockZone3 = !TimeBlockPalsZone3
                        
                        .MoveNext
                    Next IndexCounter
                    
                End If
            End With
            
            ' for BlackList
            With de.rscmdBlackList
                If (.State = adStateClosed) Then .Open

                If (.RecordCount > 0) Then

                    .MoveFirst

                    For IndexCounter = 0 To 199
                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListFromNo.a = 255
                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListFromNo.b = 255
                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListFromNo.c = 255
                        'FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListFromNo.d = 255

                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListToNo.a = 255
                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListToNo.b = 255
                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListToNo.c = 255
                        'FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListToNo.d = 255
                    Next IndexCounter

                    For IndexCounter = 0 To 199
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For

                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListFromNo = CodeCardSerial(!FromNo)
                        FileBlockTemp.FileBlackListBlock(IndexCounter).BlackListToNo = CodeCardSerial(!ToNo)

                        .MoveNext
                    Next IndexCounter

                End If
            End With
            
            ' for WhiteList
            With de.rscmdWhiteList
                If (.State = adStateClosed) Then .Open

                If (.RecordCount > 0) Then

                    .MoveFirst

                    For IndexCounter = 0 To 199
                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListFromNo.a = 255
                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListFromNo.b = 255
                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListFromNo.c = 255
                        'FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListFromNo.d = 255

                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListToNo.a = 255
                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListToNo.b = 255
                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListToNo.c = 255
                        'FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListToNo.d = 255
                    Next IndexCounter

                    For IndexCounter = 0 To 199
                        If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For

                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListFromNo = CodeCardSerial(!FromNo)
                        FileBlockTemp.FileWhiteListBlock(IndexCounter).WhiteListToNo = CodeCardSerial(!ToNo)

                        .MoveNext
                    Next IndexCounter

                End If
            End With


            ' for Message
            With de.rscmdBaseInformation
                If (.State = adStateClosed) Then .Open
                
                .MoveFirst
                
                strFileName = App.Path & "\Data\Messages\M" & Trim(Str(!MessageRef)) & ".bin"
    
    
                Open strFileName For Random Access Read Write As #2 Len = Len(FileBlockTemp.FileMessageBlock)
                                
                
                Get #2, 1, FileBlockTemp.FileMessageBlock
                
                Close #2
            End With
    
            
'            With de.rscmdCharggingScheduller
'                If (.State = adStateClosed) Then .Open
'
'                If (.RecordCount > 0) Then
'                    .MoveFirst
'
'                    For IndexCounter = 0 To 6
'                        For ByteCounter = 0 To 23
'                            FileBlockTemp.FileHourInDayInWeek(IndexCounter, ByteCounter) = 255
'                        Next ByteCounter
'                    Next IndexCounter
'
'                For IndexCounter = 0 To 6
'                    If (.EOF Or .BOF Or .AbsolutePosition = adPosUnknown) Then Exit For
'
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 0) = !H1
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 1) = !H2
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 2) = !H3
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 3) = !H4
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 4) = !H5
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 5) = !H6
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 6) = !H7
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 7) = !H8
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 8) = !H9
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 9) = !H10
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 10) = !H11
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 11) = !H12
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 12) = !H13
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 13) = !H14
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 14) = !H15
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 15) = !H16
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 16) = !H17
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 17) = !H18
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 18) = !H19
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 19) = !H20
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 20) = !H21
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 21) = !H22
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 22) = !H23
'                        FileBlockTemp.FileHourInDayInWeek(IndexCounter, 23) = !H24
'
'                        .MoveNext
'                Next IndexCounter
'
'                End If
'            End With
    
            With de.rscmdPhoneStation
                
                FileBlockTemp.FileAlarmBlock.AlarmSwitch = 161
                FileBlockTemp.FileAlarmBlock.AlarmHour = !SendDataHour
                FileBlockTemp.FileAlarmBlock.AlarmMinute = !SendDataMinute
                FileBlockTemp.FileCharggingType = !CharggingType
                FileBlockTemp.FileCharggingRoutin = !CharggingRoutin
                FileBlockTemp.FileRinger = !Ringer
                FileBlockTemp.FileDialingRule = !DialingRule
                FileBlockTemp.FilePhoneAccessLevel = !PhoneAccessLevel
                FileBlockTemp.FileDialingType = !DialingType
                FileBlockTemp.FileReportScheduling = !ReportScheduling
                FileBlockTemp.FilePhoneGroup = !PhoneGroup

            End With
    End Select

    Put #1, 1, FileBlockTemp
    
    Close #1
    
End Sub

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
    
    CodeLong.a = lngno
End Function

Public Function DecodeInt(MyIntNo As MyInteger)
    DecodeInt = MyIntNo.a
    DecodeInt = DecodeInt * 256 + MyIntNo.b
End Function
Public Function CodeCardSerial(ByVal LongNo) As MyCardSerialType
    lngno = LongNo
    
    CodeCardSerial.c = MyMod(lngno, 256)
    lngno = lngno \ 256
    
    CodeCardSerial.b = MyMod(lngno, 256)
    lngno = lngno \ 256
    
    CodeCardSerial.a = CByte(lngno)


End Function
Public Function CodeInt(IntNo) As MyInteger
    CodeInt.b = IntNo Mod 256
    IntNo = IntNo \ 256
    
    CodeInt.a = IntNo
End Function

Public Function DecodeTelNo(ArrayTelNo As MyTelNo)
    Dim IndexCounter As Integer
    
    IndexCounter = 0
    
    While ArrayTelNo.TelNo(IndexCounter) < 10 And (IndexCounter < 11)
        DecimalTelNo = DecimalTelNo * 10 + ArrayTelNo.TelNo(IndexCounter)
        IndexCounter = IndexCounter + 1
    Wend
    
    DecodeTelNo = DecimalTelNo
End Function

Public Function CodeTelNo(DecimalTelNo) As MyTelNo
    Dim IndexCounter As Integer
    Dim ShiftCounter As Integer
    
    IndexCounter = 11
    
    While DecimalTelNo > 0
        CodeTelNo.TelNo(IndexCounter) = DecimalTelNo Mod 10
        DecimalTelNo = DecimalTelNo \ 10
        IndexCounter = IndexCounter - 1
    Wend
    
'    IndexCounter = IndexCounter + 1
    
    While IndexCounter >= 0
        For ShiftCounter = 0 To 10
            CodeTelNo.TelNo(ShiftCounter) = CodeTelNo.TelNo(ShiftCounter + 1)
        Next ShiftCounter
        
        CodeTelNo.TelNo(11) = 255
        IndexCounter = IndexCounter - 1
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

Public Function MyMod(a, b)
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
Public Sub SetSkin(frm As Object)
'    FormSkin.RemoveSkin frm.hWnd
    FormSkin.ApplySkin frm.hWnd
End Sub

Public Sub SetCalled(PhoneStationID As Long)
Dim strQuery As String
            With de.rscmdPhoneStation
                strQuery = "SELECT * From PhoneStation " & _
                "WHERE PhoneStation.ID = " + Str(PhoneStationID) + " ;"
                OpenRecordset de.rscmdPhoneStation, strQuery
                de.rscmdPhoneStation!Called = 1
                .Update
            End With

End Sub
