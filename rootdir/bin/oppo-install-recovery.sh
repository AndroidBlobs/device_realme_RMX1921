#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:52ccdc433d8936e3be26f4bfa47d6315e470f979; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:974ad870a2d246494c70e5f45c85d09256bf7635 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:52ccdc433d8936e3be26f4bfa47d6315e470f979 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
