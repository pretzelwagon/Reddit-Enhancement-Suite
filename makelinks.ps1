#  Script name:    makelinks.ps1
#  Created on:     2013.06.08
#  Author:         Mike Morain
#  Purpose:        Create copies in Chrome directory for general 'lib' directory.
#				   Can't use hardlinks because the files end up being empty to build
#				   an unloaded extension on Windows.



 param (
    [switch]$clean = $false
    # TODO: Add the help below
    # [string]$help = $(throw "-username is required."),
 )



# Get current path
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
$libPath = $scriptPath + "\lib\";
$chromePath = $scriptPath + "\Chrome\";
# Get files in the path
$fileEntries = Get-ChildItem $libPath -name;

# Make hard-links for each
foreach($fileName in $fileEntries)
{
	$source = $libPath + $fileName;
	$target = $chromePath + $fileName;
    # [Console]::WriteLine($filename);
    # [Console]::WriteLine($source);
    # [Console]::WriteLine($target);

    if($clean -eq $true) {
		# remove copy
		cmd /c del $target
	} else {
    	# create copy
    	cmd /c copy /Y $source $target
    }
}