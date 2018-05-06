%hook SBNotificationBannerDestination
	// Disable the dismiss timer, so banners stay sticky until dismissed
	- (void)_startDismissTimer{}
%end