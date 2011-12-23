#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiTagProxy : TiProxy {
@private
    EDAMTag* object;
}
@property (nonatomic, retain) EDAMTag* object;

- (id)initWithObject:(EDAMTag*)object_;
@end
