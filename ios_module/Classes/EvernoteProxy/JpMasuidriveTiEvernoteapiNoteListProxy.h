#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteListProxy : TiProxy {
@private
    EDAMNoteList* object;
}
@property (nonatomic, retain) EDAMNoteList* object;

- (id)initWithObject:(EDAMNoteList*)object_;
@end
