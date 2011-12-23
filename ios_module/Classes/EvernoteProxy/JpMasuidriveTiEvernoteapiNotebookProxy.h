#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiNotebookProxy : TiProxy {
@private
    EDAMNotebook* object;
}
@property (nonatomic, retain) EDAMNotebook* object;

- (id)initWithObject:(EDAMNotebook*)object_;
@end
