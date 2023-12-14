Connect-AzureAD -AzureEnvironmentName AzureUSGovernment
$dt = (Get-Date).AddDays(-60)
$Devices = Get-AzureADDevice -All:$true | Where {$_.ApproximateLastLogonTimeStamp -le $dt}
foreach ($Device in $Devices) {
Set-AzureADDevice -ObjectId $Device.ObjectId -AccountEnabled $false
}