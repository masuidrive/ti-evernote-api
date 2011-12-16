#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMPublishingProxy : TiProxy {
@private
    EDAMPublishing* object;
}
@property (nonatomic, retain) EDAMPublishing* object;

- (id)initWithObject:(EDAMPublishing*)object_;
@end
