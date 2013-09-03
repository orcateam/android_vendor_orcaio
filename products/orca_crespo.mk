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
ifeq (orca_crespo,$(TARGET_PRODUCT))

# Define ORCA bootanimation size
ORCA_BOOTANIMATION_NAME := HDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= true

# Include Orca common configuration
include vendor/orca/config/orca_common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/crespo/full_crespo.mk)

# Override AOSP build properties
PRODUCT_NAME := orca_crespo
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus S
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_FINGERPRINT="google/soju/crespo:4.1.2/JZO54K/485486:user/release-keys" PRIVATE_BUILD_DESC="soju-user 4.1.2 JZO54K 485486 release-keys"

# Copy HDPI specific prebuilts
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/preferences/images/phablet.png:system/etc/paranoid/preferences/images/phablet.png \
    vendor/orca/prebuilt/preferences/images/phone.png:system/etc/paranoid/preferences/images/phone.png \
    vendor/orca/prebuilt/preferences/images/tablet.png:system/etc/paranoid/preferences/images/tablet.png \
    vendor/orca/prebuilt/preferences/images/undefined.png:system/etc/paranoid/preferences/images/undefined.png \
    vendor/orca/prebuilt/preferences/pa_hdpi/0_colors.xml:system/etc/paranoid/preferences/0_colors.xml \
    vendor/orca/prebuilt/preferences/pa_hdpi/pref_1.xml:system/etc/paranoid/preferences/pref_1.xml \
    vendor/orca/prebuilt/preferences/pa_hdpi/pref_2.xml:system/etc/paranoid/preferences/pref_2.xml \
    vendor/orca/prebuilt/preferences/pa_hdpi/pref_3.xml:system/etc/paranoid/preferences/pref_3.xml \
    vendor/orca/prebuilt/preferences/pa_hdpi/pref_4.xml:system/etc/paranoid/preferences/pref_4.xml \
    vendor/orca/prebuilt/preferences/pa_hdpi/pref_5.xml:system/etc/paranoid/preferences/pref_5.xml

# Include Orca repos configuration
include vendor/orca/config/orca_addons.mk

endif
