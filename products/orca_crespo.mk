# Check for target product
ifeq (orca_crespo,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# Define Orca bootanimation size
ORCA_BOOTANIMATION_NAME := HDPI

# include ORCA common configuration
include vendor/orca/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/crespo/cm.mk)

PRODUCT_NAME := orca_crespo

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/orcaio/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/orcaio/tools/addprojects.py $(PRODUCT_NAME))

endif
