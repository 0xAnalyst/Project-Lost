---
title: GMER
tags:
  - Defense Evasion
references: 
- https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-061a-black-suit-royal-ransomware
- https://www.kroll.com/en/insights/publications/cyber/royal-ransomware-deep-dive
files: []
---

GMER is an application that detects and removes rootkits. It scans for:
```
hidden processes
hidden threads
hidden modules
hidden services
hidden files
hidden disk sectors (MBR)
hidden Alternate Data Streams
hidden registry keys
drivers hooking SSDT
drivers hooking IDT
drivers hooking IRP calls
inline hooks
```

# Disable Antivirus Software

## Description
Ransomware groups used GMER to terminate or disable antivirus processes, especially during lateral movement and persistence phases. This tactic helps evade detection by bypassing security defenses that would otherwise alert to ransomware activity.

## Simulation
```
& "C:\path	o\gmer.exe" -kill "ProcessName"
```

## MITRE ATT&CK
T1562.001 - Impair Defenses: Disable or Modify Tools

## Detections
```
DeviceProcessEvents
| where FileName == "gmer.exe"
| where ActionType in ("Process Terminated", "Service Stopped", "System Modification")
| project Timestamp, DeviceName, InitiatingProcessAccountName, FileName, ActionType
```

