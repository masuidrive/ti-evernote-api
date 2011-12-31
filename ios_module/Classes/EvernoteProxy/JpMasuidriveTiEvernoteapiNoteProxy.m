#import "JpMasuidriveTiEvernoteapiNoteProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiResourceProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNote)
- (id)createNote:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNote* thrift_object = [[[EDAMNote alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: thrift_object] autorelease];
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

        val = [args objectForKey:@"content"];
        if(val) {
            [proxy setContent:val];
        }

        val = [args objectForKey:@"contentHash"];
        if(val) {
            [proxy setContentHash:val];
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

        val = [args objectForKey:@"deleted"];
        if(val) {
            [proxy setDeleted:val];
        }

        val = [args objectForKey:@"active"];
        if(val) {
            [proxy setActive:val];
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

        val = [args objectForKey:@"resources"];
        if(val) {
            [proxy setResources:val];
        }

        val = [args objectForKey:@"attributes"];
        if(val) {
            [proxy setAttributes:val];
        }

        val = [args objectForKey:@"tagNames"];
        if(val) {
            [proxy setTagNames:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteProxy
@synthesize object;

- (id)initWithObject:(EDAMNote*)thrift_object
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
        object.content, @"content",
        [[[TiBlob alloc] initWithData:object.contentHash mimetype:@"application/octet-stream"] autorelease], @"contentHash",
        NUMLONG(object.contentLength), @"contentLength",
        NUMLONGLONG(object.created), @"created",
        NUMLONGLONG(object.updated), @"updated",
        NUMLONGLONG(object.deleted), @"deleted",
        NUMBOOL(object.active), @"active",
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
        object.notebookGuid, @"notebookGuid",
        arrayMap(object.tagGuids, ^(id item) { return item; }), @"tagGuids",
        arrayMap(object.resources, ^(id item) { return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: item] autorelease]; }), @"resources",
        [[[JpMasuidriveTiEvernoteapiNoteAttributesProxy alloc] initWithObject: object.attributes] autorelease], @"attributes",
        arrayMap(object.tagNames, ^(id item) { return item; }), @"tagNames",
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


- (id)content
{
    return object.content;
}

- (void)setContent:(id)value
{
    object.content = [TiUtils stringValue:value];
}


- (id)contentHash
{
    return [[[TiBlob alloc] initWithData:object.contentHash mimetype:@"application/octet-stream"] autorelease];
}

- (void)setContentHash:(id)value
{
    object.contentHash = [value data];
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


- (id)resources
{
    return arrayMap(object.resources, ^(id item) { return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setResources:(id)value
{
    object.resources = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiResourceProxy*)item).object; });
}


- (id)attributes
{
    return [[[JpMasuidriveTiEvernoteapiNoteAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

- (void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiNoteAttributesProxy*)value).object;
}


- (id)tagNames
{
    return arrayMap(object.tagNames, ^(id item) { return item; });
}

- (void)setTagNames:(id)value
{
    object.tagNames = arrayMap(value, ^(id item) { return item; });
}



@end
