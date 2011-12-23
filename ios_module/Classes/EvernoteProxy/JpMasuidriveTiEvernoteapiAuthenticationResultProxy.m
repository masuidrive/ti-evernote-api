#import "JpMasuidriveTiEvernoteapiAuthenticationResultProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiUserProxy.h"
#import "JpMasuidriveTiEvernoteapiPublicUserInfoProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAuthenticationResult)
-(id)createAuthenticationResult:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiAuthenticationResultProxy alloc] initWithObject: [[[EDAMAuthenticationResult alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiAuthenticationResultProxy
@synthesize object;


-(id)currentTime
{
    return NUMLONG(object.currentTime);
}

-(void)setCurrentTime:(id)value
{
    object.currentTime = [value longValue];
}


-(id)authenticationToken
{
    return object.authenticationToken;
}

-(void)setAuthenticationToken:(id)value
{
    object.authenticationToken = [TiUtils stringValue:value];
}


-(id)expiration
{
    return NUMLONG(object.expiration);
}

-(void)setExpiration:(id)value
{
    object.expiration = [value longValue];
}


-(id)user
{
    return [[[JpMasuidriveTiEvernoteapiUserProxy alloc] initWithObject: object.user] autorelease];
}

-(void)setUser:(id)value
{
    object.user = ((JpMasuidriveTiEvernoteapiUserProxy*)value).object;
}


-(id)publicUserInfo
{
    return [[[JpMasuidriveTiEvernoteapiPublicUserInfoProxy alloc] initWithObject: object.publicUserInfo] autorelease];
}

-(void)setPublicUserInfo:(id)value
{
    object.publicUserInfo = ((JpMasuidriveTiEvernoteapiPublicUserInfoProxy*)value).object;
}



- (id)initWithObject:(EDAMAuthenticationResult*)object_
{
    if(self = [super init]){
        self.object = object_;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super release];
}
@end
