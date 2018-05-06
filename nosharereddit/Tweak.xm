#import <UIKit/UIKit.h>

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
