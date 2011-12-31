#import "JpMasuidriveTiEvernoteapiUserProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiUserAttributesProxy.h"
#import "JpMasuidriveTiEvernoteapiAccountingProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMUser)
- (id)createUser:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMUser* thrift_object = [[[EDAMUser alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiUserProxy* proxy = [[[JpMasuidriveTiEvernoteapiUserProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"id"];
        if(val) {
            [proxy setId:val];
        }

        val = [args objectForKey:@"username"];
        if(val) {
            [proxy setUsername:val];
        }

        val = [args objectForKey:@"email"];
        if(val) {
            [proxy setEmail:val];
        }

        val = [args objectForKey:@"name"];
        if(val) {
            [proxy setName:val];
        }

        val = [args objectForKey:@"timezone"];
        if(val) {
            [proxy setTimezone:val];
        }

        val = [args objectForKey:@"privilege"];
        if(val) {
            [proxy setPrivilege:val];
        }

        val = [args objectForKey:@"created"];
        if(val) {
            [proxy setCreated:val];
        }

        val = [args objectForKey:@"updated"];
        if(val) {
            [proxy setUpdated:val];
        }

        val = [args objectForKey:@"deleted"];
        if(val) {
            [proxy setDeleted:val];
        }

        val = [args objectForKey:@"active"];
        if(val) {
            [proxy setActive:val];
        }

        val = [args objectForKey:@"shardId"];
        if(val) {
            [proxy setShardId:val];
        }

        val = [args objectForKey:@"attributes"];
        if(val) {
            [proxy setAttributes:val];
        }

        val = [args objectForKey:@"accounting"];
        if(val) {
            [proxy setAccounting:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiUserProxy
@synthesize object;

- (id)initWithObject:(EDAMUser*)thrift_object
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
        NUMLONG(object.id), @"id",
        object.username, @"username",
        object.email, @"email",
        object.name, @"name",
        object.timezone, @"timezone",
        NUMLONG(object.privilege), @"privilege",
        NUMLONGLONG(object.created), @"created",
        NUMLONGLONG(object.updated), @"updated",
        NUMLONGLONG(object.deleted), @"deleted",
        NUMBOOL(object.active), @"active",
        object.shardId, @"shardId",
        [[[JpMasuidriveTiEvernoteapiUserAttributesProxy alloc] initWithObject: object.attributes] autorelease], @"attributes",
        [[[JpMasuidriveTiEvernoteapiAccountingProxy alloc] initWithObject: object.accounting] autorelease], @"accounting",
    nil];
}


- (id)id
{
    return NUMLONG(object.id);
}

- (void)setId:(id)value
{
    object.id = [value longValue];
}


- (id)username
{
    return object.username;
}

- (void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}


- (id)email
{
    return object.email;
}

- (void)setEmail:(id)value
{
    object.email = [TiUtils stringValue:value];
}


- (id)name
{
    return object.name;
}

- (void)setName:(id)value
{
    object.name = [TiUtils stringValue:value];
}


- (id)timezone
{
    return object.timezone;
}

- (void)setTimezone:(id)value
{
    object.timezone = [TiUtils stringValue:value];
}


- (id)privilege
{
    return NUMLONG(object.privilege);
}

- (void)setPrivilege:(id)value
{
    object.privilege = [value longValue];
}


- (id)created
{
    return NUMLONGLONG(object.created);
}

- (void)setCreated:(id)value
{
    object.created = [value longLongValue];
}


- (id)updated
{
    return NUMLONGLONG(object.updated);
}

- (void)setUpdated:(id)value
{
    object.updated = [value longLongValue];
}


- (id)deleted
{
    return NUMLONGLONG(object.deleted);
}

- (void)setDeleted:(id)value
{
    object.deleted = [value longLongValue];
}


- (id)active
{
    return NUMBOOL(object.active);
}

- (void)setActive:(id)value
{
    object.active = [value boolValue];
}


- (id)shardId
{
    return object.shardId;
}

- (void)setShardId:(id)value
{
    object.shardId = [TiUtils stringValue:value];
}


- (id)attributes
{
    return [[[JpMasuidriveTiEvernoteapiUserAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

- (void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiUserAttributesProxy*)value).object;
}


- (id)accounting
{
    return [[[JpMasuidriveTiEvernoteapiAccountingProxy alloc] initWithObject: object.accounting] autorelease];
}

- (void)setAccounting:(id)value
{
    object.accounting = ((JpMasuidriveTiEvernoteapiAccountingProxy*)value).object;
}



@end
