<#
	Monitors the size of the office download folder.
#>
param (
		[Parameter(Mandatory=$false)]
		[int]$CycleInterval = 120 ,
		[int]$Cycletime = 4
	)

Clear-Host

cd ".\Office\Data"
for ( ( $counter=0 ) ; ( $counter -le ($Cycletime*60*60/$CycleInterval) ) ; $counter++  ) {
	foreach ( $folder in ( Get-ChildItem -Path . -Directory -Recurse -Depth 2  ) ) {
		Get-FolderSizeInfo -Path $folder  |
		Select-Object -Property Path,
			@{label="Size(MiB)";expression={[Math]::Round($_.TotalSize/1MB, 2) }},
			@{Name="Timestamp"; Expression={ Get-Date -DisplayHint Time }}
		}
		Start-Sleep -Seconds $CycleInterval
	}
cd ../..
