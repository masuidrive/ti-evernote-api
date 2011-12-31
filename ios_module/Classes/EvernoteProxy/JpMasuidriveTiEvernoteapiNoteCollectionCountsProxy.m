#import "JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteCollectionCounts)
- (id)createNoteCollectionCounts:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteCollectionCounts* thrift_object = [[[EDAMNoteCollectionCounts alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"notebookCounts"];
        if(val) {
            [proxy setNotebookCounts:val];
        }

        val = [args objectForKey:@"tagCounts"];
        if(val) {
            [proxy setTagCounts:val];
        }

        val = [args objectForKey:@"trashCount"];
        if(val) {
            [proxy setTrashCount:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteCollectionCounts*)thrift_object
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
        				dictionaryMap(object.notebookCounts, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
, @"notebookCounts",
        				dictionaryMap(object.tagCounts, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
, @"tagCounts",
        NUMLONG(object.trashCount), @"trashCount",
    nil];
}


- (id)notebookCounts
{
    return 				dictionaryMap(object.notebookCounts, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

- (void)setNotebookCounts:(id)value
{
    object.notebookCounts = 				dictionaryMap(value, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}


- (id)tagCounts
{
    return 				dictionaryMap(object.tagCounts, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

- (void)setTagCounts:(id)value
{
    object.tagCounts = 				dictionaryMap(value, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}


- (id)trashCount
{
    return NUMLONG(object.trashCount);
}

- (void)setTrashCount:(id)value
{
    object.trashCount = [value longValue];
}



@end
