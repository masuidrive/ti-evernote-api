#import "EDAMUserProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"


#import "EDAMUserAttributesProxy.h"

#import "EDAMAccountingProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMUser)
-(id)createUser:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMUser)
-(id)createUser:(id)args
{
    return [[[EDAMUserProxy alloc] initWithObject: [[[EDAMUser alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMUserProxy
@synthesize object;


-(id)id
{
    return NUMINT(object.id);
}

-(void)setId:(id)value
{
    object.id = [value integerValue];
}

-(id)username
{
    return object.username;
}

-(void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}

-(id)email
{
    return object.email;
}

-(void)setEmail:(id)value
{
    object.email = [TiUtils stringValue:value];
}

-(id)name
{
    return object.name;
}

-(void)setName:(id)value
{
    object.name = [TiUtils stringValue:value];
}

-(id)timezone
{
    return object.timezone;
}

-(void)setTimezone:(id)value
{
    object.timezone = [TiUtils stringValue:value];
}

-(id)privilege
{
    return NUMINT(object.privilege);
}

-(void)setPrivilege:(id)value
{
    object.privilege = [value integerValue];
}

-(id)created
{
    return NUMLONG(object.created);
}

-(void)setCreated:(id)value
{
    object.created = [value longValue];
}

-(id)updated
{
    return NUMLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longValue];
}

-(id)deleted
{
    return NUMLONG(object.deleted);
}

-(void)setDeleted:(id)value
{
    object.deleted = [value longValue];
}

-(id)active
{
    return NUMBOOL(object.active);
}

-(void)setActive:(id)value
{
    object.active = [value boolValue];
}

-(id)shardId
{
    return object.shardId;
}

-(void)setShardId:(id)value
{
    object.shardId = [TiUtils stringValue:value];
}

-(id)attributes
{
    return [[[EDAMUserAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

-(void)setAttributes:(id)value
{
    object.attributes = ((EDAMUserAttributesProxy*)value).object;
}

-(id)accounting
{
    return [[[EDAMAccountingProxy alloc] initWithObject: object.accounting] autorelease];
}

-(void)setAccounting:(id)value
{
    object.accounting = ((EDAMAccountingProxy*)value).object;
}


- (id)initWithObject:(EDAMUser*)object_
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
