#import "EDAMSyncChunkFilterProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule(EDAMSyncChunkFilter)
-(id)createSyncChunkFilter:(id)args
{
    return [[[EDAMSyncChunkFilterProxy alloc] initWithObject: [[[EDAMSyncChunkFilter alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMSyncChunkFilterProxy
@synthesize object;


-(id)includeNotes
{
    return NUMBOOL(object.includeNotes);
}

-(void)setIncludeNotes:(id)value
{
    object.includeNotes = [value boolValue];
}


-(id)includeNoteResources
{
    return NUMBOOL(object.includeNoteResources);
}

-(void)setIncludeNoteResources:(id)value
{
    object.includeNoteResources = [value boolValue];
}


-(id)includeNoteAttributes
{
    return NUMBOOL(object.includeNoteAttributes);
}

-(void)setIncludeNoteAttributes:(id)value
{
    object.includeNoteAttributes = [value boolValue];
}


-(id)includeNotebooks
{
    return NUMBOOL(object.includeNotebooks);
}

-(void)setIncludeNotebooks:(id)value
{
    object.includeNotebooks = [value boolValue];
}


-(id)includeTags
{
    return NUMBOOL(object.includeTags);
}

-(void)setIncludeTags:(id)value
{
    object.includeTags = [value boolValue];
}


-(id)includeSearches
{
    return NUMBOOL(object.includeSearches);
}

-(void)setIncludeSearches:(id)value
{
    object.includeSearches = [value boolValue];
}


-(id)includeResources
{
    return NUMBOOL(object.includeResources);
}

-(void)setIncludeResources:(id)value
{
    object.includeResources = [value boolValue];
}


-(id)includeLinkedNotebooks
{
    return NUMBOOL(object.includeLinkedNotebooks);
}

-(void)setIncludeLinkedNotebooks:(id)value
{
    object.includeLinkedNotebooks = [value boolValue];
}


-(id)includeExpunged
{
    return NUMBOOL(object.includeExpunged);
}

-(void)setIncludeExpunged:(id)value
{
    object.includeExpunged = [value boolValue];
}



- (id)initWithObject:(EDAMSyncChunkFilter*)object_
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
