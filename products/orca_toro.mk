# Check for target product
ifeq (orca_toro,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orcaio/overlay/aokp/device/tuna

# Define Orca bootanimation size
ORCA_BOOTANIMATION_NAME := XHDPI

# include orca common configuration
include vendor/orcaio/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/toro/cm.mk)

PRODUCT_NAME := orca_toro

endif
