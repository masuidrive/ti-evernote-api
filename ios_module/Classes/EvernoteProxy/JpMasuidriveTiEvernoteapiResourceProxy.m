#import "JpMasuidriveTiEvernoteapiResourceProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiDataProxy.h"
#import "JpMasuidriveTiEvernoteapiResourceAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMResource)
- (id)createResource:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMResource* thrift_object = [[[EDAMResource alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiResourceProxy* proxy = [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"guid"];
        if(val) {
            [proxy setGuid:val];
        }

        val = [args objectForKey:@"noteGuid"];
        if(val) {
            [proxy setNoteGuid:val];
        }

        val = [args objectForKey:@"data"];
        if(val) {
            [proxy setData:val];
        }

        val = [args objectForKey:@"mime"];
        if(val) {
            [proxy setMime:val];
        }

        val = [args objectForKey:@"width"];
        if(val) {
            [proxy setWidth:val];
        }

        val = [args objectForKey:@"height"];
        if(val) {
            [proxy setHeight:val];
        }

        val = [args objectForKey:@"duration"];
        if(val) {
            [proxy setDuration:val];
        }

        val = [args objectForKey:@"active"];
        if(val) {
            [proxy setActive:val];
        }

        val = [args objectForKey:@"recognition"];
        if(val) {
            [proxy setRecognition:val];
        }

        val = [args objectForKey:@"attributes"];
        if(val) {
            [proxy setAttributes:val];
        }

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

        val = [args objectForKey:@"alternateData"];
        if(val) {
            [proxy setAlternateData:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiResourceProxy
@synthesize object;

- (id)initWithObject:(EDAMResource*)thrift_object
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
        object.noteGuid, @"noteGuid",
        [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.data] autorelease], @"data",
        object.mime, @"mime",
        NUMINT(object.width), @"width",
        NUMINT(object.height), @"height",
        NUMINT(object.duration), @"duration",
        NUMBOOL(object.active), @"active",
        [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.recognition] autorelease], @"recognition",
        [[[JpMasuidriveTiEvernoteapiResourceAttributesProxy alloc] initWithObject: object.attributes] autorelease], @"attributes",
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
        [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.alternateData] autorelease], @"alternateData",
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


- (id)noteGuid
{
    return object.noteGuid;
}

- (void)setNoteGuid:(id)value
{
    object.noteGuid = [TiUtils stringValue:value];
}


- (id)data
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.data] autorelease];
}

- (void)setData:(id)value
{
    object.data = ((JpMasuidriveTiEvernoteapiDataProxy*)value).object;
}


- (id)mime
{
    return object.mime;
}

- (void)setMime:(id)value
{
    object.mime = [TiUtils stringValue:value];
}


- (id)width
{
    return NUMINT(object.width);
}

- (void)setWidth:(id)value
{
    object.width = [value integerValue];
}


- (id)height
{
    return NUMINT(object.height);
}

- (void)setHeight:(id)value
{
    object.height = [value integerValue];
}


- (id)duration
{
    return NUMINT(object.duration);
}

- (void)setDuration:(id)value
{
    object.duration = [value integerValue];
}


- (id)active
{
    return NUMBOOL(object.active);
}

- (void)setActive:(id)value
{
    object.active = [value boolValue];
}


- (id)recognition
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.recognition] autorelease];
}

- (void)setRecognition:(id)value
{
    object.recognition = ((JpMasuidriveTiEvernoteapiDataProxy*)value).object;
}


- (id)attributes
{
    return [[[JpMasuidriveTiEvernoteapiResourceAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

- (void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiResourceAttributesProxy*)value).object;
}


- (id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

- (void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}


- (id)alternateData
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.alternateData] autorelease];
}

- (void)setAlternateData:(id)value
{
    object.alternateData = ((JpMasuidriveTiEvernoteapiDataProxy*)value).object;
}



@end
