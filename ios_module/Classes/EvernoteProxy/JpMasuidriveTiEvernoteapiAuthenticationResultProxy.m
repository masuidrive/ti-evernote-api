#import "JpMasuidriveTiEvernoteapiAuthenticationResultProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiUserProxy.h"
#import "JpMasuidriveTiEvernoteapiPublicUserInfoProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAuthenticationResult)
- (id)createAuthenticationResult:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMAuthenticationResult* thrift_object = [[[EDAMAuthenticationResult alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiAuthenticationResultProxy* proxy = [[[JpMasuidriveTiEvernoteapiAuthenticationResultProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"currentTime"];
        if(val) {
            [proxy setCurrentTime:val];
        }

        val = [args objectForKey:@"authenticationToken"];
        if(val) {
            [proxy setAuthenticationToken:val];
        }

        val = [args objectForKey:@"expiration"];
        if(val) {
            [proxy setExpiration:val];
        }

        val = [args objectForKey:@"user"];
        if(val) {
            [proxy setUser:val];
        }

        val = [args objectForKey:@"publicUserInfo"];
        if(val) {
            [proxy setPublicUserInfo:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiAuthenticationResultProxy
@synthesize object;

- (id)initWithObject:(EDAMAuthenticationResult*)thrift_object
{
    if(self = [super init]){
        self.object = thrift_object;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super release];
}

- (NSDictionary*)toHash:(id)args
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        NUMLONGLONG(object.currentTime), @"currentTime",
        object.authenticationToken, @"authenticationToken",
        NUMLONGLONG(object.expiration), @"expiration",
        [[[JpMasuidriveTiEvernoteapiUserProxy alloc] initWithObject: object.user] autorelease], @"user",
        [[[JpMasuidriveTiEvernoteapiPublicUserInfoProxy alloc] initWithObject: object.publicUserInfo] autorelease], @"publicUserInfo",
    nil];
}


- (id)currentTime
{
    return NUMLONGLONG(object.currentTime);
}

- (void)setCurrentTime:(id)value
{
    object.currentTime = [value longLongValue];
}


- (id)authenticationToken
{
    return object.authenticationToken;
}

- (void)setAuthenticationToken:(id)value
{
    object.authenticationToken = [TiUtils stringValue:value];
}


- (id)expiration
{
    return NUMLONGLONG(object.expiration);
}

- (void)setExpiration:(id)value
{
    object.expiration = [value longLongValue];
}


- (id)user
{
    return [[[JpMasuidriveTiEvernoteapiUserProxy alloc] initWithObject: object.user] autorelease];
}

- (void)setUser:(id)value
{
    object.user = ((JpMasuidriveTiEvernoteapiUserProxy*)value).object;
}


- (id)publicUserInfo
{
    return [[[JpMasuidriveTiEvernoteapiPublicUserInfoProxy alloc] initWithObject: object.publicUserInfo] autorelease];
}

- (void)setPublicUserInfo:(id)value
{
    object.publicUserInfo = ((JpMasuidriveTiEvernoteapiPublicUserInfoProxy*)value).object;
}



@end
