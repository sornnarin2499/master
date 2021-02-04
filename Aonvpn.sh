#!/bin/bash

sudo su
echo -e "\033[01;31mกำลังเตรียมความพร้อมก่อนติดตั้ง\033[0m"
IP=`dig TXT +short o-o.myaddr.l.google.com @ns1.google.com`
ping -c 4 ipv4.icanhazip.com
echo -e "\033[01;32mเตรียมความพร้อมเรียบร้อย....กำลังเริ่มการติดตั้ง\033[0m"
sleep 5

# clear command
clear

echo -e "\033[01;31mกำลังติดตั้ง...Squid Proxy\033[0m"
echo -e "\033[01;32mอาจใช้เวลา 1-3นาที โปรดรอสักครู่\033[0m"
# Install Squid
apt-get install squid -y 1> /dev/null 2> /dev/null
cd /etc/squid
echo "http_port 80" > squid.conf
echo "http_port 8080" >> squid.conf
echo "http_port 3128" >> squid.conf
echo "http_port 3306" >> squid.conf
echo "http_port 443" >> squid.conf
echo "visible_hostname otakumysterych.cf" >> squid.conf
echo "acl ip dstdomain $IP" >> squid.conf
echo "acl accept method GET" >> squid.conf
echo "acl accept method POST" >> squid.conf
echo "acl accept method OPTIONS" >> squid.conf
echo "acl accept method CONNECT" >> squid.conf
echo "acl accept method PUT" >> squid.conf
echo "acl HEAD method HEAD" >> squid.conf
echo "http_access allow ip" >> squid.conf
echo "http_access allow accept" >> squid.conf
echo "http_access allow HEAD" >> squid.conf
echo "http_access allow all" >> squid.conf
echo "error_directory /usr/share/squid/errors/English" >> squid.conf
echo "icon_directory /usr/share/squid/icons" >> squid.conf
wget -q https://i.imgur.com/0fOIw59.jpg -O /usr/share/squid/icons/SN.png 1> /dev/null 2> /dev/null
wget -q https://paste.ee/r/Dd9Ph -O /usr/share/squid/errors/English/ERR_INVALID_URL 1> /dev/null 2> /dev/null
service squid restart 1> /dev/null 2> /dev/null
squid -v
echo -e "\033[01;32mติดตั้ง Squid สำหรับใช้ Proxy เรียบร้อยแล้ว\033[0m"
sleep 3
clear

echo -e "\033[01;31mกำลังติดตั้ง...Pritunl\033[0m"
echo -e "\033[01;32mอาจใช้เวลา 3-5นาที โปรดรอสักครู่\033[0m"
# Install Pritunl
echo "deb http://repo.pritunl.com/stable/apt bionic main" > /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A 1> /dev/null 2> /dev/null
apt update 1> /dev/null 2> /dev/null
apt-get --assume-yes install pritunl mongodb-server 1> /dev/null 2> /dev/null
systemctl start pritunl mongodb ; sudo systemctl enable pritunl mongodb 1> /dev/null 2> /dev/null
pritunl version
echo -e "\033[01;32mติดตั้ง Pritunl สำหรับใช้ OpenVPN เรียบร้อยแล้ว\033[0m"
sleep 3
clear

echo -e "\033[01;31m หากติดตั้งไม่ได้ กรุณารีสตาร์ทเซิร์ฟเวอร์และลองใหม่อีกครั้ง\033[0m"
echo -e "\033[01;32m เข้าสู่ระบบ Pritunl ผ่าน IP หน้าเว็บ \033[0m"
echo -e "\033[01;33m Pritunl: https://$IP \033[0m"
echo -e "\033[01;34m รหัสสำหรับติดตั้ง pritunl setup-key \033[0m"
pritunl setup-key
echo -e "\033[01;34m หลังจากติดตั้งแล้วกลับมาพิมพ์ \033[0m"
echo -e "\033[01;34m pritunl default-password เพื่อรับชื่อผู้ใช้และรหัสผ่าน \033[0m"
echo -e "\033[01;35m-------------------------------------\033[0m"
echo -e "\033[01;36m--สร้างและแจกฟรี โดย Otaku Mystery--\033[0m"
echo -e "\033[01;37m=======================================
ติดตามเราได้ที่
Youtube: AONVPN403 CHANNEL
=======================================\033[0m"
