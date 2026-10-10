#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2024 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure virtual_ab compression.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Configure twrp common.mk
$(call inherit-product, vendor/twrp/config/common.mk)

# Configure full_base_telephony.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)


# Inherit from ovaltine device
$(call inherit-product, device/oneplus/ovaltine/device.mk)

PRODUCT_DEVICE := ovaltine
PRODUCT_NAME := twrp_ovaltine
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus Ace Pro
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oplus

# Theme
AERA_STATUS_ICONS_ALIGN := center

# ---------------------------------------------------------------------
# AERA Recovery R1.0 build entry (lunch target)
#
#   source build/envsetup.sh
#   lunch twrp_ovaltine-bp2a-eng
#   mka adbd recoveryimage
#
# Artifacts are written to out/target/product/ovaltine/ and use the
# AERA-R1.0-... filename prefix (e.g. AERA-R1.0-ovaltine-20261010.img).
#
# Inherited from the OrangeFox Recovery Project tree; original copyright
# and license notices are preserved above.
# ---------------------------------------------------------------------
