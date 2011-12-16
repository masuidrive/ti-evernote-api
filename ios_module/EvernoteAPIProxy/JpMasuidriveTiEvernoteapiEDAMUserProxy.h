#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMUserProxy : TiProxy {
@private
    EDAMUser* object;
}
@property (nonatomic, retain) EDAMUser* object;

- (id)initWithObject:(EDAMUser*)object_;
@end
