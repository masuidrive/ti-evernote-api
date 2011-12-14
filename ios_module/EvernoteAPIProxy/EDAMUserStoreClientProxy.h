#import "TiProxy.h"
#import "UserStore.h"

@interface EDAMUserStoreClientProxy : TiProxy {
@private
    EDAMUserStoreClient* client;
}
@property (nonatomic, retain) EDAMUserStoreClient* client;

- (id)initWithUri: (NSString*)uri;

@end
