#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiResourceProxy : TiProxy {
@private
    EDAMResource* object;
}
@property (nonatomic, retain) EDAMResource* object;

- (id)initWithObject:(EDAMResource*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)noteGuid;
- (void)setNoteGuid:(id)value;

- (id)data;
- (void)setData:(id)value;

- (id)mime;
- (void)setMime:(id)value;

- (id)width;
- (void)setWidth:(id)value;

- (id)height;
- (void)setHeight:(id)value;

- (id)duration;
- (void)setDuration:(id)value;

- (id)active;
- (void)setActive:(id)value;

- (id)recognition;
- (void)setRecognition:(id)value;

- (id)attributes;
- (void)setAttributes:(id)value;

- (id)updateSequenceNum;
- (void)setUpdateSequenceNum:(id)value;

- (id)alternateData;
- (void)setAlternateData:(id)value;

@end
