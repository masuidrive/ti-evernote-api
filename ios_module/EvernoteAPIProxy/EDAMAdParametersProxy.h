#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMAdParametersProxy : TiProxy {
@private
    EDAMAdParameters* object;
}
@property (nonatomic, retain) EDAMAdParameters* object;

- (id)initWithObject:(EDAMAdParameters*)object_;
@end
