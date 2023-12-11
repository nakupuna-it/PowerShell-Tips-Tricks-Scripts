#================================================================================#
#================================================================================#
#===== RUN EVERYTHING HERE IN AN ADMIN POWERSHELL OR POWERSHELL ISE SESSION =====#
#================================================================================#
#================================================================================#

#=================================================#
#===== POWERSHELL ENVIRONMENT SETUP COMMANDS =====#
#=================================================#
#SET EXECUTION POLICY FIRST. ALLOWS YOU TO RUN UNSIGNED SCRIPTS (LIKE THE ONES YOU'D BE WRITING YOURSELF)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

#INSTALL THE PSGALLERY AND PSGET REPOSITORIES/MODULES
Install-PackageProvider NuGet -Force
Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module -Name PowerShellGet -Force -AllowClobber

#SET WINRM TO ALLOW THE CONNECTIONS TO ENVIRONMENTS
winrm quickconfig -quiet
winrm set winrm/config/client/auth '@{Basic="true"}'

#INSTALL THE VARIOUS MODULES
Install-Module -Name ExchangeOnlineManagement
Install-Module -Name MicrosoftTeams -Force -AllowClobber
Install-Module -Name AzureAD
Install-Module -Name Microsoft.Online.SharePoint.PowerShell
Install-Module -Name MSOnline
Install-Module -Name Az -Repository PSGallery -Force

<======================================================>
<===== POWERSHELL ENVIRONMENT CONNECTION COMMANDS =====>
<======================================================>
#TEAMS
Connect-MicrosoftTeams -TeamsEnvironmentName TeamsGCCH

#EXCHANGE
Connect-ExchangeOnline -ExchangeEnvironmentName O365USGovGCCHigh

#AZURE AD
Connect-AzureAD -AzureEnvironmentName AzureUSGovernment

#SHAREPOINT
Connect-SPOService -Url https://nakupuna-admin.sharepoint.us/

#M365 ADMIN
Connect-MsolService -AzureEnvironment USGovernment

#AZURE
Connect-AzAccount -Environment AzureUSGovernment


<=============================>
<===== AZURE AD COMMANDS =====>
<=============================>
#GETS MOST AZURE AD PROPERTIES FOR A SPECIFIC USER
Get-AzureADUser -ObjectId "<EMAIL ADDRESS GOES HERE BETWEEN QUOTES>"| select *

#UPDATES THE TEAMS POWERSHELL MODULE. REMOVE THE MODULE NAME TO UPDATE ALL MODULES
Update-Module MicrosoftTeams

#GETS THE VERSION OF THE INSTALLED TEAMS MODULE. REMOVE NAME TO GET EVERYTHING
Get-InstalledModule -Name "MicrosoftTeams"

#GETS THE VERSION OF POWERSHELL INSTALLED
$PSVersionTable.PSVersion


