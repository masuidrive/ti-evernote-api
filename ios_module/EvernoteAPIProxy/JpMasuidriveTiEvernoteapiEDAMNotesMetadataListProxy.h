#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMNotesMetadataListProxy : TiProxy {
@private
    EDAMNotesMetadataList* object;
}
@property (nonatomic, retain) EDAMNotesMetadataList* object;

- (id)initWithObject:(EDAMNotesMetadataList*)object_;
@end
