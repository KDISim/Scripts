#Example init file to be used in your repository
. { Invoke-WebRequest -useb "https://raw.githubusercontent.com/KDISim/Scripts/latest/Repository.ps1" } | Invoke-Expression | Out-Null

Install-Paket