#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiSyncChunkFilterProxy : TiProxy {
@private
    EDAMSyncChunkFilter* object;
}
@property (nonatomic, retain) EDAMSyncChunkFilter* object;

- (id)initWithObject:(EDAMSyncChunkFilter*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)includeNotes;
- (void)setIncludeNotes:(id)value;

- (id)includeNoteResources;
- (void)setIncludeNoteResources:(id)value;

- (id)includeNoteAttributes;
- (void)setIncludeNoteAttributes:(id)value;

- (id)includeNotebooks;
- (void)setIncludeNotebooks:(id)value;

- (id)includeTags;
- (void)setIncludeTags:(id)value;

- (id)includeSearches;
- (void)setIncludeSearches:(id)value;

- (id)includeResources;
- (void)setIncludeResources:(id)value;

- (id)includeLinkedNotebooks;
- (void)setIncludeLinkedNotebooks:(id)value;

- (id)includeExpunged;
- (void)setIncludeExpunged:(id)value;

@end
