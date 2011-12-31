#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiPublishingProxy : TiProxy {
@private
    EDAMPublishing* object;
}
@property (nonatomic, retain) EDAMPublishing* object;

- (id)initWithObject:(EDAMPublishing*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)uri;
- (void)setUri:(id)value;

- (id)order;
- (void)setOrder:(id)value;

- (id)ascending;
- (void)setAscending:(id)value;

- (id)publicDescription;
- (void)setPublicDescription:(id)value;

@end
