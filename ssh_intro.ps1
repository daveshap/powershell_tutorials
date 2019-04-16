# IP address of an SSH server
$ip_addr = "192.168.0.10"

# import the SSH module for PowerShell
Import-Module Posh-SSH

# if credentials are not in memory, ask for credentials
if ($creds -eq $null) { $creds = Get-Credential -Message "Enter credentials for Linux machines" }

# connect to an SSH session
$ssh = New-SSHSession -ComputerName $ip_addr -Credential $creds -AcceptKey 

# run a command in the SSH session
$cmd = Invoke-SSHCommand -Command "time" -SSHSession $ssh

# show the results of the command
$cmd.Output

# destroy SSH session
Remove-SSHSession -SSHSession $ssh
