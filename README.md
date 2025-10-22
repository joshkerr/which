# PowerShell Which Command

A PowerShell implementation of the Linux `which` command for Windows systems.

## Overview

This script searches for executable files in your PATH environment variable and returns their full paths, mimicking the behavior of the Unix/Linux `which` command on Windows.

## Features

- 🔍 Searches through all directories in your PATH
- 📁 Supports common Windows executable extensions (`.exe`, `.cmd`, `.bat`, `.ps1`, `.com`, `.msc`)
- 🔄 Option to show all matching executables with `-All` flag
- ✅ Proper exit codes (0 for success, 1 for not found)
- 📖 Built-in help documentation

## Installation

1. Download the `which.ps1` script
2. Place it in a directory that's in your PATH, or run it directly with the full path

## Usage

### Basic Usage
```powershell
.\which.ps1 <command>
```

### Examples
```powershell
# Find notepad
.\which.ps1 notepad
# Output: C:\Windows\System32\notepad.exe

# Find all Python installations
.\which.ps1 python -All
# Output: C:\Python39\python.exe
#         C:\Users\username\AppData\Local\Programs\Python\Python310\python.exe

# Find PowerShell
.\which.ps1 powershell
# Output: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Command` | String | Yes | The command/executable to search for |
| `All` | Switch | No | Show all matching executables in PATH, not just the first one |

## Exit Codes

- `0` - Command found successfully
- `1` - Command not found

## Requirements

- Windows PowerShell 5.1 or PowerShell Core 6.0+
- No additional dependencies required

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the [MIT License](LICENSE).