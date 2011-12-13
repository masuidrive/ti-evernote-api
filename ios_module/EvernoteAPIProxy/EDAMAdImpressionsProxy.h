#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMAdImpressionsProxy : TiProxy {
@private
    EDAMAdImpressions* object;
}
@property (nonatomic, retain) EDAMAdImpressions* object;

- (id)initWithObject:(EDAMAdImpressions*)object_;
@end
