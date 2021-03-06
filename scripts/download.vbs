' Set Objects
Set objArgs = WScript.Arguments
Set objHTTP = CreateObject( "MSXML2.ServerXMLHTTP" )
Set objFSO = CreateObject( "Scripting.FileSystemObject" )

' Get download link from passed argument
strLink = objArgs(0)

If objArgs.Count = 3 Then
	' Get filename from passed argument
	strFileName = objArgs(2)
	Else
	' Strip filename from download link
	strFileName = Mid( strLink, InStrRev( strLink,"/" ) + 1, Len( strLink ) )
End If

' Get save directory from argument
strSaveTo = objArgs(1) & "\" & strFileName

' Create download folder if not exist
If Not objFSO.FolderExists( objArgs(1) ) Then
	Set objFolder = objFSO.CreateFolder( objArgs(1) )
End If

' Enable error handling
On Error Resume Next

' Ignore certificate errors
objHTTP.SetOption 2, 13056

' Start download
objHTTP.Open "GET", strLink, False
objHTTP.Send

' Quit on error
If Err.Number <> 0 Then
	WScript.Quit 1
End If

If objHTTP.Status = 200 Then
	Set objStream = CreateObject( "ADODB.Stream" )
	With objStream
		.Type = 1 'Binary
		.Open
		.Write objHTTP.ResponseBody
		.SaveToFile strSaveTo, 2 'Overwrite
		.Close
	End With
	Set objStream = Nothing
End If

' Exit with download status
If objFSO.FileExists( strSaveTo ) Then
	WScript.Quit 0
Else
	WScript.Quit 1
End If
