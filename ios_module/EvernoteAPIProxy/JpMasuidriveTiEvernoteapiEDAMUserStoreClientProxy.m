#import "JpMasuidriveTiEvernoteapiEDAMUserStoreClientProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "THTTPClient.h"
#import "TBinaryProtocol.h"

#import "JpMasuidriveTiEvernoteapiEDAMAuthenticationResultProxy.h"
#import "JpMasuidriveTiEvernoteapiEDAMUserProxy.h"
#import "JpMasuidriveTiEvernoteapiEDAMPublicUserInfoProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMUserStoreClient)
-(id)createUserStoreClient:(id)arg
{
    ENSURE_SINGLE_ARG(arg, NSString);
    return [[[JpMasuidriveTiEvernoteapiEDAMUserStoreClientProxy alloc] initWithUri:arg] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiEDAMUserStoreClientProxy 

@synthesize client;


- (id)initWithUri: (NSString*)uri
{
    NSURL* nsurl = [[[NSURL alloc] initWithString: uri] autorelease];
    
    THTTPClient* httpClient = [[[THTTPClient alloc] initWithURL: nsurl] autorelease];
    TBinaryProtocol* protocol = [[[TBinaryProtocol alloc] initWithTransport:httpClient] autorelease];
    
    self.client = [[[EDAMUserStoreClient alloc] initWithProtocol:protocol] autorelease];
    
    return self;
}

- (void)dealloc
{
    self.client = nil;
    [super dealloc];
}


- (id)checkVersion: (id)args
{
    ENSURE_ARG_COUNT(args, 3);
    return NUMBOOL([client checkVersion : [TiUtils stringValue:[args objectAtIndex:0]] : [[args objectAtIndex:1] integerValue] : [[args objectAtIndex:2] integerValue]]);
}

- (id)authenticate: (id)args
{
    ENSURE_ARG_COUNT(args, 4);
    return [[[JpMasuidriveTiEvernoteapiEDAMAuthenticationResultProxy alloc] initWithObject: [client authenticate : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [TiUtils stringValue:[args objectAtIndex:2]] : [TiUtils stringValue:[args objectAtIndex:3]]]] autorelease];
}

- (id)refreshAuthentication: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[JpMasuidriveTiEvernoteapiEDAMAuthenticationResultProxy alloc] initWithObject: [client refreshAuthentication : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)getUser: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[JpMasuidriveTiEvernoteapiEDAMUserProxy alloc] initWithObject: [client getUser : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)getPublicUserInfo: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[JpMasuidriveTiEvernoteapiEDAMPublicUserInfoProxy alloc] initWithObject: [client getPublicUserInfo : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

@end
