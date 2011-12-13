#import "EDAMPublicUserInfoProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMPublicUserInfo)
-(id)createPublicUserInfo:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMPublicUserInfo)
-(id)createPublicUserInfo:(id)args
{
    return [[[EDAMPublicUserInfoProxy alloc] initWithObject: [[[EDAMPublicUserInfo alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMPublicUserInfoProxy
@synthesize object;


-(id)userId
{
    return NUMINT(object.userId);
}

-(void)setUserId:(id)value
{
    object.userId = [value integerValue];
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
    return NUMINT(object.privilege);
}

-(void)setPrivilege:(id)value
{
    object.privilege = [value integerValue];
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
