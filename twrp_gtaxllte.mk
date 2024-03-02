#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_RELEASE_NAME := gtaxllte

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from twrp product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from this device
$(call inherit-product, device/samsung/gtaxllte/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gtaxllte
PRODUCT_NAME := twrp_gtaxllte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-T585
PRODUCT_MANUFACTURER := samsung
PRODUCT_GMS_CLIENTID_BASE := android-samsung
