#!/bin/bash

# Comprobamos si hay una interfaz tun0 (común para WireGuard/OpenVPN)
if ip a | grep -q 'tun0'; then
    # Si hay una conexión VPN, obtenemos la IP asignada
    vpn_ip=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    echo "%{F#32CD32} %{F-} $vpn_ip"
else
    echo "%{F#FF0000} %{F-} No VPN"
fi