#import "TiProxy.h"
#import "UserStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMUserStoreClientProxy : TiProxy {
@private
    EDAMUserStoreClient* client;
}
@property (nonatomic, retain) EDAMUserStoreClient* client;

- (id)initWithUri: (NSString*)uri;

@end
