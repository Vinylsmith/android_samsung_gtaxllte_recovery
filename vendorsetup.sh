#
# This file is part of the OrangeFox Recovery Project
#  Copyright (C) 2021-2023 The OrangeFox Recovery Project
#
# OrangeFox is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# OrangeFox is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  This software is released under GPL version 3 or any later version.
# See <http://www.gnu.org/licenses/>.
#
#  Please maintain this if you use this script or any part of it
#
FDEVICE="gtaxllte"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
 export FOX_USE_NANO_EDITOR=1
 export FOX_ENABLE_APP_MANAGER=1
 export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
    export TW_DEFAULT_LANGUAGE="en"
 export LC_ALL="C"
  export ALLOW_MISSING_DEPENDENCIES=true
 export TARGET_DEVICE_ALT="gtaxllte"
 export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY"
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/13540000.dwmmc0/by-name/SYSTEM"
 export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
 export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
 export OF_NO_MIUI_PATCH_WARNING=1
 export FOX_USE_BASH_SHELL=1
 export FOX_ASH_IS_BASH=1
  export FOX_DRASTIC_SIZE_REDUCTION=1
  export FOX_REMOVE_AAPT=1
  export FOX_REMOVE_ZIP_BINARY=1
  export FOX_REMOVE_BASH=1
  export BUILD_2GB_VERSION=1

 # let's see what are our build VARs
 if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
      export | grep "FOX" >> $FOX_BUILD_LOG_FILE
      export | grep "OF_" >> $FOX_BUILD_LOG_FILE
       export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
      export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  fi
else
 if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
  echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
 fi
fi
#

add_lunch_combo omni_gtaxllte-eng
