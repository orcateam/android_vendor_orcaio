# Copyright (C) 2012 ParanoidAndroid Project
# Portions Modified By Copyright (C) 2013 The Orca Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Check for target product
ifeq (orca_mako,$(TARGET_PRODUCT))

# Define Orca bootanimation size
ORCA_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/orcaio/overlay/aokp/device/mako

# Include Orca common configuration
include vendor/orca/config/orca_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/mako/cm.mk)

# Override AOSP build properties
PRODUCT_NAME := orca_mako
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 4
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=occam BUILD_FINGERPRINT=google/occam/mako:4.3/JWR66V/737497:user/release-keys PRIVATE_BUILD_DESC="occam-user 4.3 JWR66V 737497 release-keys"


# Include Orca repos configuration
include vendor/orca/config/orca_addons.mk

endif
