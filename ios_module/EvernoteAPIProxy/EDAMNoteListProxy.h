#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMNoteListProxy : TiProxy {
@private
    EDAMNoteList* object;
}
@property (nonatomic, retain) EDAMNoteList* object;

- (id)initWithObject:(EDAMNoteList*)object_;
@end
