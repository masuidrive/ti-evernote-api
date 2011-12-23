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
-(id)createSyncChunk:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiSyncChunkProxy alloc] initWithObject: [[[EDAMSyncChunk alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiSyncChunkProxy
@synthesize object;


-(id)currentTime
{
    return NUMLONG(object.currentTime);
}

-(void)setCurrentTime:(id)value
{
    object.currentTime = [value longValue];
}


-(id)chunkHighUSN
{
    return NUMINT(object.chunkHighUSN);
}

-(void)setChunkHighUSN:(id)value
{
    object.chunkHighUSN = [value integerValue];
}


-(id)updateCount
{
    return NUMINT(object.updateCount);
}

-(void)setUpdateCount:(id)value
{
    object.updateCount = [value integerValue];
}


-(id)notes
{
    return arrayMap(object.notes, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setNotes:(id)value
{
    object.notes = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiNoteProxy*)item).object; });
}


-(id)notebooks
{
    return arrayMap(object.notebooks, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setNotebooks:(id)value
{
    object.notebooks = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiNotebookProxy*)item).object; });
}


-(id)tags
{
    return arrayMap(object.tags, ^(id item) { return [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setTags:(id)value
{
    object.tags = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiTagProxy*)item).object; });
}


-(id)searches
{
    return arrayMap(object.searches, ^(id item) { return [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setSearches:(id)value
{
    object.searches = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiSavedSearchProxy*)item).object; });
}


-(id)resources
{
    return arrayMap(object.resources, ^(id item) { return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setResources:(id)value
{
    object.resources = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiResourceProxy*)item).object; });
}


-(id)expungedNotes
{
    return arrayMap(object.expungedNotes, ^(id item) { return item; });
}

-(void)setExpungedNotes:(id)value
{
    object.expungedNotes = arrayMap(value, ^(id item) { return item; });
}


-(id)expungedNotebooks
{
    return arrayMap(object.expungedNotebooks, ^(id item) { return item; });
}

-(void)setExpungedNotebooks:(id)value
{
    object.expungedNotebooks = arrayMap(value, ^(id item) { return item; });
}


-(id)expungedTags
{
    return arrayMap(object.expungedTags, ^(id item) { return item; });
}

-(void)setExpungedTags:(id)value
{
    object.expungedTags = arrayMap(value, ^(id item) { return item; });
}


-(id)expungedSearches
{
    return arrayMap(object.expungedSearches, ^(id item) { return item; });
}

-(void)setExpungedSearches:(id)value
{
    object.expungedSearches = arrayMap(value, ^(id item) { return item; });
}


-(id)linkedNotebooks
{
    return arrayMap(object.linkedNotebooks, ^(id item) { return [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setLinkedNotebooks:(id)value
{
    object.linkedNotebooks = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiLinkedNotebookProxy*)item).object; });
}


-(id)expungedLinkedNotebooks
{
    return arrayMap(object.expungedLinkedNotebooks, ^(id item) { return item; });
}

-(void)setExpungedLinkedNotebooks:(id)value
{
    object.expungedLinkedNotebooks = arrayMap(value, ^(id item) { return item; });
}



- (id)initWithObject:(EDAMSyncChunk*)object_
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
