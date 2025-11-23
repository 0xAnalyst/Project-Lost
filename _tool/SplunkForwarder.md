---
title: Splunk Universal Forwarder
tags:
  - Defense Evasion
  - Execution
references:
  - https://docs.splunk.com/Documentation/Forwarder
files: []
---

Splunk UF collects logs. Attackers push malicious Splunk apps to all endpoints.

# Malicious Splunk App Deployment

## Description
Attackers create Splunk apps containing malicious PowerShell and deploy them via deployment server.

## Simulation
```
```

## MITRE ATT&CK
T1059 – Execution

## Detections
```
DeviceProcessEvents
| where ProcessCommandLine has "splunkd"
```
