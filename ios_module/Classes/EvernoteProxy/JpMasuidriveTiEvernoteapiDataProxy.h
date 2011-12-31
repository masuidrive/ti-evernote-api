#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiDataProxy : TiProxy {
@private
    EDAMData* object;
}
@property (nonatomic, retain) EDAMData* object;

- (id)initWithObject:(EDAMData*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)bodyHash;
- (void)setBodyHash:(id)value;

- (id)size;
- (void)setSize:(id)value;

- (id)body;
- (void)setBody:(id)value;

@end
