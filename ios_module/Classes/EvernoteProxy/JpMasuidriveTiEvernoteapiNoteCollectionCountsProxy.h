#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy : TiProxy {
@private
    EDAMNoteCollectionCounts* object;
}
@property (nonatomic, retain) EDAMNoteCollectionCounts* object;

- (id)initWithObject:(EDAMNoteCollectionCounts*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)notebookCounts;
- (void)setNotebookCounts:(id)value;

- (id)tagCounts;
- (void)setTagCounts:(id)value;

- (id)trashCount;
- (void)setTrashCount:(id)value;

@end
