#
# Copyright (C) 2015 The AOSParadox Project
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
$(call inherit-product-if-exists, vendor/yu/jalebi/jalebi-vendor.mk)
$(call inherit-product-if-exists, vendor/camera/camera.mk)
$(call inherit-product-if-exists, vendor/volte/volte.mk)
$(call inherit-product-if-exists, vendor/volte/jalebi/jalebi-vendor.mk)

# Gapps
$(call inherit-product-if-exists, vendor/google/build/opengapps-packages.mk)
GAPPS_VARIANT := nano
GAPPS_FORCE_MATCHING_DPI := true

# OpenGLES
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/jalebi/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/jalebi/prebuilt/system,system)

# CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch=LA.BR.1.2.6-03110-8x16.0

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aosparadox/bootanimation/720p_PNG_bootanimation.zip:system/media/bootanimation.zip

# CodeAurora msm8916_64 Tree
include device/qcom/msm8916_32/msm8916_32.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/yu/jalebi/overlay
PRODUCT_PACKAGE_OVERLAYS += device/yu/jalebi/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# System property
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Camera
PRODUCT_PACKAGES += \
    libmm-qcamera

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.usb.id.midi=90BA \
    ro.usb.id.midi_adb=90BB \
    ro.usb.id.mtp=300B \
    ro.usb.id.mtp_adb=300C \
    ro.usb.id.ptp=300D \
    ro.usb.id.ptp_adb=300E \
    ro.usb.id.ums=300F \
    ro.usb.id.ums_adb=3010 \
    ro.usb.vid=2a96

# CNE
PRODUCT_PROPERTY_OVERRIDES += \
    persist.cne.feature=1

# Dalvik Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_large_cache_height=2048 \
    dalvik.vm.heapstartsize=14m \
    dalvik.vm.heapgrowthlimit=128m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=6m \
    dalvik.vm.heapmaxfree=8m

# Display
PRODUCT_PACKAGES += \
    libjni_livedisplay_qdcm \
    pp_calib_data_nt35521_dijing_4p7inch_hd_video_panel.xml \
    svi_config.xml

# Doze mode
PRODUCT_PACKAGES += \
    YUDoze

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.location \
    ro.gps.agps_provider=1

# IO Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=bfq

# IMS
PRODUCT_PACKAGES += \
    IMSEnabler \
    ims \
    imscmlibrary

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916 \
    keystore.qcom

# Keylayout
PRODUCT_COPY_FILES += \
    device/yu/jalebi/keylayout/goodix.kl:system/usr/keylayout/goodix.kl

# Misc
PRODUCT_PACKAGES += \
    libtinyxml

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8916 \
    power.qcom

# Sensor HAL
PRODUCT_PACKAGES += \
    sensors.msm8916

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    libwcnss_qmi \
    wcnss_service
