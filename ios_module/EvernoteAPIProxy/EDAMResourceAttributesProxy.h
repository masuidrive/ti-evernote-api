#import "TiProxy.h"
#import "Types.h"

@interface EDAMResourceAttributesProxy : TiProxy {
@private
    EDAMResourceAttributes* object;
}
@property (nonatomic, retain) EDAMResourceAttributes* object;

- (id)initWithObject:(EDAMResourceAttributes*)object_;
@end
