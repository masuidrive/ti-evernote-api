#import "JpMasuidriveTiEvernoteapiPublicUserInfoProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMPublicUserInfo)
-(id)createPublicUserInfo:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiPublicUserInfoProxy alloc] initWithObject: [[[EDAMPublicUserInfo alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiPublicUserInfoProxy
@synthesize object;


-(id)userId
{
    return NUMLONG(object.userId);
}

-(void)setUserId:(id)value
{
    object.userId = [value longValue];
}


-(id)shardId
{
    return object.shardId;
}

-(void)setShardId:(id)value
{
    object.shardId = [TiUtils stringValue:value];
}


-(id)privilege
{
    return NUMLONG(object.privilege);
}

-(void)setPrivilege:(id)value
{
    object.privilege = [value longValue];
}


-(id)username
{
    return object.username;
}

-(void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}



- (id)initWithObject:(EDAMPublicUserInfo*)object_
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
