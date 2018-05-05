FOR_RELEASE=1
include $(THEOS)/makefiles/common.mk

export SDKVERSION=10.1
TWEAK_NAME = KeepBanners
NotToday10_FILES = Tweak.xm
export ARCHS = armv7 arm64
TARGET = iphone::10.1


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
