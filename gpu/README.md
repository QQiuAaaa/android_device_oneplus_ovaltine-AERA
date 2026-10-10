---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: e368a43d4a043b6962c2f622747b1c93_f24a5c41c4d311f19063525400393706
    ReservedCode1: fWBmkH0lS2CHIBZW7h9GTCVBVgH3pGrmeJa5de9+TLWO8R9j1CcYuxn0pQkpIuaeESzd7OsVx+l8HwZ7ZMqCT2VQw8Ggesn8EDk0lZ/klL7Hx4bj8xZPR9C0saLtdgJmWDysJSKjW2Y69gSMvaXWYSmNTRG3N1e6o4c07o/3TngIP6t/KsjDvDCd9ns=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: e368a43d4a043b6962c2f622747b1c93_f24a5c41c4d311f19063525400393706
    ReservedCode2: fWBmkH0lS2CHIBZW7h9GTCVBVgH3pGrmeJa5de9+TLWO8R9j1CcYuxn0pQkpIuaeESzd7OsVx+l8HwZ7ZMqCT2VQw8Ggesn8EDk0lZ/klL7Hx4bj8xZPR9C0saLtdgJmWDysJSKjW2Y69gSMvaXWYSmNTRG3N1e6o4c07o/3TngIP6t/KsjDvDCd9ns=
---

# GPU (Ovaltine / OnePlus Ace Pro)

Device-specific GPU probe source for the AERA Recovery device tree.

- SoC: SM8475 (taro), Adreno 730
- Kernel GPU module: msm_kgsl.ko is loaded from stock vendor_dlkm
  (see AERA_LOAD_VENDOR_MODULES in BoardConfig.mk); no GPU module is
  bundled in this tree.
- Prebuilt userspace (Adreno 730 / taro): recovery/root/vendor/lib64/egl,
  recovery/root/vendor/lib64 (libgsl/libllvm-*/libgralloc*/libadreno*),
  and recovery/root/vendor/firmware (a730_zap.mbn, a730_sqe.fw,
  a650_gmu.bin, gmu_gen70000.bin).
- HAL: vendor.qti.hardware.display.allocator-service +
  android.hardware.graphics.mapper@4.0-impl-qti-display.so, wired via
  init.recovery.qcom.rc (aera-graphics-allocator) and the vintf manifests
  under recovery/root/vendor/etc/vintf/manifest.
- Probe binary: aera-gpu-probe (built from egl_probe.cpp) dlopens
  /vendor/lib64/egl/libEGL_adreno.so and libGLESv2_adreno.so to verify
  the Adreno 730 EGL stack renders a pbuffer.

Sources of prebuilt files: DNA_AcePro stock vendor image (taro / SM8475).
*（内容由AI生成，仅供参考）*
