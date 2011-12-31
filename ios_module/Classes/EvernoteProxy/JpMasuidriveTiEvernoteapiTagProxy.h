#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiTagProxy : TiProxy {
@private
    EDAMTag* object;
}
@property (nonatomic, retain) EDAMTag* object;

- (id)initWithObject:(EDAMTag*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)name;
- (void)setName:(id)value;

- (id)parentGuid;
- (void)setParentGuid:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

@end
