#  Script name:    makelinks.ps1 
#  Created on:     2013.06.08 
#  Author:         Mike Morain 
#  Purpose:        Create hard links in Chrome directory for general 'lib' directory.



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
	$target = $libPath + $fileName;
	$link = $chromePath + $fileName;
    # [Console]::WriteLine($filename); 
    # [Console]::WriteLine($source); 
    # [Console]::WriteLine($target); 

    if($clean -eq $true) {
		# remove hard-link
		cmd /c del $link
	} else { 
    	# create hardlink
    	cmd /c mklink /H $link $target
    }
}       

