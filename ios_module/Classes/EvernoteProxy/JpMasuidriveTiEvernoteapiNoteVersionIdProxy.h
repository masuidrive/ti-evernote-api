#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteVersionIdProxy : TiProxy {
@private
    EDAMNoteVersionId* object;
}
@property (nonatomic, retain) EDAMNoteVersionId* object;

- (id)initWithObject:(EDAMNoteVersionId*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

- (id)updated;
- (void)setUpdated:(id)value;

- (id)saved;
- (void)setSaved:(id)value;

- (id)title;
- (void)setTitle:(id)value;

@end
