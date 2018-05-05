FOR_RELEASE=1
include $(THEOS)/makefiles/common.mk

export ARCHS = armv7 arm64
TWEAK_NAME = NoFolderBackground
NoFolderBackground_FILES = Tweak.xm
TARGET = iphone::10.1

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
