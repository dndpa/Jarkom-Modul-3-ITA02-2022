echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get install isc-dhcp-server -y

cat dhcpd.conf > /etc/dhcp/dhcpd.conf
cat isc-dhcp-server > /etc/default/isc-dhcp-server

service isc-dhcp-server restart