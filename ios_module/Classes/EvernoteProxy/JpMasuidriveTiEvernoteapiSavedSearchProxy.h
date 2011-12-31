#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiSavedSearchProxy : TiProxy {
@private
    EDAMSavedSearch* object;
}
@property (nonatomic, retain) EDAMSavedSearch* object;

- (id)initWithObject:(EDAMSavedSearch*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)name;
- (void)setName:(id)value;

- (id)query;
- (void)setQuery:(id)value;

- (id)format;
- (void)setFormat:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

@end
