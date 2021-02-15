# Map-OneDrive-o365-to-QuickAccess
<h2>How to add Office 365 and OneDrive libraries to your Quick Access bar.</h2>
If you don't want to install OneDrive Sync or log into Office.com everytime you need to access a file you can setup Quick Access links to any Office 365 Sharepoint library or your OneDrive.
In order to map quick access links we need to setup Intranet Zones so we're not having to login every single time.

<ol>
<h3>Setup Intranet Zone on Internet Explorer:</h3>
            <li>Local Intranet sites - Open Internet Explorer, Open <b>Settings</b> icon at top right, choose <b>Internet Options</b>, Open <b>Security</b> tab, choose <b>Local Intranet</b> and hit <b>Sites</b> button.</li>
            <li>When you open the Sites button you'll see this screen.</li>
            <img src="./Local-Intranet.png" alt="Local Intranet Settings">
            <li>Click the <b>Advanced</b> button</li>
            <li>Now add <b>https://*.sharepoint.com</b> to the zone and choose <b>Close</b></li>
            <img src="./Intranet-Zone.png" alt="Websites to add to Zone">
</ol>  


<h3>Powershell commands required to map to Quick Access Links:</h3>
 ```powershell
 
$destination = "c:\users\" + ${env:username} + "\links\"
$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut($destination + "OneDrive-Access.lnk")  ## Create new lnk
$shortcut.TargetPath = "\\disabilityrightstexas-my.sharepoint.com@SSL\DavWWWRoot\personal\" + "%username%" + "_disabilityrightstx_org\Documents" ## Make changes
$shortcut.WorkingDirectory = "%windir%" 
$shortcut.Description = "OneDrive-Access"  ## This is the "Comment" field
$shortcut.Save()  ## Save

$destination = "c:\users\" + ${env:username} + "\links\"
$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut($destination + "DRTx-Teams.lnk")  ## Create new lnk
$shortcut.TargetPath = "\\disabilityrightstexas.sharepoint.com@SSL\DavWWWRoot\sites\Storage\DRTxTeams" ## Make changes
$shortcut.Description = "DRTx-Teams"  ## This is the "Comment" field
$shortcut.Save()  ## Save

$destination = "c:\users\" + ${env:username} + "\links\"
$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut($destination + "DRTx-Admin.lnk")  ## Create new lnk
$shortcut.TargetPath = "\\disabilityrightstexas.sharepoint.com@SSL\DavWWWRoot\sites\Storage\DRTx" ## Make changes
$shortcut.Description = "DRTx-Teams"  ## This is the "Comment" field
$shortcut.Save()  ## Save 

```

