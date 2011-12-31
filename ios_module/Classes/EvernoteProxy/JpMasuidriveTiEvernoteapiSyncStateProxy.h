#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiSyncStateProxy : TiProxy {
@private
    EDAMSyncState* object;
}
@property (nonatomic, retain) EDAMSyncState* object;

- (id)initWithObject:(EDAMSyncState*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)currentTime;
- (void)setCurrentTime:(id)value;

- (id)fullSyncBefore;
- (void)setFullSyncBefore:(id)value;

- (id)updateCount;
- (void)setUpdateCount:(id)value;

- (id)uploaded;
- (void)setUploaded:(id)value;

@end
