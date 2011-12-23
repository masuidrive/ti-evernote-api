#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiUserProxy : TiProxy {
@private
    EDAMUser* object;
}
@property (nonatomic, retain) EDAMUser* object;

- (id)initWithObject:(EDAMUser*)object_;
@end
