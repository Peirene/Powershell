# Created: 20160311
# Updated: 20160311
# Author: Diana Sefkow
# Purpose: To pull a report of workstations from Active Directory
# --------------------------------------------------------------- #

Get-ADComputer -Filter {OperatingSystem -NotLike "*server*"} -Property * | Select Name,Description,OperatingSystem,@{Name="Last Logon Date";Expression={ If ($_.lastLogon) { [datetime]::FromFileTime($_.lastLogon) } Else { "None" }}},logonCount,whenCreated,whenChanged | Export-Csv C:\users\diana.sefkow\Desktop\computers.csv -NoTypeInformation -Encoding UTF8