$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# NEEDED VENDOR BLOBS!!!
$(call inherit-product-if-exists, vendor/samsung/kylepro/kylepro-vendor.mk)

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

#Spesific device overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/kylepro/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/kylepro/ramdisk/fstab.hawaii_ss_kylepro:root/fstab.hawaii_ss_kylepro \
	device/samsung/kylepro/ramdisk/init.bcm2166x.usb.rc:root/init.bcm2166x.usb.rc \
	device/samsung/kylepro/ramdisk/init.log.rc:root/init.log.rc \
	device/samsung/kylepro/ramdisk/lpm.rc:root/lpm.rc \
	device/samsung/kylepro/ramdisk/ueventd.hawaii_ss_kylepro.rc:root/ueventd.hawaii_ss_kylepro.rc \
	device/samsung/kylepro/ramdisk/recovery/init.recovery.hawaii_ss_kylepro.rc:root/init.recovery.hawaii_ss_kylepro.rc \
	device/samsung/kylepro/ramdisk/ueventd.rc:root/ueventd.rc \
	device/samsung/kylepro/ramdisk/init.hawaii_ss_kylepro.rc:root/init.hawaii_ss_kylepro.rc 


PRODUCT_COPY_FILES += \
	device/samsung/kylepro/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/kylepro/configs/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/kylepro/configs/tinyucm.conf:system/etc/tinyucm.conf \
	device/samsung/kylepro/configs/default_gain.conf:system/etc/default_gain.conf \
	device/samsung/kylepro/configs/media_codecs.xml:system/etc/media_codecs.xml  \
	device/samsung/kylepro/configs/vold.fstab:system/etc/vold.fstab

LOCAL_PATH := device/samsung/kylepro

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \	
    $(LOCAL_PATH)/prebuilt/lib/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/blocklayoutdriver.ko:system/lib/modules/blocklayoutdriver.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    $(LOCAL_PATH)/prebuilt/lib/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
	device/samsung/kylepro/keylayouts/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
	device/samsung/kylepro/keylayouts/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
	device/samsung/kylepro/keylayouts/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	device/samsung/kylepro/keylayouts/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl

# Insecure ADBD
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	persist.sys.root_access=3 \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1


# Unsecure builds
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
    	ro.debuggable=1 \
	persist.sys.root_access=3 \
	persist.service.adb.enable=1

# Filesystem management tools
PRODUCT_PACKAGES += \
	setup_fs \
	e2fsck \
	f2fstat \
	fsck.f2fs \
	fibmap.f2fs \
	mkfs.f2fs
		
# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler \
	audio_policy.hawaii \
	audio.primary.default

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode 

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
	
# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libnetcmdiface \
    libskia_legacy

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    	wifi.interface=wlan0 \
    	mobiledata.interfaces=rmnet0,pdp0,wlan0,eth0,gprs,ppp0 \
    	rild.libpath=/system/lib/libbrcm_ril.so \
    	ro.telephony.ril_class=SamsungBCMRIL \
    	ro.zygote.disable_gl_preload=true \
    	persist.radio.multisim.config=none \
	ro.telephony.call_ring.multiple=0 \
	ro.telephony.call_ring=0
    
# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=0 \
    ro.com.google.networklocation=0 \
    ro.product.locale.language=tr \
    ro.product.locale.region=TR

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb
	
#BRCM stuff
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.brcm.log=auto \
	persist.brcm.cp_crash=auto \
	persist.brcm.ap_crash=auto \
	persist.brcm.force_ramdump=0 

# Override phone-hdpi-512-dalvik-heap to match value on stock
# - helps pass CTS com.squareup.okhttp.internal.spdy.Spdy3Test#tooLargeDataFrame)
# (property override must come before included property)
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapgrowthlimit=56m	

# Dalvik heap config
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product-if-exist, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

ifeq ($(TARGET_BUILD_VARIANT),userdebug)      
else      
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
PRODUCT_NAME := cm_kylepro
PRODUCT_DEVICE := kylepro
PRODUCT_MODEL := GT-S7580
