---
title: Velociraptor
tags:
  - Enum
  - Exec
references: 
- https://github.com/Velocidex/velociraptor
---

Velociraptor is a tool for collecting host based state information using The Velociraptor Query Language (VQL) queries.

**Enumerate Users**

**Execute Commands**

```velociraptor client collect --artifact "Windows.System.CmdShell" --parameters command="ipconfig" --client {client_id}```


**Execute Powershell**

```velociraptor query --artifact "Windows.Sys.AllUsers" --json```
