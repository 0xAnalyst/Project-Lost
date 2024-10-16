---
title: Defender
tags:
  - Defense Evasion
references: 
- https://blog.fndsec.net/2024/10/04/uncovering-exclusion-paths-in-microsoft-defender-a-security-research-insight/
files: []
---

Microsoft Defender is a built-in security solution in Windows that offers real-time protection against malware, exploits, and various threats, leveraging cloud-based intelligence and centralized management in enterprise environments.

# List exclusion paths

## Description
Microsoft Defender can be abused to list exclusion paths to avoid detection without requiring elevated privileges or searching through event logs.

## Simulation
```
& "C:\Program Files\Windows Defender\MpCmdRun.exe" -Scan -ScanType 3 -File "C:\path\to\folder\|*"
```

## MITRE ATT&CK
T1564.012 - Hide Artifacts: File/Path Exclusions

## Detections
```
DeviceProcessEvents
| where FileName == "MpCmdRun.exe"
| where ProcessCommandLine has "-Scan -ScanType 3 -File"
| where ProcessCommandLine endswith @"|*"
| where InitiatingProcessUserSID != "S-1-5-18"
| project Timestamp, DeviceName, InitiatingProcessAccountName, FileName, ProcessCommandLine
```