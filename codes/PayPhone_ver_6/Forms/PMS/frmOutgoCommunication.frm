VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmOutgoCommunication 
   BorderStyle     =   0  'None
   Caption         =   "outgo"
   ClientHeight    =   690
   ClientLeft      =   2040
   ClientTop       =   1485
   ClientWidth     =   1200
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   690
   ScaleWidth      =   1200
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   720
      Top             =   90
   End
   Begin MSCommLib.MSComm com 
      Left            =   60
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
Attribute VB_Name = "frmOutgoCommunication"
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

Const SendWindowSize = 200
Const ReceiveWindowSize = 1000

Const AddressOfUpdateAvailableSw = 6000

Const AddressAlarmUpdateSw = 10357
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
Const MapSize = 10400
Const StarOfUpdateBlock = 6001
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
Dim NeedToUpdate As Boolean

Private Sub com_OnComm()
Dim s As String
Dim p As String
On Error Resume Next
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
                                                    frmModem.ConnectCheck(15).Value = 1
                                                    State = RECEIVE_REPORT
                                                    mode = wait_for_HI
                                                    .RThreshold = 3
                                                 End If
                                                clear_receive_buffer
                                        
                                        Case wait_for_RING:
                                        
                                        Case wait_for_OK:
                                                If (p = "0") Then
                                                .Output = "ath" + vbCrLf
                                                .PortOpen = False
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
                                    If (rec_crc_hi = cal_crc_hi) And (rec_crc_lo = cal_crc_lo) Then
                                        send_ACK
                                        ReceivePageCounter = ReceivePageCounter + 1
                                        frmModem.ReportProgress(15).Value = 16.66 * ReceivePageCounter
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
    
                                        frmModem.HiCheck(15).Value = 1
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
                                            frmModem.SorCheck(15).Value = 1
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
                                                    frmModem.EorCheck(15).Value = 1
                                                    mode = wait_for_READY
                                                    .RThreshold = 3
                                                    State = SEND_UPDATE
                                                    send_SOU
                                                    frmModem.SouCheck(15).Value = 1
                                        Else
                                                    Timer1.Enabled = False
                                                    send_BYE
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    frmModem.refresh_line 15
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
                                                If (SendPageCounter = 22) Then
                                                   Timer1.Enabled = False
                                                    send_EOU
                                                    frmModem.EouCheck(15).Value = 1
                                                    WriteFile PhoneStationID
                                                    ReadDataFromFile PhoneStationID
                                                    frmModem.refresh_line 15
                                                    disconnect
                                                Else
                                                    SetGuardTimer 15000
                                                    
                                                    SendPageCounter = SendPageCounter + 1
                                                    frmModem.UpdateProgress(15).Value = SendPageCounter * 4.54
                                                    mode = wait_for_READY
                                                    .RThreshold = 3
                                                    SendUpdatePack (SendPageCounter)
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
                                        End If
                     
                     
                     End Select
               End Select
        
        
        End Select 'select case state
    End With
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
    Tmp(1) = SOP
    Tmp(2) = SOU
    Tmp(3) = EOP
    com.Output = Tmp
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
             If (p <> "") Then CalculateCrc (Asc(p))
              Next i
End Sub
Private Sub SaveReportPack(a As String, Page As Byte)
   Dim ReceivePackTmp(ReceiveWindowSize) As Byte
   Dim p As String
   Dim i As Integer
   
    For i = 1 To ReceiveWindowSize
       p = Mid(a, i, 1)
        If (p <> "") Then
           FileMap(i + (ReceiveWindowSize * (ReceivePageCounter - 1))) = Asc(p)
       Else
           FileMap(i + (ReceiveWindowSize * (ReceivePageCounter - 1))) = 187
        End If
    Next i
End Sub

Private Sub SendUpdatePack(Page As Byte)
   Dim CrcTmp(2) As Byte
   Dim SendPackTmp(SendWindowSize) As Byte
   Dim i As Integer
        
       
        iCurrentCRC = 0
        
        With com
              For i = 1 To SendWindowSize
               SendPackTmp(i) = FileMap((StarOfUpdateBlock - 1) + ((Page - 1) * SendWindowSize) + i)
               CalculateCrc (SendPackTmp(i))
              Next i
        
          .Output = SendPackTmp
          CrcTmp(1) = cal_crc_hi
          CrcTmp(2) = cal_crc_lo
          
          
          .Output = CrcTmp
        End With
End Sub
Private Sub disconnect()
com.PortOpen = False
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
            
            If (FileMap(AddressOfUpdateAvailableSw) = 161) Then
            NeedToUpdate = True
            Else
            
            NeedToUpdate = False
            End If
                        
            frmModem.Frame5(15).Visible = NeedToUpdate
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
com.CommPort = PortNumber(15)
End Sub
Public Sub connect(TelID As Long, TelNo As String)
    PhoneStationID = TelID
    ReadFile TelID
    With com
        ReceivePageCounter = 0
        SendPageCounter = 0
        If (.PortOpen = False) Then
            .PortOpen = True
             dial (TelNo)
             clear_receive_buffer
             mode = wait_for_connection
             State = MANAGEMENT
             com.RThreshold = 1
            SetGuardTimer 40000
        End If
     End With
End Sub
Private Sub Timer1_Timer()
   frmModem.refresh_line 15
  disconnect
  Timer1.Enabled = False
End Sub
Private Sub SetGuardTimer(a As Long)
             Timer1.Enabled = False
             Timer1.Interval = a
             Timer1.Enabled = True
End Sub
