#import "TiProxy.h"
#import "Types.h"

@interface EDAMUserProxy : TiProxy {
@private
    EDAMUser* object;
}
@property (nonatomic, retain) EDAMUser* object;

- (id)initWithObject:(EDAMUser*)object_;
@end
