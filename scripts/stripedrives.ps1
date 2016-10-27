Param([string]$MachineName)
$PoolCount = Get-PhysicalDisk -CanPool $True
$DiskCount = $PoolCount.count
$PoolName = "TableauData"
$PhysicalDisks = Get-StorageSubSystem -FriendlyName "Storage Spaces*" | Get-PhysicalDisk -CanPool $True
New-StoragePool -FriendlyName $PoolName -StorageSubsystemFriendlyName "Storage Spaces*" -PhysicalDisks $PhysicalDisks |New-VirtualDisk -FriendlyName $PoolName -NumberOfColumns $DiskCount -ResiliencySettingName simple –UseMaximumSize -Interleave 65536 | Initialize-Disk -Confirm:$False -PassThru |New-Partition -DriveLetter F -UseMaximumSize |Format-Volume -FileSystem NTFS -NewFileSystemLabel $PoolName -AllocationUnitSize 65536 -Confirm:$false