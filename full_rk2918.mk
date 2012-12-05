# Copyright (C) 2012 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS := device/rockchip/rk2918/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/rk29xxnand_ko.ko.3.0.8+:root/rk29xxnand_ko.ko.3.0.8+ \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.trace.rc:root/init.trace.rc \
    $(LOCAL_PATH)/ramdisk/init.rk29board.rc:root/init.rk29board.rc \
    $(LOCAL_PATH)/ramdisk/init.rk29board.usb.rc:root/init.rk29board.usb.rc \
    $(LOCAL_PATH)/ramdisk/misc.img:root/misc.img \
    $(LOCAL_PATH)/ramdisk/ueventd.rk29board.rc:root/ueventd.rk29board.rc \
    $(LOCAL_PATH)/ramdisk/bcm4329_cybertan.hcd:root/bcm4329_cybertan.hcd \
    $(LOCAL_PATH)/ramdisk/bcm4329_samsung.hcd:root/bcm4329_samsung.hcd \
    $(LOCAL_PATH)/ramdisk/bcm4329_usi.hcd:root/bcm4329_usi.hcd \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/rk29xxnand_ko.ko.3.0.8+:recovery/root/rk29xxnand_ko.ko.3.0.8+ \
    $(LOCAL_PATH)/ramdisk/initlogo.rle:recovery/root/initlogo.rle \
    $(LOCAL_PATH)/ramdisk/init.rk29board.rc:recovery/root/init.rk29board.rc \
    $(LOCAL_PATH)/ramdisk/init.rk29board.usb.rc:recovery/root/init.rk29board.usb.rc \
    $(LOCAL_PATH)/ramdisk/misc.img:recovery/root/misc.img \
    $(LOCAL_PATH)/ramdisk/ueventd.rk29board.rc:recovery/root/ueventd.rk29board.rc


# Prebuilt configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/call-pppd:system/etc/ppp/call-pppd \
    $(LOCAL_PATH)/configs/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/configs/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/rk29-keypad.kl:/system/usr/keylayout/rk29-keypad.kl


# init.d scripts
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk2918/init.d,system/etc/init.d)

#Rktools and custom boot/recovery img
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/rockchip/rk2918/rktools,rktools) 

# Configuration files

# These are the hardware-specific feature permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
    
# OTG
PRODUCT_COPY_FILES += \
    device/rockchip/rk2918/prebuilt/usb_modeswitch:system/bin/usb_modeswitch \
    device/rockchip/rk2918/prebuilt/usb_modeswitch.sh:system/bin/usb_modeswitch.sh \
    $(call find-copy-subdir-files,*,device/rockchip/rk2918/prebuilt/usb_modeswitch.d,system/etc/usb_modeswitch.d)
# Audio
PRODUCT_COPY_FILES += \
    device/rockchip/rk2918/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/rockchip/rk2918/configs/audio_effects.conf:system/etc/audio_effects.conf

PRODUCT_PACKAGES := \
    HoloSpiralWallpaper \
    LiveWallpapersPicker \
    VisualizationWallpapers \

PRODUCT_PACKAGES += \
    Camera \

PRODUCT_PACKAGES += \
    audio.primary.default \
    audio_policy.default \
    audio.a2dp.default \
    audio.usb.default \

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory
    
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    static_busybox \

PRODUCT_PROPERTY_OVERRIDES := \
    service.adb.root=1 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.timezone=Europe/Madrid \
    persist.sys.language=es \
    persist.sys.country=ES \
    ro.kernel.android.checkjni=1 \
    persist.sys.ui.hw=true \
    opengl.vivante.texture=1 \
    ro.opengles.version=131072 \
    accelerometer.invert_x=1 \
    hwui.render_dirty_regions=false \
    qemu.hw.mainkeys=0 \
    ro.sf.lcd_density=120 \
    sys.hwc.compose_policy=6 \

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

#Fix for dalvik-cache
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dexopt-data-only=1

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage	

# copy the builder 
PRODUCT_COPY_FILES += \
	device/rockchip/rk2918/custom_boot.sh:custom_boot.sh

# other kernel modules not in ramdisk
PRODUCT_COPY_FILES += $(foreach module,\
	$(filter-out $(RAMDISK_MODULES),$(wildcard device/rockchip/rk2918/modules/*.ko)),\
	$(module):system/lib/modules/$(notdir $(module)))

#PRODUCT_AAPT_CONFIG := large xlarge mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0


$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product-if-exists, vendor/rockchip/rk2918/rk2918-vendor.mk)
