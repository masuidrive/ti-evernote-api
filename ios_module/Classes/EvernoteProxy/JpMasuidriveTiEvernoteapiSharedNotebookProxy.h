#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiSharedNotebookProxy : TiProxy {
@private
    EDAMSharedNotebook* object;
}
@property (nonatomic, retain) EDAMSharedNotebook* object;

- (id)initWithObject:(EDAMSharedNotebook*)object_;
@end
