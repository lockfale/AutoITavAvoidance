#Include "lib/aes.au3"

$PlantextFilename = "C:\encrypting\install.exe"
$ChipertextFilename = "C:\encrypting\install.enc"

_AesEncryptFile("lolwut",  $PlantextFilename, $ChipertextFilename, "CFB")