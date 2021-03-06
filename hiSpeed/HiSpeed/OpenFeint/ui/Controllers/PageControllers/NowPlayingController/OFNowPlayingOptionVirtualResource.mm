////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///  Copyright (c) 2009 Aurora Feint Inc.
///
///  This library is free software; you can redistribute it and/or
///  modify it under the terms of the GNU Lesser General Public
///  License as published by the Free Software Foundation; either
///  
///  version 3 of the License, or (at your option) any later version.
///  
///  This library is distributed in the hope that it will be useful,
///  
///  but WITHOUT ANY WARRANTY; without even the implied warranty of
///  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
///  Lesser General Public License for more details.
///  
///  
///  You should have received a copy of the GNU Lesser General Public
///  License along with this library; if not, write to the Free Software
///  
///  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
///
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#import "OFDependencies.h"
#import "OFNowPlayingOptionVirtualResource.h"
#import "OFResourceDataMap.h"
#import "OFControllerLoader.h"

@implementation OFNowPlayingOptionVirtualResource

@synthesize title, controllerName, imageName;

+ (id)withTitle:(NSString*)optionTitle andControllerName:(NSString*)controller andImageName:(NSString*)imageName
{
	OFNowPlayingOptionVirtualResource* option = [[[OFNowPlayingOptionVirtualResource alloc] init] autorelease];
	option.title = optionTitle;
	option.controllerName = controller;
	option.imageName = imageName;
	return option;
}

+ (OFResourceDataMap*)getDataMap
{
	static OFPointer<OFResourceDataMap> dataMap;
	
	if(dataMap.get() == NULL)
	{
		dataMap = new OFResourceDataMap;
	}
	
	return dataMap.get();
}

+ (NSString*)getResourceName
{
	return @"now_playing_option";
}

- (void) dealloc
{
	OFSafeRelease(title);
	OFSafeRelease(controllerName);
	OFSafeRelease(imageName);
	[super dealloc];
}

@end