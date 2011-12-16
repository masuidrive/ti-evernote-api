#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMNoteListProxy : TiProxy {
@private
    EDAMNoteList* object;
}
@property (nonatomic, retain) EDAMNoteList* object;

- (id)initWithObject:(EDAMNoteList*)object_;
@end
