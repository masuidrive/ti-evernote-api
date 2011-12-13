#import "EDAMNoteProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"


#import "EDAMResourceProxy.h"

#import "EDAMNoteAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMNote)
-(id)createNote:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMNote)
-(id)createNote:(id)args
{
    return [[[EDAMNoteProxy alloc] initWithObject: [[[EDAMNote alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMNoteProxy
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
    return NUMINT(object.contentLength);
}

-(void)setContentLength:(id)value
{
    object.contentLength = [value integerValue];
}

-(id)created
{
    return NUMLONG(object.created);
}

-(void)setCreated:(id)value
{
    object.created = [value longValue];
}

-(id)updated
{
    return NUMLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longValue];
}

-(id)deleted
{
    return NUMLONG(object.deleted);
}

-(void)setDeleted:(id)value
{
    object.deleted = [value longValue];
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
    return NUMINT(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value integerValue];
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
    return arrayMap(object.resources, ^(id item) { return [[[EDAMResourceProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setResources:(id)value
{
    object.resources = arrayMap(value, ^(id item) { return ((EDAMResourceProxy*)item).object; });
}

-(id)attributes
{
    return [[[EDAMNoteAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

-(void)setAttributes:(id)value
{
    object.attributes = ((EDAMNoteAttributesProxy*)value).object;
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
