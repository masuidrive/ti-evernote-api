#import "JpMasuidriveTiEvernoteapiNoteMetadataProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiNoteAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteMetadata)
- (id)createNoteMetadata:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteMetadata* thrift_object = [[[EDAMNoteMetadata alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteMetadataProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteMetadataProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"guid"];
        if(val) {
            [proxy setGuid:val];
        }

        val = [args objectForKey:@"title"];
        if(val) {
            [proxy setTitle:val];
        }

        val = [args objectForKey:@"contentLength"];
        if(val) {
            [proxy setContentLength:val];
        }

        val = [args objectForKey:@"created"];
        if(val) {
            [proxy setCreated:val];
        }

        val = [args objectForKey:@"updated"];
        if(val) {
            [proxy setUpdated:val];
        }

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

        val = [args objectForKey:@"notebookGuid"];
        if(val) {
            [proxy setNotebookGuid:val];
        }

        val = [args objectForKey:@"tagGuids"];
        if(val) {
            [proxy setTagGuids:val];
        }

        val = [args objectForKey:@"attributes"];
        if(val) {
            [proxy setAttributes:val];
        }

        val = [args objectForKey:@"largestResourceMime"];
        if(val) {
            [proxy setLargestResourceMime:val];
        }

        val = [args objectForKey:@"largestResourceSize"];
        if(val) {
            [proxy setLargestResourceSize:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteMetadataProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteMetadata*)thrift_object
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
        object.title, @"title",
        NUMLONG(object.contentLength), @"contentLength",
        NUMLONGLONG(object.created), @"created",
        NUMLONGLONG(object.updated), @"updated",
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
        object.notebookGuid, @"notebookGuid",
        arrayMap(object.tagGuids, ^(id item) { return item; }), @"tagGuids",
        [[[JpMasuidriveTiEvernoteapiNoteAttributesProxy alloc] initWithObject: object.attributes] autorelease], @"attributes",
        object.largestResourceMime, @"largestResourceMime",
        NUMLONG(object.largestResourceSize), @"largestResourceSize",
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


- (id)title
{
    return object.title;
}

- (void)setTitle:(id)value
{
    object.title = [TiUtils stringValue:value];
}


- (id)contentLength
{
    return NUMLONG(object.contentLength);
}

- (void)setContentLength:(id)value
{
    object.contentLength = [value longValue];
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


- (id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

- (void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
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


- (id)attributes
{
    return [[[JpMasuidriveTiEvernoteapiNoteAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

- (void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiNoteAttributesProxy*)value).object;
}


- (id)largestResourceMime
{
    return object.largestResourceMime;
}

- (void)setLargestResourceMime:(id)value
{
    object.largestResourceMime = [TiUtils stringValue:value];
}


- (id)largestResourceSize
{
    return NUMLONG(object.largestResourceSize);
}

- (void)setLargestResourceSize:(id)value
{
    object.largestResourceSize = [value longValue];
}



@end
