# Linux CTF Tools
## Instructions for Setting up Virtual Target Range
### Install ProxMox
The competition server uses proxmox.  You will need an extra device to install this on.  I would recommend having a device with as much RAM as possible.  Here are the instructions from ProxMox: https://www.proxmox.com/en/proxmox-virtual-environment/get-started
1. Download the image from here: https://www.proxmox.com/en/downloads
2. Burn the image to USB.  I usually use Rufus: https://rufus.ie/en/
2. Plug the USB into your device and and select it, as a boot image

### Set up servers
The competition uses CentOS and Rocky Linux.  The router is CentOS and the main services are typically Rocky Linux.
1. Download CentOS ISO: https://www.centos.org/download/
