#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMNoteMetadataProxy : TiProxy {
@private
    EDAMNoteMetadata* object;
}
@property (nonatomic, retain) EDAMNoteMetadata* object;

- (id)initWithObject:(EDAMNoteMetadata*)object_;
@end
