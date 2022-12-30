  $date= Get-Date -UFormat "%d-%m-%Y-%Hh-%Mm-%Ss"
    Get-WinEvent -FilterHashtable @{Logname='Security';ID=4723,4724,4625,4720,4726,4722,4725,4738,4740,4767}| Select-Object ID,@{l='Category';e={Switch($_.ID){
    "4723" {"Password change"}
    "4724" {"Password reset"}
    "4625" {"Failed Logon because of bad password"}
    "4720" {"User account creation"}
    "4726" {"User account deleted"}
    "4722" {"User account enabled"}
    "4725" {"User account disabled"}
    "4738" {"User account changed"}
    "4740" {"User account was locked out"}
    "4724" {"User account was unlocked"}
  }
}},@{label='Time Created';expression={$_.TimeCreated.ToString("d-M-yyyy HH:mm:ss")}},Message |Export-CSV "C:\audit\EventLogs-$Env:ComputerName-$date.csv" -Encoding UTF8
