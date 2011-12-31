#import "JpMasuidriveTiEvernoteapiPublishingProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMPublishing)
- (id)createPublishing:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMPublishing* thrift_object = [[[EDAMPublishing alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiPublishingProxy* proxy = [[[JpMasuidriveTiEvernoteapiPublishingProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"uri"];
        if(val) {
            [proxy setUri:val];
        }

        val = [args objectForKey:@"order"];
        if(val) {
            [proxy setOrder:val];
        }

        val = [args objectForKey:@"ascending"];
        if(val) {
            [proxy setAscending:val];
        }

        val = [args objectForKey:@"publicDescription"];
        if(val) {
            [proxy setPublicDescription:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiPublishingProxy
@synthesize object;

- (id)initWithObject:(EDAMPublishing*)thrift_object
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
        object.uri, @"uri",
        NUMLONG(object.order), @"order",
        NUMBOOL(object.ascending), @"ascending",
        object.publicDescription, @"publicDescription",
    nil];
}


- (id)uri
{
    return object.uri;
}

- (void)setUri:(id)value
{
    object.uri = [TiUtils stringValue:value];
}


- (id)order
{
    return NUMLONG(object.order);
}

- (void)setOrder:(id)value
{
    object.order = [value longValue];
}


- (id)ascending
{
    return NUMBOOL(object.ascending);
}

- (void)setAscending:(id)value
{
    object.ascending = [value boolValue];
}


- (id)publicDescription
{
    return object.publicDescription;
}

- (void)setPublicDescription:(id)value
{
    object.publicDescription = [TiUtils stringValue:value];
}



@end
