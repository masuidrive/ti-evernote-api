#import "TiProxy.h"
#import "Types.h"

@interface EDAMAccountingProxy : TiProxy {
@private
    EDAMAccounting* object;
}
@property (nonatomic, retain) EDAMAccounting* object;

- (id)initWithObject:(EDAMAccounting*)object_;
@end
