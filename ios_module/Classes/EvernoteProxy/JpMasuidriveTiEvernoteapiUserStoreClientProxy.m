#import "JpMasuidriveTiEvernoteapiUserStoreClientProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "THTTPClient.h"
#import "TBinaryProtocol.h"

#import "JpMasuidriveTiEvernoteapiAuthenticationResultProxy.h"
#import "JpMasuidriveTiEvernoteapiUserProxy.h"
#import "JpMasuidriveTiEvernoteapiPublicUserInfoProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMUserStoreClient)
-(id)createUserStoreClient:(id)arg
{
    ENSURE_SINGLE_ARG(arg, NSString);
    return [[[JpMasuidriveTiEvernoteapiUserStoreClientProxy alloc] initWithUri:arg] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiUserStoreClientProxy 

@synthesize client;


- (id)initWithUri: (NSString*)uri
{
    self = [super initWithUri:uri];
    if (self != nil) {
        self.client = [[[EDAMUserStoreClient alloc] initWithProtocol:protocol] autorelease];
    }
    return self;
}

- (void)dealloc
{
    self.client = nil;
    [super dealloc];
}


- (id)checkVersion: (id)args
{
    ENSURE_ARG_COUNT(args, 4);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:3];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMBOOL([client checkVersion : [TiUtils stringValue:[args objectAtIndex:0]] : [[args objectAtIndex:1] integerValue] : [[args objectAtIndex:2] integerValue]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)authenticate: (id)args
{
    ENSURE_ARG_COUNT(args, 5);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:4];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiAuthenticationResultProxy alloc] initWithObject: [client authenticate : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [TiUtils stringValue:[args objectAtIndex:2]] : [TiUtils stringValue:[args objectAtIndex:3]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)refreshAuthentication: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiAuthenticationResultProxy alloc] initWithObject: [client refreshAuthentication : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getUser: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiUserProxy alloc] initWithObject: [client getUser : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getPublicUserInfo: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiPublicUserInfoProxy alloc] initWithObject: [client getPublicUserInfo : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

@end
