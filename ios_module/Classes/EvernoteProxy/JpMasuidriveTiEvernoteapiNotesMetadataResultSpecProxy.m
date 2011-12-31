#import "JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNotesMetadataResultSpec)
- (id)createNotesMetadataResultSpec:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNotesMetadataResultSpec* thrift_object = [[[EDAMNotesMetadataResultSpec alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy* proxy = [[[JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"includeTitle"];
        if(val) {
            [proxy setIncludeTitle:val];
        }

        val = [args objectForKey:@"includeContentLength"];
        if(val) {
            [proxy setIncludeContentLength:val];
        }

        val = [args objectForKey:@"includeCreated"];
        if(val) {
            [proxy setIncludeCreated:val];
        }

        val = [args objectForKey:@"includeUpdated"];
        if(val) {
            [proxy setIncludeUpdated:val];
        }

        val = [args objectForKey:@"includeUpdateSequenceNum"];
        if(val) {
            [proxy setIncludeUpdateSequenceNum:val];
        }

        val = [args objectForKey:@"includeNotebookGuid"];
        if(val) {
            [proxy setIncludeNotebookGuid:val];
        }

        val = [args objectForKey:@"includeTagGuids"];
        if(val) {
            [proxy setIncludeTagGuids:val];
        }

        val = [args objectForKey:@"includeAttributes"];
        if(val) {
            [proxy setIncludeAttributes:val];
        }

        val = [args objectForKey:@"includeLargestResourceMime"];
        if(val) {
            [proxy setIncludeLargestResourceMime:val];
        }

        val = [args objectForKey:@"includeLargestResourceSize"];
        if(val) {
            [proxy setIncludeLargestResourceSize:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy
@synthesize object;

- (id)initWithObject:(EDAMNotesMetadataResultSpec*)thrift_object
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
        NUMBOOL(object.includeTitle), @"includeTitle",
        NUMBOOL(object.includeContentLength), @"includeContentLength",
        NUMBOOL(object.includeCreated), @"includeCreated",
        NUMBOOL(object.includeUpdated), @"includeUpdated",
        NUMBOOL(object.includeUpdateSequenceNum), @"includeUpdateSequenceNum",
        NUMBOOL(object.includeNotebookGuid), @"includeNotebookGuid",
        NUMBOOL(object.includeTagGuids), @"includeTagGuids",
        NUMBOOL(object.includeAttributes), @"includeAttributes",
        NUMBOOL(object.includeLargestResourceMime), @"includeLargestResourceMime",
        NUMBOOL(object.includeLargestResourceSize), @"includeLargestResourceSize",
    nil];
}


- (id)includeTitle
{
    return NUMBOOL(object.includeTitle);
}

- (void)setIncludeTitle:(id)value
{
    object.includeTitle = [value boolValue];
}


- (id)includeContentLength
{
    return NUMBOOL(object.includeContentLength);
}

- (void)setIncludeContentLength:(id)value
{
    object.includeContentLength = [value boolValue];
}


- (id)includeCreated
{
    return NUMBOOL(object.includeCreated);
}

- (void)setIncludeCreated:(id)value
{
    object.includeCreated = [value boolValue];
}


- (id)includeUpdated
{
    return NUMBOOL(object.includeUpdated);
}

- (void)setIncludeUpdated:(id)value
{
    object.includeUpdated = [value boolValue];
}


- (id)includeUpdateSequenceNum
{
    return NUMBOOL(object.includeUpdateSequenceNum);
}

- (void)setIncludeUpdateSequenceNum:(id)value
{
    object.includeUpdateSequenceNum = [value boolValue];
}


- (id)includeNotebookGuid
{
    return NUMBOOL(object.includeNotebookGuid);
}

- (void)setIncludeNotebookGuid:(id)value
{
    object.includeNotebookGuid = [value boolValue];
}


- (id)includeTagGuids
{
    return NUMBOOL(object.includeTagGuids);
}

- (void)setIncludeTagGuids:(id)value
{
    object.includeTagGuids = [value boolValue];
}


- (id)includeAttributes
{
    return NUMBOOL(object.includeAttributes);
}

- (void)setIncludeAttributes:(id)value
{
    object.includeAttributes = [value boolValue];
}


- (id)includeLargestResourceMime
{
    return NUMBOOL(object.includeLargestResourceMime);
}

- (void)setIncludeLargestResourceMime:(id)value
{
    object.includeLargestResourceMime = [value boolValue];
}


- (id)includeLargestResourceSize
{
    return NUMBOOL(object.includeLargestResourceSize);
}

- (void)setIncludeLargestResourceSize:(id)value
{
    object.includeLargestResourceSize = [value boolValue];
}



@end
