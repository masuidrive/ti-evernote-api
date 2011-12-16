#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMTagProxy : TiProxy {
@private
    EDAMTag* object;
}
@property (nonatomic, retain) EDAMTag* object;

- (id)initWithObject:(EDAMTag*)object_;
@end
