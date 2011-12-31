#import "JpMasuidriveTiEvernoteapiNoteFilterProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteFilter)
- (id)createNoteFilter:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteFilter* thrift_object = [[[EDAMNoteFilter alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteFilterProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteFilterProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"order"];
        if(val) {
            [proxy setOrder:val];
        }

        val = [args objectForKey:@"ascending"];
        if(val) {
            [proxy setAscending:val];
        }

        val = [args objectForKey:@"words"];
        if(val) {
            [proxy setWords:val];
        }

        val = [args objectForKey:@"notebookGuid"];
        if(val) {
            [proxy setNotebookGuid:val];
        }

        val = [args objectForKey:@"tagGuids"];
        if(val) {
            [proxy setTagGuids:val];
        }

        val = [args objectForKey:@"timeZone"];
        if(val) {
            [proxy setTimeZone:val];
        }

        val = [args objectForKey:@"inactive"];
        if(val) {
            [proxy setInactive:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteFilterProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteFilter*)thrift_object
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
        NUMLONG(object.order), @"order",
        NUMBOOL(object.ascending), @"ascending",
        object.words, @"words",
        object.notebookGuid, @"notebookGuid",
        arrayMap(object.tagGuids, ^(id item) { return item; }), @"tagGuids",
        object.timeZone, @"timeZone",
        NUMBOOL(object.inactive), @"inactive",
    nil];
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


- (id)words
{
    return object.words;
}

- (void)setWords:(id)value
{
    object.words = [TiUtils stringValue:value];
}


- (id)notebookGuid
{
    return object.notebookGuid;
}

- (void)setNotebookGuid:(id)value
{
    object.notebookGuid = [TiUtils stringValue:value];
}


- (id)tagGuids
{
    return arrayMap(object.tagGuids, ^(id item) { return item; });
}

- (void)setTagGuids:(id)value
{
    object.tagGuids = arrayMap(value, ^(id item) { return item; });
}


- (id)timeZone
{
    return object.timeZone;
}

- (void)setTimeZone:(id)value
{
    object.timeZone = [TiUtils stringValue:value];
}


- (id)inactive
{
    return NUMBOOL(object.inactive);
}

- (void)setInactive:(id)value
{
    object.inactive = [value boolValue];
}



@end
