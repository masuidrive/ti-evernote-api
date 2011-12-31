#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiResourceAttributesProxy : TiProxy {
@private
    EDAMResourceAttributes* object;
}
@property (nonatomic, retain) EDAMResourceAttributes* object;

- (id)initWithObject:(EDAMResourceAttributes*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)sourceURL;
- (void)setSourceURL:(id)value;

- (id)timestamp;
- (void)setTimestamp:(id)value;

- (id)latitude;
- (void)setLatitude:(id)value;

- (id)longitude;
- (void)setLongitude:(id)value;

- (id)altitude;
- (void)setAltitude:(id)value;

- (id)cameraMake;
- (void)setCameraMake:(id)value;

- (id)cameraModel;
- (void)setCameraModel:(id)value;

- (id)clientWillIndex;
- (void)setClientWillIndex:(id)value;

- (id)recoType;
- (void)setRecoType:(id)value;

- (id)fileName;
- (void)setFileName:(id)value;

- (id)attachment;
- (void)setAttachment:(id)value;

@end
