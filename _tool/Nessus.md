---
title: Nessus / Tenable.sc
tags:
  - Credential Access
  - Discovery
references:
  - https://www.tenable.com/blog
files: []
---

Nessus is a vulnerability scanner. Attackers target stored scan credentials.

# Credential Theft via Scan Server

## Description
Nessus servers store privileged SSH/SMB credentials used for scans. Attackers steal them for lateral movement.

## Simulation
```
nessuscli lscreds
```

## MITRE ATT&CK
T1552 – Unsecured Credentials

## Detections
```
DeviceProcessEvents
| where FileName == "nessuscli"
```
