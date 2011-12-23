#import "JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNotesMetadataResultSpec)
-(id)createNotesMetadataResultSpec:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy alloc] initWithObject: [[[EDAMNotesMetadataResultSpec alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy
@synthesize object;


-(id)includeTitle
{
    return NUMBOOL(object.includeTitle);
}

-(void)setIncludeTitle:(id)value
{
    object.includeTitle = [value boolValue];
}


-(id)includeContentLength
{
    return NUMBOOL(object.includeContentLength);
}

-(void)setIncludeContentLength:(id)value
{
    object.includeContentLength = [value boolValue];
}


-(id)includeCreated
{
    return NUMBOOL(object.includeCreated);
}

-(void)setIncludeCreated:(id)value
{
    object.includeCreated = [value boolValue];
}


-(id)includeUpdated
{
    return NUMBOOL(object.includeUpdated);
}

-(void)setIncludeUpdated:(id)value
{
    object.includeUpdated = [value boolValue];
}


-(id)includeUpdateSequenceNum
{
    return NUMBOOL(object.includeUpdateSequenceNum);
}

-(void)setIncludeUpdateSequenceNum:(id)value
{
    object.includeUpdateSequenceNum = [value boolValue];
}


-(id)includeNotebookGuid
{
    return NUMBOOL(object.includeNotebookGuid);
}

-(void)setIncludeNotebookGuid:(id)value
{
    object.includeNotebookGuid = [value boolValue];
}


-(id)includeTagGuids
{
    return NUMBOOL(object.includeTagGuids);
}

-(void)setIncludeTagGuids:(id)value
{
    object.includeTagGuids = [value boolValue];
}


-(id)includeAttributes
{
    return NUMBOOL(object.includeAttributes);
}

-(void)setIncludeAttributes:(id)value
{
    object.includeAttributes = [value boolValue];
}


-(id)includeLargestResourceMime
{
    return NUMBOOL(object.includeLargestResourceMime);
}

-(void)setIncludeLargestResourceMime:(id)value
{
    object.includeLargestResourceMime = [value boolValue];
}


-(id)includeLargestResourceSize
{
    return NUMBOOL(object.includeLargestResourceSize);
}

-(void)setIncludeLargestResourceSize:(id)value
{
    object.includeLargestResourceSize = [value boolValue];
}



- (id)initWithObject:(EDAMNotesMetadataResultSpec*)object_
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
