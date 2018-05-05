FOR_RELEASE=0
include $(THEOS)/makefiles/common.mk

#export SDKVERSION=10.1
TWEAK_NAME = NotToday10
NotToday10_FILES = Tweak.xm
export ARCHS = armv7 arm64
TARGET = iphone::10.1


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nottoday10
include $(THEOS_MAKE_PATH)/aggregate.mk
