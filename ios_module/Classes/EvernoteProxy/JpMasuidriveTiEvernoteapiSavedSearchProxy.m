#import "JpMasuidriveTiEvernoteapiSavedSearchProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSavedSearch)
- (id)createSavedSearch:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMSavedSearch* thrift_object = [[[EDAMSavedSearch alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiSavedSearchProxy* proxy = [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: thrift_object] autorelease];
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

        val = [args objectForKey:@"query"];
        if(val) {
            [proxy setQuery:val];
        }

        val = [args objectForKey:@"format"];
        if(val) {
            [proxy setFormat:val];
        }

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiSavedSearchProxy
@synthesize object;

- (id)initWithObject:(EDAMSavedSearch*)thrift_object
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
        object.query, @"query",
        NUMLONG(object.format), @"format",
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


- (id)query
{
    return object.query;
}

- (void)setQuery:(id)value
{
    object.query = [TiUtils stringValue:value];
}


- (id)format
{
    return NUMLONG(object.format);
}

- (void)setFormat:(id)value
{
    object.format = [value longValue];
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
