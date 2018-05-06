// Copyright © 2017 Danny Glover (Infuse Dreams) - All rights reserved.

%hook SBFolderBackgroundView
	// Removes the folder background (rounded rect)
	- (id)initWithFrame:(struct CGRect)arg1
	{
		return 0;
	}
%end
