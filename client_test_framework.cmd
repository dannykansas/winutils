@ECHO OFF

ECHO ...
ECHO Relaxing Powershell execution policy...
ECHO ...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Powershell" /V ExecutionPolicy /D "Unrestricted" /T REG_SZ /F > nul

POWERSHELL set-executionpolicy UNRESTRICTED -force 
POWERSHELL set-executionpolicy UNRESTRICTED
ECHO --Testing 80 to test Server>> testPort.txt
POWERSHELL Port-Testv1.ps1 -computer IP.OF.DEV.ICE -port 80 -tcp -TCPtimeout 2000 >> testPort.txt
ECHO --Testing 8080 to test Server >> testPort.txt
POWERSHELL Port-Testv1.ps1 -computer IP.OF.DEV.ICE -port 8080 -tcp -TCPtimeout 2000 >> testPort.txt
ECHO --Testing 22 to test Server >> testPort.txt
POWERSHELL Port-Testv1.ps1 -computer IP.OF.DEV.ICE -port 22 -tcp -TCPtimeout 2000 >> testPort.txt
ECHO --Testing UDP 53 to DNS Server >> testPort.txt
POWERSHELL Port-Testv1.ps1 -computer IP.OF.DEV.ICE -port 53 -UDP -UDPtimeout 2000 >> testPort.txt

ECHO ...
ECHO Un-Relaxing Powershell execution policy...
ECHO ...

reg.exe ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Powershell" /V ExecutionPolicy /D "AllSigned" /T REG_SZ /F >> NUL

:exit

