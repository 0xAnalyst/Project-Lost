---
title: Defender
tags:
  - Enum
  - Exec
references: 
- https://blog.fndsec.net/2024/10/04/uncovering-exclusion-paths-in-microsoft-defender-a-security-research-insight/
files: []
path:
- C:\Program Files\Windows Defender\MpCmdRun.exe
---

# List exclusion paths

## Description
Microsoft Defender can be abused to list exclusion paths to avoid detection without requiring elevated privileges or searching through event logs.

## Simulation
```& "C:\Program Files\Windows Defender\MpCmdRun.exe" -Scan -ScanType 3 -File "C:\path\to\folder\|*"```

## MITRE ATT&CK
T1564.012 - Hide Artifacts: File/Path Exclusions

## Detections
- test