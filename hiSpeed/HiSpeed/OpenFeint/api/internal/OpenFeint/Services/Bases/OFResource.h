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

#pragma once

@class OFXmlDocument;
@class OFPaginatedSeries;
class OFXmlElement;
class OFResourceNameMap;
class OFResourceDataMap;

@interface OFResource : NSObject 
{
@package
	NSString* resourceId;
}

+ (OFPaginatedSeries*)resourcesFromXml:(OFXmlDocument*)data withMap:(OFResourceNameMap*)resourceNameMap;

- (void)populateFromXml:(OFXmlElement*)root withMap:(OFResourceNameMap*)resourceNameMap;

@property (nonatomic, readonly, assign) NSString* resourceId;

@end
