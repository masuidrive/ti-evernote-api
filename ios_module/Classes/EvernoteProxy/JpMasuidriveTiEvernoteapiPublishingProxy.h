#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiPublishingProxy : TiProxy {
@private
    EDAMPublishing* object;
}
@property (nonatomic, retain) EDAMPublishing* object;

- (id)initWithObject:(EDAMPublishing*)object_;
@end
