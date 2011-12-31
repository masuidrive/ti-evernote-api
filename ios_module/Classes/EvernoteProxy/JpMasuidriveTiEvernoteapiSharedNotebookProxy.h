#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiSharedNotebookProxy : TiProxy {
@private
    EDAMSharedNotebook* object;
}
@property (nonatomic, retain) EDAMSharedNotebook* object;

- (id)initWithObject:(EDAMSharedNotebook*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)id;
- (void)setId:(id)value;

- (id)userId;
- (void)setUserId:(id)value;

- (id)notebookGuid;
- (void)setNotebookGuid:(id)value;

- (id)email;
- (void)setEmail:(id)value;

- (id)notebookModifiable;
- (void)setNotebookModifiable:(id)value;

- (id)requireLogin;
- (void)setRequireLogin:(id)value;

- (id)serviceCreated;
- (void)setServiceCreated:(id)value;

- (id)shareKey;
- (void)setShareKey:(id)value;

- (id)username;
- (void)setUsername:(id)value;

@end
