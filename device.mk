#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/$(PRODUCT_DEVICE)/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/$(PRODUCT_DEVICE)/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/$(PRODUCT_DEVICE)/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/$(PRODUCT_DEVICE)/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/$(PRODUCT_DEVICE)/com.android.nfc_extras.xml

# Overlay
PRODUCT_PACKAGES += \
    FrameworksResOverlayAres \
    SystemUIOverlayAres \

PRODUCT_PACKAGES += \
    LineageSDKOverlayAres \

PRODUCT_ENFORCE_RRO_TARGETS := *

# Device parts app (triggers, RGB LED, vibration strength)
PRODUCT_PACKAGES += \
    AresParts

# Neutralize the raw KEY_F1..F6 the xm_gamekey evdev device emits on
# slider/trigger events; AresParts consumes /dev/gamekey directly, so
# nothing should see these as function keys.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/xm_gamekey.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/xm_gamekey.kl

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_VENDOR)/)

# Rootdir
PRODUCT_PACKAGES += \
    init.ares.rc \
    init.project.rc

# Inherit from mt6893-common
$(call inherit-product, device/xiaomi/mt6893-common/mt6893.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/ares/ares-vendor.mk)
