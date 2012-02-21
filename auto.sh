tar zxvf ixgbe-3.7.17.tar.gz
cd ixgbe-3.7.17/src
apt-get install build-essential
make install
rmmod ixgbe
modprobe ixgbe
cd ../..
cat bond0.conf >> /etc/network/interfaces

ifconfig eth2 0.0.0.0 up
ifconfig eth3 0.0.0.0 up
ifup bond0
ifdown bond0

