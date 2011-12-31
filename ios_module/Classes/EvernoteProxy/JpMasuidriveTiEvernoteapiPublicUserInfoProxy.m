#import "JpMasuidriveTiEvernoteapiPublicUserInfoProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMPublicUserInfo)
- (id)createPublicUserInfo:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMPublicUserInfo* thrift_object = [[[EDAMPublicUserInfo alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiPublicUserInfoProxy* proxy = [[[JpMasuidriveTiEvernoteapiPublicUserInfoProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"userId"];
        if(val) {
            [proxy setUserId:val];
        }

        val = [args objectForKey:@"shardId"];
        if(val) {
            [proxy setShardId:val];
        }

        val = [args objectForKey:@"privilege"];
        if(val) {
            [proxy setPrivilege:val];
        }

        val = [args objectForKey:@"username"];
        if(val) {
            [proxy setUsername:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiPublicUserInfoProxy
@synthesize object;

- (id)initWithObject:(EDAMPublicUserInfo*)thrift_object
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
        NUMLONG(object.userId), @"userId",
        object.shardId, @"shardId",
        NUMLONG(object.privilege), @"privilege",
        object.username, @"username",
    nil];
}


- (id)userId
{
    return NUMLONG(object.userId);
}

- (void)setUserId:(id)value
{
    object.userId = [value longValue];
}


- (id)shardId
{
    return object.shardId;
}

- (void)setShardId:(id)value
{
    object.shardId = [TiUtils stringValue:value];
}


- (id)privilege
{
    return NUMLONG(object.privilege);
}

- (void)setPrivilege:(id)value
{
    object.privilege = [value longValue];
}


- (id)username
{
    return object.username;
}

- (void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}



@end
