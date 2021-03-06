#
# PluginRegistration.ps1
#

param(
	[string]$CrmConnectionString,
	[string]$RegistrationType,
	[string]$AssemblyPath,
	[bool]$IsWorkflowActivityAssembly,
	[string]$MappingJsonPath,
	[string]$SolutionName,
	[int]$Timeout
)

$ErrorActionPreference = "Stop"

Write-Verbose 'Entering PluginRegistration.ps1' -Verbose

#Parameters
Write-Verbose "CrmConnectionString = $CrmConnectionString"
Write-Verbose "RegistrationType = $RegistrationType"
Write-Verbose "AssemblyPath = $AssemblyPath"
Write-Verbose "IsWorkflowActivityAssembly = $IsWorkflowActivityAssembly"
Write-Verbose "MappingJsonPath = $MappingJsonPath"
Write-Verbose "SolutionName = $SolutionName"
Write-Verbose "Timeout = $Timeout"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

#Load XrmCIFramework
$xrmCIToolkit = $scriptPath + "\Xrm.Framework.CI.PowerShell.Cmdlets.dll"
Write-Verbose "Importing CIToolkit: $xrmCIToolkit" 
Import-Module $xrmCIToolkit
Write-Verbose "Imported CIToolkit"

Write-Host "Updating Plugin Assembly: $AssemblyPath"

Set-XrmPluginRegistration -RegistrationType $RegistrationType -AssemblyPath $AssemblyPath -IsWorkflowActivityAssembly $IsWorkflowActivityAssembly -MappingJsonPath $MappingJsonPath -SolutionName $SolutionName -ConnectionString $CrmConnectionString -Timeout $Timeout -Verbose

Write-Host "Updated Plugin Assembly and Steps"

Write-Verbose 'Leaving PluginRegistration.ps1' -Verbose