---
title: OSQuery
tags:
- Discovery
references: 
- https://osquery.readthedocs.io/en/latest/
files: [ 'osqueryi']
---

osquery is an operating system instrumentation framework for Windows, OS X (macOS), and Linux. The tools make low-level operating system analytics and monitoring both performant and intuitive..

# Enumerate users

## Description

Osquery can be leveraged to query details about local accounts on a system (retrieving usernames, descriptions, security identifiers (SIDs), etc.)

## Simulation
```
osqueryi --json "SELECT username, description, sid, directory FROM users;"
```
## MITRE ATT&CK

T1033 - System Owner/User Discovery

## Detections



# Enumerate System Information
## Description

Osquery can be leveraged to gather comprehensive information about a system such as OS verion, CPU and memory details, network interfaces, process, logged-in users and so on.

## Simulation
```
osqueryi --json "
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
## MITRE ATT&CK

T1082 - System Information Discovery
T1016 - System Network Configuration Discovery
T1057 - Process Discovery

## Detections

