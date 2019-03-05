#
# ExportMultipleSolutions.ps1
#

param(
[string]$SourceSolutionsCrmConnectionString,
[String[]] $SourceSolutionsToMerge, 
[String] $SourceSolutionsWorkFolder,
[int]$Timeout #Optional - CRM connection timeout
)

$VerbosePreference = "Continue"

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

# Export Solutions into the working folder
$exportSolutionOutputPath = "$scriptPath$SourceSolutionsWorkFolder"
Write-Verbose "exportSolutionOutputPath: $exportSolutionOutputPath"

# Delete the existing folder and create a new one if it exists
If(test-path $exportSolutionOutputPath)
{
	Remove-Item $exportSolutionOutputPath -Force  -Recurse -ErrorAction SilentlyContinue
}

New-Item -ItemType Directory -Force -Path $exportSolutionOutputPath

for ($i=0; $i -lt $SourceSolutionsToMerge.length; $i++) {
	$sourceSolution = $SourceSolutionsToMerge[$i]
	Write-Verbose "Export sourceSolution = $sourceSolution"
	Write-Verbose "SourceSolutionsCrmConnectionString = $SourceSolutionsCrmConnectionString"
	Write-Verbose "exportSolutionOutputPath: $exportSolutionOutputPath"
	& "$scriptPath\ExportSolution.ps1" -CrmConnectionString $SourceSolutionsCrmConnectionString -SolutionName $sourceSolution -ExportSolutionOutputPath $exportSolutionOutputPath -Timeout $Timeout
}