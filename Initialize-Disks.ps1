Function Initialize-Disks
{    
    $disks = Get-Disk | Where-Object {$_.NumberOfPartitions -eq 0}
        
    If (@($disks).Count -gt 0)
    {
<<<<<<< HEAD
        foreach ($disk in $disks)
        {
            $disk |`
            New-Partition -AssignDriveLetter -UseMaximumSize | `
            Format-Volume -FileSystem NTFS -Confirm:$false
        }
=======
        $disk |`
        New-Partition -AssignDriveLetter -UseMaximumSize | `
        Format-Volume -FileSystem NTFS -Confirm:$false
>>>>>>> 18385b359c6d2535428b95f424ccad997ba7ad56
    }
}