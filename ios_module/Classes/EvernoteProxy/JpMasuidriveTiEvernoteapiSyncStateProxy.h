#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiSyncStateProxy : TiProxy {
@private
    EDAMSyncState* object;
}
@property (nonatomic, retain) EDAMSyncState* object;

- (id)initWithObject:(EDAMSyncState*)object_;
@end
