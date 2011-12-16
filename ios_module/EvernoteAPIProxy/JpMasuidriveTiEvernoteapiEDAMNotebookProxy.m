#import "JpMasuidriveTiEvernoteapiEDAMNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiEDAMPublishingProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNotebook)
-(id)createNotebook:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiEDAMNotebookProxy alloc] initWithObject: [[[EDAMNotebook alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiEDAMNotebookProxy
@synthesize object;


-(id)guid
{
    return object.guid;
}

-(void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


-(id)name
{
    return object.name;
}

-(void)setName:(id)value
{
    object.name = [TiUtils stringValue:value];
}


-(id)updateSequenceNum
{
    return NUMINT(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value integerValue];
}


-(id)defaultNotebook
{
    return NUMBOOL(object.defaultNotebook);
}

-(void)setDefaultNotebook:(id)value
{
    object.defaultNotebook = [value boolValue];
}


-(id)serviceCreated
{
    return NUMLONG(object.serviceCreated);
}

-(void)setServiceCreated:(id)value
{
    object.serviceCreated = [value longValue];
}


-(id)serviceUpdated
{
    return NUMLONG(object.serviceUpdated);
}

-(void)setServiceUpdated:(id)value
{
    object.serviceUpdated = [value longValue];
}


-(id)publishing
{
    return [[[JpMasuidriveTiEvernoteapiEDAMPublishingProxy alloc] initWithObject: object.publishing] autorelease];
}

-(void)setPublishing:(id)value
{
    object.publishing = ((JpMasuidriveTiEvernoteapiEDAMPublishingProxy*)value).object;
}


-(id)published
{
    return NUMBOOL(object.published);
}

-(void)setPublished:(id)value
{
    object.published = [value boolValue];
}


-(id)stack
{
    return object.stack;
}

-(void)setStack:(id)value
{
    object.stack = [TiUtils stringValue:value];
}


-(id)sharedNotebookIds
{
    return arrayMap(object.sharedNotebookIds, ^(id item) { return item; });
}

-(void)setSharedNotebookIds:(id)value
{
    object.sharedNotebookIds = arrayMap(value, ^(id item) { return item; });
}



- (id)initWithObject:(EDAMNotebook*)object_
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
