#import "TiProxy.h"
#import "UserStore.h"

@interface EDAMPublicUserInfoProxy : TiProxy {
@private
    EDAMPublicUserInfo* object;
}
@property (nonatomic, retain) EDAMPublicUserInfo* object;

- (id)initWithObject:(EDAMPublicUserInfo*)object_;
@end
