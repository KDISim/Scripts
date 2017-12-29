#Example init file to be used in your repository
. { Invoke-WebRequest -useb "https://raw.githubusercontent.com/KDISim/Scripts/latest/InitializeRepository.ps1" } | Invoke-Expression | Out-Nul
initialize -RequiredTools paket