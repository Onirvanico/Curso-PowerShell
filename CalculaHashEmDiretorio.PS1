param($diretorio)

$ErrorActionPreference = "stop"

. .\vsCodePower.PS1

$arquivos = Get-ChildItem $diretorio -File

foreach ($arquivo in $arquivos.FullName) {
    $hashDoArquivo = Get-fileSHA1 $arquivo  
    Write-Host "O hash do arquivo $arquivo e $hashDoArquivo"
}

