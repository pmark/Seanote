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

#include "OFInputSerializer.h"

@class OFXmlDocument;

class OFXmlReader : public OFInputSerializer
{
OFDeclareRTTI;
public:
	typedef OFRetainedPtr<NSString> (*StringDecoder)(NSString* stringToDecode);
	
	OFXmlReader(const char* fileName, StringDecoder decoder = NULL);
	OFXmlReader(NSData* documentBytes, StringDecoder decoder = NULL);
	OFXmlReader(NSString* fullPathName, StringDecoder decoder = NULL);

	bool supportsKeys() const;

	OFRetainedPtr<OFXmlDocument> document() { return mDocument; }
	
private:
	void nviIo(OFISerializerKey* keyName, bool& value);
	void nviIo(OFISerializerKey* keyName, int& value);
	void nviIo(OFISerializerKey* keyName, unsigned int& value);
	void nviIo(OFISerializerKey* keyName, int64_t& value);	
	void nviIo(OFISerializerKey* keyName, float& value);
	void nviIo(OFISerializerKey* keyName, double& value);
	void nviIo(OFISerializerKey* keyName, std::string& value);	
	void nviIo(OFISerializerKey* keyName, OFRetainedPtr<NSString>& value);	
	void nviIo(OFISerializerKey* keyName, OFRetainedPtr<NSData>& value)
	{
		OFAssert(false, @"Reading NSData Not Implemented In OFXmlReader");
	}

	bool getNextValueAtCurrentScope(OFISerializerKey* keyName, NSString*& outString);
	
	const OFRTTI* beginDecodeType();
	void endDecodeType();	
	void beginEncodeType(const OFRTTI* typeToEncode);
	void endEncodeType();
	
	void onScopePushed(OFISerializerKey* scopeName);
	void onScopePopped(OFISerializerKey* scopeName);

	OFRetainedPtr<NSString> decodeString(NSString* stringToDecode);

	OFRetainedPtr<OFXmlDocument> mDocument;
	StringDecoder mStringDecoder;
};