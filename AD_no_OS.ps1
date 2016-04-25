# Created: 20160311
# Updated: 20160311
# Author: Diana Sefkow
# Purpose: To identify workstations with no OS specified in AD
# --------------------------------------------------------------- #


Get-ADComputer -LDAPFilter "(!OperatingSystem=*)" -Property * | Select Name,Description,OperatingSystem,OperatingSystemServicePack,@{Name="Last Logon Date";Expression={ If ($_.lastLogon) { [datetime]::FromFileTime($_.lastLogon) } Else { "None" }}},logonCount,whenCreated,whenChanged | Export-Csv C:\users\diana.sefkow\Desktop\computers-null-os.csv -NoTypeInformation -Encoding UTF8