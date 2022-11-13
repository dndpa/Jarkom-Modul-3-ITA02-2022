cat interfaces > /etc/network/interfaces
apt-get install bind9 -y

cat named.conf.options > /etc/bind/named.conf.options
cat named.conf.local > /etc/bind/named.conf.local

mkdir /etc/bind/work
cp loid-work.com /etc/bind/work/loid-work.com
cp franky-work.com /etc/bind/work/franky-work.com

service bind9 restart