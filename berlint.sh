apt-get update
apt-get install squid -y

cat squid.conf > /etc/squid/squid.conf
cp acl.conf /etc/squid/acl.conf
cp allowed_doms.acl /etc/squid/allowed_doms.acl

service squid restart