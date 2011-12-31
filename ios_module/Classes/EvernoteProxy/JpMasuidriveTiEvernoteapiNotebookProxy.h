#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiNotebookProxy : TiProxy {
@private
    EDAMNotebook* object;
}
@property (nonatomic, retain) EDAMNotebook* object;

- (id)initWithObject:(EDAMNotebook*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)name;
- (void)setName:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

- (id)defaultNotebook;
- (void)setDefaultNotebook:(id)value;

- (id)serviceCreated;
- (void)setServiceCreated:(id)value;

- (id)serviceUpdated;
- (void)setServiceUpdated:(id)value;

- (id)publishing;
- (void)setPublishing:(id)value;

- (id)published;
- (void)setPublished:(id)value;

- (id)stack;
- (void)setStack:(id)value;

- (id)sharedNotebookIds;
- (void)setSharedNotebookIds:(id)value;

@end
