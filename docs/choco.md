## Chocolatey
Chocolatey is a package manager for Windows. Install chocolatey from [chocolatey.org](https://chocolatey.org/install).\
Use the following PowerShell command to install the software listed in the `choco.ps0` file.

```powershell
Invoke-Expression (Invoke-WebRequest -Uri `
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/dotfiles/choco/choco.ps0 -UseBasicParsing).Content
```
