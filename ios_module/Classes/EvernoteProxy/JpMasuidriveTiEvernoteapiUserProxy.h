#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiUserProxy : TiProxy {
@private
    EDAMUser* object;
}
@property (nonatomic, retain) EDAMUser* object;

- (id)initWithObject:(EDAMUser*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)id;
- (void)setId:(id)value;

- (id)username;
- (void)setUsername:(id)value;

- (id)email;
- (void)setEmail:(id)value;

- (id)name;
- (void)setName:(id)value;

- (id)timezone;
- (void)setTimezone:(id)value;

- (id)privilege;
- (void)setPrivilege:(id)value;

- (id)created;
- (void)setCreated:(id)value;

- (id)updated;
- (void)setUpdated:(id)value;

- (id)deleted;
- (void)setDeleted:(id)value;

- (id)active;
- (void)setActive:(id)value;

- (id)shardId;
- (void)setShardId:(id)value;

- (id)attributes;
- (void)setAttributes:(id)value;

- (id)accounting;
- (void)setAccounting:(id)value;

@end
