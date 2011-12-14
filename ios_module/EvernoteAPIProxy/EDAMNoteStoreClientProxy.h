#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMNoteStoreClientProxy : TiProxy {
@private
    EDAMNoteStoreClient* client;
}
@property (nonatomic, retain) EDAMNoteStoreClient* client;

- (id)initWithUri: (NSString*)uri;

@end
