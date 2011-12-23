#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteVersionIdProxy : TiProxy {
@private
    EDAMNoteVersionId* object;
}
@property (nonatomic, retain) EDAMNoteVersionId* object;

- (id)initWithObject:(EDAMNoteVersionId*)object_;
@end
