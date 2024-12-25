## Manual Windows settings

Definitely do not **activate Windows** using something like [massgrave.dev](https://massgrave.dev/).

Install [Chocolatey](https://chocolatey.org/install).

Install **Chocolatey** packages:
```powershell
$programs = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/daniel-mizsak/macos-setup/refs/heads/main/ansible/windows/programs.txt" | Select-Object -ExpandProperty Content
```
```powershell
$programs -split "`n" | ForEach-Object { if ($_ -ne '') { choco install $_ -y } }
```

Pressing the `Enter` key might be necessary after some programs are installed.

Also enable:
- Show Hidden Files
- Show File Extensions
