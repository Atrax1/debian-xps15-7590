# Introduction

This repo intend to share my config for a Dell XPS 15 (7590) laptop with debian distro and give scripts and hints on how set it up.
I use KDE and i3 as well but you can choose your own desktop environment on top of it
Use it at your own risk but at least it works for me like a charm. 

My config currently looks like that : 

![config](kde-i3.png#center)

# Usb drive and debian installation

## Preparation

Download Debian Net Install iso at 

[Index of /debian-cd/current/amd64/iso-cd](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

Install Rufus to create your bootable usb drive at 

[Rufus](https://rufus.ie/)

## Rufus

Start Rufus and choose the following parameters : 

- Device : your usb drive
- Boot selection : your iso
- Partition scheme : GPT
- Target System : UEFI

then click START

## Bios Setting

Plug your usb drive

Press F2 at boot time when Dell logo pops

Enter settings and go to System Configuration > Sata Operation then change from RAID On to AHCI

Go to General > Boot Sequence and click Add Boot Option Add your usb drive with usb name and click on it. 

Apply & Exit

## Debian install

Choose Graphical Install

Fill your information

Then create your partition on the laptop SSD drive that you freed when shrinking it

When you see UEFI force option select Yes

Choose your graphical interface, I personally like KDE but you can choose Gnome

Finish install then reboot

# My Model ?

```
> sudo dmidecode | grep -A3 '^System Information'
System Information
	Manufacturer: Dell Inc.
	Product Name: XPS 15 7590
	Version: Not Specified
```

## GPU

```
> lspci | egrep 'VGA|3D'                         
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 630 (Mobile)
01:00.0 3D controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Mobile / Max-Q] (rev a1)
```

# My distro ?

Debian 11 testing bullseye

```
> cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux bullseye/sid"
NAME="Debian GNU/Linux"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

```
## Sources ?

> cat /etc/apt/sources.list 
deb http://deb.debian.org/debian buster main contrib non-free
deb-src http://deb.debian.org/debian buster main contrib non-free

deb http://deb.debian.org/debian-security/ buster/updates main contrib non-free
deb-src http://deb.debian.org/debian-security/ buster/updates main contrib non-free

deb http://deb.debian.org/debian buster-updates main
deb-src http://deb.debian.org/debian buster-updates main

deb http://deb.debian.org/debian testing main contrib non-free
```

## Kernel version ?

```
> uname -a
Linux atraxpc 5.8.0-1-amd64 #1 SMP Debian 5.8.7-1 (2020-09-05) x86_64 GNU/Linux
```

# Bumblebee

First look at this page : [Bumblebee](https://wiki.debian.org/Bumblebee)

Installation details on script bumblebee.sh

It is my config and it work for me like that it might not be the case for you, 
check script before running it there are some opiniated decisions

Result after running primusrun on glxgears

![glxgears](glxgears.png#center)  

# Steam

It is now possible to run games on linux with steam

Setup available on script steam.sh

Don't forget to add in properties of the game : 

```
primusrun %command%
```

Have fun :)

# Hybrid KDE-i3

## KDE install if not done

To install kde :

```
apt install kde-full
```

## i3 with i3 gaps (compiled)

to install i3 with KDE plasma :

```
apt install i3
cd /usr/share/xsessions
# We will be able to change from plasma to plasma-i3 at login page copy current plasma.desktop
cp plasma.desktop plasma-i3.desktop
```

And plasma-i3.desktop should looks like that : 

```
[Desktop Entry]
Type=XSession
Exec=env KDEWM=/usr/bin/i3 /usr/bin/startplasma-x11
DesktopNames=KDE i3
Name=Plasma i3
Comment=Plasma by KDE i3
X-KDE-PluginInfo-Version=5.17.5
```

to install i3-gaps follow this gist [gist](https://gist.github.com/boreycutts/6417980039760d9d9dac0dd2148d4783)

My i3 config is shared and name config at root of the repo

# Links with good content to set up your XPS

* https://github.com/delta-one/dell-xps-15-9570-debian-linux
