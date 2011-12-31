#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteEmailParametersProxy : TiProxy {
@private
    EDAMNoteEmailParameters* object;
}
@property (nonatomic, retain) EDAMNoteEmailParameters* object;

- (id)initWithObject:(EDAMNoteEmailParameters*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)guid;
- (void)setGuid:(id)value;

- (id)note;
- (void)setNote:(id)value;

- (id)toAddresses;
- (void)setToAddresses:(id)value;

- (id)ccAddresses;
- (void)setCcAddresses:(id)value;

- (id)subject;
- (void)setSubject:(id)value;

- (id)message;
- (void)setMessage:(id)value;

@end
