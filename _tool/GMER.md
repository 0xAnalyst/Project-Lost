---
title: GMER
tags:
  - Defense Evasion
references: 
- https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-061a-black-suit-royal-ransomware
- https://www.kroll.com/en/insights/publications/cyber/royal-ransomware-deep-dive
files: []
---

GMER is a legitimate rootkit detection tool that has been misused by ransomware groups, including Play and BlackSuit (Royal), to disable antivirus software and other endpoint defenses, allowing attackers to evade detection and maintain control over infected systems.

# Disable Antivirus Software

## Description
Ransomware groups exploit GMER to terminate or disable antivirus processes, especially during lateral movement and persistence phases. This tactic helps evade detection by bypassing security defenses that would otherwise alert to ransomware activity.

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

