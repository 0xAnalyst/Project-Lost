---
title: Splunk Universal Forwarder
tags:
  - Execution
  - Defense Evasion
references:
  - https://docs.splunk.com/Documentation/Forwarder
files: []
---

The Splunk Universal Forwarder (UF) is a lightweight agent used to forward logs to Splunk indexers and to receive configuration and app updates from a deployment server. When attackers compromise the deployment server, they can push malicious Splunk apps to all connected forwarders.

# Malicious Splunk App Deployment

## Description
A Splunk app is simply a directory structure packaged as a tar/ZIP file. Attackers can include scripts (PowerShell, Bash, Python) that run on app install or input execution, using Splunk as a stealth mass-deployment mechanism.

## Simulation
Example malicious app structure:
```text
TA_malicious/
  bin/payload.ps1
  default/inputs.conf
```

Example `inputs.conf` to launch payload:
```ini
[script://./bin/payload.ps1]
disabled = 0
interval = 3600
sourcetype = attacker:payload
```

## MITRE ATT&CK
T1059 – Command and Scripting Interpreter  
T1105 – Ingress Tool Transfer

## Detections
```kql
DeviceProcessEvents
| where FileName in~ ("splunkd.exe","splunkd")
| where ProcessCommandLine has ".ps1" or ProcessCommandLine has ".sh"
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```
