#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMSharedNotebookProxy : TiProxy {
@private
    EDAMSharedNotebook* object;
}
@property (nonatomic, retain) EDAMSharedNotebook* object;

- (id)initWithObject:(EDAMSharedNotebook*)object_;
@end
