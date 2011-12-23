#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy : TiProxy {
@private
    EDAMNoteCollectionCounts* object;
}
@property (nonatomic, retain) EDAMNoteCollectionCounts* object;

- (id)initWithObject:(EDAMNoteCollectionCounts*)object_;
@end
