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

# SELinux
BOARD_SEPOLICY_DIRS += \
       device/fraunhofer/trustme_generic/sepolicy

# The list below is order dependent
BOARD_SEPOLICY_UNION += \
      file.te \
      gpsd.te \
      init.te \
      healthd.te \
      mpdecision.te \
      platform_app.te \
      radio.te \
      rild.te \
      sdcardd.te \
      sensors.te \
      svc.te \
      system_app.te \
      system_server.te \
      ueventd.te \
      untrusted_app.te \
      wpa.te \
      zygote.te \
      file_contexts \
      fs_use
