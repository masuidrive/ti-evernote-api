#import "TiProxy.h"
#import "Types.h"

@interface EDAMSharedNotebookProxy : TiProxy {
@private
    EDAMSharedNotebook* object;
}
@property (nonatomic, retain) EDAMSharedNotebook* object;

- (id)initWithObject:(EDAMSharedNotebook*)object_;
@end
