#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from jalebi device
$(call inherit-product, device/yu/jalebi/device.mk)

# BSP
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/msm8916/BoardConfigVendor.mk)
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/config/device-vendor.mk)
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/config/rendering-engine.mk)
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/config/qtic-config.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := jalebi
PRODUCT_NAME := full_jalebi
PRODUCT_BRAND := YU
PRODUCT_MODEL := YU4711
PRODUCT_MANUFACTURER := YU

PRODUCT_GMS_CLIENTID_BASE := android-micromax

TARGET_VENDOR_PRODUCT_NAME := YUNIQUE
TARGET_VENDOR_DEVICE_NAME := YUNIQUE
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=YUNIQUE PRODUCT_NAME=YUNIQUE
