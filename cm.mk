$(call inherit-product, device/samsung/apexqtmo/full_apexqtmo.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# TODO: FO why this seems to be the wrong version in d2tmo jb
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=apexqtmo TARGET_DEVICE=apexqtmo BUILD_FINGERPRINT="apexqtmo-user 4.0.4 IMM76D T699UVALEM release-keys" PRIVATE_BUILD_DESC="samsung/apexqtmo/apexqtmo:4.0.4/IMM76D/T699UVALEM:user/release-keys"

PRODUCT_NAME := cm_apexqtmo
PRODUCT_DEVICE := apexqtmo

