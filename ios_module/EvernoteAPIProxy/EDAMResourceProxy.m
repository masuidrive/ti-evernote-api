#import "EDAMResourceProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"


#import "EDAMDataProxy.h"

#import "EDAMResourceAttributesProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMResource)
-(id)createResource:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMResource)
-(id)createResource:(id)args
{
    return [[[EDAMResourceProxy alloc] initWithObject: [[[EDAMResource alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMResourceProxy
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
    return [[[EDAMDataProxy alloc] initWithObject: object.data] autorelease];
}

-(void)setData:(id)value
{
    object.data = ((EDAMDataProxy*)value).object;
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
    return [[[EDAMDataProxy alloc] initWithObject: object.recognition] autorelease];
}

-(void)setRecognition:(id)value
{
    object.recognition = ((EDAMDataProxy*)value).object;
}

-(id)attributes
{
    return [[[EDAMResourceAttributesProxy alloc] initWithObject: object.attributes] autorelease];
}

-(void)setAttributes:(id)value
{
    object.attributes = ((EDAMResourceAttributesProxy*)value).object;
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
    return [[[EDAMDataProxy alloc] initWithObject: object.alternateData] autorelease];
}

-(void)setAlternateData:(id)value
{
    object.alternateData = ((EDAMDataProxy*)value).object;
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
