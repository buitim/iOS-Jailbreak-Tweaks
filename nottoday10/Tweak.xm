// Vars
static BOOL isEnabledInSpringboard = YES;
static BOOL isEnabledInNotificationCenter = YES;
static BOOL isEnabledInLockScreen = YES;

%hook SBIconController
	- (_Bool)isShowingTodayView
	{
		return (isEnabledInNotificationCenter) ? YES : NO;
	}
%end

%hook SBNotificationCenterController
	// Removes the today view from the notification center
	- (_Bool)_shouldPresentSpotlightForCurrentTransitionStateAndVelocity:(struct CGPoint)arg1
	{
		return (isEnabledInNotificationCenter) ? NO : %orig;
	};
%end

%hook SBPolicyAggregator
	// Removes the today view from the lock screen (swipe left)
	- (_Bool)_allowsCapabilityLockScreenTodayViewWithExplanation:(id *)arg1
	{
		return !isEnabledInLockScreen;
	};
%end

%hook SBRootFolderView
	// Works for removing the today view, but makes it so springboard scrolls to an empty page
	- (_Bool)_searchableTodayViewIsTransitioning
	{
		return (isEnabledInSpringboard) ? YES : %orig;
	}

	// Fixes issue with blank springboard page (caused by method above)
	- (unsigned long long)_minusPageCount 
	{
		return (isEnabledInSpringboard) ? 0 : 1;
	}
%end

// Load the preferences file
static void loadPrefs()
{
	// Get the preferences dictionary
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.dannyglover.nottoday10.plist"];

	// If the preferences exist, update our values
	if (prefs)
	{
		isEnabledInSpringboard = [prefs objectForKey:@"enableInSpringboard"] ? [[prefs objectForKey:@"enableInSpringboard"] boolValue] : isEnabledInSpringboard;
		isEnabledInNotificationCenter = [prefs objectForKey:@"enableInNotificationCenter"] ? [[prefs objectForKey:@"enableInNotificationCenter"] boolValue] : isEnabledInNotificationCenter;
		isEnabledInLockScreen = [prefs objectForKey:@"enableInLockScreen"] ? [[prefs objectForKey:@"enableInLockScreen"] boolValue] : isEnabledInLockScreen;
	}
	[prefs release];
}

// Runs on tweak initialisation
%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.dannyglover.nottoday10/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}
