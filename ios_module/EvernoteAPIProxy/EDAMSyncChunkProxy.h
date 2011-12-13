#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMSyncChunkProxy : TiProxy {
@private
    EDAMSyncChunk* object;
}
@property (nonatomic, retain) EDAMSyncChunk* object;

- (id)initWithObject:(EDAMSyncChunk*)object_;
@end
