#import "EDAMResourceAttributesProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule(EDAMResourceAttributes)
-(id)createResourceAttributes:(id)args
{
    return [[[EDAMResourceAttributesProxy alloc] initWithObject: [[[EDAMResourceAttributes alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMResourceAttributesProxy
@synthesize object;


-(id)sourceURL
{
    return object.sourceURL;
}

-(void)setSourceURL:(id)value
{
    object.sourceURL = [TiUtils stringValue:value];
}


-(id)timestamp
{
    return NUMLONG(object.timestamp);
}

-(void)setTimestamp:(id)value
{
    object.timestamp = [value longValue];
}


-(id)latitude
{
    return NUMDOUBLE(object.latitude);
}

-(void)setLatitude:(id)value
{
    object.latitude = [value doubleValue];
}


-(id)longitude
{
    return NUMDOUBLE(object.longitude);
}

-(void)setLongitude:(id)value
{
    object.longitude = [value doubleValue];
}


-(id)altitude
{
    return NUMDOUBLE(object.altitude);
}

-(void)setAltitude:(id)value
{
    object.altitude = [value doubleValue];
}


-(id)cameraMake
{
    return object.cameraMake;
}

-(void)setCameraMake:(id)value
{
    object.cameraMake = [TiUtils stringValue:value];
}


-(id)cameraModel
{
    return object.cameraModel;
}

-(void)setCameraModel:(id)value
{
    object.cameraModel = [TiUtils stringValue:value];
}


-(id)clientWillIndex
{
    return NUMBOOL(object.clientWillIndex);
}

-(void)setClientWillIndex:(id)value
{
    object.clientWillIndex = [value boolValue];
}


-(id)recoType
{
    return object.recoType;
}

-(void)setRecoType:(id)value
{
    object.recoType = [TiUtils stringValue:value];
}


-(id)fileName
{
    return object.fileName;
}

-(void)setFileName:(id)value
{
    object.fileName = [TiUtils stringValue:value];
}


-(id)attachment
{
    return NUMBOOL(object.attachment);
}

-(void)setAttachment:(id)value
{
    object.attachment = [value boolValue];
}



- (id)initWithObject:(EDAMResourceAttributes*)object_
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
