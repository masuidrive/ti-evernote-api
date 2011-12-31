#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteMetadataProxy : TiProxy {
@private
    EDAMNoteMetadata* object;
}
@property (nonatomic, retain) EDAMNoteMetadata* object;

- (id)initWithObject:(EDAMNoteMetadata*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)title;
- (void)setTitle:(id)value;

- (id)contentLength;
- (void)setContentLength:(id)value;

- (id)created;
- (void)setCreated:(id)value;

- (id)updated;
- (void)setUpdated:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

- (id)notebookGuid;
- (void)setNotebookGuid:(id)value;

- (id)tagGuids;
- (void)setTagGuids:(id)value;

- (id)attributes;
- (void)setAttributes:(id)value;

- (id)largestResourceMime;
- (void)setLargestResourceMime:(id)value;

- (id)largestResourceSize;
- (void)setLargestResourceSize:(id)value;

@end
