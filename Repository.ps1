new-module -name Repository -scriptblock {
    $Script:downloadBaseUrl = "https://raw.githubusercontent.com/KDISim/Scripts/latest/"
    
    function _loadInstallerModule($installerModule) {
        $url = "$($Script:downloadBaseUrl)/installers/$installerModule.ps1"
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

        $module = _loadInstallerModule "Paket"
        installPaket -Version $Version -Path $Path
        Remove-Module $module
    }
  
    export-modulemember -Function "Install-Paket"
}