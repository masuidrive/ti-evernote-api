#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMAdProxy : TiProxy {
@private
    EDAMAd* object;
}
@property (nonatomic, retain) EDAMAd* object;

- (id)initWithObject:(EDAMAd*)object_;
@end
