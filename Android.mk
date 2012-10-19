# HACK for prebuilt libril and libcamera
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libril_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libril_intermediates/export_includes)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libcamera_intermediates/export_includes)

ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),p350)
include $(call first-makefiles-under,$(call my-dir))
endif
