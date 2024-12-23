## Configure Windows for Ansible

> [!WARNING]
> This solution is not maintained.
> It might not even be possible to properly configure Windows using Ansible.
> [Ansible host requirements](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#control-node-requirements)

Definitely do not **activate Windows** using something like [massgrave.dev](https://massgrave.dev/).


Install **Chocolatey** from [chocolatey.org](https://chocolatey.org/install).


Install **Python**:
```powershell
choco install python
```

Run the **windows setup** script:
```powershell
iex ((New-Object System.Net.WebClient).DownloadString(
    'https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/ansible/scripts/windows-setup.ps1'))
```
