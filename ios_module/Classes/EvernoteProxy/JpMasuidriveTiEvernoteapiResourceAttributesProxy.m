#import "JpMasuidriveTiEvernoteapiResourceAttributesProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMResourceAttributes)
- (id)createResourceAttributes:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMResourceAttributes* thrift_object = [[[EDAMResourceAttributes alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiResourceAttributesProxy* proxy = [[[JpMasuidriveTiEvernoteapiResourceAttributesProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"sourceURL"];
        if(val) {
            [proxy setSourceURL:val];
        }

        val = [args objectForKey:@"timestamp"];
        if(val) {
            [proxy setTimestamp:val];
        }

        val = [args objectForKey:@"latitude"];
        if(val) {
            [proxy setLatitude:val];
        }

        val = [args objectForKey:@"longitude"];
        if(val) {
            [proxy setLongitude:val];
        }

        val = [args objectForKey:@"altitude"];
        if(val) {
            [proxy setAltitude:val];
        }

        val = [args objectForKey:@"cameraMake"];
        if(val) {
            [proxy setCameraMake:val];
        }

        val = [args objectForKey:@"cameraModel"];
        if(val) {
            [proxy setCameraModel:val];
        }

        val = [args objectForKey:@"clientWillIndex"];
        if(val) {
            [proxy setClientWillIndex:val];
        }

        val = [args objectForKey:@"recoType"];
        if(val) {
            [proxy setRecoType:val];
        }

        val = [args objectForKey:@"fileName"];
        if(val) {
            [proxy setFileName:val];
        }

        val = [args objectForKey:@"attachment"];
        if(val) {
            [proxy setAttachment:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiResourceAttributesProxy
@synthesize object;

- (id)initWithObject:(EDAMResourceAttributes*)thrift_object
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
        object.sourceURL, @"sourceURL",
        NUMLONGLONG(object.timestamp), @"timestamp",
        NUMDOUBLE(object.latitude), @"latitude",
        NUMDOUBLE(object.longitude), @"longitude",
        NUMDOUBLE(object.altitude), @"altitude",
        object.cameraMake, @"cameraMake",
        object.cameraModel, @"cameraModel",
        NUMBOOL(object.clientWillIndex), @"clientWillIndex",
        object.recoType, @"recoType",
        object.fileName, @"fileName",
        NUMBOOL(object.attachment), @"attachment",
    nil];
}


- (id)sourceURL
{
    return object.sourceURL;
}

- (void)setSourceURL:(id)value
{
    object.sourceURL = [TiUtils stringValue:value];
}


- (id)timestamp
{
    return NUMLONGLONG(object.timestamp);
}

- (void)setTimestamp:(id)value
{
    object.timestamp = [value longLongValue];
}


- (id)latitude
{
    return NUMDOUBLE(object.latitude);
}

- (void)setLatitude:(id)value
{
    object.latitude = [value doubleValue];
}


- (id)longitude
{
    return NUMDOUBLE(object.longitude);
}

- (void)setLongitude:(id)value
{
    object.longitude = [value doubleValue];
}


- (id)altitude
{
    return NUMDOUBLE(object.altitude);
}

- (void)setAltitude:(id)value
{
    object.altitude = [value doubleValue];
}


- (id)cameraMake
{
    return object.cameraMake;
}

- (void)setCameraMake:(id)value
{
    object.cameraMake = [TiUtils stringValue:value];
}


- (id)cameraModel
{
    return object.cameraModel;
}

- (void)setCameraModel:(id)value
{
    object.cameraModel = [TiUtils stringValue:value];
}


- (id)clientWillIndex
{
    return NUMBOOL(object.clientWillIndex);
}

- (void)setClientWillIndex:(id)value
{
    object.clientWillIndex = [value boolValue];
}


- (id)recoType
{
    return object.recoType;
}

- (void)setRecoType:(id)value
{
    object.recoType = [TiUtils stringValue:value];
}


- (id)fileName
{
    return object.fileName;
}

- (void)setFileName:(id)value
{
    object.fileName = [TiUtils stringValue:value];
}


- (id)attachment
{
    return NUMBOOL(object.attachment);
}

- (void)setAttachment:(id)value
{
    object.attachment = [value boolValue];
}



@end
