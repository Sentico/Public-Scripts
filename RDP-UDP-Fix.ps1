# Quick fix for Microsoft RDP - UDP bug
# 
# Sentico ICT Solutions
#
$KeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client"
$ValueName = "fClientDisableUDP"
$ValueData = "1"

try {
	Get-ItemProperty -Path $KeyPath -Name $ValueName -ErrorAction Stop
    Write-Host "Key gevonden - fix al doorgevoerd"
}
catch [System.Management.Automation.ItemNotFoundException] {
	Write-Host "Registry Key not found - oops..."
}
catch {
	# Found but not set
    New-ItemProperty -Path $KeyPath -Name $ValueName -Value $ValueData -PropertyType Dword -Force
}