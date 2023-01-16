VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmInCom 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   690
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3150
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   690
   ScaleWidth      =   3150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer CommandTimer 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2640
      Top             =   120
   End
   Begin VB.Timer GetPackTimer 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   2160
      Top             =   120
   End
   Begin VB.Timer ClearStageTimer 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   1680
      Top             =   120
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   1200
      Top             =   120
   End
   Begin MSCommLib.MSComm com 
      Left            =   90
      Top             =   45
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   4
      DTREnable       =   -1  'True
      InputLen        =   100
      RThreshold      =   7
      RTSEnable       =   -1  'True
      BaudRate        =   115200
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   40000
      Left            =   720
      Top             =   135
   End
End
Attribute VB_Name = "frmInCom"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Base 1

Const ACK = 165     'aknowlage
Const NACK = 195    'not acknowlage
Const EOU = 141     'end of update
Const SOU = 149     'start of update
Const EOR = 145     'end of report
Const SOR = 153     'start of report
Const HI = 129      'start of comunication
Const HI_ACK = 221 '
Const HI_NACK = 201 '
Const GET_PACK = 179 '
Const CLR_STG_LENGTH = 20 '
Const EOR_ACK = 231 '
Const EOR_NACK = 173
Const BYE = 189     'end of communication
Const AUTHEN = 161  'authentication session
Const READY = 157   'ready to receive
Const EOP = 85      'end of package
Const SOP = 170     'start of package
Const Im_AntiTap_Agent = 70
Const its_emergency_report = 80

Const EmergencyEvent = 115
Const SendWindowSize = 200
Const ReceiveWindowSize = 100 '0
Const AddressOfUpdateAvailableSw = 6000

Const AddressAlarmUpdateSw = 10357 + 4029
Const AddressHourUpdateSw = 10353 + 4029
Const AddressMinuteUpdateSw = 10355 + 4029
Const AddressDayUpdateSw = 10360 + 4029
Const AddressMonthUpdateSw = 10362 + 4029
Const AddressPulsePriseUpdateSw = 10365 + 4029

Const wait_for_connection = 1
Const wait_for_HI = 2
Const wait_for_SOR = 3
Const wait_for_EOR = 4
Const wait_for_ACK = 5
Const wait_for_PACK = 6
Const wait_for_CRC = 7
Const wait_for_RING = 8
Const wait_for_OK = 9
Const wait_for_READY = 10
Const wait_for_NACK = 11
Const wait_for_BYE = 12
Const wait_for_AT_ok = 13
Const wait_for_ATN0_ok = 14
Const wait_for_ATB0_ok = 15
Const wait_for_ATV0_ok = 16
Const wait_for_ATS37_ok = 17
Const wait_for_ATM0_ok = 18
Const wait_for_ATE0_ok = 19
Const wait_for_clear_stage_1 = 20 '''''''''''''''''''''''
Const wait_for_clear_stage_2 = 21 '''''''''''''''''''''''
Const wait_for_clear_stage_3 = 22 '''''''''''''''''''''''
Const wait_for_clear_stage_4 = 23 '''''''''''''''''''''''

Const StartComport = 2
Const ModemSetup = 1
Const MANAGEMENT = 0
Const RECEIVE_REPORT = 200
Const SEND_UPDATE = 100
Const EmergencyReport = 150

Const MapSize = 10400 + 4029
Const StarOfUpdateBlock = 6001

Const PmsNoTableAddr = 6001
Const FreeNoTableAddr = 6001 + 194
Const ChargingTableAddr = 6001 + 194 + 242 + 2
Const ChargeScheduleTableAddr = 6001 + 194 + 242 + 4502
Const DayTypeTableAddr = 6001 + 194 + 242 + 4502 + 82

Const BlackListTableAddr = 6001 + 194 + 242 + 4502 + 82 + 365
Const WhiteListTableAddr = 6001 + 194 + 242 + 4502 + 82 + 365 + 1200
Const SamTableAddr = 6001 + 194 + 242 + 4502 + 82 + 1200 + 365 + 1200
Const MessageTableAddr = 6001 + 194 + 242 + 4502 + 82 + 1200 + 365 + 1200 + 86
Const SettingTableAddr = 6001 + 194 + 242 + 4502 + 82 + 1200 + 365 + 1200 + 86 + 512
Const ProgramSize = 61440 'f000 hex
Const AllReportPacks = 60

Dim ProgramMap(ProgramSize) As Byte
Dim FileMap(MapSize) As Byte
Dim rec_crc_lo As Byte
Dim rec_crc_hi As Byte
Dim cal_crc_lo As Byte
Dim cal_crc_hi As Byte
Dim command_tmp As Byte
Dim mode As Byte
Dim State As Byte
Dim q As String
Dim iCurrentCRC As Long

Dim SendPageCounter As Byte
Dim ReceivePageCounter As Byte
Dim PhoneStationID As Long
Dim LocalHandler As Byte
Dim NeedToUpdate As Boolean

Dim PMSNumUpdateSw As Boolean
Dim FreeNumUpdateSw As Boolean
Dim ChargingUpdateSw As Boolean
Dim ChargeSchedulerUpdateSw As Boolean
Dim BlackListUpdateSw As Boolean
Dim WhiteListUpdateSw As Boolean
Dim SamUpdateSw As Boolean
Dim MessageUpdateSW As Boolean
Dim SettingUpdateSw As Boolean
Dim DayTypeUpdateSw As Boolean
Dim ProgramUpdateSw As Boolean
Dim SynchronizeSw As Boolean

Dim UpdatePolicy1 As Byte
Dim UpdatePolicy2 As Byte
Dim ModemCondition As Byte
Const ERROR = 100
Const OFF = 0
Const NORMAL = 1


Private Sub ClearStageTimer_Timer()
On Error Resume Next
Dim s As String
    com.InputLen = com.InBufferSize
    s = com.Input
                            
                            Select Case mode
                                Case wait_for_clear_stage_1:
                                    ClearStageTimer.Enabled = False
                                    send_GET_PACK
                                    ClearStageTimer.Enabled = True
                                    mode = wait_for_clear_stage_1
                                   com.RThreshold = CLR_STG_LENGTH
                                
                                Case wait_for_clear_stage_2:
                                    ClearStageTimer.Enabled = False
                                    send_ACK
                                    ClearStageTimer.Enabled = True
                                    mode = wait_for_clear_stage_2
                                    com.RThreshold = CLR_STG_LENGTH
                                
                                Case wait_for_clear_stage_3:
                                      ClearStageTimer.Enabled = False
                                    send_NACK
                                    ClearStageTimer.Enabled = True
                                    mode = wait_for_clear_stage_3
                                    com.RThreshold = CLR_STG_LENGTH
                                
                                Case wait_for_clear_stage_4:
                                     ClearStageTimer.Enabled = False
                                    send_EOR_ACK
                                    ClearStageTimer.Enabled = True
                                    mode = wait_for_clear_stage_4
                                    com.RThreshold = CLR_STG_LENGTH
                                
                                End Select

End Sub

Private Sub com_OnComm()
On Error Resume Next
'On Error GoTo EH

Dim s As String
Dim p As String
Dim x As Integer

Dim TmpID As MyLong
    
   With com
    
    .InputLen = .RThreshold
    s = .Input
    Select Case State
'---------------------------------------------
       Case StartComport:
        Select Case mode
                 Case wait_for_AT_ok:
                        
                        p = Mid(s, 4, 1)
                        If (p = "0") Then
                          StartIncom
                        End If

        End Select
'---------------------------------------------
       Case ModemSetup:
            
                Select Case mode
                
                    Case wait_for_ATE0_ok:
                
                    Case wait_for_ATB0_ok:
                    
                      clear_receive_buffer
                      com.RThreshold = 6
                      com.Output = "atn0" + vbCrLf
                      mode = wait_for_ATN0_ok
                      State = ModemSetup
                    
                    Case wait_for_ATM0_ok:
                      
                      clear_receive_buffer
                      com.RThreshold = 9
                      com.Output = "ats37=5" + vbCrLf
                      mode = wait_for_ATS37_ok
                      State = ModemSetup
                    
                    Case wait_for_ATN0_ok:
                      
                      clear_receive_buffer
                      com.RThreshold = 6
                      com.Output = "atm0" + vbCrLf
                      mode = wait_for_ATM0_ok
                      State = ModemSetup
                    
                    Case wait_for_ATS37_ok:
                    
                      clear_receive_buffer
                      com.RThreshold = 4
                      com.Output = "at" + vbCrLf
                      mode = wait_for_AT_ok
                      State = ModemSetup

                    Case wait_for_ATV0_ok:
                      p = Mid(s, 6, 1)
                      'u If (p = "0") Then
                      clear_receive_buffer
                      com.RThreshold = 6
                      com.Output = "atb0" + vbCrLf
                      mode = wait_for_ATB0_ok
                      State = ModemSetup
                      'u End If
                        
                        
                    Case wait_for_AT_ok:
                        p = Mid(s, 4, 1)
                  ' u     If (p = "0") Then
                        frmMain.SetStandBy (LocalHandler)
                        ModemCondition = NORMAL
                        clear_receive_buffer
                        mode = wait_for_RING
                        State = MANAGEMENT
                        com.RThreshold = 1
                        
                        ''''''''''''''''''''''''''''
                        '''''''''''in ghesmat baraye test bedoone khat ezafe shode'''''''''''''''''
                        ''''''''''''''''''''''''''''
                        ''''''''''''''''''''''''''''
'
'                            AnswerCall
'
'                        frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Start Time: " + Str(Time) + vbCrLf
'
'                        frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Channel" + Str(LocalHandler) + vbCrLf
'
'                         frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "RING" + vbCrLf
'                         frmMain.SetRinged (LocalHandler)
'
'                                                        State = MANAGEMENT
'                                                        mode = wait_for_connection
'                                                        .RThreshold = 1
'
'                                                    clear_receive_buffer
'
                        ''''''''''''''''''''''''''''
                        ''''''''''''''''''''''''''''
                        ''''''''''''''''''''''''''''


'    u                    Else
'
'    u                     ModemCondition = OFF
'    u                     frmMain.SetPowerOff (LocalHandler)
'    u                    Timer2.Enabled = True
'    u                    End If
                
                End Select 'mode
'---------------------------------------------
       Case MANAGEMENT:
                       Select Case .RThreshold
                            Case 1:
                                p = Mid(s, 1, 1)
                                    Select Case mode
                                        Case wait_for_connection:
                                                If (p = "1") Or (p = "5") Then
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "CONNECTED" + vbCrLf
     frmMain.SetConnected (LocalHandler)
                                           '''''''''''''''
                                                   ' .RTSEnable = False
                                                   ' .DTREnable = False
                                                   ' .DSRHolding = False
                                            '''''''''''''
                                                    State = RECEIVE_REPORT
                                                    mode = wait_for_HI
                                                    CommandTimer.Enabled = True
                                                    .RThreshold = 3
                                                 End If
                                                clear_receive_buffer
                                        
                                        Case wait_for_RING:
                                                 If (p = "2") Then
                                                    AnswerCall
    
    frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Start Time: " + Str(Time) + vbCrLf
    
    frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Channel" + Str(LocalHandler) + vbCrLf
                                                
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "RING" + vbCrLf
     frmMain.SetRinged (LocalHandler)
                                                    State = MANAGEMENT
                                                    mode = wait_for_connection
                                                    .RThreshold = 1
                                                 End If
                                                clear_receive_buffer
                                            
                                        Case wait_for_OK:
                                                If (p = "0") Then
                                                .Output = "ath" + vbCrLf
                                                StartIncom
                                                 End If
                                               
                                                
                                    End Select
                        End Select
'---------------------------------------------------
       Case RECEIVE_REPORT:
           If .CDHolding = False Then
           Timer1.Enabled = False

            disconnect
            frmMain.refresh_line LocalHandler
            Exit Sub
           
           End If
                Select Case .RThreshold
                    
                    Case 3:
                        p = Mid(s, 2, 1)
                        If (p <> "") Then command_tmp = Asc(p)
                            Select Case mode
                                Case wait_for_HI:
                                    If (command_tmp = HI) Then
                                    CommandTimer.Enabled = False
                                       SetGuardTimer 60000 '30000
                                        frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Handshake complete" + vbCrLf
                                        
                                        send_HI_ACK
                                    CommandTimer.Enabled = True
                                        mode = wait_for_SOR
                                        .RThreshold = 3
                                        
                                    Else
                                     CommandTimer.Enabled = False

                                        send_HI_NACK
                                    CommandTimer.Enabled = True
                                        mode = wait_for_HI
                                        .RThreshold = 3
                                        
                                    End If
                              '  Case wait_for_BYE
                                
                                Case wait_for_ACK:
                                       If (command_tmp = ACK) Then
                                            mode = wait_for_SOR
                                            .RThreshold = 3
                                       Else
                                            If (command_tmp = its_emergency_report) Then
                                                State = EmergencyReport
                                                send_ACK
                                                .RThreshold = 6
                                            End If
                                      End If
                                Case wait_for_SOR:
                                        If (command_tmp = SOR) Then
                                    CommandTimer.Enabled = False
                                        frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Start of report" + vbCrLf
                                           send_GET_PACK
                                            ClearStageTimer.Enabled = True
                                            mode = wait_for_clear_stage_1
                                            .RThreshold = CLR_STG_LENGTH
                                            
                                        Else
                                            
                                            send_HI_ACK
                                    CommandTimer.Enabled = True
                                            
                                            mode = wait_for_SOR
                                            .RThreshold = 3
                                            
                                        End If
                                    
                                Case wait_for_EOR:
        
                                        If (command_tmp = EOR) Then
                                            SetGuardTimer 60000 '10000
                                            ClearStageTimer.Enabled = True
                                            mode = wait_for_clear_stage_4
                                            .RThreshold = CLR_STG_LENGTH
                                             send_EOR_ACK

                                        Else
                                            mode = wait_for_EOR
                                            .RThreshold = 3
                                            send_EOR_NACK


                                        End If
        
                            End Select
                    Case CLR_STG_LENGTH:
                          ClearStageTimer.Enabled = False ''''''''''''''''''
                            Select Case mode
                                Case wait_for_clear_stage_1:
                                

                                    q = s
                                    If CheckClearStagePack(q) Then
                                        ClearStageTimer.Enabled = False
                                        mode = wait_for_PACK
                                        GetPackTimer.Enabled = True
                                        .RThreshold = ReceiveWindowSize + 2
                                    Else
                                         send_GET_PACK
                                         ClearStageTimer.Enabled = True
                                         mode = wait_for_clear_stage_1
                                        .RThreshold = CLR_STG_LENGTH
                                    End If
                                
                                Case wait_for_clear_stage_2:
                                
                                    q = s
                                    If CheckClearStagePack(q) Then
                                            

                                            If (ReceivePageCounter = AllReportPacks) Then
                                                mode = wait_for_EOR
                                                .RThreshold = 3
                                            Else
                                                GetPackTimer.Enabled = True
                                                mode = wait_for_PACK
                                                .RThreshold = ReceiveWindowSize + 2
                                            End If

                                            ClearStageTimer.Enabled = False
                                            
                                            Else
                                                     send_ACK
                                                     ClearStageTimer.Enabled = True
                                                     mode = wait_for_clear_stage_2
                                                    .RThreshold = CLR_STG_LENGTH
                                            End If
                            
                                Case wait_for_clear_stage_3:
                                        
                                            q = s
                                            If CheckClearStagePack(q) Then
                                              GetPackTimer.Enabled = True
                                                        mode = wait_for_PACK
                                                        .RThreshold = ReceiveWindowSize + 2
                                                    ClearStageTimer.Enabled = False
                                            
                                            Else
                                                     send_NACK
                                                     ClearStageTimer.Enabled = True
                                                     mode = wait_for_clear_stage_3
                                                    .RThreshold = CLR_STG_LENGTH
                                            End If
                            
                                Case wait_for_clear_stage_4:
                                
                                    q = s
                                If CheckClearStagePack(q) Then
                                        SetGuardTimer 60000 '10000
                                        frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + vbCrLf + "End of report" + vbCrLf
                                                
                                               ''''''''''''''test ''''''''''''''
                                                CommandTimer.Enabled = False
                                                GetPackTimer.Enabled = False
                                                ClearStageTimer.Enabled = False
                                                    
                                                    WriteFile PhoneStationID
'                                                  ''''''''
                                                    ReadDataFromFile PhoneStationID
'                                                  ''''''''

                                        If (NeedToUpdate) Then
                                                    SetGuardTimer 60000 '10000
                                                  send_SOU
                                                     
                                                     mode = wait_for_READY
                                                    .RThreshold = 3
                                                    State = SEND_UPDATE
                                                    
                                                    
                                                    frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Start of update" + vbCrLf
                                        Else
                                                    Timer1.Enabled = False
                                                    send_BYE
                                                    'WriteFile PhoneStationID
                                                    'ReadDataFromFile PhoneStationID
                                                   UpdateTransactionLogReportOnly PhoneStationID
                                                    disconnect
                                                    frmMain.refresh_line LocalHandler
                                                       ' frmMain.SetStandBy (0)
 
                                                    

                                        End If

                                Else
                                             send_EOR_ACK
                                             ClearStageTimer.Enabled = True
                                             mode = wait_for_clear_stage_4
                                            .RThreshold = CLR_STG_LENGTH
                                End If
                            
                            End Select
                    
                    Case ReceiveWindowSize + 2:
                            Select Case mode
                                Case wait_for_PACK:
                                GetPackTimer.Enabled = False
                               SetGuardTimer 60000 '20000
                                q = s
                                    
                                    CalculatePackCrc (q)
''''''''''''''''''''''''''''''''''''
                        p = Mid(s, ReceiveWindowSize + 1, 1)
                        rec_crc_hi = Asc(p)
                        p = Mid(s, ReceiveWindowSize + 2, 1)
                        rec_crc_lo = Asc(p)
                                    
                                If (rec_crc_hi = cal_crc_hi) And (rec_crc_lo = cal_crc_lo) Then
                                              
                                              If (ReceivePageCounter = 0) Then
                                                  p = Mid(q, 1, 1)
                                                  TmpID.a = Asc(p)
                                                  p = Mid(q, 2, 1)
                                                  TmpID.b = Asc(p)
                                                  p = Mid(q, 3, 1)
                                                  TmpID.c = Asc(p)
                                                  p = Mid(q, 4, 1)
                                                  TmpID.d = Asc(p)
                                                  PhoneStationID = DecodeLong(TmpID)
                                                  frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Payphone ID:" + Str(GetPayphoneXDfromDataBase(PhoneStationID)) + vbCrLf
                                                  ReadFile PhoneStationID
                                              End If

                                             ReceivePageCounter = ReceivePageCounter + 1
                                             ''''''''''''''''''''
                                             If (ReceivePageCounter Mod 10) = 0 Then
                                             frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + " * "
                            
                                             End If
                                             '''''''''''''''''''''
                                             SaveReportPack q, ReceivePageCounter
 
                                   ' frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + vbCrLf + Str(rec_crc_hi) + vbCrLf + Str(rec_crc_lo) + vbCrLf
                                                send_ACK
                                            '''''''''''''
                                                 ClearStageTimer.Enabled = True
                                                 mode = wait_for_clear_stage_2
                                                .RThreshold = CLR_STG_LENGTH

                                            ''''''''''''''

                                Else
                                        ''    send_NACK'''''''''''''test
                                            '''''''''''''
                                                 ClearStageTimer.Enabled = True
                                                 mode = wait_for_clear_stage_3
                                                .RThreshold = CLR_STG_LENGTH

                                            ''''''''''''''

                                End If

''''''''''''''''''''''''''''''''''''
                            End Select
                End Select
'--------------------------------------------
          Case SEND_UPDATE:
           If .CDHolding = False Then
           Timer1.Enabled = False

            disconnect
            frmMain.refresh_line LocalHandler
            Exit Sub
           End If

               Select Case .RThreshold
                Case 1:
                
                Case 2:
                
                Case 3:
                     p = Mid(s, 2, 1)
                     If (p <> "") Then command_tmp = Asc(p)
                     
                     Select Case mode
                                Case wait_for_READY:
                                        If (command_tmp = READY) Then
                                        SetGuardTimer 60000 '40000
                                            ShowMessage (SendPageCounter)
                                             If (SendPageCounter = 90) Then
                                                Timer1.Enabled = False
                                                    send_EOU
                                                    frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "End of update" + vbCrLf
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    UpdateTransactionLog PhoneStationID
                                                    disconnect
                                                    frmMain.refresh_line LocalHandler
                                                  '  frmMain.SetStandBy (0)
 
                                                   
                                            Else
                                                SetGuardTimer 60000 '40000
                                                  TurnNextPage
                                                If (SendPageCounter = 91) Then
                                                   Timer1.Enabled = False
                                                    send_EOU
                                                    frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "End of Update" + vbCrLf
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    UpdateTransactionLog PhoneStationID
                                                    disconnect
                                                    frmMain.refresh_line LocalHandler
                                                  
                                                Else
                                                   
                                                 '  frmMain.UpdateProgress(LocalHandler).Value = SendPageCounter * 5.88
                                                    mode = wait_for_READY
                                                    .RThreshold = 3
                                                   
                                                   
                                                    SendUpdatePack (SendPageCounter) 'test
                                                    
                                                 End If
                                            End If
                                        Else
                                            'If (command_tmp = NACK) Then
                                             mode = wait_for_ACK
                                            .RThreshold = 3
                                            SendPageCounter = SendPageCounter - 1
                                            send_NACK
                                            'End If
                                        End If
                                
                                Case wait_for_ACK:
                                        If (command_tmp = ACK) Then
                                            mode = wait_for_READY
                                            .RThreshold = 3
'                                        Else
'                                            If (command_tmp = NACK) Then
'                                             mode = wait_for_ACK
'                                            .RThreshold = 3
'                                            send_NACK
'                                            End If
                                        End If
                     
                     
                     End Select
               End Select
 '----------------------------------------------------------------------
    Case EmergencyReport:
              If .CDHolding = False Then
           Timer1.Enabled = False

            disconnect
            frmMain.refresh_line LocalHandler
            Exit Sub
            End If
                        p = Mid(s, 3, 1)
                        TmpID.a = Asc(p)
                        p = Mid(s, 4, 1)
                        TmpID.b = Asc(p)
                        p = Mid(s, 5, 1)
                        TmpID.c = Asc(p)
                        p = Mid(s, 6, 1)
                        TmpID.d = Asc(p)
                        PhoneStationID = DecodeLong(TmpID)
                             frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Payphone Serial:" + Str(PhoneStationID) + vbCrLf
                           frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Emergency Report" + vbCrLf
                p = Mid(s, 2, 1)
                Dim Emergency_code As Byte
                Emergency_code = Asc(p)
                     '   HandleEmergencyEvent PhoneStationID, Emergency_code
                        .RThreshold = 0
                        HandleEmergencyEvent PhoneStationID, Emergency_code
                        Timer1.Enabled = False
                         disconnect
                        frmMain.refresh_line LocalHandler
                        'frmMain.SetStandBy (0)
                        
                       

        End Select 'select case state
    End With

Exit Sub
EH:
MsgBox "com_oncom"
End Sub
Private Sub TurnNextPage()
On Error Resume Next


nextpage:
SendPageCounter = SendPageCounter + 1

Select Case SendPageCounter
Case 1:
If (PMSNumUpdateSw = False) Then GoTo nextpage
Case 2:
If (FreeNumUpdateSw = False) Then GoTo nextpage
Case 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17:
If (ChargingUpdateSw = False) Then GoTo nextpage
Case 18:
If (ChargeSchedulerUpdateSw = False) Then GoTo nextpage
Case 19:
If (DayTypeUpdateSw = False) Then GoTo nextpage
Case 20, 21, 22:
If (BlackListUpdateSw = False) Then GoTo nextpage
Case 23, 24, 25:
If (WhiteListUpdateSw = False) Then GoTo nextpage
Case 26:
If (SamUpdateSw = False) Then GoTo nextpage
Case 27, 28:
If (MessageUpdateSW = False) Then GoTo nextpage
Case 29:
If (SettingUpdateSw = False) Then GoTo nextpage
Case 30 To 89:
If (ProgramUpdateSw = False) Then GoTo nextpage
Case 90:
If (SynchronizeSw = False) Then GoTo nextpage

End Select
End Sub
Private Sub clear_receive_buffer()
On Error Resume Next
   
   Dim a As String
    With com
        .InputLen = .InBufferCount
        a = .Input
    End With
End Sub
Private Sub dial(TelNo As String)
    
    com.Output = "atdt" + TelNo + vbCrLf
End Sub

Private Sub send_GET_PACK()
On Error Resume Next

    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = GET_PACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub

Private Sub send_EOR_ACK()
On Error Resume Next

    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = EOR_ACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_EOR_NACK()
On Error Resume Next

    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = EOR_NACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub

Private Sub send_ACK()
On Error Resume Next

    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = ACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_NACK()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = NACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_HI_ACK()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = HI_ACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_HI_NACK()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = HI_NACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub

Private Sub send_SOU()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Dim UpdatePolicy(2) As Byte
    
    Tmp(1) = SOP
    Tmp(2) = SOU
    Tmp(3) = EOP
    com.Output = Tmp
    
    UpdatePolicy(1) = UpdatePolicy2
    UpdatePolicy(2) = UpdatePolicy1
    com.Output = UpdatePolicy

End Sub
Private Sub send_EOU()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = EOU
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_HI()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = HI
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_BYE()
On Error Resume Next
    
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = BYE
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub CalculatePackCrc(a As String)
On Error Resume Next

Dim p As String
Dim i As Integer
        iCurrentCRC = 0
              For i = 1 To ReceiveWindowSize
              p = Mid(a, i, 1)
              CalculateCrc (Asc(p))
              Next i
End Sub
Private Function CheckClearStagePack(a As String) As Boolean
On Error Resume Next

Dim p As String
Dim x As Integer
Dim i As Integer
              x = 0
              For i = 1 To CLR_STG_LENGTH
              p = Mid(a, i, 1)
              If CByte(Asc(p)) = &HAA Then x = x + 1
              Next i
              
                If x > 5 Then
                  CheckClearStagePack = True
                Else
                  CheckClearStagePack = False
                End If
End Function

Private Sub SaveReportPack(a As String, Page As Byte)
On Error Resume Next
   
   Dim p As String
   Dim i As Integer
   Dim x As Integer
   
    For i = 1 To ReceiveWindowSize
       p = Mid(a, i, 1)
       x = i + (ReceiveWindowSize * (Page - 1))
        
        If x <= 5996 Then
            FileMap(i + (ReceiveWindowSize * (Page - 1))) = Asc(p)
        End If
    
    Next i
    
End Sub

Private Sub SendUpdatePack(Page As Byte)
On Error Resume Next
   
   Dim CrcTmp(2) As Byte
   Dim SendPmsNoPackTmp(194) As Byte
   Dim SendFreeNoPackTmp(242) As Byte
   Dim SendChargingPackTmp(300) As Byte
   Dim SendChargeSchedulePackTmp(82) As Byte
   Dim SendDayTypePackTmp(365) As Byte
   
   Dim SendBlackListPackTmp(400) As Byte
   Dim SendSamPackTmp(86) As Byte
   Dim SendMessagePackTmp(256) As Byte
   Dim SendSettingPackTmp(46) As Byte
   Dim SendProgramUpdatePackTmp(1024) As Byte
   Dim SendSynchronizePackTmp(6) As Byte
   
   Dim i As Variant
   Dim th As Variant
   
        iCurrentCRC = 0
        
       Select Case Page
       Case 1:
              For i = 1 To 194
               SendPmsNoPackTmp(i) = FileMap((PmsNoTableAddr - 1) + i)
               CalculateCrc (SendPmsNoPackTmp(i))
              Next i
         With com
          .Output = SendPmsNoPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 2:
              For i = 1 To 242
               SendFreeNoPackTmp(i) = FileMap((FreeNoTableAddr - 1) + i)
               CalculateCrc (SendFreeNoPackTmp(i))
              Next i
                With com
          .Output = SendFreeNoPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17:
              For i = 1 To 300
               SendChargingPackTmp(i) = FileMap((ChargingTableAddr - 1) + ((Page - 3) * 300) + i)
               CalculateCrc (SendChargingPackTmp(i))
              Next i
         With com
          .Output = SendChargingPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 18:
              For i = 1 To 82
               SendChargeSchedulePackTmp(i) = FileMap((ChargeScheduleTableAddr - 1) + i)
               CalculateCrc (SendChargeSchedulePackTmp(i))
              Next i
         With com
          .Output = SendChargeSchedulePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 19:
              For i = 1 To 365
               SendDayTypePackTmp(i) = FileMap((DayTypeTableAddr - 1) + i)
               CalculateCrc (SendDayTypePackTmp(i))
              Next i
         With com
          .Output = SendDayTypePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 20, 21, 22:
              For i = 1 To 400
               SendBlackListPackTmp(i) = FileMap((BlackListTableAddr - 1) + ((Page - 20) * 400) + i)
               CalculateCrc (SendBlackListPackTmp(i))
              Next i
         With com
          .Output = SendBlackListPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 23, 24, 25:
             For i = 1 To 400
               SendBlackListPackTmp(i) = FileMap((WhiteListTableAddr - 1) + ((Page - 23) * 400) + i)
               CalculateCrc (SendBlackListPackTmp(i))
             Next i
         With com
          .Output = SendBlackListPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 26:
              For i = 1 To 86
               SendSamPackTmp(i) = FileMap((SamTableAddr - 1) + i)
               CalculateCrc (SendSamPackTmp(i))
              Next i
         With com
          .Output = SendSamPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 27, 28:
              For i = 1 To 256
               SendMessagePackTmp(i) = FileMap((MessageTableAddr - 1) + ((Page - 27) * 256) + i)
               CalculateCrc (SendMessagePackTmp(i))
              Next i
         With com
          .Output = SendMessagePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 29:
              For i = 1 To 46
               SendSettingPackTmp(i) = FileMap((SettingTableAddr - 1) + i)
               CalculateCrc (SendSettingPackTmp(i))
              Next i
         With com
          
          .Output = SendSettingPackTmp
          
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
         
        End With
              
        Case 30 To 89:
              For i = 1 To 1024
              th = myMul((Page - 30), 1024) + i
               SendProgramUpdatePackTmp(i) = ProgramMap(th)
               CalculateCrc (SendProgramUpdatePackTmp(i))
              Next i
         With com
          .Output = SendProgramUpdatePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
             
           Case 90:
               
                SendSynchronizePackTmp(1) = CByte(("&h" + Trim(Str(Hour(Now)))))
                CalculateCrc (SendSynchronizePackTmp(1))
                SendSynchronizePackTmp(2) = CByte(("&h" + Trim(Str(Minute(Now)))))
                CalculateCrc (SendSynchronizePackTmp(2))
                SendSynchronizePackTmp(3) = CByte(("&h" + Trim(Str(Second(Now)))))
                CalculateCrc (SendSynchronizePackTmp(3))
                SendSynchronizePackTmp(4) = CByte(Abs(Year(Now) - 2008))
                CalculateCrc (SendSynchronizePackTmp(4))
                SendSynchronizePackTmp(5) = CByte(("&h" + Trim(Str(Month(Now)))))
                CalculateCrc (SendSynchronizePackTmp(5))
                SendSynchronizePackTmp(6) = CByte(("&h" + Trim(Str(Day(Now)))))
                CalculateCrc (SendSynchronizePackTmp(6))

         With com
          .Output = SendSynchronizePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
         
      End Select

End Sub

Private Sub disconnect()
On Error Resume Next
'On Error GoTo EH
Timer1.Enabled = False
ClearStageTimer.Enabled = False
GetPackTimer.Enabled = False
CommandTimer.Enabled = False

DoEvents
frmMain.MakeConnectionLog PhoneStationID, LocalHandler

'Sleep 2000
com.PortOpen = False
com.PortOpen = True
com.PortOpen = False

Sleep 2000
StartIncom

Exit Sub
EH:
MsgBox "disconnect"
End Sub
Private Sub ReadFile(PhoneStationSerialNo As Long)
On Error Resume Next
   
   Dim TmpFileMap(MapSize) As Byte
   Dim i As Integer
   
          
    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Read As #1 Len = MapSize
    Get #1, 1, TmpFileMap
    Close #1
            
            
            For i = 1 To MapSize
              FileMap(i) = TmpFileMap(i)
            Next i
       
       UpdatePolicy2 = FileMap(AddressOfUpdateAvailableSw - 2)
       UpdatePolicy1 = FileMap(AddressOfUpdateAvailableSw - 1)
        
PMSNumUpdateSw = False
FreeNumUpdateSw = False
ChargingUpdateSw = False
ChargeSchedulerUpdateSw = False
BlackListUpdateSw = False
WhiteListUpdateSw = False
SamUpdateSw = False
MessageUpdateSW = False
SettingUpdateSw = False
DayTypeUpdateSw = False
ProgramUpdateSw = False
SynchronizeSw = False

If ((UpdatePolicy1 And 1) <> 0) Then PMSNumUpdateSw = True
If ((UpdatePolicy1 And 2) <> 0) Then FreeNumUpdateSw = True
If ((UpdatePolicy1 And 4) <> 0) Then ChargingUpdateSw = True
If ((UpdatePolicy1 And 8) <> 0) Then ChargeSchedulerUpdateSw = True
If ((UpdatePolicy1 And 16) <> 0) Then DayTypeUpdateSw = True

If ((UpdatePolicy1 And 32) <> 0) Then BlackListUpdateSw = True
If ((UpdatePolicy1 And 64) <> 0) Then WhiteListUpdateSw = True
If ((UpdatePolicy1 And 128) <> 0) Then SamUpdateSw = True

If ((UpdatePolicy2 And 1) <> 0) Then MessageUpdateSW = True
If ((UpdatePolicy2 And 2) <> 0) Then SettingUpdateSw = True
If ((UpdatePolicy2 And 4) <> 0) Then ProgramUpdateSw = True
If ((UpdatePolicy2 And 8) <> 0) Then SynchronizeSw = True

'''''''''''''''''''''''''''''''''''''
'SettingUpdateSw = True
'SynchronizeSw = True
'
'       UpdatePolicy2 = 10
'       UpdatePolicy1 = 0
'
''''''''''''''''''''''''''''''''''''''
        If (FileMap(AddressOfUpdateAvailableSw) = 161) Then
        NeedToUpdate = True
        Else
        NeedToUpdate = False
        End If
    
End Sub
Private Sub ReadProgramUpgradeFile()
On Error Resume Next
   
   Dim i As Variant
   Dim tmpProgramMap1(32767) As Byte
   Dim tmpProgramMap2(32767) As Byte
          
    Open App.Path & "\Data\upgrade\b.bin" For Random Access Read As #1 Len = 32767
    Get #1, 1, tmpProgramMap1
    Close #1

    Open App.Path & "\Data\upgrade\c.bin" For Random Access Read As #1 Len = 32767
    Get #1, 1, tmpProgramMap2
    Close #1

            For i = 1 To 32767
              ProgramMap(i) = tmpProgramMap1(i)
            Next i

            For i = 32768 To ProgramSize
              ProgramMap(i) = tmpProgramMap2(i - 32767)
            Next i



End Sub

Private Sub WriteFile(PhoneStationSerialNo As Long)
On Error Resume Next
   
   Dim TmpFileMap(MapSize) As Byte
   Dim i As Integer
    
    For i = 1 To MapSize
              TmpFileMap(i) = FileMap(i)
            Next i
   
     TmpFileMap(AddressOfUpdateAvailableSw) = 0
     TmpFileMap(AddressAlarmUpdateSw) = 0
     TmpFileMap(AddressHourUpdateSw) = 0
     TmpFileMap(AddressMinuteUpdateSw) = 0
     TmpFileMap(AddressDayUpdateSw) = 0
     TmpFileMap(AddressMonthUpdateSw) = 0
     TmpFileMap(AddressPulsePriseUpdateSw) = 0
  
    Open App.Path & "\Data\F" & Trim(Str(PhoneStationSerialNo)) & ".bin" For Random Access Write As #1 Len = MapSize
    Put #1, 1, TmpFileMap
    Close #1
End Sub
Private Sub CalculateCrc(ByVal bValue As Byte)
On Error Resume Next
        
        Dim iValue As Long
        Dim CRCTemp As Long
        Dim Bit As Byte
        
        iValue = CInt(bValue)
        
        CRCTemp = iCurrentCRC Xor iValue
        
        For Bit = 0 To 7
            If (CRCTemp And 1) = 1 Then
                CRCTemp = CRCTemp \ 2
                CRCTemp = CRCTemp Xor 40961 ' x^16 + x^14 + x^1
            Else
                CRCTemp = CRCTemp \ 2
            End If
        Next
        
        iCurrentCRC = CRCTemp
        
        cal_crc_lo = CByte(iCurrentCRC Mod 256)
        cal_crc_hi = CByte(iCurrentCRC \ 256)
End Sub

Private Sub CommandTimer_Timer()
On Error Resume Next

Dim s As String
    com.InputLen = com.InBufferSize
    s = com.Input

                            Select Case mode
                                Case wait_for_HI:
                                    send_HI_NACK
                                    mode = wait_for_HI
                                   com.RThreshold = 3
                                
                                
                                Case wait_for_SOR:
                                    send_HI_ACK
                                    mode = wait_for_SOR
                                   com.RThreshold = 3
                                
                                End Select


End Sub

Private Sub Form_Load()
On Error GoTo EH
LocalHandler = IncomHandler
com.CommPort = PortNumber(LocalHandler)
StartIncom
Exit Sub
EH:
MsgBox "form_load"
End Sub
Private Sub StartIncom()

Dim sbuf As String

On Error GoTo EH
DoEvents

Timer2.Enabled = False
    With com
    .RThreshold = 0
    ReceivePageCounter = 0
    SendPageCounter = 0
       If (.PortOpen = False) Then .PortOpen = True


      clear_receive_buffer
      com.RThreshold = 6
        com.Output = "atv0" + vbCrLf
        mode = wait_for_ATV0_ok
        State = ModemSetup

'           Sleep 1000
'           com.Output = "atb0" + vbCrLf
'           Sleep 1000
'      clear_receive_buffer
'           com.Output = "at" + vbCrLf
'           Sleep 1000
'
'           sbuf = com.Input
'
'           If (sbuf <> "") Then
'           frmMain.SetStandBy (LocalHandler)
'        ModemCondition = NORMAL
'        clear_receive_buffer
'        mode = wait_for_RING
'        State = MANAGEMENT
'        com.RThreshold = 1
'        Else
'         ModemCondition = OFF
'         frmMain.SetPowerOff (LocalHandler)
'        Timer2.Enabled = True
'        End If
      End With
Exit Sub
EH:

Timer2.Enabled = True
ModemCondition = ERROR
 frmMain.SetError (LocalHandler)
End Sub
Private Sub AnswerCall()
On Error Resume Next

SetGuardTimer 60000 '40000
    com.Output = "ata" + vbCrLf
End Sub

Private Sub GetPackTimer_Timer()
On Error Resume Next

Dim s As String
    com.InputLen = com.InBufferSize
   s = com.Input

                                            GetPackTimer.Enabled = False
                                            send_NACK
                                            '''''''''''''
                                                 ClearStageTimer.Enabled = True
                                                 mode = wait_for_clear_stage_3
                                                com.RThreshold = CLR_STG_LENGTH

End Sub

Private Sub Timer1_Timer() 'GuardTimer
On Error Resume Next
Timer1.Enabled = False

   disconnect
   frmMain.refresh_line LocalHandler

  
End Sub
Private Sub SetGuardTimer(a As Long)
On Error Resume Next
            
            Timer1.Enabled = False
            Timer1.Interval = 65000 'a
            Timer1.Enabled = True
End Sub

Private Sub ShowMessage(a As Byte)
On Error Resume Next

Select Case a
Case 1:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "PMS NUM Updated" + vbCrLf

Case 2:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Free NUM Updated" + vbCrLf
Case 17:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Charging Updated" + vbCrLf
Case 18:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Charge scheduller Updated" + vbCrLf
Case 19:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Day Type Updated" + vbCrLf

Case 22:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Black List Updated" + vbCrLf
Case 25:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "White List Updated" + vbCrLf
Case 26:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "SAM Updated" + vbCrLf
Case 28:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Message Updated" + vbCrLf
Case 29:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Setting Updated" + vbCrLf
Case 89:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Program Updated" + vbCrLf
Case 90:
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Synchronized" + vbCrLf

End Select
End Sub

Private Sub Timer2_Timer()
On Error Resume Next

Dim sbuf As String
DoEvents
'On Error GoTo EH
Select Case ModemCondition
        Case ERROR:
            com.PortOpen = True
            StartIncom
        Case NORMAL:
            Timer2.Enabled = False
        Case OFF:
            clear_receive_buffer
           
           
      com.RThreshold = 4
        com.Output = "at" + vbCrLf
        mode = wait_for_AT_ok
        State = StartComport
  
  
End Select
Exit Sub
EH:
MsgBox "timer2"

End Sub

Private Sub HandleEmergencyEvent(TelID As Long, EventType As Byte)
On Error Resume Next
      
                       SaveEmergencyEvent TelID, EventType
                       UpdateShowEmergencyEventTable TelID, EventType, LocalHandler
     
      frmMain.SetFocus
      DoEvents
      frmEmergencyEventList.kill_me
      frmEmergencyEventList.Show
  '    frmEmergencyEventList.SetFocus

End Sub

Private Sub Timer3_Timer()
On Error Resume Next

If (frmMain.Check1.Value = 1) Then
frmMain.refresh_line LocalHandler
frmMain.SetPowerOff LocalHandler
Unload Me
End If
End Sub

Private Sub UpdateTransactionLog(TelID As Long)
On Error Resume Next
     
Dim tmpPayphoneXD As Double

OpenRecordset de.rscmdTransactionLog
tmpPayphoneXD = GetPayphoneXDfromDataBase(TelID)
    
    With de.rscmdTransactionLog

            .AddNew
                !PayphoneXDRef = tmpPayphoneXD
                !PhoneStationRef = TelID
                !CallHour = CByte(Hour(Now))
                !CallMinute = CByte(Minute(Now))
                !CallDay = CByte(Day(Now)) '
                !CallMonth = CByte(Month(Now))  '
                !CallYear = CByte(Year(Now) - 2000) '
                !ReportComplete = CByte(True)
                !MessageUpdate = CByte(MessageUpdateSW) '
                !PMSNumUpdate = CByte(PMSNumUpdateSw) '
                !FreeNumUpdate = CByte(FreeNumUpdateSw) '
                !CharggingUpdate = CByte(ChargingUpdateSw) '
                !ChargeSchedullerUpdate = CByte(ChargeSchedulerUpdateSw) '
                !DayTypeUpdate = CByte(DayTypeUpdateSw) '
                !PhoneSettingUpdate = CByte(SettingUpdateSw) '
                !SamUpdate = CByte(SamUpdateSw) '
                !BlackListUpdate = CByte(BlackListUpdateSw) '
                !WhiteListUpdate = CByte(WhiteListUpdateSw) '
                !SoftwareUpgrade = CByte(ProgramUpdateSw)
                !Sync = CByte(SynchronizeSw)
    
            
            .Update
            .Close
    End With
   
End Sub

Private Sub UpdateTransactionLogReportOnly(TelID As Long)
On Error Resume Next
   
   Dim tmpPayphoneXD As Double
 
     OpenRecordset de.rscmdTransactionLog

tmpPayphoneXD = GetPayphoneXDfromDataBase(TelID)

    With de.rscmdTransactionLog

            .AddNew
                !PayphoneXDRef = tmpPayphoneXD
                !PhoneStationRef = TelID
                !CallHour = CByte(Hour(Now))
                !CallMinute = CByte(Minute(Now))
                !CallDay = CByte(Day(Now)) '
                !CallMonth = CByte(Month(Now))  '
                !CallYear = CByte(Year(Now) - 2000) '
                !ReportComplete = CByte(True)
                !MessageUpdate = CByte(False) '
                !PMSNumUpdate = CByte(False) '
                !FreeNumUpdate = CByte(False) '
                !CharggingUpdate = CByte(False) '
                !ChargeSchedullerUpdate = CByte(False) '
                !DayTypeUpdate = CByte(False) '
                !PhoneSettingUpdate = CByte(False) '
                !SamUpdate = CByte(False) '
                !BlackListUpdate = CByte(False) '
                !WhiteListUpdate = CByte(False) '
            .Update
            .Close
    End With
   
End Sub

Private Function myMul(a As Long, b As Long) As Long
On Error Resume Next

Dim tmpj As Long
Dim tmpMul As Long
For tmpj = 1 To b
tmpMul = tmpMul + a
Next tmpj
myMul = tmpMul
End Function

