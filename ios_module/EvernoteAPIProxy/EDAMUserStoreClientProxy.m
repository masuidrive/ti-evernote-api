#import "EDAMUserStoreClientProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "THTTPClient.h"
#import "TBinaryProtocol.h"

#import "EDAMAuthenticationResultProxy.h"
#import "EDAMUserProxy.h"
#import "EDAMPublicUserInfoProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@interface JpMasuidriveTiEvernoteapiModule(EDAMUserStoreClient)
-(id)createUserStoreClient:(id)arg;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMUserStoreClient)
-(id)createUserStoreClient:(id)arg
{
    ENSURE_SINGLE_ARG(arg, NSString);
    return [[[EDAMUserStoreClientProxy alloc] initWithUri:arg] autorelease];
}
@end


@implementation EDAMUserStoreClientProxy 

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
    return [[[EDAMAuthenticationResultProxy alloc] initWithObject: [client authenticate : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [TiUtils stringValue:[args objectAtIndex:2]] : [TiUtils stringValue:[args objectAtIndex:3]]]] autorelease];
}

- (id)refreshAuthentication: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[EDAMAuthenticationResultProxy alloc] initWithObject: [client refreshAuthentication : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)getUser: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[EDAMUserProxy alloc] initWithObject: [client getUser : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)getPublicUserInfo: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[EDAMPublicUserInfoProxy alloc] initWithObject: [client getPublicUserInfo : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

@end
