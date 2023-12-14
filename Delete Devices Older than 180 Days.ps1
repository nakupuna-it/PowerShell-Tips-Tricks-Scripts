$dt = (Get-Date).AddDays(-180)
$Devices = Get-AzureADDevice -All:$true | Where {($_.ApproximateLastLogonTimeStamp -le $dt) -and ($_.AccountEnabled -eq $false)}
foreach ($Device in $Devices) {
Remove-AzureADDevice -ObjectId $Device.ObjectId
}