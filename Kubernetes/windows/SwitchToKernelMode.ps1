
Stop-Service KubeProxy
Stop-Service Kubelet
get-hnsendpoints | Remove-HNSEndpoint 
Get-HNSPolicyLists | Remove-HnsPolicyList
$na = Get-NetAdapter -InterfaceIndex (Get-WmiObject win32_networkadapterconfiguration | Where-Object {$_.defaultipgateway -ne $null}).InterfaceIndex
netsh in ipv4 set int $na.ifIndex fo=dis

Echo "Modify KubeproxyStartup.ps1 to KernelMode"
pause

Start-Service KubeProxy

cmd /c C:\ctsTraffic_old.exe -listen:* -port:30275
