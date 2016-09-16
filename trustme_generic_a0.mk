#
# This file is part of trust|me
# Copyright(c) 2013 - 2017 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from those products. Most specific first.
$(call inherit-product, device/fraunhofer/trustme_generic/a0/full_base_telephony.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

#----------------------------------------------------------------------------#
# missing stuff from generic_no_telephony.mk
#----------------------------------------------------------------------------#
PRODUCT_PACKAGES += \
    OneTimeInitializer \
    Provision \
    SystemUI
#----------------------------------------------------------------------------#


#----------------------------------------------------------------------------#
# missing stuff from core.mk
#----------------------------------------------------------------------------#
PRODUCT_PACKAGES += \
    DownloadProvider \
    ExternalStorageProvider \
    KeyChain \
    Keyguard \
    LatinIME \
    Launcher2 \
    Settings \
    Telecom \
    TeleService \
    VpnDialogs
#----------------------------------------------------------------------------#

#$(call inherit-product, device/fraunhofer/trustme_generic/a0/core_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_base.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/core_tiny.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/dancing-script/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/carrois-gothic-sc/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/coming-soon/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/cutive-mono/fonts.mk)
$(call inherit-product-if-exists, external/lohit-fonts/fonts.mk)
$(call inherit-product-if-exists, external/noto-fonts/fonts.mk)
$(call inherit-product-if-exists, external/naver-fonts/fonts.mk)

$(call inherit-product-if-exists, external/hyphenation-patterns/patterns.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage6.mk)


##----------------------------------------------------------------------------#
## override with values of core_minimal.mk (hammerhead needs ethernet)
##----------------------------------------------------------------------------#
#PRODUCT_PACKAGES += \
#    PackageInstaller \
#    ethernet-service
#
## The order of PRODUCT_SYSTEM_SERVER_JARS matters.
#PRODUCT_SYSTEM_SERVER_JARS := \
#    services \
#    ethernet-service \
#    wifi-service
#
#PRODUCT_COPY_FILES += \
#    system/core/rootdir/etc/public.libraries.android.txt:system/etc/public.libraries.txt
##----------------------------------------------------------------------------#


#----------------------------------------------------------------------------#
# override isome values of device/lge/hammerhead/device.mk
#----------------------------------------------------------------------------#
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=false
#----------------------------------------------------------------------------#

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

OUT_DIR := out-a0

##################################################
# Configure Android0

TRUSTME_A0 := true

DEVICE_PACKAGE_OVERLAYS += device/fraunhofer/trustme_generic/a0/overlay

PRODUCT_PACKAGES += \
   TrustmeService \
   rilproxy \
   rild \
   sensors-client.default \
   perf \
   sensors-server \
   gps-server \
   power-proxy \
   wpad \
   resolv_sync \
   TrustmeKeyguard

PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/a0/trustme-bootanimation-1080.zip:system/media/bootanimation.zip \
    device/fraunhofer/trustme_generic/a0/dnsmasq.conf:system/etc/dnsmasq.conf \

# Overwrite disabled functions with empty xmls
PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.nfc.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.location.gps.xml

# Copy trustme specific handheld_core_hardware.xml (e.g., removed camera and bluetooth)
PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/handheld_core_hardware.xml \
    device/fraunhofer/trustme_generic/trustme_generic_hardware.xml:system/etc/permissions/trustme_generic_hardware.xml

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    trustme/build/device_provisioning/test_certificates/dev.user.adbkey.pub:root/adb_keys
endif
