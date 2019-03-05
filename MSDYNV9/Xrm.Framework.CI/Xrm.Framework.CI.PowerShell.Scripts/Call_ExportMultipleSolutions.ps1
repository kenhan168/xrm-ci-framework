#
# AAA_Call.ps1
#

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

& "$scriptPath\ExportMultipleSolutions.ps1" -SourceSolutionsCrmConnectionString '<TBA>' -SourceSolutionsToMerge D365CE_126,D365CE_124,D365CE_112 -SourceSolutionsWorkFolder "/ExportedSolutions"