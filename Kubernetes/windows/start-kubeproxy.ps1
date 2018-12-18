Param(
    $NetworkName = "cbr0"
)

$env:KUBE_NETWORK=$NetworkName.ToLower()
ipmo C:\k\hns.psm1 -DisableNameChecking
Get-HnsPolicyList | Remove-HnsPolicyList

c:\k\kube-proxy.exe --v=4 --proxy-mode=kernelspace --hostname-override=$(hostname) --kubeconfig=c:\k\config
