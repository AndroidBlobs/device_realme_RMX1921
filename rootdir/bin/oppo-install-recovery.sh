#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:fef50c827225fd7a7464c3a64eb2dfe51d8183af; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:f428fd02a9af00331524ceef0945dbc80519f4e6 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:fef50c827225fd7a7464c3a64eb2dfe51d8183af && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
