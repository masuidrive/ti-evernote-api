#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMResourceProxy : TiProxy {
@private
    EDAMResource* object;
}
@property (nonatomic, retain) EDAMResource* object;

- (id)initWithObject:(EDAMResource*)object_;
@end
