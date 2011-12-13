#import "TiProxy.h"
#import "Types.h"

@interface EDAMUserAttributesProxy : TiProxy {
@private
    EDAMUserAttributes* object;
}
@property (nonatomic, retain) EDAMUserAttributes* object;

- (id)initWithObject:(EDAMUserAttributes*)object_;
@end
