# Check for target product
ifeq (orca_flo,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_manta

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orcaio/overlay/aokp/common_tablet

# include ORCA common configuration
include vendor/orcaio/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/asus/flo/cm.mk)

PRODUCT_NAME := orca_flo

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/orcaio/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/orcaio/tools/addprojects.py $(PRODUCT_NAME))

endif
