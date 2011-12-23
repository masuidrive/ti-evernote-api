#import "TiProxy.h"
#import "NoteStore.h"
#import "JpMasuidriveTiEvernoteapiClientProxy.h"

@interface JpMasuidriveTiEvernoteapiNoteStoreClientProxy : JpMasuidriveTiEvernoteapiClientProxy {
@private
    EDAMNoteStoreClient* client;
}
@property (nonatomic, retain) EDAMNoteStoreClient* client;

- (id)initWithUri: (NSString*)uri;

@end
