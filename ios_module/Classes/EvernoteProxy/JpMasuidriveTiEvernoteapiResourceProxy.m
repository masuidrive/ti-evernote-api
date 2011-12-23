#import "JpMasuidriveTiEvernoteapiResourceProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiDataProxy.h"
#import "JpMasuidriveTiEvernoteapiResourceAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMResource)
-(id)createResource:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: [[[EDAMResource alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiResourceProxy
@synthesize object;


-(id)guid
{
    return object.guid;
}

-(void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


-(id)noteGuid
{
    return object.noteGuid;
}

-(void)setNoteGuid:(id)value
{
    object.noteGuid = [TiUtils stringValue:value];
}


-(id)data
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.data] autorelease];
}

-(void)setData:(id)value
{
    object.data = ((JpMasuidriveTiEvernoteapiDataProxy*)value).object;
}


-(id)mime
{
    return object.mime;
}

-(void)setMime:(id)value
{
    object.mime = [TiUtils stringValue:value];
}


-(id)width
{
    return NUMINT(object.width);
}

-(void)setWidth:(id)value
{
    object.width = [value integerValue];
}


-(id)height
{
    return NUMINT(object.height);
}

-(void)setHeight:(id)value
{
    object.height = [value integerValue];
}


-(id)duration
{
    return NUMINT(object.duration);
}

-(void)setDuration:(id)value
{
    object.duration = [value integerValue];
}


-(id)active
{
    return NUMBOOL(object.active);
}

-(void)setActive:(id)value
{
    object.active = [value boolValue];
}


-(id)recognition
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.recognition] autorelease];
}

-(void)setRecognition:(id)value
{
    object.recognition = ((JpMasuidriveTiEvernoteapiDataProxy*)value).object;
}


-(id)attributes
{
    return [[[JpMasuidriveTiEvernoteapiResourceAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

-(void)setAttributes:(id)value
{
    object.attributes = ((JpMasuidriveTiEvernoteapiResourceAttributesProxy*)value).object;
}


-(id)updateSequenceNum
{
    return NUMINT(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value integerValue];
}


-(id)alternateData
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: object.alternateData] autorelease];
}

-(void)setAlternateData:(id)value
{
    object.alternateData = ((JpMasuidriveTiEvernoteapiDataProxy*)value).object;
}



- (id)initWithObject:(EDAMResource*)object_
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
