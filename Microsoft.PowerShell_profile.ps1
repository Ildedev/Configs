$GIT = "C:\Program Files\Git\git-cmd.exe"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Location $HOME
$Host.UI.RawUI.CursorSize = 100

Function Edit-Profile		{vim $profile}
Function Edit-Vimrc		{vim $home/_vimrc}
Function Touch ($file)  	{"" | set-content -encoding ascii $file}
Function workspace		{cd $HOME/Programming}

Function Convert-IntToBits ([Uint32]$Integer, [Switch]$NoleadingZeros) {
	if ($NoleadingZeros){ [system.convert]::toString($Integer, 2) }
	else { ([system.convert]::tostring($integer,2)).PadLeft(8,"0") }
}

function prompt {
    $wi = [System.security.principal.windowsidentity]::getcurrent()
    $wp = new-object 'system.security.principal.windowsprincipal' $wi
    if($wp.IsInRole("Administrators") -eq 1) {
        $color = "White"
        $title = "Root** on " + (hostname);
    }
    else {
        $color = "Grey"
        $title = hostname;
    }
    $runTime = '[00:00:000]' 
    $LastCmd = get-history -count 1
    if ($LastCmd) {
        $runTime = '[{0:mm\:ss\.fff}]' -f   ($LastCmd.EndExecutionTime - $LastCmd.StartExecutionTime)
    } 
    $currentDirectory = Split-Path (Get-Location) -Leaf
    $host.UI.RawUI.WindowTitle = $title
    write-host "$runtime " -foreground red -nonewline
	if($currentDirectory -eq (split-path $($HOME) -leaf)) {
		write-host "~:>" -foreground $color -nonewline
	}
	else {
		write-host "~:$currentDirectory>" -foreground $color -nonewline
	}
	return ' '
} 


# Aliases
set-alias -Name "grep" 	-Value select-string
set-alias -name "git" 	-value $GIT
