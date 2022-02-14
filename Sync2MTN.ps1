& net use O: "\\ZA-FE-CMP-01.mtn.com\H$\Software Repository$" /User:mtngroup\adm234093

Set-Location -Path "C:\Office365_ODT\"
$WorkDir = Get-Location
$Days = 36
$ScripRunStart = Get-Date -Format "yyyyMMdd_HHmm"
Start-Transcript -Path "$WorkDir\Sync2MTN-$ScripRunStart.Transcript"

$SourceList = Get-ChildItem  -path ".\Office\Data\" |  Where-Object {$_.LastWriteTime -ge (Get-Date).AddDays(-($Days)) }

$DataLocation = "$WorkDir\Office\Data\"
$DestinationLocation = "O:\Microsoft\Office Applications\Office365\Office\Data\"
Set-Location $DataLocation

foreach ($Source in $SourceList) {
	If ( $Source.PSIsContainer -eq $true )  {
		& robocopy $Source.Name $DestinationLocation$Source /ETA /S /TBD /w:5 /R:30
		}
	If ($Source.Extension -eq ".cab") {
		Copy-Item -Path $Source.Name -Destination $DestinationLocation  -Force -Verbose
	}


}
Set-Location $WorkDir
Stop-Transcript

Write-Host "Replication results in $WorkDir\Sync2MTN-$ScripRunStart.Transcript"
np "$WorkDir\Sync2MTN-$ScripRunStart.Transcript"
