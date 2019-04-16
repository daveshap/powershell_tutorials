# start fresh
Clear-Host

# infinite loop
while ($true)
    {
    # display choices
    Write-Host "`n`n"
    Write-Host "1: Install NuGet package provider"
    Write-Host "2: Install PowerShell Get"
    Write-Host "3: Install SSH module"
    Write-Host "4: Install VMware modules"
    Write-Host "5: Install Cisco UCS modules"
    Write-Host "6: Install HPE modules"

    # get user input
    $choice = Read-Host -Prompt "Choose option or CTRL-C to quit"

    # execute action
    switch ($choice)
        {
        "1" {Install-PackageProvider -Name NuGet -Scope CurrentUser -Confirm:$false -Force }
        "2" {Install-Module -Name PowerShellGet -Scope CurrentUser -Confirm:$false -Force -AllowClobber }
        "3" {Install-Module -Name Posh-SSH -Scope CurrentUser -Confirm:$false -Force }
        "4" {Install-Module -Name VMware.PowerCLI -Scope CurrentUser -Confirm:$false -Force }
        "5" {Install-Module -Name Cisco.UCS.Core -Scope CurrentUser -Confirm:$false -Force; Install-Module -Name Cisco.UCSManager -Scope CurrentUser -Confirm:$false -Force }
        "6" {Install-Module -Name HPEiLOCmdlets -Scope CurrentUser -Confirm:$false -Force; Install-Module -Name HPEOACmdlets -Scope CurrentUser -Confirm:$false -Force }
        }
    }
