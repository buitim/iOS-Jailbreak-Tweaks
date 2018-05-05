include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NotToday10
NotToday10_FILES = nttRootListController.m
NotToday10_INSTALL_PATH = /Library/PreferenceBundles
NotToday10_FRAMEWORKS = UIKit
NotToday10_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NotToday10.plist$(ECHO_END)
