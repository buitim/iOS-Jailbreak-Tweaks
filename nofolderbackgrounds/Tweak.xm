// Copyright © 2017 Danny Glover (Infuse Dreams) - All rights reserved.

//#define LOG_STATEMENTS 1

#ifdef LOG_STATEMENTS
	#define PHLog(fmt, ...) NSLog((@"NoFolderBackground [Line %d]: " fmt), __LINE__, ##__VA_ARGS__)
#else
	#define PHLog(...)
#endif

%hook SBFolderBackgroundView
	// Removes the folder background (rounded rect)
	- (id)initWithFrame:(struct CGRect)arg1
	{
		PHLog("SBFolderBackgroundView - initWithFrame");
		return 0;
	}
%end
