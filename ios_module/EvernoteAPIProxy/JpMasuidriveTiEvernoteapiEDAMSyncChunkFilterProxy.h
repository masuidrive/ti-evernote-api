#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMSyncChunkFilterProxy : TiProxy {
@private
    EDAMSyncChunkFilter* object;
}
@property (nonatomic, retain) EDAMSyncChunkFilter* object;

- (id)initWithObject:(EDAMSyncChunkFilter*)object_;
@end
