#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiSavedSearchProxy : TiProxy {
@private
    EDAMSavedSearch* object;
}
@property (nonatomic, retain) EDAMSavedSearch* object;

- (id)initWithObject:(EDAMSavedSearch*)object_;
@end
