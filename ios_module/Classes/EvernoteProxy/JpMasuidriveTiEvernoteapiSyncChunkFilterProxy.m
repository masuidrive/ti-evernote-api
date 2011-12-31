#import "JpMasuidriveTiEvernoteapiSyncChunkFilterProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSyncChunkFilter)
- (id)createSyncChunkFilter:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMSyncChunkFilter* thrift_object = [[[EDAMSyncChunkFilter alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiSyncChunkFilterProxy* proxy = [[[JpMasuidriveTiEvernoteapiSyncChunkFilterProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"includeNotes"];
        if(val) {
            [proxy setIncludeNotes:val];
        }

        val = [args objectForKey:@"includeNoteResources"];
        if(val) {
            [proxy setIncludeNoteResources:val];
        }

        val = [args objectForKey:@"includeNoteAttributes"];
        if(val) {
            [proxy setIncludeNoteAttributes:val];
        }

        val = [args objectForKey:@"includeNotebooks"];
        if(val) {
            [proxy setIncludeNotebooks:val];
        }

        val = [args objectForKey:@"includeTags"];
        if(val) {
            [proxy setIncludeTags:val];
        }

        val = [args objectForKey:@"includeSearches"];
        if(val) {
            [proxy setIncludeSearches:val];
        }

        val = [args objectForKey:@"includeResources"];
        if(val) {
            [proxy setIncludeResources:val];
        }

        val = [args objectForKey:@"includeLinkedNotebooks"];
        if(val) {
            [proxy setIncludeLinkedNotebooks:val];
        }

        val = [args objectForKey:@"includeExpunged"];
        if(val) {
            [proxy setIncludeExpunged:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiSyncChunkFilterProxy
@synthesize object;

- (id)initWithObject:(EDAMSyncChunkFilter*)thrift_object
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
        NUMBOOL(object.includeNotes), @"includeNotes",
        NUMBOOL(object.includeNoteResources), @"includeNoteResources",
        NUMBOOL(object.includeNoteAttributes), @"includeNoteAttributes",
        NUMBOOL(object.includeNotebooks), @"includeNotebooks",
        NUMBOOL(object.includeTags), @"includeTags",
        NUMBOOL(object.includeSearches), @"includeSearches",
        NUMBOOL(object.includeResources), @"includeResources",
        NUMBOOL(object.includeLinkedNotebooks), @"includeLinkedNotebooks",
        NUMBOOL(object.includeExpunged), @"includeExpunged",
    nil];
}


- (id)includeNotes
{
    return NUMBOOL(object.includeNotes);
}

- (void)setIncludeNotes:(id)value
{
    object.includeNotes = [value boolValue];
}


- (id)includeNoteResources
{
    return NUMBOOL(object.includeNoteResources);
}

- (void)setIncludeNoteResources:(id)value
{
    object.includeNoteResources = [value boolValue];
}


- (id)includeNoteAttributes
{
    return NUMBOOL(object.includeNoteAttributes);
}

- (void)setIncludeNoteAttributes:(id)value
{
    object.includeNoteAttributes = [value boolValue];
}


- (id)includeNotebooks
{
    return NUMBOOL(object.includeNotebooks);
}

- (void)setIncludeNotebooks:(id)value
{
    object.includeNotebooks = [value boolValue];
}


- (id)includeTags
{
    return NUMBOOL(object.includeTags);
}

- (void)setIncludeTags:(id)value
{
    object.includeTags = [value boolValue];
}


- (id)includeSearches
{
    return NUMBOOL(object.includeSearches);
}

- (void)setIncludeSearches:(id)value
{
    object.includeSearches = [value boolValue];
}


- (id)includeResources
{
    return NUMBOOL(object.includeResources);
}

- (void)setIncludeResources:(id)value
{
    object.includeResources = [value boolValue];
}


- (id)includeLinkedNotebooks
{
    return NUMBOOL(object.includeLinkedNotebooks);
}

- (void)setIncludeLinkedNotebooks:(id)value
{
    object.includeLinkedNotebooks = [value boolValue];
}


- (id)includeExpunged
{
    return NUMBOOL(object.includeExpunged);
}

- (void)setIncludeExpunged:(id)value
{
    object.includeExpunged = [value boolValue];
}



@end
