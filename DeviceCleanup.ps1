$dtDISABLE = (Get-Date).AddDays(-60)
$Devices = Get-AzureADDevice -All:$true | Where {$_.ApproximateLastLogonTimeStamp -le $dtDISABLE}
foreach ($Device in $Devices) {
Set-AzureADDevice -ObjectId $Device.ObjectId -AccountEnabled $false
}
$dtDELETE = (Get-Date).AddDays(-180)
$Devices = Get-AzureADDevice -All:$true | Where {($_.ApproximateLastLogonTimeStamp -le $dtDELETE) -and ($_.AccountEnabled -eq $false)}
foreach ($Device in $Devices) {
Remove-AzureADDevice -ObjectId $Device.ObjectId
}

#WIll need to automate this one day. Here's a link https://learn.microsoft.com/en-us/entra/id-governance/identity-governance-automation