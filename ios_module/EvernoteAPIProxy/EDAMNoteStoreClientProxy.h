#import "TiProxy.h"
#import "NoteStore.h"

@interface EDAMNoteStoreClientProxy : TiProxy {
@private
    EDAMNoteStoreClient* object;
}
@property (nonatomic, retain) EDAMNoteStoreClientProxy* client;

- (id)initWithUri: (NSString*)uri;

@end
