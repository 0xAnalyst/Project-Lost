---
title: Velociraptor
tags:
  - Execution
references: 
- https://github.com/Velocidex/velociraptor
---

Velociraptor is a tool for collecting host based state information using The Velociraptor Query Language (VQL) queries.

# Enumerate Users
## Description

Velociraptor can be leveraged to collect details about all user accounts on a Windows system by querying the Windows.Sys.AllUsers artifact, returning the information in JSON format.

## Simulation
```
velociraptor query --artifact "Windows.Sys.AllUsers" --json
```
## MITRE ATT&CK



## Detections

# Execute commands
## Description

Velociraptor can be leveraged to execute commands using the Windows command shell, such as in the following example, running ipconfig.

## Simulation
```
velociraptor client collect --artifact "Windows.System.CmdShell" --parameters command="ipconfig" --client {client_id}
```

## MITRE ATT&CK

T1059.003 - Command and Scripting Interpreter: Windows Command Shell

## Detections


# Execute Powershell
## Description



## Simulation
```

```

## MITRE ATT&CK

T1059.001 - Command and Scripting Interpreter: PowerShell

## Detections

