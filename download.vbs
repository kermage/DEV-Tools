' Set Objects
Set objArgs = WScript.Arguments
Set objHTTP = CreateObject( "MSXML2.ServerXMLHTTP" )
Set objFSO = CreateObject( "Scripting.FileSystemObject" )

' Get download link from passed argument
strLink = objArgs(0)

' Strip filename from download link
strFileName = Mid( strLink, InStrRev( strLink,"/" ) + 1, Len( strLink ) )

' Get save directory from argument
strSaveTo = objArgs(1) & "\" & strFileName

' Create download folder if not exist
If Not objFSO.FolderExists( objArgs(1) ) Then
	Set objFolder = objFSO.CreateFolder( objArgs(1) )
End If

' Start download
On Error Resume Next
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
