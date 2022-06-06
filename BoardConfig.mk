USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/kylepro/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := hawaii
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := hawaii

# Assert
TARGET_OTA_ASSERT_DEVICE := kylepro,S7580,GT-S7580,hawaii

# Kernel
BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_PREBUILT_KERNEL := device/samsung/kylepro/prebuilt/zImage

# Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE 	   := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 9191424
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1210769408
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2373976064
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE 			   := 4096

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kylepro/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/kylepro/bluetooth/libbt_vndcfg.txt

# Connectivity - Wi-Fi
BOARD_HAVE_SAMSUNG_WIFI             := true
WPA_BUILD_SUPPLICANT 				:= true
BOARD_WPA_SUPPLICANT_DRIVER         := NL80211
WPA_SUPPLICANT_VERSION      		:= VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 	:= lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        		:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB   		:= lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           		:= bcmdhd
BOARD_WLAN_DEVICE_REV       		:= bcm4330_b1
WIFI_DRIVER_FW_PATH_PARAM   		:= "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     		:= "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      		:= "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH     		:= "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     		:= "dhd"
WIFI_DRIVER_MODULE_ARG      		:= "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   		:= "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   		:= 802_11_ABG

# Wi-Fi Tethering
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_NO_APSME_ATTR := true

# Resolution
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 800
DEVICE_RESOLUTION := 480x800

# Hardware rendering
BOARD_EGL_CFG := device/samsung/kylepro/configs/egl.cfg
BOARD_USES_HWCOMPOSER := true
USE_OPENGL_RENDERER := true
BOARD_USES_SKTEXTBOX := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_USES_ION := true
HWUI_COMPILE_FOR_PERF := true
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DHAWAII_HWC -DMR0_CAMERA_BLOB

# Opengl
BOARD_USES_HWCOMPOSER := true
BOARD_USE_BGRA_8888 := true

# Audio
BOARD_USES_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DSAMSUNG_BCM_AUDIO_BLOB

# Optimisations
TARGET_USE_SCORPIAN_BIONIC_OPTIMIZATION := true
TARGET_CORTEX_CACHE_LINE_32 := true
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

MALLOC_IMPL := jemalloc

#FM-Radio --- we disable it for now
#BOARD_HAVE_FM_RADIO := true
#BOARD_FM_DEVICE := bcm4329

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Charger
BOARD_BATTERY_DEVICE_NAME                   := battery
BOARD_CHARGER_ENABLE_SUSPEND                := true
BOARD_CHARGER_SHOW_PERCENTAGE               := true
BOARD_CHARGING_MODE_BOOTING_LPM             := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH                       := "/sys/class/power_supply/battery/batt_lp_charging"
BACKLIGHT_PATH                              := "/sys/class/backlight/panel/brightness"

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd-kylepro.hawaii

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/kylepro/ril/

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/kylepro/ramdisk/recovery/recovery.fstab
TARGET_RECOVERY_INITRC := device/samsung/kylepro/ramdisk/recovery/init.rc
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_USES_MMCUTILS := false
BOARD_RECOVERY_ALWAYS_WIPES := false
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/kylepro/ramdisk/recovery/recovery_keys.c
BOARD_HDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_10x18.h>"

# TWRP
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
#TW_BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/kylevess/ramdisk/recovery/graphics.c
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := false
TW_NO_REBOOT_BOOTLOADER := true
TW_INTERNAL_STORAGE_PATH := "/storage/sdcard0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard0"
TW_EXTERNAL_STORAGE_PATH := "/storage/sdcard1"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_INCLUDE_INJECTTWRP := true
TWRP_EVENT_LOGGING := false

# Vold
BOARD_UMS_LUNFILE                           := /sys/class/android_usb/f_mass_storage/lun/file
TARGET_USE_CUSTOM_LUN_FILE_PATH             := /sys/class/android_usb/android0/f_mass_storage/lun/file
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR            := true
BOARD_VOLD_MAX_PARTITIONS                   := 19

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/

# GPS
TARGET_SPECIFIC_HEADER_PATH := device/samsung/kylevess/include
