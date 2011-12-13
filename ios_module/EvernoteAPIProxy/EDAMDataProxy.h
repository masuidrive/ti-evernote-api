#import "TiProxy.h"
#import "Types.h"

@interface EDAMDataProxy : TiProxy {
@private
    EDAMData* object;
}
@property (nonatomic, retain) EDAMData* object;

- (id)initWithObject:(EDAMData*)object_;
@end
