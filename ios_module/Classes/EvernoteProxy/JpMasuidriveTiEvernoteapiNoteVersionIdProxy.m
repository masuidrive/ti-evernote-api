#import "JpMasuidriveTiEvernoteapiNoteVersionIdProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteVersionId)
- (id)createNoteVersionId:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteVersionId* thrift_object = [[[EDAMNoteVersionId alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteVersionIdProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteVersionIdProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

        val = [args objectForKey:@"updated"];
        if(val) {
            [proxy setUpdated:val];
        }

        val = [args objectForKey:@"saved"];
        if(val) {
            [proxy setSaved:val];
        }

        val = [args objectForKey:@"title"];
        if(val) {
            [proxy setTitle:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteVersionIdProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteVersionId*)thrift_object
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
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
        NUMLONGLONG(object.updated), @"updated",
        NUMLONGLONG(object.saved), @"saved",
        object.title, @"title",
    nil];
}


- (id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

- (void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}


- (id)updated
{
    return NUMLONGLONG(object.updated);
}

- (void)setUpdated:(id)value
{
    object.updated = [value longLongValue];
}


- (id)saved
{
    return NUMLONGLONG(object.saved);
}

- (void)setSaved:(id)value
{
    object.saved = [value longLongValue];
}


- (id)title
{
    return object.title;
}

- (void)setTitle:(id)value
{
    object.title = [TiUtils stringValue:value];
}



@end
