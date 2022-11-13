apt-get update
apt-get install lynx -y
cat interfaces > /etc/network/interfaces
export http_proxy="http://192.211.2.3:8080"
env | grep -i proxy