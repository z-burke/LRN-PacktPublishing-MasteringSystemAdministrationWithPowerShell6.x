Get-Service WinRM

$WSManResults = Test-WSMan -ErrorAction SilentlyContinue
$WSManResults
$Error[0]

Get-ChildItem wsman:\



Enable-PSRemoting -Force -SkipNetworkProfileCheck

Test-WSMan
New-PSSession -Name "ALocalSession"

Get-PSSession
Get-PSSession -Name "ALocalSession" | Remove-PSSession
Get-PSSession

