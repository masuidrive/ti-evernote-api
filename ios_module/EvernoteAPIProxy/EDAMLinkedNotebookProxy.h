#import "TiProxy.h"
#import "Types.h"

@interface EDAMLinkedNotebookProxy : TiProxy {
@private
    EDAMLinkedNotebook* object;
}
@property (nonatomic, retain) EDAMLinkedNotebook* object;

- (id)initWithObject:(EDAMLinkedNotebook*)object_;
@end
