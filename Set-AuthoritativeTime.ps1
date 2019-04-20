function Set-AuthoritativeTime
{
    Param
    (
        [Parameter(Mandatory=$true)]
        [String]
        $TimeServer
    )

    w32tm /config `
            /update `
            /manualpeerlist:$TimeServer `
            /syncfromflags:MANUAL `
            /reliable:YES

    w32tm /resync `
            /rediscover `
            /nowait

    Restart-Service w32time;
}