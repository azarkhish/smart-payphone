Attribute VB_Name = "Start"
Public FormSkin As New ACTIVESKINLib.Skin

Public Sub Main()
   '  For SQL Server
    strConnectionString = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=dbTelephone;Data Source=(local)"
   
    With de.cnnTelephone
        If (.State = adStateOpen) Then .Close
        .ConnectionString = strConnectionString
        .Open
    End With
        strSkinPath = App.Path & "\Scin\b-studio.skn"
    FormSkin.LoadSkin strSkinPath
    frmMain.Show
End Sub

