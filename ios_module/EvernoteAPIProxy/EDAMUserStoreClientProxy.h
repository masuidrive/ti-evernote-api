#import "TiProxy.h"
#import "UserStore.h"

@interface EDAMUserStoreClientProxy : TiProxy {
@private
    EDAMUserStoreClient* object;
}
@property (nonatomic, retain) EDAMUserStoreClientProxy* client;

- (id)initWithUri: (NSString*)uri;

@end
