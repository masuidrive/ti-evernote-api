#import "TiProxy.h"
#import "UserStore.h"

@interface EDAMAuthenticationResultProxy : TiProxy {
@private
    EDAMAuthenticationResult* object;
}
@property (nonatomic, retain) EDAMAuthenticationResult* object;

- (id)initWithObject:(EDAMAuthenticationResult*)object_;
@end
