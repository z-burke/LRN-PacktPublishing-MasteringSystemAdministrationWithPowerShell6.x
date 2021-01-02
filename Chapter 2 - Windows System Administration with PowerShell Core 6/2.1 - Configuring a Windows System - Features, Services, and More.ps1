Set-Location C:\
Clear-Host

Get-Command *windowsfeature

dism /online /enable-Feature
dism /online ?


Get-Service "Docker"
Get-Command -noun Service
Set-Service "Docker" -DisplayName "Docker Containers" -WhatIf
Set-Service "Docker" -StartupType Automatic -Status Running -PassThru
Set-Service "Docker" -Credential (Get-Credential)


Get-Command -Noun TimeZone
Get-TimeZone
Get-TimeZone "*Pacific*"
Set-TimeZone "Pacific Standard Time"


Get-Command -Noun Archive
For ($i = 0; $i -lt 20; $i++) {
    New-Item C:\Temp\MyFakeLogFiles\Logfile_$i.log -Force
    New-Item C:\Temp\MyFakeLogFiles\Logfile_$i.txt -Force
}
Get-ChildItem C:\Temp\MyFakeLogfiles\* -Include *.log -Exlude *.txt | Compress-Archive -DestinationPath "C:\temp\Logs.zip"
Expand-Archive -Path C:\temp\Logs.zip -DestinationPath C:\Temp\LogsOnly

Get-ComputerInfo -Property windows*

Get-Uptime
