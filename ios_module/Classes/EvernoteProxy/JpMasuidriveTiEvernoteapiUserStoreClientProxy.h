#import "TiProxy.h"
#import "UserStore.h"
#import "JpMasuidriveTiEvernoteapiClientProxy.h"

@interface JpMasuidriveTiEvernoteapiUserStoreClientProxy : JpMasuidriveTiEvernoteapiClientProxy {
@private
    EDAMUserStoreClient* client;
}
@property (nonatomic, retain) EDAMUserStoreClient* client;

- (id)initWithUri: (NSString*)uri;

@end
