#
# Copyright 2017 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

# Building with minimal manifest
ALLOW_MISSING_DEPENDENCIES                      := true
BUILD_BROKEN_DUP_RULES                          := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES    := true

BUILD_BROKEN_NINJA_USES_ENV_VARS    += RTIC_MPGEN
BUILD_BROKEN_PLUGIN_VALIDATION      := soong-libaosprecovery_defaults soong-libguitwrp_defaults soong-libminuitwrp_defaults soong-vold_defaults

# A/B
AB_OTA_PARTITIONS := \
    boot \
    vendor_boot \
    dtbo \
    odm \
    odm_dlkm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_dlkm

# AB partitions for oplus
AB_OTA_PARTITIONS += \
    my_bigball \
    my_carrier \
    my_company \
    my_engineering \
    my_heytap \
    my_manifest \
    my_preload \
    my_product \
    my_region \
    my_stock

# SDK
BOARD_SYSTEMSDK_VERSIONS := 31

# Architecture (arm64-only; matches the waffle AERA pattern + core_64_bit_only.mk)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a-branchprot
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo385

# Platform: taro / SM8475 (Ace Pro stock ro.board.platform=taro)
# device.mk derives TARGET_BOARD_PLATFORM and QCOM_BOARD_PLATFORMS from this.
PRODUCT_PLATFORM                := taro
QCOM_BOARD_PLATFORMS            += taro

# Bootloader: a recovery device tree does not build a bootloader image.
TARGET_NO_BOOTLOADER            := true
# Kept from the legacy QCOM set (verify if the secure-world stack changes):
TARGET_USES_REMOTEPROC          := true

# Kernel/Ramdisk
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_NO_KERNEL_OVERRIDE := true

# Partition Info
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDOR_DLKMIMAGE := true
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 48318382080
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216
BOARD_DTBOIMG_PARTITION_SIZE := 0x1700000
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Dynamic/Logical Partitions
BOARD_SUPER_PARTITION_SIZE := 11274289152
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 11270094848 # BOARD_SUPER_PARTITION_SIZE - 4MB
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm \
    odm_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += my_bigball my_carrier my_company my_engineering my_heytap my_manifest my_preload my_product my_region my_stock


BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x06400000

# Workaround for error copying vendor files to recovery ramdisk
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM             := odm
TARGET_COPY_OUT_VENDOR := vendor

# Rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN

# KEYSTONE(If43215c7f384f24e7adeeabdbbb1790f174b2ec1,b/147756744)
BUILD_BROKEN_NINJA_USES_ENV_VARS += SDCLANG_AE_CONFIG SDCLANG_CONFIG SDCLANG_SA_ENABLE

BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    vendor.display.config@1.0 \
    vendor.display.config@2.0
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Encryption
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
AERA_INCLUDE_CRYPTO_FBE := true
AERA_USE_FSCRYPT_POLICY := 2
AERA_USE_DMCTL := true
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Extras
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Tool
AERA_ENABLE_ALL_PARTITION_TOOLS := true
AERA_INCLUDE_FASTBOOTD := true
AERA_INCLUDE_7ZA                := true
AERA_INCLUDE_LIBRESETPROP       := true
AERA_INCLUDE_LPDUMP             := true
AERA_INCLUDE_LPTOOLS            := true
AERA_INCLUDE_REPACKTOOLS        := true
AERA_INCLUDE_RESETPROP          := true
AERA_USE_TOOLBOX                := true
AERA_INCLUDE_ZSTD               := true

# TWRP specific build flags
AERA_DEFAULT_LANGUAGE := zh_CN
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
AERA_THEME := portrait_hdpi

TARGET_SCREEN_DENSITY := 420
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2412

# AIDL
AERA_SUPPORT_INPUT_AIDL_HAPTICS := true
AERA_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/default"
AERA_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true

AERA_STATUS_ICONS_ALIGN := center
AERA_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone39/temp"
AERA_DEFAULT_BRIGHTNESS := 1024
AERA_MAX_BRIGHTNESS := 4095
AERA_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
AERA_QCOM_ATS_OFFSET := 1666528204500
AERA_EXCLUDE_APEX := true
AERA_EXCLUDE_DEFAULT_USB_INIT := true
AERA_EXTRA_LANGUAGES := true
AERA_FRAMERATE := 120
AERA_INCLUDE_CRYPTO := true
AERA_NO_EXFAT_FUSE := true
#AERA_NO_SCREEN_BLANK := true
AERA_SCREEN_BLANK_ON_BOOT := true
AERA_INCLUDE_RESETPROP := true
AERA_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
#AERA_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
AERA_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko fts_touch_spi.ko nt36xxx-spi.ko"
AERA_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# Wi-Fi (ported from waffle AERA tree, adapted to Ace Pro / taro QCA6490):
# cnss/wlan driver stack loaded post-decrypt. Module names follow the stock
# taro vendor_dlkm (init.wlan.target.rc modprobes qca_cld3_wlan); verify
# against the installed vendor_dlkm if the ROM differs.
AERA_POST_DECRYPT_MODULES := "cnss_prealloc.ko cnss_nl.ko wlan_firmware_service.ko cnss_plat_ipc_qmi_svc.ko cnss_utils.ko cnss2.ko rfkill.ko cfg80211.ko gsim.ko rmnet_mem.ko ipam.ko qca_cld3_wlan.ko"

# TWRP Debug Flags
#TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
#TARGET_RECOVERY_DEVICE_MODULES += twrpdec
#RECOVERY_BINARY_SOURCE_FILES += $(TARGET_RECOVERY_ROOT_OUT)/sbin/twrpdec

#
# For local builds only
#
# TWRP zip installer
ifneq ($(wildcard bootable/recovery/installer/.),)
    USE_RECOVERY_INSTALLER := true
    RECOVERY_INSTALLER_PATH := bootable/recovery/installer
endif

# Custom TWRP Versioning
# See https://github.com/minimal-manifest-twrp/android_device_common_version-info for details
ifneq ($(USE_CUSTOM_VERSION),)
    ifneq ($(wildcard device/common/version-info/.),)
        # version prefix is optional - the default value is "LOCAL" if nothing is set in device tree
        CUSTOM_TWRP_VERSION_PREFIX := CPTB

        # Repo must be synced for automatic custom versioning to work
        include device/common/version-info/custom_twrp_version.mk

        ifeq ($(CUSTOM_TWRP_VERSION),)
            CUSTOM_TWRP_VERSION := $(shell date +%Y%m%d)-01
        endif
    endif
endif
#
# end local build flags
#
