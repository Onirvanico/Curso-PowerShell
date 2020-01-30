function Get-fileSHA1 {

    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [String] $filePath
    )

    begin {
        $Sha1 = New-Object System.Security.Cryptography.SHA1Managed
        $stringHash = New-Object System.Text.StringBuilder
    }

    process {

        $fileContent = Get-Content $filePath
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
        $hash = $Sha1.ComputeHash($fileBytes)
        $stringHash = New-Object System.Text.StringBuilder
    
        foreach ($byte in $hash) {
            $hasHex = $byte.ToString("X2")
            $stringHash.Append($hasHex) > null
        }
     $stringHash.ToString() 

        $stringHash.Clear() > $null
    }

    end {
        $sha1.Dispose()
    }
}

<#
$arquivo = "C:\Users\neath\Desktop\powerShellBrinks\vsCodePower.PS1"
$hashArquivo = Get-fileSHA1 $arquivo
#>

#Write-Host "O hash do arquivo $arquivo eh $hashArquivo" -BackgroundColor Green -ForegroundColor Red 



