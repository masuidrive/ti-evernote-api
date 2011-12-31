#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiAdProxy : TiProxy {
@private
    EDAMAd* object;
}
@property (nonatomic, retain) EDAMAd* object;

- (id)initWithObject:(EDAMAd*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)id;
- (void)setId:(id)value;

- (id)width;
- (void)setWidth:(id)value;

- (id)height;
- (void)setHeight:(id)value;

- (id)advertiserName;
- (void)setAdvertiserName:(id)value;

- (id)imageUrl;
- (void)setImageUrl:(id)value;

- (id)destinationUrl;
- (void)setDestinationUrl:(id)value;

- (id)displaySeconds;
- (void)setDisplaySeconds:(id)value;

- (id)score;
- (void)setScore:(id)value;

- (id)image;
- (void)setImage:(id)value;

- (id)imageMime;
- (void)setImageMime:(id)value;

- (id)html;
- (void)setHtml:(id)value;

- (id)displayFrequency;
- (void)setDisplayFrequency:(id)value;

- (id)openInTrunk;
- (void)setOpenInTrunk:(id)value;

@end
