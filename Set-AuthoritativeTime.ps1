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