# Check for target product
ifeq (orca_d710,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orcaio/overlay/aokp/device/d710

# Define Orca bootanimation size
ORCA_BOOTANIMATION_NAME := HDPI

# include ora common configuration
include vendor/orcaio/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/d710/cm.mk)

PRODUCT_NAME := orca_d710
DEVICE_RESOLUTION := 480x800

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/orcaio/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/orcaio/tools/addprojects.py $(PRODUCT_NAME))

endif
