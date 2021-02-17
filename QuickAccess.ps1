## Written by Carlton Whitmore, 2021

## Please set these variables
$CompanyName =   ## full company name from Office 365 ex. "Microsoft"
$SharepointLibrary =   ## site name and library name ex. "Storage/Test"
$DomainName =   ## full domain name including underscores ex. "_Microsoft_com"
## Do not change anything past this point

$urlSPLibrary = "https://" + $CompanyName + ".sharepoint.com\sites\" + $SharepointLibrary
$urlOneDrive = "https://" + $CompanyName + "-my.sharepoint.com\personal\" + ${env:username} + $DomainName + "\Documents"


 $ie = Start-Process -file iexplore -arg $urlSPLibrary -PassThru -WindowStyle Minimized
 sleep 8
 $ie.Kill()
 $ie = Start-Process -file iexplore -arg $urlOneDrive -Passthru -WindowStyle Minimized
 sleep 8
 $ie.Kill()
 $folder = "\\" + $CompanyName + ".sharepoint.com@SSL\DavWWWRoot\sites\" + $SharepointLibrary
 $folder1 = "\\" + $CompanyName + "-my.sharepoint.com@SSL\DavWWWRoot\personal\" + $env:username + $DomainName + "\Documents"
 $QuickAccess = New-Object -ComObject shell.application
 $QuickAccess.Namespace($folder).Self.InvokeVerb("pintohome")
 $QuickAccess.Namespace($folder1).Self.InvokeVerb("pintohome")
