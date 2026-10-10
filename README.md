# AERA Recovery Project device tree for OnePlus Ace Pro

**Device codename:** ovaltine  
**Platform:** Qualcomm SM8475 (taro)  
**Recovery partition limit:** 100 MiB  

This tree preserves the history of the original OrangeFox device tree while
carrying the OnePlus Ace Pro integration for AERA Recovery Project R1.0.

## Hardware support

- Display and touch (1080 x 2412, 420 dpi, 120 Hz)
- File-based encryption (QCOM FBE, fscrypt v2 / inlinecrypt / wrappedkey)
- A/B flashing, backup/restore, ADB, MTP, and fastbootd
- Wi-Fi (Qualcomm QCA6490)
- Haptics and flashlight
- KernelSU, KernelSU Next, and SukiSU support
- Qualcomm AGM/PAL audio using the installed Ace Pro stock partitions (audio/ bridge)
- USB gadget (ADB / MTP / MSC)

## Build

```bash
source build/envsetup.sh
lunch twrp_ovaltine-bp2a-eng
mka adbd recoveryimage
```

Artifacts are written to `out/target/product/ovaltine/` and use the
`AERA-R1.0-...` filename prefix (e.g. `AERA-R1.0-ovaltine-20261010.img`).

## Local manifest

Device trees are not synced by the common AERA manifest. Add this repository
as a local manifest instead (aera.xml):

```xml
<project path="device/oneplus/ovaltine"
         name="android_device_oneplus_ovaltine-AERA"
         remote="AERA"
         revision="aera-16.0"/>
```

## Repository structure

- `Android.bp` / `Android.mk` / `AndroidProducts.mk` / `BoardConfig.mk` / `device.mk` / `system.prop` / `vendorsetup.sh`
- `twrp_ovaltine.mk` — lunch entry (`twrp_ovaltine-bp2a-eng`)
- `aera_ovaltine.mk` — AERA configuration entry, public `AERA_*` namespace only
- `recovery/root/` — recovery ramdisk
- `audio/` — AERA audio service
- `.github/workflows/` — AERA automated build workflows

## Notes

- Maintainer: 秋詞 (inherited from the original OrangeFox tree; original
  authorship is preserved per the AERA contribution policy "Preserve original
  authorship when importing or adapting changes").
- The `gpu/` directory is intentionally not included: Adreno recovery
  rendering firmware must be extracted from the matching OnePlus Ace Pro
  stock OTA and must not be reused from another platform.
- The tree keeps the A12-era vendor layout (VNDK 31) matching the stock Ace
  Pro images; deeper Android 16 integration should be validated by an actual
  build against the AERA Android 16 manifest.
- AERA-Recovery org access requires an SSH key registered with GitHub; the
  CI workflows expect a deploy key in the `AERA_SSH_KEY` repository secret.

## Disclaimer

本设备树仅供个人学习与适配研究使用，刷机有风险，请自行承担。
