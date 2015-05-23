function Set-AuthoritativeTime
{
    Param
    (
        [Parameter(Mandatory=$true)]
        [String[]]
        $TimeServer
    )
    
    Stop-Service w32time;
    
    w32tm /config `
            /update `
            /manualpeerlist:"time.nrc.ca,time.chu.nrc.ca" `
            /syncfromflags:MANUAL `
            /reliable:YES
        
    w32tm /resync `
            /rediscover `
            /nowait
    
    Start-Service w32time;
}

function Private:Concatenate-DomainNames
{
    Param
    (
        [Parameter(Mandatory=$true)]
        [String[]] $DomainName
    )
    
    for($i = 0; $i -lt $DomainName.Count; $i++)
    {
        if ($i -ne 0)
        {
            $DomainString += ","
        }
        
        $DomainString += $DomainName[$i]
    }
    
    Return $DomainString.Replace('\n', '')
}