# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from S4 common
-include device/htc/s4-common/BoardConfigCommon.mk

# Require bootloader version
ifeq ($(TARGET_DEVICE),villedm)
TARGET_BOARD_INFO_FILE ?= device/htc/ville/board-info-villedm.txt
else
TARGET_BOARD_INFO_FILE ?= device/htc/ville/board-info-ville.txt
endif

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ville

# Kernel
TARGET_KERNEL_CONFIG := ville_defconfig

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/ville/bluetooth

# Use libril in the device tree
BOARD_PROVIDES_LIBRIL := true
BOARD_RIL_FIVE_SEARCH_RESPONSES := true

ifneq ($(TARGET_DEVICE),villedm)
# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
endif

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1744829440
ifeq ($(TARGET_DEVICE),villedm)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13153337344
else
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2550136320
endif
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_MAX_PARTITIONS := 36

# Recovery
ifeq ($(TARGET_DEVICE),villedm)
TARGET_RECOVERY_FSTAB := device/htc/ville/rootdir/etc/fstab.qcom.villedm
else
TARGET_RECOVERY_FSTAB := device/htc/ville/rootdir/etc/fstab.qcom.ville
endif
