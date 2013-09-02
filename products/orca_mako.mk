# Check for target product
ifeq (orca_mako,$(TARGET_PRODUCT))

# Define Orca bootanimation size
ORCA_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orcaio/overlay/aokp/device/mako

# include ORCA common configuration
include vendor/orcaio/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/mako/cm.mk)

PRODUCT_NAME := orca_mako

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/orcaio/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/orcaio/tools/addprojects.py $(PRODUCT_NAME))

endif
