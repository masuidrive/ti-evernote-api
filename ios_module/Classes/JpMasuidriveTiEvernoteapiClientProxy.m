/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2011 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "JpMasuidriveTiEvernoteapiClientProxy.h"
#import "TiUtils.h"

@implementation JpMasuidriveTiEvernoteapiClientProxy

- (id)initWithUri: (NSString*)uri
{
    self = [super init];
    if (self != nil) {
        queue = dispatch_queue_create("jp.masuidrive.ti.evernoteapi.clientproxy", nil);
        
        NSURL* nsurl = [[[NSURL alloc] initWithString: uri] autorelease];
        httpClient = [[THTTPClient alloc] initWithURL: nsurl];
        protocol = [[TBinaryProtocol alloc] initWithTransport:httpClient];
    }
    return self;
}


- (void)dealloc
{
    dispatch_release(queue);
    [httpClient release];
    [protocol release];
    [super dealloc];
}


-(void)dispatchCallback:(NSArray*)args
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSString *type = [args objectAtIndex:0];
	id object = [args objectAtIndex:1];
	id listener = [args objectAtIndex:2];
	[self _fireEventToListener:type withObject:object listener:listener thisObject:nil];
	[pool release];
}

@end
