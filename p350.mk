# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/lge/p350/p350-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p350/overlay

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

#ifeq ($(TARGET_PREBUILT_KERNEL),)
#	LOCAL_KERNEL := device/lge/p350/prebuilt/zImage
#else
#	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/root/init.pecan.rc:root/init.pecan.rc \
    $(LOCAL_PATH)/prebuilt/root/ueventd.pecan.rc:root/ueventd.pecan.rc \
    $(LOCAL_PATH)/prebuilt/root/init.pecan.usb.rc:root/init.pecan.usb.rc

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/prebuilt/system/usr/touch_mcs7000.kl:system/usr/keylayout/touch_mcs7000.kl \
    $(LOCAL_PATH)/prebuilt/system/usr/keychars/touch_mcs7000.kcm.bin:system/usr/keychars/touch_mcs7000.kcm.bin \
    $(LOCAL_PATH)/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/synaptics.idc:system/usr/idc/synaptics.idc \
    $(LOCAL_PATH)/prebuilt/system/usr/idc/touch_mcs7000.idc:system/usr/idc/touch_mcs7000.idc 

# Wi-Fi
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
   $(LOCAL_PATH)/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# SD Card
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Media
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
   $(LOCAL_PATH)/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
   $(LOCAL_PATH)/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
   $(LOCAL_PATH)/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
   $(LOCAL_PATH)/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \

# Post-boot script
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# Misc
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/system/etc/adreno_config.txt:system/etc/adreno_config.txt 

# Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

PRODUCT_LOCALES := en_GB

# Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Display 
PRODUCT_PACKAGES += \
   libgenlock \
   libmemalloc \
   libqdutils \
   libstagefrighthw \
   libtilerenderer \
   libopencorehw \
   hwcomposer.default \
   copybit.p350

# Audio
PRODUCT_PACKAGES += \
    audio_policy.p350 \
    audio.primary.p350 \
    audio.a2dp.default

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Apps
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    FM \
    Gallery

# Other
PRODUCT_PACKAGES += \
    librs_jni \
    lights.msm7k \
    gps.p350 \
    lgapversion

# BT startup
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/system/bin/init.qcom.bt.sh:system/bin/init.qcom.bt.sh
PRODUCT_PACKAGES += \
    hcitool \
    hciconfig \
    hwaddrs

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=p350 \
    debug.camcorder.disablemeta=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    persist.sys.strictmode.visual=false

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := p350
PRODUCT_DEVICE := p350
PRODUCT_MODEL := LG-P350
