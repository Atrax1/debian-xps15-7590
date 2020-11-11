#!/bin/sh

dpkg --add-architecture i386
apt-get install nvidia-driver-libs:i386
apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
apt install steam
