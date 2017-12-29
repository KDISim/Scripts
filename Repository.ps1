new-module -name Repository -scriptblock {
    $Script:downloadBaseUrl = "https://raw.githubusercontent.com/KDISim/Scripts/latest/"
    
    function _installPaket {
        Write-Host "Installing paket"
        $installScriptUrl = "$downloadBaseUrl/installers/Paket.ps1"
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($installScriptUrl))
    }

    function _loadInstallerModule($url) {
        . { Invoke-WebRequest -useb $url } | Invoke-Expression
    }
    
    function Install-Paket {
        param(
            $Version,
            $Path
        )
        Write-Verbose "Install-Paket"
        Write-Verbose "`$Version=$Version"
        Write-Verbose "`$Path=$Path"

        $url = "$downloadBaseUrl/installers/Paket.ps1"
        $module = _loadInstallerModule $url
        Paket-Install
        Remove-Module $module
    }
  
  
    export-modulemember -Function "Install-Paket"
}