#!/bin/bash
# Raspberry Pwn 0.1 : A Raspberry Pi Pentesting suite by Pwnie Express
# pwnieexpress.com
# UNINSTALLER Revision 6.12.2012

echo ""

# Verify we are root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "  _____      ___  _ ___ ___   _____  _____ ___ ___ ___ ___      "
echo " | _ \ \    / / \| |_ _| __| | __\ \/ / _ \ _ \ __/ __/ __|     "
echo " |  _/\ \/\/ /| .\` || || _|  | _| >  <|  _/   / _|\__ \__ \    "
echo " |_|   \_/\_/ |_|\_|___|___| |___/_/\_\_| |_|_\___|___/___/     "
echo ""
echo "        === Raspberry Pwn Release 0.1 UNINSTALLER ===           "
echo ""
echo "----------------------------------------------------------------"
echo " This UNINSTALLER will remove the Raspberry Pwn pentesting      "
echo " software suite from your Raspberry Pi.                         "
echo ""
echo "Press ENTER to continue, CTRL+C to abort."
read INPUT
echo ""

echo "[+] Removing baseline pentesting tools/dependencies..."
aptitude -y remove telnet btscanner libnet-dns-perl hostapd nmap dsniff netcat nikto xprobe python-scapy wireshark tcpdump ettercap hping3 medusa macchanger nbtscan john ptunnel p0f ngrep tcpflow openvpn iodine httptunnel cryptcat sipsak yersinia smbclient sslsniff tcptraceroute pbnj netdiscover netmask udptunnel dnstracer sslscan medusa ipcalc dnswalk socat onesixtyone tinyproxy dmitry fcrackzip ssldump fping ike-scan gpsd darkstat swaks arping tcpreplay sipcrack proxychains proxytunnel siege sqlmap wapiti skipfish w3af libssl-dev libpcap-dev libpcre3 libpcre3-dev libnl-dev libncurses-dev subversion python-twisted-web python-pymssql

echo "[+] Removing wireless pentesting tools..."
aptitude -y remove kismet
cd src/aircrack-ng-1.1
make uninstall
cd ../..

# Remove /pentest
echo "[+] Removing /pentest..."
rm -rf /pentest

# Restore original motd
cp src/motd.tail.original /etc/motd.tail

echo ""
echo "---------------------------------------------------------------"
echo "Raspberry Pwn Release 0.1 UNINSTALLED successfully!"
echo "---------------------------------------------------------------"
echo ""
exit 1
