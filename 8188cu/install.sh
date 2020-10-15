#!/bin/bash

kernel=4.19.97-v7+
driver=8188cu

module_bin="$driver.ko"
module_dir="/lib/modules/$kernel/kernel/drivers/net/wireless"

sudo mv $driver.conf /etc/modprobe.d/.

sudo chown root:root $module_bin
sudo chmod 644 $module_bin
echo "sudo install -p -m 644 $module_bin $module_dir"
sudo install -p -m 644 $module_bin $module_dir
echo "sudo depmod $kernel"
sudo /sbin/depmod -a $kernel
sudo modprobe $driver
sudo rm $module_bin
sudo rm -f $driver* > /dev/null 2>&1

echo
echo "Reboot to run the driver."
echo
echo "If you have already configured your wifi it should start up and connect to your"
echo "wireless network."
echo
echo "If you have not configured your wifi you will need to do that to enable the wifi."

rm -f install.sh  > /dev/null 2>&1
