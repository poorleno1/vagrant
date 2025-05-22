Configuration Computer_JoinDomain_Config
{
    $password = "vagrant" | ConvertTo-SecureString -asPlainText -force
    $user = "contoso\vagrant"
    $Credential = New-Object System.Management.Automation.PSCredential($user, $password)

    Import-DscResource -Module ComputerManagementDsc
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsServerAddress DnsServerAddress {
            #Address        = '192.168.1.10'
            Address        ='192.168.0.10'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Validate       = $true
        }
        
        Computer JoinDomain {
            Name       = $env:COMPUTERNAME
            DomainName = 'Contoso.local'
            Credential = $Credential # Credential to join to domain
            DependsOn  = "[DnsServerAddress]DnsServerAddress"
        }

        PendingReboot AfterJoinDomain {
            Name                  = 'JoinDomainReboot'
            SkipCcmClientSDK      = $true
            SkipPendingFileRename = $true
            DependsOn             = '[Computer]JoinDomain'
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

Computer_JoinDomain_Config -ConfigurationData $cd

Start-DscConfiguration .\Computer_JoinDomain_Config -Wait -Verbose