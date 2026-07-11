#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/ares/device.mk)

# Inherit LineageOS product
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Built-in GApps (MindTheGapps, vendor/gapps @ baklava). Baked in because on a
# user build + Virtual A/B, recovery-sideloaded GApps neither prompt past
# signature verification nor persist to /product. Same rationale as chopin.
$(call inherit-product, vendor/gapps/arm64/arm64-vendor.mk)

PRODUCT_NAME := lineage_ares
PRODUCT_DEVICE := ares
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := M2012K10C

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint=Redmi/ares/ares:12/SP1A.210812.016/V14.0.5.0.TKJINXM:user/release-keys \
    DeviceProduct=ares \
    SystemName=ares

PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/lineage-priv/keys/releasekey
PRODUCT_EXTRA_RECOVERY_KEYS := vendor/lineage-priv/keys/releasekey
# The Bluetooth app is signed with our private "bluetooth" key (via the default
# cert dir above). On A16 the bluetooth SELinux domain is gated by
# seinfo=bluetooth (seapp_contexts), which requires the @BLUETOOTH mac_permissions
# cert to match the app's signer. That cert defaults to the AOSP test dir unless
# com.google.android.bt is built, so point it at our keys or BT breaks at runtime.
PRODUCT_MAINLINE_BLUETOOTH_SEPOLICY_DEV_CERTIFICATES := vendor/lineage-priv/keys
