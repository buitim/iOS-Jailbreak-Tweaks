/* How to Hook with Logos
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor. */
#import <UIKit/UIKit.h>

//#define DEBUG_TWEAK 1

#ifdef DEBUG_TWEAK
	#define PHLog(fmt, ...) NSLog((@"NoShareReddit [Line %d]: " fmt), __LINE__, ##__VA_ARGS__)
#else
	#define PHLog(...)
#endif

%hook UIViewController
- (void)presentShareViewForTextString:(id)arg1 urlString:(id)arg2 fromSource:(id)arg3{
}
- (void)presentShareViewForTextString:(id)arg1 urlString:(id)arg2 fromBarButtonItem:(id)arg3{
}
- (void)presentShareViewForTextString:(id)arg1 urlString:(id)arg2 inView:(id)arg3{
}
- (void)presentShareViewForUrlString:(id)arg1 inView:(id)arg2{
}
%end
