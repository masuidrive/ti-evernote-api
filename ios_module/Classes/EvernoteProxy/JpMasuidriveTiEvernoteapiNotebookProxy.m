#import "JpMasuidriveTiEvernoteapiNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiPublishingProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNotebook)
- (id)createNotebook:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNotebook* thrift_object = [[[EDAMNotebook alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNotebookProxy* proxy = [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"guid"];
        if(val) {
            [proxy setGuid:val];
        }

        val = [args objectForKey:@"name"];
        if(val) {
            [proxy setName:val];
        }

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

        val = [args objectForKey:@"defaultNotebook"];
        if(val) {
            [proxy setDefaultNotebook:val];
        }

        val = [args objectForKey:@"serviceCreated"];
        if(val) {
            [proxy setServiceCreated:val];
        }

        val = [args objectForKey:@"serviceUpdated"];
        if(val) {
            [proxy setServiceUpdated:val];
        }

        val = [args objectForKey:@"publishing"];
        if(val) {
            [proxy setPublishing:val];
        }

        val = [args objectForKey:@"published"];
        if(val) {
            [proxy setPublished:val];
        }

        val = [args objectForKey:@"stack"];
        if(val) {
            [proxy setStack:val];
        }

        val = [args objectForKey:@"sharedNotebookIds"];
        if(val) {
            [proxy setSharedNotebookIds:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNotebookProxy
@synthesize object;

- (id)initWithObject:(EDAMNotebook*)thrift_object
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
        object.name, @"name",
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
        NUMBOOL(object.defaultNotebook), @"defaultNotebook",
        NUMLONGLONG(object.serviceCreated), @"serviceCreated",
        NUMLONGLONG(object.serviceUpdated), @"serviceUpdated",
        [[[JpMasuidriveTiEvernoteapiPublishingProxy alloc] initWithObject: object.publishing] autorelease], @"publishing",
        NUMBOOL(object.published), @"published",
        object.stack, @"stack",
        arrayMap(object.sharedNotebookIds, ^(id item) { return item; }), @"sharedNotebookIds",
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


- (id)name
{
    return object.name;
}

- (void)setName:(id)value
{
    object.name = [TiUtils stringValue:value];
}


- (id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

- (void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}


- (id)defaultNotebook
{
    return NUMBOOL(object.defaultNotebook);
}

- (void)setDefaultNotebook:(id)value
{
    object.defaultNotebook = [value boolValue];
}


- (id)serviceCreated
{
    return NUMLONGLONG(object.serviceCreated);
}

- (void)setServiceCreated:(id)value
{
    object.serviceCreated = [value longLongValue];
}


- (id)serviceUpdated
{
    return NUMLONGLONG(object.serviceUpdated);
}

- (void)setServiceUpdated:(id)value
{
    object.serviceUpdated = [value longLongValue];
}


- (id)publishing
{
    return [[[JpMasuidriveTiEvernoteapiPublishingProxy alloc] initWithObject: object.publishing] autorelease];
}

- (void)setPublishing:(id)value
{
    object.publishing = ((JpMasuidriveTiEvernoteapiPublishingProxy*)value).object;
}


- (id)published
{
    return NUMBOOL(object.published);
}

- (void)setPublished:(id)value
{
    object.published = [value boolValue];
}


- (id)stack
{
    return object.stack;
}

- (void)setStack:(id)value
{
    object.stack = [TiUtils stringValue:value];
}


- (id)sharedNotebookIds
{
    return arrayMap(object.sharedNotebookIds, ^(id item) { return item; });
}

- (void)setSharedNotebookIds:(id)value
{
    object.sharedNotebookIds = arrayMap(value, ^(id item) { return item; });
}



@end
