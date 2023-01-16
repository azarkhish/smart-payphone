VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmIncomCommunication 
   BorderStyle     =   0  'None
   Caption         =   "incom"
   ClientHeight    =   690
   ClientLeft      =   3330
   ClientTop       =   2970
   ClientWidth     =   1335
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   690
   ScaleWidth      =   1335
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   810
      Top             =   120
   End
   Begin MSCommLib.MSComm com 
      Left            =   150
      Top             =   60
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
      InputLen        =   100
      RThreshold      =   7
      RTSEnable       =   -1  'True
      BaudRate        =   1200
   End
End
Attribute VB_Name = "frmIncomCommunication"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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

Const SendWindowSize = 200
Const ReceiveWindowSize = 1000
Const AddressOfUpdateAvailableSw = 6000
Const AddressAlarmUpdateSw = 1035
Const AddressHourUpdateSw = 10353
Const AddressMinuteUpdateSw = 10355
Const AddressDayUpdateSw = 10360
Const AddressMonthUpdateSw = 10362
Const AddressPulsePriseUpdateSw = 10365

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

Const MapSize = 10400
Const StarOfUpdateBlock = 6001

Const PmsNoTableAddr = 6001
Const FreeNoTableAddr = 6001 + 149
Const ChargingTableAddr = 6001 + 149 + 242
Const ChargeScheduleTableAddr = 6001 + 149 + 242 + 2402
Const BlackListTableAddr = 6001 + 149 + 242 + 2402 + 114
Const WhiteListTableAddr = 6001 + 149 + 242 + 2402 + 114 + 402
Const SamTableAddr = 6001 + 149 + 242 + 2402 + 114 + 402 + 402
Const MessageTableAddr = 6001 + 149 + 242 + 2402 + 114 + 402 + 402 + 86
Const SettingTableAddr = 6001 + 149 + 242 + 2402 + 114 + 402 + 402 + 86 + 512

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
Dim MessageUpdateSw As Boolean
Dim SettingUpdateSw As Boolean
Dim UpdatePolicy1 As Byte
Dim UpdatePolicy2 As Byte

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
                                                    frmModem.ConnectCheck(LocalHandler).Value = 1
                                                    State = RECEIVE_REPORT
                                                    mode = wait_for_HI
                                                    .RThreshold = 3
                                                 End If
                                                clear_receive_buffer
                                        
                                        Case wait_for_RING:
                                                 If (p = "2") Then
                                                    AnswerCall
                                                    frmModem.RingCheck(LocalHandler).Value = 1
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
                                                TmpID.B = Asc(p)
                                                p = Mid(q, 3, 1)
                                                TmpID.C = Asc(p)
                                                p = Mid(q, 4, 1)
                                                TmpID.D = Asc(p)
                                             PhoneStationID = DecodeLong(TmpID)
                                             frmModem.txtID(LocalHandler).Text = Str(PhoneStationID)
                                             ReadFile PhoneStationID
                                            End If
                                       ''''''''''''''''''''
                                        
                                            ReceivePageCounter = ReceivePageCounter + 1
                                            frmModem.ReportProgress(LocalHandler).Value = 16.66 * ReceivePageCounter
                                        
                                            If (ReceivePageCounter = 6) Then
                                                mode = wait_for_EOR
                                                .RThreshold = 3
                                            Else
                                      
                                                SaveReportPack q, ReceivePageCounter
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
                                        frmModem.HiCheck(LocalHandler).Value = 1
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
                                            frmModem.SorCheck(LocalHandler).Value = 1
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
                                                    frmModem.EorCheck(LocalHandler).Value = 1
                                                    mode = wait_for_READY
                                                    .RThreshold = 3
                                                    State = SEND_UPDATE
                                                    send_SOU
                                                    
                                                    frmModem.SouCheck(LocalHandler).Value = 1
                                        Else
                                                    Timer1.Enabled = False
                                                    send_BYE
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    frmModem.refresh_line LocalHandler
                                                    disconnect

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
                                             If (SendPageCounter = 17) Then
                                                Timer1.Enabled = False
                                                   'Sleep 1000
                                                    send_EOU
                                                    frmModem.EouCheck(LocalHandler).Value = 1
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    frmModem.refresh_line LocalHandler
                                                   disconnect
                                            Else
                                                SetGuardTimer 15000
                                                    'SendPageCounter = SendPageCounter + 1
                                                  TurnNextPage
                                                If (SendPageCounter = 18) Then
                                                   Timer1.Enabled = False
                                                   'Sleep 1000
                                                    send_EOU
                                                    frmModem.EouCheck(LocalHandler).Value = 1
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    frmModem.refresh_line LocalHandler
                                                   disconnect
                                                Else
                                                   
                                                   frmModem.UpdateProgress(LocalHandler).Value = SendPageCounter * 5.88
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
                        TmpID.B = Asc(p)
                        p = Mid(s, 5, 1)
                        TmpID.C = Asc(p)
                        p = Mid(s, 6, 1)
                        TmpID.D = Asc(p)
                        PhoneStationID = DecodeLong(TmpID)
                        SaveTapEvent PhoneStationID
                        frmModem.refresh_line LocalHandler
                        disconnect

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
Case 3, 4, 5, 6, 7, 8, 9, 10:
If (ChargingUpdateSw = False) Then GoTo nextpage
Case 11:
If (ChargeSchedulerUpdateSw = False) Then GoTo nextpage
Case 12:
If (BlackListUpdateSw = False) Then GoTo nextpage
Case 13:
If (WhiteListUpdateSw = False) Then GoTo nextpage
Case 14:
If (SamUpdateSw = False) Then GoTo nextpage
Case 15, 16:
If (MessageUpdateSw = False) Then GoTo nextpage
Case 17:
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
   Dim SendChargeSchedulePackTmp(114) As Byte
   Dim SendBlackListPackTmp(400) As Byte
   Dim SendSamPackTmp(86) As Byte
   Dim SendMessagePackTmp(256) As Byte
   Dim SendSettingPackTmp(46) As Byte
   
   Dim i As Integer
        
        iCurrentCRC = 0
        
       Select Case Page
       Case 1:
              For i = 1 To 194
               SendPmsNoPackTmp(i) = 1 'FileMap((PmsNoTableAddr - 1) + i)
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
               SendFreeNoPackTmp(i) = 2 ' FileMap((FreeNoTableAddr - 1) + i)
               CalculateCrc (SendFreeNoPackTmp(i))
              Next i
                With com
          .Output = SendFreeNoPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 3, 4, 5, 6, 7, 8, 9, 10:
              For i = 1 To 300
               SendChargingPackTmp(i) = 3 'FileMap((ChargingTableAddr - 1) + ((Page - 3) * 300) + i)
               CalculateCrc (SendChargingPackTmp(i))
              Next i
         With com
          .Output = SendChargingPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 11:
              For i = 1 To 114
               SendChargeSchedulePackTmp(i) = 4 'FileMap((ChargeScheduleTableAddr - 1) + i)
               CalculateCrc (SendChargeSchedulePackTmp(i))
              Next i
         With com
          .Output = SendChargeSchedulePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 12:
              For i = 1 To 400
               SendBlackListPackTmp(i) = 5 'FileMap((BlackListTableAddr - 1) + i)
               CalculateCrc (SendBlackListPackTmp(i))
              Next i
         With com
          .Output = SendBlackListPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 13:
             For i = 1 To 400
               SendBlackListPackTmp(i) = 6 'FileMap((WhiteListTableAddr - 1) + i)
               CalculateCrc (SendBlackListPackTmp(i))
             Next i
         With com
          .Output = SendBlackListPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With

       Case 14:
              For i = 1 To 86
               SendSamPackTmp(i) = 7 'FileMap((SamTableAddr - 1) + i)
               CalculateCrc (SendSamPackTmp(i))
              Next i
         With com
          .Output = SendSamPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 15, 16:
              For i = 1 To 256
               SendMessagePackTmp(i) = 8 'FileMap((MessageTableAddr - 1) + ((Page - 15) * 256) + i)
               CalculateCrc (SendMessagePackTmp(i))
              Next i
         With com
          .Output = SendMessagePackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          .Output = CrcTmp
        End With
       
       Case 17:
              For i = 1 To 46
               SendSettingPackTmp(i) = 9  'FileMap((SettingTableAddr - 1) + i)
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
Sleep 200
com.PortOpen = False
Sleep 1000
StartIncom
'    Sleep 2000
'        com.Output = "+++"
'        State = MANAGEMENT
'        mode = wait_for_OK
'        com.RThreshold = 1
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
        frmModem.Text1.Text = Str(UpdatePolicy1)
        frmModem.Text2.Text = Str(UpdatePolicy2)
        
PMSNumUpdateSw = False
FreeNumUpdateSw = False
ChargingUpdateSw = False
ChargeSchedulerUpdateSw = False
BlackListUpdateSw = False
WhiteListUpdateSw = False
SamUpdateSw = False
MessageUpdateSw = False
SettingUpdateSw = False
        
If ((UpdatePolicy1 And 1) <> 0) Then PMSNumUpdateSw = True
If ((UpdatePolicy1 And 2) <> 0) Then FreeNumUpdateSw = True
If ((UpdatePolicy1 And 4) <> 0) Then ChargingUpdateSw = True
If ((UpdatePolicy1 And 8) <> 0) Then ChargeSchedulerUpdateSw = True
If ((UpdatePolicy1 And 16) <> 0) Then BlackListUpdateSw = True
If ((UpdatePolicy1 And 32) <> 0) Then WhiteListUpdateSw = True
If ((UpdatePolicy1 And 64) <> 0) Then SamUpdateSw = True
If ((UpdatePolicy1 And 128) <> 0) Then MessageUpdateSw = True
If ((UpdatePolicy2 And 1) <> 0) Then SettingUpdateSw = True

        If (FileMap(AddressOfUpdateAvailableSw) = 161) Then
        NeedToUpdate = True
        Else
        NeedToUpdate = False
        End If
        frmModem.Frame5(LocalHandler).Visible = NeedToUpdate
    
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
LocalHandler = IncomHandler
com.CommPort = PortNumber(LocalHandler)
StartIncom
End Sub
Private Sub StartIncom()

    With com
    ReceivePageCounter = 0
    SendPageCounter = 0
       If (.PortOpen = False) Then .PortOpen = True
           com.Output = "atv0" + vbCrLf
           Sleep 200
           com.Output = "atm0" + vbCrLf
           Sleep 200
        
        clear_receive_buffer
        mode = wait_for_RING
        State = MANAGEMENT
        com.RThreshold = 1
      End With
End Sub
Private Sub AnswerCall()
SetGuardTimer 30000
    com.Output = "ata" + vbCrLf
End Sub

Private Sub Timer1_Timer()
   frmModem.refresh_line LocalHandler
  disconnect
  Timer1.Enabled = False
End Sub
Private Sub SetGuardTimer(a As Long)
             Timer1.Enabled = False
'             Timer1.Interval = a
'             Timer1.Enabled = True
End Sub

Private Sub ShowMessage(a As Byte)
Select Case a
Case 1:
'    MsgBox "PMS NUM" ', vbOKOnly, ":)"

Case 2:
'    MsgBox "Free NUM" ', vbOKOnly, ":)"

Case 10:
'    MsgBox "Chargging" ', vbOKOnly, ":)"

Case 11:
'    MsgBox "Charge scheduller" ', vbOKOnly, ":)"

Case 12:
'    MsgBox "Black List" ', vbOKOnly, ":)"

Case 13:
'    MsgBox "White List" ', vbOKOnly, ":)"

Case 14:
'    MsgBox "SAM" ', vbOKOnly, ":)"

Case 16:
'    MsgBox "Message" ', vbOKOnly, ":)"

Case 17:
'    MsgBox "Setting" ', vbOKOnly, ":)"

End Select
End Sub
