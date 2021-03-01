# Import-FortiLog.ps1

## Description

This script converts a log with Fortigate like format to a Powershell object.

## Use

```powershell
PS> $data = ./Import-FortiLogs.ps1 -File ./example.log
PS> $data.where({$_.dstcountry -eq "China"}) | Select srcip, dstip, dstport

srcip      dstip         dstport
-----      -----         -------
10.1.1.140 112.124.0.188 15000
```

