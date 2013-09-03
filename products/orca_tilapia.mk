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
ifeq (orca_tilapia,$(TARGET_PRODUCT))

# Define ORCA bootanimation size
ORCA_BOOTANIMATION_NAME := XHDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_tvdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= true

# Include Orca common configuration
include vendor/orca/config/orca_common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/tilapia/full_tilapia.mk)

# Override AOSP build properties
PRODUCT_NAME := orca_tilapia
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nakasi BUILD_FINGERPRINT="google/nakasig/tilapia:4.3/JSS15J/737497:user/release-keys"
PRIVATE_BUILD_DESC="nakasi-user 4.3 JSS15J 737497 release-keys"

# Copy TVDPI specific prebuilts
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/preferences/images/phablet.png:system/etc/paranoid/preferences/images/phablet.png \
    vendor/orca/prebuilt/preferences/images/phone.png:system/etc/paranoid/preferences/images/phone.png \
    vendor/orca/prebuilt/preferences/images/tablet.png:system/etc/paranoid/preferences/images/tablet.png \
    vendor/orca/prebuilt/preferences/images/undefined.png:system/etc/paranoid/preferences/images/undefined.png \
    vendor/orca/prebuilt/preferences/pa_tvdpi/0_colors.xml:system/etc/paranoid/preferences/0_colors.xml \
    vendor/orca/prebuilt/preferences/pa_tvdpi/pref_1.xml:system/etc/paranoid/preferences/pref_1.xml \
    vendor/orca/prebuilt/preferences/pa_tvdpi/pref_2.xml:system/etc/paranoid/preferences/pref_2.xml \
    vendor/orca/prebuilt/preferences/pa_tvdpi/pref_3.xml:system/etc/paranoid/preferences/pref_3.xml \
    vendor/orca/prebuilt/preferences/pa_tvdpi/pref_4.xml:system/etc/paranoid/preferences/pref_4.xml \
    vendor/orca/prebuilt/preferences/pa_tvdpi/pref_5.xml:system/etc/paranoid/preferences/pref_5.xml

# Include Orca repos configuration
include vendor/orca/config/orca_addons.mk

endif
