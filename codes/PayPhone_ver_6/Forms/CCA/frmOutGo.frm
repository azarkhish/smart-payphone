VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmOutGo 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   705
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1755
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   705
   ScaleWidth      =   1755
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Interval        =   2000
      Left            =   1200
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   765
      Top             =   120
   End
   Begin MSCommLib.MSComm com 
      Left            =   135
      Top             =   45
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   4
      DTREnable       =   -1  'True
      InputLen        =   100
      RThreshold      =   7
      RTSEnable       =   -1  'True
      BaudRate        =   1200
   End
End
Attribute VB_Name = "frmOutGo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    ' frmMain.txtMonitor(0) = frmMain.txtMonitor(0) + "CONNECTED" + vbCrLf
Option Explicit
Option Base 1

Const ACK = 133     'aknowlage
Const NACK = 165    'not acknowlage
Const EOU = 141     'end of update
Const SOU = 149     'start of update
Const EOR = 145     'end of report
Const SOR = 153     'start of report
Const HI = 129      'start of comunication
Const BYE = 189     'end of communication
Const AUTHEN = 161  'authentication session
Const READY = 157   'ready to receive
Const EOP = 85      'end of package
Const SOP = 170     'start of package
Const Im_AntiTap_Agent = 70
Const EmergencyEvent = 115
Const SendWindowSize = 200
Const ReceiveWindowSize = 1000
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

Const MANAGEMENT = 0
Const RECEIVE_REPORT = 200
Const SEND_UPDATE = 100
Const AntiTapCall = 150

Const MapSize = 10400 + 4029
Const StarOfUpdateBlock = 6001

Const PmsNoTableAddr = 6001
Const FreeNoTableAddr = 6001 + 194
Const ChargingTableAddr = 6001 + 194 + 242 + 2 '''''''''
Const ChargeScheduleTableAddr = 6001 + 194 + 242 + 4502
Const DayTypeTableAddr = 6001 + 149 + 194 + 4502 + 82

Const BlackListTableAddr = 6001 + 194 + 242 + 4502 + 82 + 365
Const WhiteListTableAddr = 6001 + 194 + 242 + 4502 + 82 + 365 + 1200
Const SamTableAddr = 6001 + 194 + 242 + 4502 + 82 + 1200 + 365 + 1200
Const MessageTableAddr = 6001 + 194 + 242 + 4502 + 82 + 1200 + 365 + 1200 + 86
Const SettingTableAddr = 6001 + 194 + 242 + 4502 + 82 + 1200 + 365 + 1200 + 86 + 512

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
Dim UpdatePolicy1 As Byte
Dim UpdatePolicy2 As Byte
Dim ModemCondition As Byte
Const ERROR = 100
Const OFF = 0
Const NORMAL = 1
Private Sub com_OnComm()
On Error Resume Next

Dim s As String
Dim p As String
Dim TmpID As MyLong
    With com
    .InputLen = .RThreshold
    s = .Input
    Select Case State
'---------------------------------------------
       Case MANAGEMENT:
                       Select Case .RThreshold
                            Case 1:
                                p = Mid(s, 1, 1)
                                    Select Case mode
                                        Case wait_for_connection:
                                                If (p = "5") Then
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "CONNECTED" + vbCrLf
     frmMain.SetConnected (LocalHandler)
                                                    State = RECEIVE_REPORT
                                                    mode = wait_for_HI
                                                    .RThreshold = 3
                                                 End If
                                                clear_receive_buffer
                                        
                                        Case wait_for_RING:
                                            
                                        Case wait_for_OK:
                                                If (p = "0") Then
                                                .Output = "ath" + vbCrLf
                                               ' StartIncom
                                                 End If
                                               
                                                
                                    End Select
                        End Select
'---------------------------------------------------
       Case RECEIVE_REPORT:
                
                Select Case .RThreshold
                    
                    Case 2:
                        p = Mid(s, 1, 1)
                        rec_crc_hi = Asc(p)
                        p = Mid(s, 2, 1)
                        rec_crc_lo = Asc(p)
                            Select Case mode
                                Case wait_for_CRC:
                                    If (rec_crc_hi = cal_crc_hi) And (rec_crc_lo = cal_crc_lo) Then  '(True) Then
                                        send_ACK
                                      
                                      ''''''''''''''''''''
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
                                                frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Payphone Serial:" + Str(PhoneStationID) + vbCrLf
                                                ReadFile PhoneStationID
                                            End If
                                       ''''''''''''''''''''
                                        
                                            ReceivePageCounter = ReceivePageCounter + 1
                                           frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + " * "
                                              
                                              SaveReportPack q, ReceivePageCounter

                                            If (ReceivePageCounter = 6) Then
                                                mode = wait_for_EOR
                                                .RThreshold = 3
                                            Else
                                      
                                                                     mode = wait_for_PACK
                                                .RThreshold = ReceiveWindowSize
                                            End If
                                           
                                    Else
                                       send_NACK
                                       mode = wait_for_NACK
                                       .RThreshold = 3
                                    End If
                            End Select
                    Case 3:
                        p = Mid(s, 2, 1)
                        If (p <> "") Then command_tmp = Asc(p)
                            Select Case mode
                                Case wait_for_HI:
                                    If (command_tmp = HI) Then
                                       SetGuardTimer 30000
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Handshake complete" + vbCrLf
                                        mode = wait_for_ACK
                                        .RThreshold = 3
                                        send_HI
                                    Else
                                        mode = wait_for_HI
                                        .RThreshold = 3
                                        send_NACK
                                    End If
                                Case wait_for_BYE
                                
                                Case wait_for_ACK:
                                       If (command_tmp = ACK) Then
                                        mode = wait_for_SOR
                                        .RThreshold = 3
                                       Else
                                            If (command_tmp = Im_AntiTap_Agent) Then
                                                State = AntiTapCall
                                                send_ACK
                                                .RThreshold = 6
                                            End If
                                      End If
                                Case wait_for_NACK:
                                        If (command_tmp = NACK) Then
                                            mode = wait_for_PACK
                                            .RThreshold = ReceiveWindowSize
                                            send_ACK
                                        Else
                                            mode = wait_for_NACK
                                            .RThreshold = 3
                                            send_NACK
                                        End If
                                Case wait_for_SOR:
                                        If (command_tmp = SOR) Then
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Start of report" + vbCrLf
                                            mode = wait_for_PACK
                                            .RThreshold = ReceiveWindowSize
                                            send_ACK
                                        Else
                                            mode = wait_for_SOR
                                            .RThreshold = 3
                                            send_NACK
                                        End If
                                    
                                Case wait_for_EOR:
                                        If (command_tmp = EOR) And (NeedToUpdate) Then
                                                   SetGuardTimer 10000
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + vbCrLf + "End of report" + vbCrLf
                                                    mode = wait_for_READY
                                                    .RThreshold = 3
                                                    State = SEND_UPDATE
                                                    send_SOU
                                                    
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Start of update" + vbCrLf
                                        Else
                                                    Timer1.Enabled = False
                                                    send_BYE
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                   UpdateTransactionLogReportOnly PhoneStationID
                                                    disconnect
                                                    frmMain.refresh_manual_line LocalHandler
                                                       ' frmMain.SetStandBy (0)
 
                                                    

                                        End If
        
                            End Select
                    
                    Case ReceiveWindowSize:
                            Select Case mode
                                Case wait_for_PACK:
                               SetGuardTimer 20000
                                q = s
                                    
                                    CalculatePackCrc (q)
                                    mode = wait_for_CRC
                                    .RThreshold = 2
                                    
                            End Select
                End Select
'--------------------------------------------
          Case SEND_UPDATE:
               Select Case .RThreshold
                Case 1:
                
                Case 2:
                
                Case 3:
                     p = Mid(s, 2, 1)
                     If (p <> "") Then command_tmp = Asc(p)
                     
                     Select Case mode
                                Case wait_for_READY:
                                        If (command_tmp = READY) Then
                                            ShowMessage (SendPageCounter)
                                             If (SendPageCounter = 29) Then
                                                Timer1.Enabled = False
                                                    send_EOU
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "End of update" + vbCrLf
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                   UpdateTransactionLog PhoneStationID
                                                    disconnect
                                                    frmMain.refresh_manual_line LocalHandler
                                                  '  frmMain.SetStandBy (0)
 
                                                   
                                            Else
                                                SetGuardTimer 15000
                                                  TurnNextPage
                                                If (SendPageCounter = 30) Then
                                                   Timer1.Enabled = False
                                                    send_EOU
     frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "End of Update" + vbCrLf
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                   UpdateTransactionLog PhoneStationID
                                                    disconnect
                                                    frmMain.refresh_manual_line LocalHandler
                                                  
                                                Else
                                                   
                                                 '  frmMain.UpdateProgress(LocalHandler).Value = SendPageCounter * 5.88
                                                    mode = wait_for_READY
                                                    .RThreshold = 3
                                                    SendUpdatePack (SendPageCounter)
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
           Case AntiTapCall:
                
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
                           frmMain.txtMonitor(LocalHandler) = frmMain.txtMonitor(LocalHandler) + "Line Tap" + vbCrLf
                
                        HandleEmergencyEvent PhoneStationID, 9

                        'SaveTapEvent PhoneStationID
                         disconnect
                        frmMain.refresh_manual_line LocalHandler
                        'frmMain.SetStandBy (0)
                        
                       

        End Select 'select case state
    End With
End Sub
Private Sub TurnNextPage()


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
End Select
End Sub
Private Sub clear_receive_buffer()
   Dim a As String
    With com
        .InputLen = .InBufferCount
        a = .Input
    End With
End Sub
Private Sub dial(TelNo As String)
    com.Output = "atdt" + TelNo + vbCrLf
End Sub
Private Sub send_ACK()

    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = ACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_NACK()
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = NACK
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_SOU()
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
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = EOU
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_HI()
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = HI
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub send_BYE()
    Dim Tmp(3) As Byte
    Tmp(1) = SOP
    Tmp(2) = BYE
    Tmp(3) = EOP
    com.Output = Tmp
End Sub
Private Sub CalculatePackCrc(a As String)
Dim p As String
Dim i As Integer
        iCurrentCRC = 0
              For i = 1 To ReceiveWindowSize
              p = Mid(a, i, 1)
              CalculateCrc (Asc(p))
              Next i
End Sub
Private Sub SaveReportPack(a As String, Page As Byte)
   Dim ReceivePackTmp(ReceiveWindowSize) As Byte
   Dim p As String
   Dim i As Integer
   
    For i = 1 To ReceiveWindowSize
       p = Mid(a, i, 1)
       FileMap(i + (ReceiveWindowSize * (ReceivePageCounter - 1))) = Asc(p)
    Next i
End Sub

Private Sub SendUpdatePack(Page As Byte)
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
   
   Dim i As Integer
        
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
               SendDayTypePackTmp(i) = 5 'FileMap((ChargeScheduleTableAddr - 1) + i)
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
              
      End Select
End Sub
Private Sub disconnect()
DoEvents
frmMain.MakeConnectionLog PhoneStationID, LocalHandler

Sleep 200
com.PortOpen = False
Sleep 1000
'StartIncom
End Sub
Private Sub ReadFile(PhoneStationSerialNo As Long)
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

        If (FileMap(AddressOfUpdateAvailableSw) = 161) Then
        NeedToUpdate = True
        Else
        NeedToUpdate = False
        End If
        'frmModem.Frame5(LocalHandler).Visible = NeedToUpdate
    
End Sub
Private Sub WriteFile(PhoneStationSerialNo As Long)
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

Private Sub Form_Load()
LocalHandler = OutgoHandler
com.CommPort = PortNumber(LocalHandler)
frmMain.SetDial (OutgoHandler)
End Sub

Private Sub Timer1_Timer()
   disconnect
   frmMain.refresh_manual_line LocalHandler
  
  Timer1.Enabled = False
End Sub
Private Sub SetGuardTimer(a As Long)
             Timer1.Enabled = False
             Timer1.Interval = a
             Timer1.Enabled = True
End Sub

Private Sub ShowMessage(a As Byte)
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

End Select
End Sub

Private Sub HandleEmergencyEvent(TelID As Long, EventType As Byte)
'EmergencyPSNUM = TelID
'EmergencyEventCode = EventType
'EmergencyLNUM = LocalHandler
      
      frmMain.SetFocus
      DoEvents
      frmEmergencyEvent.Show
      frmEmergencyEvent.SetFocus

End Sub
Public Sub connect(TelID As Long, TelNo As String)
'On Error GoTo EH
    PhoneStationID = TelID
    ReadFile TelID
    With com
        ReceivePageCounter = 0
        SendPageCounter = 0
        If (.PortOpen = False) Then
            .PortOpen = True
            PreSetModem
             
             dial (TelNo)
             clear_receive_buffer
             mode = wait_for_connection
             State = MANAGEMENT
             com.RThreshold = 1
            SetGuardTimer 40000
        End If
     End With
Exit Sub
EH:
frmMain.SetManual (LocalHandler)
Unload Me
     
End Sub

Private Sub Timer2_Timer()
If frmMain.chkDCLine(LocalHandler).Value = 1 Then
frmMain.chkDCLine(LocalHandler).Value = 0
disconnect
frmMain.refresh_manual_line LocalHandler
Timer2.Enabled = False
Unload Me
End If
End Sub
Private Sub PreSetModem()
'    OpenRecordset de.rscmdModemSetting, "Select * From ModemSetting"
DoEvents
'    With de.rscmdModemSetting
           com.Output = "atv0" + vbCrLf
           Sleep 100
'
'
'        If (!ATN0 = True) Then
'           com.Output = "atn0" + vbCrLf
'           Sleep 100
'        End If
'
'        If (!ATB0 = True) Then
           com.Output = "atb0" + vbCrLf
           Sleep 100
'        End If
'
'        If (!ATS37 = True) Then
'           com.Output = "ats37=5" + vbCrLf
'           Sleep 100
'        End If
'
'        If (!ATM0 = True) Then
'           com.Output = "atm0" + vbCrLf
'           Sleep 100
'        End If
'
'
'
'    End With
End Sub


Private Sub UpdateTransactionLog(TelID As Long)
     OpenRecordset de.rscmdTransactionLog

Dim tmpPayphoneXD As Double
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
            
            
            .Update
    End With
   
End Sub

Private Sub UpdateTransactionLogReportOnly(TelID As Long)
     OpenRecordset de.rscmdTransactionLog

    With de.rscmdTransactionLog

            .AddNew

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

