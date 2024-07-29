## Chocolatey

Chocolatey is a package manager for Windows.


Install chocolatey from [chocolatey.org](https://chocolatey.org/install).


Use the following **PowerShell** command to install the software listed in the `choco/choco.ps1` file.
```powershell
Invoke-Expression (Invoke-WebRequest -Uri `
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/dotfiles/choco/choco.ps1 -UseBasicParsing).Content
```

<!--
# TODO: Also try copying some of the dotfiles intro their places in case of Windows:
https://docs.ansible.com/ansible/latest/collections/ansible/windows/win_copy_module.html#ansible-collections-ansible-windows-win-copy-module
-->
