#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMSyncStateProxy : TiProxy {
@private
    EDAMSyncState* object;
}
@property (nonatomic, retain) EDAMSyncState* object;

- (id)initWithObject:(EDAMSyncState*)object_;
@end
