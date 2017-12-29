#Example init file to be used in your repository
. { Invoke-WebRequest -useb "https://raw.githubusercontent.com/KDISim/Scripts/latest/Init.ps1" } | Invoke-Expression

init -RequiredTools paket