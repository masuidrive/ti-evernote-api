#import "JpMasuidriveTiEvernoteapiTagProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMTag)
- (id)createTag:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMTag* thrift_object = [[[EDAMTag alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiTagProxy* proxy = [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"guid"];
        if(val) {
            [proxy setGuid:val];
        }

        val = [args objectForKey:@"name"];
        if(val) {
            [proxy setName:val];
        }

        val = [args objectForKey:@"parentGuid"];
        if(val) {
            [proxy setParentGuid:val];
        }

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiTagProxy
@synthesize object;

- (id)initWithObject:(EDAMTag*)thrift_object
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
        object.guid, @"guid",
        object.name, @"name",
        object.parentGuid, @"parentGuid",
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
    nil];
}


- (id)guid
{
    return object.guid;
}

- (void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


- (id)name
{
    return object.name;
}

- (void)setName:(id)value
{
    object.name = [TiUtils stringValue:value];
}


- (id)parentGuid
{
    return object.parentGuid;
}

- (void)setParentGuid:(id)value
{
    object.parentGuid = [TiUtils stringValue:value];
}


- (id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

- (void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}



@end
