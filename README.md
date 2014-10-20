# Raspberry Pi Motion Following Camera Project #

## Overview ##
raspberrypi-motion is a project that implements a motion tracking network pan and tilt camera and takes advantage of several main pieces of software:

- RaspberryPi-Buildroot (aka the Bsquask SDK)
- motion - A software motion detector.
- raspberrypi-pwm - DMA based PWM for driving servos.

The hardware involved includes:
- Raspberry Pi B
- Raspberry Pi Camera v1.3
- Pan and Tilt Camera Mount
- 2 Micro RC Servos
- 3.3v External Power Supply

## Building ##
Clone the RaspberryPi-BuildRoot project into your local code directory:  
`git clone git@github.com:digitalpeer/raspberrypi-motion.git`
`git checkout raspberrypi-motion`

Enter the BuildRoot directory and generate a Makefile for your SDK:  
`cd raspberrypi-motion`  
`make raspberrypi-motion_defconfig`  
You may be missing some build dependancies (flex, bison, etc...) but you will be warned about what packages you need to install if this is the case. If you are using ubuntu the following command should install all needed dependancies:   
`sudo apt-get install flex bison texinfo mercurial git-core`   

Now start the build (this can take a few hours the first time).  
`make`  
*Do not use the -j option with this Makefile!  The optimum number of make jobs is determined by BuildRoot, and overriding this with the -j flag here breaks the build system.

## Using Generated Image on the Raspberry Pi ##

First you need to obtain an SD card that has the correct partitions setup.  It needs to be setup as follows:  
- 75MB fat32 partition
- 500MB or greater ext4 partition (ideally using the remainder of the card)

If you need help with this, the Raspberry Pi wiki has a [guide](http://elinux.org/RPi_Advanced_Setup#Advanced_SD_card_setup) that's pretty close (make sure to use ext4 instead of ext3).

When you have this setup, mount the the two partitions (assuming /media/BOOT for the fat32 partiion, and /media/rootfs for the ext4).  The run the following commands to install the rootfs:  
`cd images`  
`tar -zxvf boot.tar.gz -C /media/boot`  
`sudo tar -zxvf rootfs.tar.gz -C /media/rootfs`  
*Make sure you are root(sudo) when extracting rootfs.tar.gz, or you will have problems on boot*

Now place the SD card in your Raspberry Pi and power on.  If everything went as planned, you should get a login prompt for Bsquask (linux).  You can access the live video tracking stream at the IP of the RaspBerry Pi on port 8081.

### Login information:  
username: root   
password: root   
