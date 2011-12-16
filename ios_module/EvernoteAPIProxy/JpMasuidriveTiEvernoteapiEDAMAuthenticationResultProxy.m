#import "JpMasuidriveTiEvernoteapiEDAMAuthenticationResultProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiEDAMUserProxy.h"
#import "JpMasuidriveTiEvernoteapiEDAMPublicUserInfoProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAuthenticationResult)
-(id)createAuthenticationResult:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiEDAMAuthenticationResultProxy alloc] initWithObject: [[[EDAMAuthenticationResult alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiEDAMAuthenticationResultProxy
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
    return [[[JpMasuidriveTiEvernoteapiEDAMUserProxy alloc] initWithObject: object.user] autorelease];
}

-(void)setUser:(id)value
{
    object.user = ((JpMasuidriveTiEvernoteapiEDAMUserProxy*)value).object;
}


-(id)publicUserInfo
{
    return [[[JpMasuidriveTiEvernoteapiEDAMPublicUserInfoProxy alloc] initWithObject: object.publicUserInfo] autorelease];
}

-(void)setPublicUserInfo:(id)value
{
    object.publicUserInfo = ((JpMasuidriveTiEvernoteapiEDAMPublicUserInfoProxy*)value).object;
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
