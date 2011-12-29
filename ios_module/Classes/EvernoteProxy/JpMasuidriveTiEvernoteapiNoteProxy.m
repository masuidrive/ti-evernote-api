#import "JpMasuidriveTiEvernoteapiNoteProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiResourceProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNote)
-(id)createNote:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: [[[EDAMNote alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteProxy
@synthesize object;


-(id)guid
{
    return object.guid;
}

-(void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


-(id)title
{
    return object.title;
}

-(void)setTitle:(id)value
{
    object.title = [TiUtils stringValue:value];
}


-(id)content
{
    return object.content;
}

-(void)setContent:(id)value
{
    object.content = [TiUtils stringValue:value];
}


-(id)contentHash
{
    return [[[TiBlob alloc] initWithData:object.contentHash mimetype:@"application/octet-stream"] autorelease];
}

-(void)setContentHash:(id)value
{
    object.contentHash = [value data];
}


-(id)contentLength
{
    return NUMLONG(object.contentLength);
}

-(void)setContentLength:(id)value
{
    object.contentLength = [value longValue];
}


-(id)created
{
    return NUMLONGLONG(object.created);
}

-(void)setCreated:(id)value
{
    object.created = [value longLongValue];
}


-(id)updated
{
    return NUMLONGLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longLongValue];
}


-(id)deleted
{
    return NUMLONGLONG(object.deleted);
}

-(void)setDeleted:(id)value
{
    object.deleted = [value longLongValue];
}


-(id)active
{
    return NUMBOOL(object.active);
}

-(void)setActive:(id)value
{
    object.active = [value boolValue];
}


-(id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}


-(id)notebookGuid
{
    return object.notebookGuid;
}

-(void)setNotebookGuid:(id)value
{
    object.notebookGuid = [TiUtils stringValue:value];
}


-(id)tagGuids
{
    return arrayMap(object.tagGuids, ^(id item) { return item; });
}

-(void)setTagGuids:(id)value
{
    object.tagGuids = arrayMap(value, ^(id item) { return item; });
}


-(id)resources
{
    return arrayMap(object.resources, ^(id item) { return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setResources:(id)value
{
    object.resources = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiResourceProxy*)item).object; });
}


-(id)attributes
{
    return [[[JpMasuidriveTiEvernoteapiNoteAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

-(void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiNoteAttributesProxy*)value).object;
}


-(id)tagNames
{
    return arrayMap(object.tagNames, ^(id item) { return item; });
}

-(void)setTagNames:(id)value
{
    object.tagNames = arrayMap(value, ^(id item) { return item; });
}



- (id)initWithObject:(EDAMNote*)object_
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
