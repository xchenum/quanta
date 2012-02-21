tar zxvf ixgbe-3.7.17.tar.gz
cd ixgbe-3.7.17/src
apt-get install build-essential lldpd
make install
rmmod ixgbe
modprobe ixgbe
cd ../..
cat bond0.conf >> /etc/network/interfaces

ifconfig eth2 0.0.0.0 up
ifconfig eth3 0.0.0.0 up
ifup bond0

echo "$1" > /etc/hostname
cat hosts > /etc/hosts

echo "auto bond0.4051" >> /etc/network/interfaces
echo "iface bond0.4051 inet static" >> /etc/network/interfaces
echo "  address $2" >> /etc/network/interfaces
echo "  netmask 255.255.255.0" >> /etc/network/interfaces
echo "  vlan_raw_device bond0" >> /etc/network/interfaces



