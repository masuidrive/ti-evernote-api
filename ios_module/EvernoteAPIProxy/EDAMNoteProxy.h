#import "TiProxy.h"
#import "Types.h"

@interface EDAMNoteProxy : TiProxy {
@private
    EDAMNote* object;
}
@property (nonatomic, retain) EDAMNote* object;

- (id)initWithObject:(EDAMNote*)object_;
@end
