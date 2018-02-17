#!/bin/bash

# Environment Setup

apt update

apt dist-upgrade -y

apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev repo openjdk-8-jdk 

mkdir -p /home/android/

cd /home/android/

repo init -u https://github.com/LineageOS/android.git -b cm-14.1

repo sync -j 32

# Cloning Zenfone Resources

git clone https://gitlab.com/LineageOS-Zenfone3/device_asus_14.2020.1712.85.git -b master /home/android/device/asus/Z017/
git clone https://gitlab.com/LineageOS-Zenfone3/vendor_asus_14.2020.1712.85.git -b master /home/android/vendor/asus/Z017/
git clone https://gitlab.com/LineageOS-Zenfone3/kernel_asus_14.2020.1712.85.git -b N /home/android/kernel/asus/Z017/

# Cloning Dependencies

git clone https://gitlab.com/LineageOS-Zenfone3/android_hardware_qcom_audio-caf_msm8937_asus.git /home/android/hardware/qcom/audio-caf/msm8937/legacy
git clone https://gitlab.com/LineageOS-Zenfone3/android_hardware_qcom_audio-caf_msm8996_asus.git /home/android/hardware/qcom/audio-caf/msm8996/legacy
git clone https://github.com/LineageOS/android_packages_resources_devicesettings.git /home/android/packages/resources/devicesettings


# Fixing FM
rm -Rf /home/android/vendor/qcom/opensource/fm
#git clone https://github.com/LineageOS/android_hardware_qcom_fm.git /home/android/vendor/qcom/opensource/fm