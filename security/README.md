---
AIGC:
    Label: "1"
    ContentProducer: 001191440300708461136T1XGW3
    ProduceID: e368a43d4a043b6962c2f622747b1c93_f38f1832c4d311f19063525400393706
    ReservedCode1: swSYKnpxUUUlXuZZB/tI0xhWnkLDvX8WprzKPEpM6+MBXJ4kB5jEwzrGeYS1HGhpeVOxprFTlYAXybOmOVQg0FEnqp4OqQwEPMj9ofz0DCiZZqXu75J/R0gsKsFt7r8M5miBnBLi2g2bZyla2LgsRhyA+YPUkfo6EKHKwXvzq2t5kDGtAAZUuUi9HwU=
    ContentPropagator: 001191440300708461136T1XGW3
    PropagateID: e368a43d4a043b6962c2f622747b1c93_f38f1832c4d311f19063525400393706
    ReservedCode2: swSYKnpxUUUlXuZZB/tI0xhWnkLDvX8WprzKPEpM6+MBXJ4kB5jEwzrGeYS1HGhpeVOxprFTlYAXybOmOVQg0FEnqp4OqQwEPMj9ofz0DCiZZqXu75J/R0gsKsFt7r8M5miBnBLi2g2bZyla2LgsRhyA+YPUkfo6EKHKwXvzq2t5kDGtAAZUuUi9HwU=
---

# Security (Ovaltine / OnePlus Ace Pro)

Recovery security userspace layout for the AERA Recovery device tree.

- No OTA certificates are enabled: the DNA_AcePro stock vendor image does
  not ship local_OTA/special_OTA keys, so PRODUCT_EXTRA_RECOVERY_KEYS is
  intentionally NOT set (differs from the waffle reference tree).
- Keymaster/Keymint: vendor keymint-service-qti + libqtikeymint.so etc.
  are already present under recovery/root (system/bin + vendor/lib64) and
  are kept unchanged.
- SSG/secure element prebuilts added from the DNA_AcePro stock vendor
  image (taro): vendor/bin/ssgtzd (+ ssgtzd.rc),
  vendor/bin/hw/vendor.qti.secure_element@1.2-service
  (+ vendor.qti.secure_element@1.2-service.rc).
- No se_omapi/weaver binaries are bundled; they are not available in the
  stock vendor image and are left as-is.
*（内容由AI生成，仅供参考）*
