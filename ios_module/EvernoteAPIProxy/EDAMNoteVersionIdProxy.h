#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMNoteVersionIdProxy : TiProxy {
@private
    EDAMNoteVersionId* object;
}
@property (nonatomic, retain) EDAMNoteVersionId* object;

- (id)initWithObject:(EDAMNoteVersionId*)object_;
@end
