#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiSyncChunkProxy : TiProxy {
@private
    EDAMSyncChunk* object;
}
@property (nonatomic, retain) EDAMSyncChunk* object;

- (id)initWithObject:(EDAMSyncChunk*)object_;
@end
