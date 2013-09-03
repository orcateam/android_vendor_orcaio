# Vendor hack
#   $1 = vendor name
#   $2 = product name
define vendor-replace
  $(shell mkdir -p vendor/$(1); \
          rm -rf vendor/$(1)/$(2); \
          ln -sf ../$(1)-extra/$(2) vendor/$(1)/$(2))
endef

# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# APPS TO COPY
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/common/apk/GooManager.apk:system/app/GooManager.apk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/orca/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/orca/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# T-Mobile theme engine
include vendor/orca/config/themes_common.mk

# init.d support
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check \
    vendor/orca/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/orca/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/orca/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/orca/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/orca/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/orca/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/orca/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/orca/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/orca/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/orca/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/orca/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/orca/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/orca/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/orca/prebuilt/common/xbin/zipalign:system/xbin/zipalign

# ORCA Packages
PRODUCT_PACKAGES += \
    DashClock \
    MonthCalendarWidget \
    OrcaWallpapers \
    SunBeam

ifneq ($(ORCA_BOOTANIMATION_NAME),)
    PRODUCT_COPY_FILES += \
        vendor/orca/prebuilt/common/bootanimation/$(ORCA_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip
else
    PRODUCT_COPY_FILES += \
        vendor/orca/prebuilt/common/bootanimation/XHDPI.zip:system/media/bootanimation.zip
endif

# PAC Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/orca/overlay/orca/common

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/orca/overlay/aokp/common

### PARANOID ###
# PARANOID Packages
PRODUCT_PACKAGES += \
    HALO

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

# ParanoidAndroid Proprietary
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk \
    vendor/orca/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/orca/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

# ParanoidAndroid Images
PA_IMAGE_FILES := $(wildcard vendor/pa/prebuilt/preferences/images/*.png)
PRODUCT_COPY_FILES += \
    $(foreach f,$(PA_IMAGE_FILES),$(f):system/etc/paranoid/preferences/images/$(notdir $(f)))

# ParanoidAndroid Preferences
PA_PREF_FILES := $(wildcard vendor/orca/prebuilt/pa/preferences/$(PA_CONF_SOURCE)/*.xml)
PRODUCT_COPY_FILES += \
    $(foreach f,$(PA_PREF_FILES),$(f):system/etc/paranoid/preferences/$(notdir $(f)))

BOARD := $(subst pac_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

# Add PA release version
PA_VERSION_MAJOR = 3
PA_VERSION_MINOR = 9
PA_VERSION_MAINTENANCE = 7
PA_PREF_REVISION = 1
VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := pa_$(BOARD)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

# Orca version
ORCA_VERSION_MAJOR = 3
ORCA_VERSION_MINOR = 0
ORCA_VERSION_MAINTENANCE = 4
ORCA_VERSION := $(ORCA_VERSION_MAJOR).$(ORCA_VERSION_MINOR).$(ORCA_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.orca.version=$(ORCA_VERSION) \
    ro.modversion=$(PA_VERSION) \
    ro.orcarom.version=orca_$(BOARD)_4.3-$(ORCA_VERSION)_$(shell date +%Y%m%d-%H%M%S) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.papref.revision=$(PA_PREF_REVISION) \
    ro.aokp.version=$(BOARD)_jb-mr1_milestone-2

# Disable ADB authentication and set root access to Apps and ADB
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.sys.root_access=3

# goo.im properties
ifneq ($(DEVELOPER_VERSION),true)
    PRODUCT_PROPERTY_OVERRIDES += \
      ro.goo.developerid=drewgaren \
      ro.goo.rom=Orca_Nightlies \
      ro.goo.version=$(shell date +%s)
endif