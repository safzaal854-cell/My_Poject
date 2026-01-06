# 2026-01-06 05:28:13 by RouterOS 7.20.6
# system id = eCvD3mMwbzJ
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
/ip address
add address=192.168.56.250/24 interface=ether2 network=192.168.56.0
add address=10.10.0.1/27 comment=Hotspot interface=ether3 network=10.10.0.0
/ip dhcp-client
add interface=ether1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=reject chain=forward comment="Block The Ip" dst-address=1.1.1.1 \
    dst-port=443 log=yes protocol=tcp reject-with=icmp-admin-prohibited \
    src-address=0.0.0.0/0
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip hotspot
add disabled=no interface=ether3 name=Hotspot_
/ip service
set www-ssl disabled=no
/radius
add address=35.227.71.209 service=hotspot
add address=35.227.71.209 service=hotspot
add address=35.227.71.209 service=hotspot
