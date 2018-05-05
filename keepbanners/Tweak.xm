/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.
*/

#define LOG_STATEMENTS 0

#ifdef LOG_STATEMENTS
	#define PHLog(fmt, ...) NSLog((@"NotToday10 [Line %d]: " fmt), __LINE__, ##__VA_ARGS__)
#else
	#define PHLog(...)
#endif

%hook SBNotificationBannerDestination
	// Disable the dismiss timer, so banners stay sticky until dismissed
	- (void)_startDismissTimer
	{
		PHLog("wanting to start dismiss timer");
	}
%end