---
title: Sysinternals (ProcDump, PSExec, Sysmon)
tags:
  - Credential Access
  - Defense Evasion
  - Lateral Movement
references:
  - https://learn.microsoft.com/en-us/sysinternals/downloads/procdump
  - https://learn.microsoft.com/en-us/sysinternals/downloads/psexec
  - https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon
files: []
---

Sysinternals tools such as ProcDump, PSExec, and Sysmon are widely used for troubleshooting, monitoring, and incident response in Windows environments. Because they are trusted and signed by Microsoft, they are frequently abused by threat actors to perform credential dumping, remote execution, and defense evasion.

# ProcDump – LSASS Dumping

## Description
ProcDump can be abused to dump the LSASS process memory and extract credentials without dropping obvious credential-dumping tools like Mimikatz, helping attackers blend into normal administrative activity.

## Simulation
```
procdump.exe -accepteula -ma lsass.exe C:\Windows\Temp\lsass.dmp
```

## MITRE ATT&CK
T1003.001 – OS Credential Dumping: LSASS Memory

## Detections
```kql
DeviceProcessEvents
| where FileName =~ "procdump.exe"
| where ProcessCommandLine has_any ("lsass", "lsass.exe")
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```

# PSExec – Lateral Movement

## Description
PSExec is used legitimately for remote administration but is heavily abused by ransomware groups to execute commands and deploy payloads across many hosts over SMB.

## Simulation
```
psexec.exe \\TARGET -u DOMAIN\\user -p Password123 -accepteula cmd.exe /c C:\share\ransomware.exe
```

## MITRE ATT&CK
T1021.002 – Remote Services: SMB/Windows Admin Shares

## Detections
```kql
DeviceProcessEvents
| where FileName =~ "psexec.exe"
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```

# Sysmon – Tampering and Blind Spots

## Description
Sysmon is often deployed to enhance visibility. Threat actors may attempt to stop the service, uninstall it, or replace its configuration with a weaker one to reduce logging and evade detection.

## Simulation
```
sc stop sysmon
sysmon64.exe -u
```

## MITRE ATT&CK
T1562.001 – Impair Defenses: Disable or Modify Tools

## Detections
```kql
DeviceProcessEvents
| where FileName in~ ("sysmon.exe","sysmon64.exe","sc.exe")
| where ProcessCommandLine has_any ("sysmon", "Sysmon")
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```
