param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$Command,
    
    [switch]$All
)

<#
.SYNOPSIS
    Mimics the Linux 'which' command functionality on Windows.

.DESCRIPTION
    Searches for the specified command in the PATH environment variable and returns
    the full path to the executable. Similar to the Linux 'which' command.

.PARAMETER Command
    The command/executable to search for.

.PARAMETER All
    Show all matching executables in PATH, not just the first one.

.EXAMPLE
    .\which.ps1 notepad
    Returns the path to notepad.exe

.EXAMPLE
    .\which.ps1 python -All
    Returns all python executables found in PATH
#>

# Get PATH environment variable and split into directories
$pathDirs = $env:PATH -split ';' | Where-Object { $_ -ne '' }

# Common executable extensions on Windows
$executableExtensions = @('.exe', '.cmd', '.bat', '.ps1', '.com', '.msc')

$found = $false
$results = @()

foreach ($dir in $pathDirs) {
    if (Test-Path $dir) {
        # Try the command as-is first
        $fullPath = Join-Path $dir $Command
        if (Test-Path $fullPath -PathType Leaf) {
            $results += $fullPath
            $found = $true
            if (-not $All) { break }
        }
        
        # Try with each executable extension
        foreach ($ext in $executableExtensions) {
            $fullPathWithExt = Join-Path $dir "$Command$ext"
            if (Test-Path $fullPathWithExt -PathType Leaf) {
                $results += $fullPathWithExt
                $found = $true
                if (-not $All) { break }
            }
        }
        
        if ($found -and -not $All) { break }
    }
}

if ($results.Count -gt 0) {
    $results | ForEach-Object { Write-Output $_ }
    exit 0
} else {
    Write-Error "$Command not found"
    exit 1
}