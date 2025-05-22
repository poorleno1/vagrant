[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            RebootNodeIfNeeded = $true
            ActionAfterReboot = "ContinueConfiguration"
            ConfigurationMode = "ApplyAndAutoCorrect"
            DebugMode = "ForceModuleImport"
        }
    }
}

LCMConfig

Set-DscLocalConfigurationManager .\LCMConfig -verbose -force