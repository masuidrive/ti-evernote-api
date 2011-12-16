#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiEDAMNotebookProxy : TiProxy {
@private
    EDAMNotebook* object;
}
@property (nonatomic, retain) EDAMNotebook* object;

- (id)initWithObject:(EDAMNotebook*)object_;
@end
