---
title: Carbon Black (EDR / Defense)
tags:
  - Defense Evasion
  - Execution
  - Credential Access
references:
  - https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/docs/vmware-carbon-black-edr-ultimate-guide.pdf
  - https://www.mandiant.com/resources/blog/carbon-black-response-abuse
files: []
---

Carbon Black is an enterprise EDR platform used for process monitoring, threat detection, and incident response. It is widely deployed in corporate environments and integrates tightly with endpoint telemetry.

Attackers who compromise Carbon Black servers or obtain API tokens can leverage the platform itself as a **remote execution and lateral movement tool** or disable monitoring to blind defenders.

# Abusing Carbon Black for EDR Bypass & Remote Execution

## Description

Threat actors have abused Carbon Black in multiple IR cases by:

1. **Using the Live Response feature to execute system commands** on endpoints.  
2. **Using carbonblack\_client.py or API keys** to enumerate endpoints and deploy malware.  
3. **Disabling sensors** by pushing configuration changes through the Cb server.  
4. **Killing carbonblack processes** via valid service control commands.  
5. **Tampering with watchlists** or filtering rules to hide malicious binaries.

This allows attackers to blend into legitimate SOC workflows while executing fully-authorized commands across the enterprise.

## Simulation

Example: Executing a commandline payload via Live Response API

