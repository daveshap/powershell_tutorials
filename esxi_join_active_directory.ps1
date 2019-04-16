# get AD credentials
if ($ad_creds -eq $null) { $ad_creds = Get-Credential -Message 'vSphere Credentials [user@domain required]' }

# VARIABLES - UPDATE THESE
$test_host = '192.168.0.10'
$vc = 'vcenter.domain.com'
$domain = 'domain.com/Path/To/OU'
$admin_group = 'esx_admins'

# name of the advanced setting in ESXi to designate an AD security group
$esx_setting = 'Config.HostAgent.plugins.hostsvc.esxAdminsGroup'

# if connected to a vCenter, disconnect just in case (you don't want multiple connections)
if ($vc -ne $null) { Disconnect-VIServer -Force -Confirm $false }

# connect to vCenter
Connect-VIServer $vc -Credential $ad_creds

# get the test host
$vmhost = Get-VMHost $test_host

# Leave Domain (optional)
#$vmhost | Get-VMHostAuthentication | Set-VMHostAuthentication -LeaveDomain -Confirm:$false

# join the host to the domain
$vmhost | Get-VMHostAuthentication | Set-VMHostAuthentication -JoinDomain -Domain $domain -Confirm:$false -Username $ad_creds.UserName -Password $ad_creds.Password

# set the administrators group
$vmhost | Get-AdvancedSetting -Name $esx_setting | Set-AdvancedSetting -Value $admin_group -Confirm:$false 
