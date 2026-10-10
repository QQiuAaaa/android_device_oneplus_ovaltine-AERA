#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
# ---------------------------------------------------------------------
# 	AERA Recovery Project device tree configuration entry for OnePlus
# 	ovaltine (OnePlus Ace Pro), AERA Recovery R1.0.
#
# 	This file uses the public AERA_* configuration namespace only.
# 	Legacy backend names remain internal compatibility interfaces for
# 	inherited recovery code; the AERA vendor recovery build imports the
# 	translation bridge automatically, so no additional compatibility
# 	makefile is required.
#
# 	Build: lunch twrp_ovaltine-bp2a-eng
# 	       mka adbd recoveryimage
# 	Artifacts: out/target/product/ovaltine/AERA-R1.0-ovaltine-<date>.img
#
# 	Inherited from the OrangeFox Recovery Project tree; original
# 	copyright and license notices are preserved below per the AERA
# 	contribution policy ("Preserve original authorship when importing
# 	or adapting changes").
# ---------------------------------------------------------------------

# AERA settings
AERA_HIDE_NOTCH := 1
AERA_USE_GREEN_LED := 0
AERA_FLASHLIGHT_ENABLE := 1
AERA_ALLOW_DISABLE_NAVBAR := 0
AERA_QUICK_BACKUP_LIST := /data;/boot;
AERA_SKIP_MULTIUSER_FOLDERS_BACKUP := 1
AERA_ENABLE_USB_STORAGE := 1
AERA_IGNORE_LOGICAL_MOUNT_ERRORS := 1
AERA_BIND_MOUNT_SDCARD_ON_FORMAT := 1
AERA_FORCE_CASEFOLDING := 1
AERA_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
AERA_RECOVERY_AB_FULL_REFLASH_RAMDISK := 1

# AERA GUI settings
AERA_SCREEN_H := 2412
AERA_STATUS_H := 130
AERA_STATUS_INDENT_LEFT := 48
AERA_STATUS_INDENT_RIGHT := 48
AERA_HIDE_NOTCH := 1
AERA_CLOCK_POS := 1
AERA_OPTIONS_LIST_NUM := 9

# Recovery additional features	
AERA_ENABLE_ALL_PARTITION_TOOLS := 1

AERA_DISABLE_OTA_MENU := 1

# Wi-Fi (ported from OnePlus 12 waffle AERA tree, adapted to Ace Pro QCA6490)
AERA_ENABLE_WLAN := 1

# ----- data format stuff -----
# ensure that /sdcard is bind-unmounted before f2fs data repair or format
AERA_UNBIND_SDCARD_F2FS := 1
AERA_WIPE_METADATA_AFTER_DATAFORMAT := 1

# Compression / FRP (aligned with waffle AERA device tree)
AERA_USE_LZ4_COMPRESSION := 1
AERA_ENABLE_FRP_ADDON := 1


# OTA
AERA_NO_TREBLE_COMPATIBILITY_CHECK := 1

# AERA Localization Settings
AERA_MAINTAINER=秋詞
AERA_DEFAULT_TIMEZONE := CST-8

# Dynamic Partition Assist Options
AERA_USE_DMSETUP := 1

AERA_FORCE_DATA_FORMAT_F2FS := 1

AERA_USE_LOCKSCREEN_BUTTON := 1
