# get the 50 most recent system logs (sample data)
$logs = Get-EventLog -LogName System -Newest 50

# show the logs as a table on the console
$logs | Format-Table

# export a CSV to the same directory as the script
$logs | Export-Csv -Path ($PSScriptRoot + "\50_system_logs.csv") -NoTypeInformation 
