#
# Module manifest for module 'Vester'
#
# Generated by: Brian Bunke
#
# Generated on: 8/28/2016
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Vester.psm1'

# Version number of this module.
ModuleVersion = '1.1.0'

# ID used to uniquely identify this module
GUID = 'cd038486-b669-4edb-a66d-bfe94c61b011'

# Author of this module
Author = 'Chris Wahl'

# Company or vendor of this module
CompanyName = 'Community'

# Copyright statement for this module
Copyright = 'Apache License'

# Description of the functionality provided by this module
Description = 'Check your VMware vSphere environment for undesired values, and automatically fix them. Define settings, then use PowerCLI and Pester to report on and/or remediate any problems discovered.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(
    @{ModuleName = 'Pester'; ModuleVersion = '3.4.3'},
    @{ModuleName = 'VMware.VimAutomation.Core'; ModuleVersion = '6.5.1'}
)

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = @('Invoke-Vester','New-VesterConfig')

# Cmdlets to export from this module
# CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module
# AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('vester','vmware','vcenter','vsphere','esxi','powercli')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/WahlNetwork/Vester/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/WahlNetwork/Vester'

        # A URL to an icon representing this module.
        # IconUri = ''

        # External Module Dependencies
        # ExternalModuleDependencies = @()

        # ReleaseNotes of this module
        ReleaseNotes = @'
## [1.1.0] - 2017-06-15
I learned that we need to publish releases far more often. :)

### Added
- New scope for datastore clusters: "DSCluster"
- New [DSCluster tests](https://github.com/WahlNetwork/Vester/tree/0a8b87807e60606fe3006a65bbb429958a122d34/Vester/Tests/DSCluster):
  - AutoOverride-IoLoadBalance
  - AutoOverride-PolicyEnforcement
  - AutoOverride-RuleEnforcement
  - AutoOverride-SpaceLoadBalance
  - AutoOverride-VmEvacuation
  - IO-Latency
  - IO-LoadImbalanceThreshold
  - IO-ResIopsThreshold
  - IO-ResPercentThreshold
  - IO-ResThresholdMode
  - IOLoadBalance
  - LoadBalance-Interval
  - SDRS-AutomationLevel
  - SDRS-DefaultVMAffinity
  - Space-FreespaceTheshold
  - Space-ThresholdMode
  - Space-UtilDiffMin
  - SpaceUtilPercent
- Some new tests were written, and others were ported from the old test format (prior to Vester 1.0's module life)
- New [vCenter tests](https://github.com/WahlNetwork/Vester/tree/0a8b87807e60606fe3006a65bbb429958a122d34/Vester/Tests/vCenter):
  - SMTP-Sender
  - SMTP-Server
  - VC-EventMaxAge
  - VC-EventMaxAgeEnabled
  - VC-TaskMaxAge
  - VC-TaskMaxAgeEnabled
- New [ESXi Host tests](https://github.com/WahlNetwork/Vester/tree/0a8b87807e60606fe3006a65bbb429958a122d34/Vester/Tests/Host):
  - Advanced-Kernel-iovDisableIR
  - BPDU-Filter
  - Disk-MaxLUN
  - NetDump-Settings
  - NetDump-SettingsEnable
  - NTP-Service
  - NTP-Service-Policy
  - SSH-Service-Policy
- New [VM tests](https://github.com/WahlNetwork/Vester/tree/0a8b87807e60606fe3006a65bbb429958a122d34/Vester/Tests/VM):
  - Boot-Delay
  - CPU-Reservation
  - Isolation-DeviceConnectable
  - Isolation-DeviceEdit
  - Memory-Reservation
  - RemoteConsole-VNC
  - Snapshot-Retention
  - Sync-TimeSettings
  - Tools-HostInfoAccess
  - Tools-SetInfo-SizeLimit
- New [VDS Network tests](https://github.com/WahlNetwork/Vester/tree/0a8b87807e60606fe3006a65bbb429958a122d34/Vester/Tests/Network):
  - VDS-LinkOperation
  - VDS-MTUsize
  - VDS-Teaming-HealthCheck
  - VDS-VlanMTU-HealthCheck

### Changed
- #114/#115: `Invoke-Vester` is **more than twice as fast** now! We removed repeated `Get` calls within private file `VesterTemplate.Tests.ps1`. Big thanks to @Midacts/@jpsider/@jonneedham for collaborating on this.
- #118/#119: `Config.json` files now sort their settings within each scope.

### Fixed
- #90: `Invoke-Vester -Test $TestList` should execute all tests in the array, instead of just the final one after ignoring the rest. Now they do again.
- #99: Re-implemented `-PassThru` on `Invoke-Vester`.
- #116/#129: The name of the active vCenter connection was not being reported properly.
- Cleaned up VM test files:
  - Tools-DiskWiperDisable
  - Tools-HGFS-ServerDisable

### Much :heart:
[@jeffgreenca](https://github.com/jeffgreenca) [@haberstrohr](https://github.com/haberstrohr) [@jonneedham](https://github.com/jonneedham) [@Midacts](https://github.com/Midacts) [@jpsider](https://github.com/jpsider)


## [1.0.1] - 2017-02-28
Initial availability as a PowerShell module


## [1.0.0] - 2016-11-10 [YANKED]
Published just to reserve the name on the PowerShell Gallery. If you have this version, please update!
'@
    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
