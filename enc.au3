#Include "lib/aes.au3"

$PlantextFilename = "UnencryptedSource"
$ChipertextFilename = "EncryptedDestination"

_AesEncryptFile("AESKey",  $PlantextFilename, $ChipertextFilename, "CFB")
