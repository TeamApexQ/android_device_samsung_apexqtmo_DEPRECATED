#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/apexqtmo/overlay

## blobs
$(call inherit-product, vendor/samsung/apexqtmo/apexqtmo-vendor.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Audio configuration
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/samsung/apexqtmo/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/apexqtmo/audio/audio_effects.conf:system/etc/audio_effects.conf

# Hardware keyboard
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/keyboard/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl \
    device/samsung/apexqtmo/keyboard/sec_keypad.kcm:system/usr/keychars/sec_keypad.kcm \
    device/samsung/apexqtmo/keyboard/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Overwrite msm8960-common media profiles
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/configs/media_profiles.xml:system/etc/media_profiles.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/samsung/apexqtmo/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/apexqtmo/rootdir/fstab.qcom:root/fstab.qcom \
    device/samsung/apexqtmo/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/samsung/apexqtmo/rootdir/init.target.rc:root/init.target.rc \
    device/samsung/apexqtmo/rootdir/initlogo.rle:root/initlogo.rle


# Bluetooth
PRODUCT_PACKAGES += \
    hci_qcomm_init
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/configs/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Torch
PRODUCT_PACKAGES += Torch

# Vold configuration
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/vold.fstab:system/etc/vold.fstab

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Lights
PRODUCT_PACKAGES += lights.msm8960

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# QRNGD
PRODUCT_PACKAGES += qrngd

#common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    persist.radio.add_power_save=1 \
    persist.radio.snapshot_disabled=1 \
    com.qc.hardware=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.gps.qmienabled=true \
    ro.telephony.call_ring.multiple=0 \
    ro.sf.lcd_density=240 \
    ro.ril.transmitpower=true \
    ro.opengles.version=131072 \
    persist.audio.handset.mic=analog\
    persist.timed.enable=true \
    ro.emmc.sdcard.partition=17 \
    ro.use_data_netmgrd=true \
    persist.data_netmgrd_nint=16 \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM \
    ro.config.svlte1x=true \
    persist.radio.no_wait_for_card=1 \
    keyguard.no_require_sim=true \
    media.aac_51_output_enabled=true

# common msm8960
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

