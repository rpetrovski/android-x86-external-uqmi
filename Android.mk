LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=        \
	main.c \
	dev.c \
	commands.c \
	qmi-message.c \
	qmi-message-ctl.c \
	qmi-message-dms.c \
	qmi-message-nas.c \
	qmi-message-pds.c \
	qmi-message-wds.c \
	qmi-message-wms.c \
	qmi-message-wda.c	


LOCAL_MODULE:= uqmi
LOCAL_C_INCLUDES := external/uqmi
LOCAL_STATIC_LIBRARIES := libubox libblobmsg_json
LOCAL_SHARED_LIBRARIES := libjson-c
LOCAL_CFLAGS+=--std=gnu99

include $(BUILD_EXECUTABLE)

