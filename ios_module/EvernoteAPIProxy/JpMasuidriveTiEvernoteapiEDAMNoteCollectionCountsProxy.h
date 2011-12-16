#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMNoteCollectionCountsProxy : TiProxy {
@private
    EDAMNoteCollectionCounts* object;
}
@property (nonatomic, retain) EDAMNoteCollectionCounts* object;

- (id)initWithObject:(EDAMNoteCollectionCounts*)object_;
@end
