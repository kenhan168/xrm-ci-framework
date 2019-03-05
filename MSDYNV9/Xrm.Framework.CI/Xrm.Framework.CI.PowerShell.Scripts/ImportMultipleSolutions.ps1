#
# AAA.ps1
#

param(
[String] $SourceSolutionsWorkFolder,
[String[]] $SourceSolutionsToMerge, 
[string]$TargetSolutionCrmConnectionString,
[string]$TargetSolutionUniqueName,
[string]$TargetSolutionDisplayName,
[string]$TargetSolutionPublisherUniqueName,
[string]$TargetSolutionVersionNumber = '1.0.0.0',
[string]$TargetSolutionDescription = '',
[int]$Timeout #Optional - CRM connection timeout
)

$VerbosePreference = "Continue"

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

Write-Verbose "Createing Target Solution TargetSolutionDisplayName = $TargetSolutionDisplayName"
Write-Verbose "TargetSolutionCrmConnectionString = $TargetSolutionCrmConnectionString"

& "$scriptPath\CreateSolution.ps1" -CrmConnectionString $TargetSolutionCrmConnectionString -UniqueName $TargetSolutionUniqueName -DisplayName $TargetSolutionDisplayName -PublisherUniqueName $TargetSolutionPublisherUniqueName -Description $TargetSolutionDescription

# Working folder that contains the export solution zip files
$exportSolutionOutputPath = "$scriptPath$SourceSolutionsWorkFolder"
Write-Verbose "exportSolutionOutputPath: $exportSolutionOutputPath"

# import solutions into the Target Instance
for ($i=0; $i -lt $SourceSolutionsToMerge.length; $i++) {
	$fromSolutionName = $SourceSolutionsToMerge[$i]
	$fromSolutionZip = $exportSolutionOutputPath + "/" + $fromSolutionName + ".zip"
	Write-Verbose "fromSolutionZip = $fromSolutionZip"
	Write-Verbose "TargetSolutionCrmConnectionString = $TargetSolutionCrmConnectionString"
	& "$scriptPath\ImportSolution.ps1" -CrmConnectionString $TargetSolutionCrmConnectionString -solutionFile $fromSolutionZip

	& "$scriptPath\CopySolutionComponents.ps1" -CrmConnectionString $TargetSolutionCrmConnectionString -FromSolutionName $fromSolutionName -ToSolutionName $TargetSolutionUniqueName
}

Exit

