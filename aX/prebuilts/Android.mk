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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE		 := ChromePublic
LOCAL_OVERRIDES_PACKAGES := Browser Browser2 QuickSearchBox
LOCAL_MODULE_TAGS	 := optional
LOCAL_BUILT_MODULE_STEM  := package.apk
LOCAL_MODULE_CLASS	 := APPS
LOCAL_MODULE_OWNER	 := chromium
LOCAL_SRC_FILES		 := $(LOCAL_MODULE).apk
LOCAL_REQUIRED_MODULES	 := libchrome_public libchromium_android_linker
LOCAL_CERTIFICATE	 := PRESIGNED
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		 := libchrome_public
LOCAL_SRC_FILES		 := lib/$(LOCAL_MODULE).so
LOCAL_MODULE_TAGS	 := optional
LOCAL_MODULE_SUFFIX	 := .so
LOCAL_MODULE_CLASS	 := SHARED_LIBRARIES
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE		 := libchromium_android_linker
LOCAL_SRC_FILES		 := lib/$(LOCAL_MODULE).so
LOCAL_MODULE_TAGS	 := optional
LOCAL_MODULE_SUFFIX	 := .so
LOCAL_MODULE_CLASS	 := SHARED_LIBRARIES
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE		 := FDroid
LOCAL_MODULE_TAGS	 := optional
LOCAL_BUILT_MODULE_STEM  := package.apk
LOCAL_MODULE_CLASS	 := APPS
LOCAL_MODULE_OWNER	 := fdroid
LOCAL_SRC_FILES		 := $(LOCAL_MODULE).apk
LOCAL_PRIVILEGED_MODULE  := true
LOCAL_CERTIFICATE	 := PRESIGNED
include $(BUILD_PREBUILT)
