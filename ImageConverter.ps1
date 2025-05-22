Configuration imageconverter
{
    param
    (
        [String]
        $ServiceAccountPassword="Polska123456",
        [int]
        $port = 5000
    )
    
    $username = "ImageConverter"
    $password = $ServiceAccountPassword| ConvertTo-SecureString -AsPlainText -Force
    $ServiceAccountCred = New-Object System.Management.Automation.PSCredential($username, $password)
    
    #$local_ip = (Get-NetIPAddress| ? InterfaceAlias -eq Ethernet |?  AddressFamily -eq IPv4).Ipaddress
    
    $ErrorActionPreference = "Continue"
    $VerbosePreference = "Continue"



    Import-DscResource -ModuleName cChoco
    Import-DscResource -Module SecurityPolicyDsc
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    node $AllNodes.Where{ $_.Role -contains "ImageConverter" }.NodeName
    {
    cChocoInstaller InstallChoco {
            InstallDir = "$env:SystemDrive\choco"
        }
    cChocoPackageInstaller nssm {
            Name      = "nssm"
            Ensure    = 'Present'
            DependsOn = '[cChocoInstaller]installChoco'
        }
    cChocoPackageInstaller dotnet8 {
            Name      = "dotnet-8.0-sdk"
            Ensure    = 'Present'
            DependsOn = '[cChocoInstaller]installChoco'
        }
    Script DownloadSource {
            TestScript = { # the TestScript block runs first. If the TestScript block returns $false, the SetScript block will run
                Test-Path "$env:SystemDrive\temp\net8.0.zip"
            }
            SetScript  = {
                
                
                Write-Verbose "Starting download.."
                Start-BitsTransfer 'https://iposlandingpage.blob.core.windows.net/imageconverter/image-service.zip?sp=r&st=2023-12-29T16:39:13Z&se=2024-07-18T23:39:13Z&spr=https&sv=2022-11-02&sr=b&sig=9EsrxT%2FaB6G%2Fqo%2F2cecV7qAQxdiGSIlNH2Fs30xJeJc%3D' -Destination "$env:SystemDrive\temp\net8.0.zip"
                

            }
            GetScript  = { # should return a hashtable representing the state of the current node
                $result = est-Path "$env:SystemDrive\temp\net8.0.zip"
                @{
                    "Downloaded" = $result
                }
            }
        }
    File ImageConverterDir {
            DestinationPath = "$env:SystemDrive\ImageConverter"
            Type            = "Directory"
            Ensure          = "Present"
        }
    Archive ImageConverter {
            DependsOn = "[Script]DownloadSource","[File]ImageConverterDir"
            Path = "$env:SystemDrive\temp\net8.0.zip"
            Destination = "$env:SystemDrive\ImageConverter\net8.0\"
        }
    User ImageConverterServiceAccount  {
            Ensure = "Present"  # To ensure the user account does not exist, set Ensure to "Absent"
            UserName = $ServiceAccountCred.UserName
            Password = $ServiceAccountCred # This needs to be a credential object
            PasswordNeverExpires = $true
            Description = "Account used for running ImageConverter service"
            
        }

    UserRightsAssignment LogOnAsaServiceServiceAccount {
        DependsOn = "[User]ImageConverterServiceAccount"
        Policy    = "Log_on_as_a_service"
        Identity  = $ServiceAccountCred.UserName
        Force     = $true
    }

    Script ImageConverterService {
            DependsOn =         "[cChocoPackageInstaller]nssm","[Archive]ImageConverter","[UserRightsAssignment]LogOnAsaServiceServiceAccount"
            TestScript = { # the TestScript block runs first. If the TestScript block returns $false, the SetScript block will run
                if (get-service ImageConverter -ErrorAction SilentlyContinue)
                          {$true}
                          else
                          {$false}
            }
            SetScript  = {
                
                
                Write-Verbose "Installing service.."
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "install","ImageConverter",'c:\ImageConverter\net8.0\ImageService.exe'
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","AppDirectory",'c:\ImageConverter\net8.0\'
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","AppParameters","$using:port"
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","Start","SERVICE_AUTO_START"
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","AppStdout","c:\ImageConverter\ImageConverter.log"
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","AppStderr","c:\ImageConverter\ImageConverter.log"
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","AppExit","Default","Restart"
                
                #Write-Verbose "IP: $($using:local_ip)"
                Write-Verbose "port: $($using:port)"
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "set","ImageConverter","ObjectName",".\$using:username",$using:ServiceAccountPassword
                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "start","ImageConverter"

                start-sleep 10

                Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "restart","ImageConverter"

                <#
                    Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "stop","ImageConverter"
                    Start-Process -FilePath "C:\choco\bin\nssm.exe" -ArgumentList "remove","ImageConverter","confirm"
                #>
            }
            GetScript  = { # should return a hashtable representing the state of the current node
                if (get-service ImageConverter -ErrorAction SilentlyContinue)
                          {$true}
                          else
                          {$false}
            }
        }
    }

}


$data = @{
    AllNodes    = @(    
        @{  
            NodeName = 'localhost'
        },
        @{
            NodeName                    = $env:COMPUTERNAME
            Role                        = "ImageConverter"
            PSDscAllowPlainTextPassword = $true
            PSDscAllowDomainUser        = $true
            
        }
    );
    NonNodeData = ""
}

ImageConverter -ConfigurationData $data -ServiceAccountPassword "Polska123456"
Start-DscConfiguration .\ImageConverter -Wait -Verbose -force