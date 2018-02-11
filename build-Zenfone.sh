#!/bin/bash

# Environment Setup

apt update

apt dist-upgrade

apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev repo openjdk-8-jdk 

mkdir -p /home/android/

cd /home/android/

repo init -u https://github.com/LineageOS/android.git -b cm-14.1

repo sync -j 16

# Cloning Zenfone Resources

git clone https://gitlab.com/LineageOS-Zenfone3/device_asus_Z017.git /home/android/device/asus/Z017/
git clone https://gitlab.com/LineageOS-Zenfone3/vendor_asus_Z017.git /home/android/vendor/asus/Z017/
git clone https://gitlab.com/LineageOS-Zenfone3/kernel_asus_Z017.git /home/android/kernel/asus/Z017/

# Cloning Dependencies

git clone https://gitlab.com/LineageOS-Zenfone3/android_hardware_qcom_audio-caf_msm8937_asus.git /hardware/qcom/audio-caf/msm8937
git clone https://gitlab.com/LineageOS-Zenfone3/android_hardware_qcom_audio-caf_msm8996_asus.git /hardware/qcom/audio-caf/msm8996

# Fixing FM
rm -Rf /home/android/vendor/qcom/opensource/fm
git clone https://github.com/LineageOS/android_hardware_qcom_fm.git /home/android/vendor/qcom/opensource/fm

# Running Build
source build/envsetup.sh
breakfast Z017
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8G"
croot
make bacon



