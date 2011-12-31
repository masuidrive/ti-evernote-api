#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteListProxy : TiProxy {
@private
    EDAMNoteList* object;
}
@property (nonatomic, retain) EDAMNoteList* object;

- (id)initWithObject:(EDAMNoteList*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)startIndex;
- (void)setStartIndex:(id)value;

- (id)totalNotes;
- (void)setTotalNotes:(id)value;

- (id)notes;
- (void)setNotes:(id)value;

- (id)stoppedWords;
- (void)setStoppedWords:(id)value;

- (id)searchedWords;
- (void)setSearchedWords:(id)value;

- (id)updateCount;
- (void)setUpdateCount:(id)value;

@end
