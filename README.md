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
            <li>Your Intranet Zone is now setup.</li>
</ol>  

<h3>Powershell commands required to map to Quick Access Links:</h3>

<h4>Setup Quick Access link for OneDrive</h4>

```powershell
            $MyCompanyName = ## Type in your Domain name here ex.. Microsoft 
            $MyDomainName = ## Type in your Full Domain name here ex.. _Microsoft_com
            $destination = "c:\users\" + ${env:username} + "\links\"<br> ## If this is only for one person you can just plug in your username where $destination is below
            $shell = New-Object -COM WScript.Shell<br> 
            $shortcut = $shell.CreateShortcut($destination + "OneDrive-Access.lnk")  ## Create new link shortcut<br>
            $shortcut.TargetPath = "\\"%MyCompanyName%"-my.sharepoint.com@SSL\DavWWWRoot\personal\" + "%username%" + ""%MyDomainName%"\Documents" ## Target CompanyName and DomainName<br>
            $shortcut.WorkingDirectory = "%windir%" <br>
            $shortcut.Description = "OneDrive-Access"  ## This is the "Comment" field. YOu can set this to whatever you like<br>
            $shortcut.Save()  ## Save<br>

```

<h4>Setup Quick Access link for Office 365 Sharepoint Library</h4>

```powershell
            $MyCompanyName = ## Type in your Domain name here ex.. Microsoft 
            $MyDomainName = ## Type in your Full Domain name here ex.. _Microsoft_com
            $NameofLink = ## Type in descriptive name for your link to the Office 365 Library ex.. HR-Docs.lnk
            $LibraryName = ## Type in actual library name for Office 365 library
            $destination = "c:\users\" + ${env:username} + "\links\"<br> ## same as above example
            $shell = New-Object -COM WScript.Shell<br>
            $shortcut = $shell.CreateShortcut($destination + "%NameOfLink%")  ## Link name for library<br> 
            $shortcut.TargetPath = "\\"%MyCompanyName%".sharepoint.com@SSL\DavWWWRoot\sites\Storage\"%LibraryName%"" ## shortcut to Office 365 library<br>
            $shortcut.Description = "DescriptionofLibraryNameHere"  ## You can set DescriptionofLibraryNameHere to whatever you want like HR-Docs. It's the comment<br>
            $shortcut.Save()  ## Saves shortcut<br>

```

