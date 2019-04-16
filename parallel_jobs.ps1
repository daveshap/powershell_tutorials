# define a job
$script_block = {
    param ($log)
    $log | Format-List
    }

# get some test data
$logs = Get-EventLog -LogName System -Newest 50

# start a job for each item in the data
foreach ($log in $logs) { Start-Job -ScriptBlock $script_block -ArgumentList @($log) }

# get the job and receive output in real time
Get-Job | Receive-Job -Wait

# remove all jobs once they're done
Get-Job | Remove-Job -Force
