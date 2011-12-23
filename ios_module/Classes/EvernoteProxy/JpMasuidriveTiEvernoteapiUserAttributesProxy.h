#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiUserAttributesProxy : TiProxy {
@private
    EDAMUserAttributes* object;
}
@property (nonatomic, retain) EDAMUserAttributes* object;

- (id)initWithObject:(EDAMUserAttributes*)object_;
@end
