# Linux CTF Tools
## Instructions for Setting up Virtual Target Range
### Install ProxMox
The competition server uses proxmox.  You will need an extra device to install this on.  I would recommend having a device with as much RAM as possible.  Here are the instructions from ProxMox: https://www.proxmox.com/en/proxmox-virtual-environment/get-started
1. Download the image from here: https://www.proxmox.com/en/downloads
2. Burn the image to USB.  I usually use Rufus: https://rufus.ie/en/
2. Plug the USB into your device and and select it, as a boot image

### Download Necessary ISOs
The competition uses CentOS and Rocky Linux.  The router is CentOS and the main services are typically Rocky Linux.
1. Download CentOS ISO: https://www.centos.org/download/
2. Download RockyLinux ISO: https://rockylinux.org/download/
3. Upload the ISOs to the storage on PVE.  By defualt this will be named local

### Set up Network
Here are the instructions to set up the test network
1. Create the network cards.  By default you should have a physical network device named "eno1".  You should also have a Linux bridge named "vmbr0".  It is a network bridge between the virtual network and your home network.
2. Create a new linux bridge, by defualt this will be named "vmbr1".  You can leave default settings.  I gave this a CIDR range 10.10.10.0/24.
3. Create the virtual machine with the CentOS ISO. Give this ISO both vmbr0, after its created give it vmbr1 as well.
4. Create the virtual machine with RockyLinux ISO. Give this CPU type 'host' and network vmbr1.

### Set up the router
1. Set up the router to have a static IP.  Edit this file `/etc/sysconfig/network-scripts/ifcfg-<interface>`
2. Enable traffic forwarding by running this command `sudo sysctl -w net.ipv4.ip_forward=1`
3. If the router reboots, this setting will get removed.  Edit this file to set this permenently `/etc/sysctl.d/sysctl.conf`

### Set up the server
1. I use nmtui, but you can use any other network manager to set this up.  Set the Gateway as the router IP, in my setup its 10.10.10.1
2. Set the static IP.

### QA
If you have questions about this set up or something is not working, please let me know.
