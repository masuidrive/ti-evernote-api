#import "TiProxy.h"
#import "UserStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMPublicUserInfoProxy : TiProxy {
@private
    EDAMPublicUserInfo* object;
}
@property (nonatomic, retain) EDAMPublicUserInfo* object;

- (id)initWithObject:(EDAMPublicUserInfo*)object_;
@end
