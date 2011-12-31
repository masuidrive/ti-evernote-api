#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiNoteProxy : TiProxy {
@private
    EDAMNote* object;
}
@property (nonatomic, retain) EDAMNote* object;

- (id)initWithObject:(EDAMNote*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)title;
- (void)setTitle:(id)value;

- (id)content;
- (void)setContent:(id)value;

- (id)contentHash;
- (void)setContentHash:(id)value;

- (id)contentLength;
- (void)setContentLength:(id)value;

- (id)created;
- (void)setCreated:(id)value;

- (id)updated;
- (void)setUpdated:(id)value;

- (id)deleted;
- (void)setDeleted:(id)value;

- (id)active;
- (void)setActive:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

- (id)notebookGuid;
- (void)setNotebookGuid:(id)value;

- (id)tagGuids;
- (void)setTagGuids:(id)value;

- (id)resources;
- (void)setResources:(id)value;

- (id)attributes;
- (void)setAttributes:(id)value;

- (id)tagNames;
- (void)setTagNames:(id)value;

@end
