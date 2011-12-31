#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiLinkedNotebookProxy : TiProxy {
@private
    EDAMLinkedNotebook* object;
}
@property (nonatomic, retain) EDAMLinkedNotebook* object;

- (id)initWithObject:(EDAMLinkedNotebook*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)shareName;
- (void)setShareName:(id)value;

- (id)username;
- (void)setUsername:(id)value;

- (id)shardId;
- (void)setShardId:(id)value;

- (id)shareKey;
- (void)setShareKey:(id)value;

- (id)uri;
- (void)setUri:(id)value;

- (id)guid;
- (void)setGuid:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

@end
