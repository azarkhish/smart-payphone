Attribute VB_Name = "EXPORTQUOTECOM"
Public Function EXPORTQUOCOM(ByVal fileNme As String, ByVal outtb As ADODB.Recordset)
   
   Dim NUMOFFIELDS As Long
   Dim I As Long
   Dim RECARRAY As Variant
   NUMOFFIELDS = outtb.Fields.Count
   
   Open fileNme For Output As 1
   outtb.MoveFirst
   Do Until outtb.EOF
      I = 1
      RECARRAY = outtb.GetRows(1, adBookmarkCurrent) 'getrows does a movenext
      Do Until I > NUMOFFIELDS
         
         If I < NUMOFFIELDS Then 'CHECK FOR NOT LAST FIELD
            Print #1, Chr(34) & Trim(RECARRAY(I - 1, 0)) & Chr(34) & ",";
         Else 'this is the last field so don't put a comma on the end.
            Print #1, Chr(34) & Trim(RECARRAY(I - 1, 0)) & Chr(34)
         End If
         
         I = I + 1
      Loop
      Erase RECARRAY

   Loop
Close #1
End Function
