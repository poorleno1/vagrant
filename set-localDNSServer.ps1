Configuration Computer_SetDNS
{
    $password = "vagrant" | ConvertTo-SecureString -asPlainText -force
    $user = "contoso\vagrant"
    $Credential = New-Object System.Management.Automation.PSCredential($user, $password)

    Import-DscResource -Module ComputerManagementDsc
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsServerAddress DnsServerAddress
        {
            Address        = '192.168.1.10'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Validate       = $true
        }
    }
}

$cd = @{
    AllNodes = @(
        @{
            NodeName                    = 'localhost'
            PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser        = $true
        }
    )
}

Computer_SetDNS -ConfigurationData $cd

Start-DscConfiguration .\Computer_SetDNS -Wait -Verbose