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
#import "OFImageUrl.h"
#import "OFSocialNotificationService.h"
#import "OFResourceDataMap.h"

@implementation OFImageUrl

@synthesize url;

- (void)setUrl:(NSString*)value
{
	url = [value retain];
}

+ (OFService*)getService;
{
	return [OFSocialNotificationService sharedInstance];
}

+ (OFResourceDataMap*)getDataMap
{
	static OFPointer<OFResourceDataMap> dataMap;
	
	if(dataMap.get() == NULL)
	{
		dataMap = new OFResourceDataMap;
		dataMap->addField(@"url", @selector(setUrl:));
	}
	
	return dataMap.get();
}

+ (NSString*)getResourceName
{
	return @"image_url";
}

+ (NSString*)getResourceDiscoveredNotification
{
	return nil;
}

- (void) dealloc
{
	OFSafeRelease(url);
	[super dealloc];
}

@end