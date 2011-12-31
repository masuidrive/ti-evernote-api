#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiSyncChunkProxy : TiProxy {
@private
    EDAMSyncChunk* object;
}
@property (nonatomic, retain) EDAMSyncChunk* object;

- (id)initWithObject:(EDAMSyncChunk*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)currentTime;
- (void)setCurrentTime:(id)value;

- (id)chunkHighUSN;
- (void)setChunkHighUSN:(id)value;

- (id)updateCount;
- (void)setUpdateCount:(id)value;

- (id)notes;
- (void)setNotes:(id)value;

- (id)notebooks;
- (void)setNotebooks:(id)value;

- (id)tags;
- (void)setTags:(id)value;

- (id)searches;
- (void)setSearches:(id)value;

- (id)resources;
- (void)setResources:(id)value;

- (id)expungedNotes;
- (void)setExpungedNotes:(id)value;

- (id)expungedNotebooks;
- (void)setExpungedNotebooks:(id)value;

- (id)expungedTags;
- (void)setExpungedTags:(id)value;

- (id)expungedSearches;
- (void)setExpungedSearches:(id)value;

- (id)linkedNotebooks;
- (void)setLinkedNotebooks:(id)value;

- (id)expungedLinkedNotebooks;
- (void)setExpungedLinkedNotebooks:(id)value;

@end
