#import "JpMasuidriveTiEvernoteapiUserProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiUserAttributesProxy.h"
#import "JpMasuidriveTiEvernoteapiAccountingProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMUser)
-(id)createUser:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiUserProxy alloc] initWithObject: [[[EDAMUser alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiUserProxy
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
    return [[[JpMasuidriveTiEvernoteapiUserAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

-(void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiUserAttributesProxy*)value).object;
}


-(id)accounting
{
    return [[[JpMasuidriveTiEvernoteapiAccountingProxy alloc] initWithObject: object.accounting] autorelease];
}

-(void)setAccounting:(id)value
{
    object.accounting = ((JpMasuidriveTiEvernoteapiAccountingProxy*)value).object;
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
