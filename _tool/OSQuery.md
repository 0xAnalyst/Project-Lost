---
title: OSQuery
tags:
- Enum
- Exec
references: 
- https://osquery.readthedocs.io/en/latest/
files: [ 'osqueryi']
---

osquery is an operating system instrumentation framework for Windows, OS X (macOS), and Linux. The tools make low-level operating system analytics and monitoring both performant and intuitive..

**Enumerate users**

```
osqueryi --json "SELECT username, description, sid, directory FROM users;"
```

**Enumerate System Information**

```osqueryi --json "
SELECT 'os_version' AS category, * FROM os_version
UNION ALL
SELECT 'cpu_info' AS category, * FROM cpu_info
UNION ALL
SELECT 'memory_info' AS category, * FROM memory_info
UNION ALL
SELECT 'block_devices' AS category, * FROM block_devices
UNION ALL
SELECT 'interface_details' AS category, * FROM interface_details
UNION ALL
SELECT 'processes' AS category, pid AS id, name, path FROM processes LIMIT 5
UNION ALL
SELECT 'logged_in_users' AS category, * FROM logged_in_users
UNION ALL
SELECT 'packages' AS category, * FROM packages LIMIT 5
UNION ALL
SELECT 'uptime' AS category, * FROM uptime
UNION ALL
SELECT 'system_info' AS category, hostname, cpu_brand, physical_memory FROM system_info;
"
```
