#import "JpMasuidriveTiEvernoteapiSyncChunkProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiNoteProxy.h"
#import "JpMasuidriveTiEvernoteapiNotebookProxy.h"
#import "JpMasuidriveTiEvernoteapiTagProxy.h"
#import "JpMasuidriveTiEvernoteapiSavedSearchProxy.h"
#import "JpMasuidriveTiEvernoteapiResourceProxy.h"
#import "JpMasuidriveTiEvernoteapiLinkedNotebookProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSyncChunk)
- (id)createSyncChunk:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMSyncChunk* thrift_object = [[[EDAMSyncChunk alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiSyncChunkProxy* proxy = [[[JpMasuidriveTiEvernoteapiSyncChunkProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"currentTime"];
        if(val) {
            [proxy setCurrentTime:val];
        }

        val = [args objectForKey:@"chunkHighUSN"];
        if(val) {
            [proxy setChunkHighUSN:val];
        }

        val = [args objectForKey:@"updateCount"];
        if(val) {
            [proxy setUpdateCount:val];
        }

        val = [args objectForKey:@"notes"];
        if(val) {
            [proxy setNotes:val];
        }

        val = [args objectForKey:@"notebooks"];
        if(val) {
            [proxy setNotebooks:val];
        }

        val = [args objectForKey:@"tags"];
        if(val) {
            [proxy setTags:val];
        }

        val = [args objectForKey:@"searches"];
        if(val) {
            [proxy setSearches:val];
        }

        val = [args objectForKey:@"resources"];
        if(val) {
            [proxy setResources:val];
        }

        val = [args objectForKey:@"expungedNotes"];
        if(val) {
            [proxy setExpungedNotes:val];
        }

        val = [args objectForKey:@"expungedNotebooks"];
        if(val) {
            [proxy setExpungedNotebooks:val];
        }

        val = [args objectForKey:@"expungedTags"];
        if(val) {
            [proxy setExpungedTags:val];
        }

        val = [args objectForKey:@"expungedSearches"];
        if(val) {
            [proxy setExpungedSearches:val];
        }

        val = [args objectForKey:@"linkedNotebooks"];
        if(val) {
            [proxy setLinkedNotebooks:val];
        }

        val = [args objectForKey:@"expungedLinkedNotebooks"];
        if(val) {
            [proxy setExpungedLinkedNotebooks:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiSyncChunkProxy
@synthesize object;

- (id)initWithObject:(EDAMSyncChunk*)thrift_object
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
        NUMLONGLONG(object.currentTime), @"currentTime",
        NUMLONG(object.chunkHighUSN), @"chunkHighUSN",
        NUMLONG(object.updateCount), @"updateCount",
        arrayMap(object.notes, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: item] autorelease]; }), @"notes",
        arrayMap(object.notebooks, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: item] autorelease]; }), @"notebooks",
        arrayMap(object.tags, ^(id item) { return [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: item] autorelease]; }), @"tags",
        arrayMap(object.searches, ^(id item) { return [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: item] autorelease]; }), @"searches",
        arrayMap(object.resources, ^(id item) { return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: item] autorelease]; }), @"resources",
        arrayMap(object.expungedNotes, ^(id item) { return item; }), @"expungedNotes",
        arrayMap(object.expungedNotebooks, ^(id item) { return item; }), @"expungedNotebooks",
        arrayMap(object.expungedTags, ^(id item) { return item; }), @"expungedTags",
        arrayMap(object.expungedSearches, ^(id item) { return item; }), @"expungedSearches",
        arrayMap(object.linkedNotebooks, ^(id item) { return [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: item] autorelease]; }), @"linkedNotebooks",
        arrayMap(object.expungedLinkedNotebooks, ^(id item) { return item; }), @"expungedLinkedNotebooks",
    nil];
}


- (id)currentTime
{
    return NUMLONGLONG(object.currentTime);
}

- (void)setCurrentTime:(id)value
{
    object.currentTime = [value longLongValue];
}


- (id)chunkHighUSN
{
    return NUMLONG(object.chunkHighUSN);
}

- (void)setChunkHighUSN:(id)value
{
    object.chunkHighUSN = [value longValue];
}


- (id)updateCount
{
    return NUMLONG(object.updateCount);
}

- (void)setUpdateCount:(id)value
{
    object.updateCount = [value longValue];
}


- (id)notes
{
    return arrayMap(object.notes, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setNotes:(id)value
{
    object.notes = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiNoteProxy*)item).object; });
}


- (id)notebooks
{
    return arrayMap(object.notebooks, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setNotebooks:(id)value
{
    object.notebooks = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiNotebookProxy*)item).object; });
}


- (id)tags
{
    return arrayMap(object.tags, ^(id item) { return [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setTags:(id)value
{
    object.tags = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiTagProxy*)item).object; });
}


- (id)searches
{
    return arrayMap(object.searches, ^(id item) { return [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setSearches:(id)value
{
    object.searches = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiSavedSearchProxy*)item).object; });
}


- (id)resources
{
    return arrayMap(object.resources, ^(id item) { return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setResources:(id)value
{
    object.resources = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiResourceProxy*)item).object; });
}


- (id)expungedNotes
{
    return arrayMap(object.expungedNotes, ^(id item) { return item; });
}

- (void)setExpungedNotes:(id)value
{
    object.expungedNotes = arrayMap(value, ^(id item) { return item; });
}


- (id)expungedNotebooks
{
    return arrayMap(object.expungedNotebooks, ^(id item) { return item; });
}

- (void)setExpungedNotebooks:(id)value
{
    object.expungedNotebooks = arrayMap(value, ^(id item) { return item; });
}


- (id)expungedTags
{
    return arrayMap(object.expungedTags, ^(id item) { return item; });
}

- (void)setExpungedTags:(id)value
{
    object.expungedTags = arrayMap(value, ^(id item) { return item; });
}


- (id)expungedSearches
{
    return arrayMap(object.expungedSearches, ^(id item) { return item; });
}

- (void)setExpungedSearches:(id)value
{
    object.expungedSearches = arrayMap(value, ^(id item) { return item; });
}


- (id)linkedNotebooks
{
    return arrayMap(object.linkedNotebooks, ^(id item) { return [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setLinkedNotebooks:(id)value
{
    object.linkedNotebooks = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiLinkedNotebookProxy*)item).object; });
}


- (id)expungedLinkedNotebooks
{
    return arrayMap(object.expungedLinkedNotebooks, ^(id item) { return item; });
}

- (void)setExpungedLinkedNotebooks:(id)value
{
    object.expungedLinkedNotebooks = arrayMap(value, ^(id item) { return item; });
}



@end
