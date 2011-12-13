#import "TiProxy.h"
#import "Types.h"

@interface EDAMNoteAttributesProxy : TiProxy {
@private
    EDAMNoteAttributes* object;
}
@property (nonatomic, retain) EDAMNoteAttributes* object;

- (id)initWithObject:(EDAMNoteAttributes*)object_;
@end
