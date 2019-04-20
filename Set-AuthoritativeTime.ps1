function Set-AuthoritativeTime
{
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "High"
    )]

    Param
    (
        [Parameter(Mandatory=$true)]
        [String]
        $TimeServer
    )

    if ($PSCmdlet.ShouldProcess("$_", "Update time server configuration")) {
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
}