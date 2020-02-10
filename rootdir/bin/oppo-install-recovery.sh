#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:574ae96b000ff73a86dc76fd22a9e1717cce3b6f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:624f422241735b4b41a7c15fa934e62381a37a3c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:574ae96b000ff73a86dc76fd22a9e1717cce3b6f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
