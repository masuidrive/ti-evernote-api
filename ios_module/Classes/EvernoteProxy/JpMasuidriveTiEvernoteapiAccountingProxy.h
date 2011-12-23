#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiAccountingProxy : TiProxy {
@private
    EDAMAccounting* object;
}
@property (nonatomic, retain) EDAMAccounting* object;

- (id)initWithObject:(EDAMAccounting*)object_;
@end
