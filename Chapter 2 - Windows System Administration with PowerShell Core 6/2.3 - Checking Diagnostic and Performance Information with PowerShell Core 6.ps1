Set-Location C:\
Clear-Host

#Performance Counters
Get-CimClass "Win32_PerfFormatted*" | Select-Object CimClassName

Get-CimClass *Perf*LogicalDisk* | Select-Object CimClassName

Get-CimInstance "Win32_PerfFormattedData_PerfDisk_LogicalDisk" -Filter 'Name = "C:"' | Select-Object "Percent*"
Get-CimInstance "Win32_PerfRawData_PerfDisk_LogicalDisk" -Filter 'Name = "C:"' | Select-Object "Percent*"


#Which Process is hogging the CPU
Get-CIMClass *Perf*Process* | Select-Object CimClassName

Get-CIMInstance -ClassName "Win32_PerformattedData_PerfProc_Process" | Select-Object Name, IDProcess, PercentProcessorTime # Could be more? Screen didn't show everything.
$CimProcessPerformance = Get-CIMInstance -ClassName "Win32_PerfFormattedData_PerfProc_Process"
$CimProcessPerformance = $CimProcessPerformance | Where-Object {$_.Name -notin "Idle", "_Total"}






# Video cut out here. Don't know what happened.













Get-WinEvent -FilterXml '<QueryList>
<Query Id="0" Path="Application">
    <Select Path="Application">*[System[(Level=1 or Level=2 or Level=3) and TimeCreated[timediff(@SystemTime) &lt;= 86400000]]</Select>
</Query>
</QueryList>'

#Getting the events out of a saved logfile
