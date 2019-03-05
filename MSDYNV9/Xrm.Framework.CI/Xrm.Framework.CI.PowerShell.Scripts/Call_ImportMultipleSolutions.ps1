#
# AAA_Call.ps1
#

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

& "$scriptPath\ImportMultipleSolutions.ps1" -TargetSolutionCrmConnectionString '<TBA>' -TargetSolutionUniqueName "ken1" -TargetSolutionDisplayName "ken1" -TargetSolutionPublisherUniqueName "<TBA>" -TargetSolutionDescription "ken1" -SourceSolutionsToMerge "D365CE_126","D365CE_124","D365CE_112" -SourceSolutionsWorkFolder "/ExportedSolutions"
