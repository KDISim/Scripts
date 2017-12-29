new-module -name init -scriptblock {
    function _installTool ($tool) {
        switch ($tool) 
        { 
            "paket" {_installPaket} 
            default {Write-Error "Could not install tool:$tool"}
        }
    }
    
    function _installPaket {
        Write-Host "Installing paket"
        $installScriptUrl = "$downloadBaseUrl/paket/Install-Paket.ps1"
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($installScriptUrl))
    }
    
    function Init {
        Write-Verbose "Invoking Init.ps1"
        
        if($RequiredTools -gt 0) {
            Write-Verbose "`$RequiredTools:"
            $RequiredTools|ForEach-Object { Write-Verbose "  -$_"}
        }
        
        $downloadBaseUrl = "https://raw.githubusercontent.com/KDISim/Scripts/latest/"
        Write-Verbose "`$downloadBaseUrl=$downloadBaseUrl"
        
        foreach($tool in $RequiredTools) {
            _installTool $tool
        }
    }
  
    set-alias init -value Init
  
    export-modulemember -alias 'init'
  }

