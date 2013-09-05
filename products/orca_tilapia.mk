# Check for target product
ifeq (orca_tilapia,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_tvdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orcaio/overlay/aokp/device/grouper

# Define Orca bootanimation size
ORCA_BOOTANIMATION_NAME := XHDPI

# include orcaio common configuration
include vendor/orcaio/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/asus/tilapia/cm.mk)

PRODUCT_NAME := orca_tilapia

endif
