#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNoteFilterProxy : TiProxy {
@private
    EDAMNoteFilter* object;
}
@property (nonatomic, retain) EDAMNoteFilter* object;

- (id)initWithObject:(EDAMNoteFilter*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)order;
- (void)setOrder:(id)value;

- (id)ascending;
- (void)setAscending:(id)value;

- (id)words;
- (void)setWords:(id)value;

- (id)notebookGuid;
- (void)setNotebookGuid:(id)value;

- (id)tagGuids;
- (void)setTagGuids:(id)value;

- (id)timeZone;
- (void)setTimeZone:(id)value;

- (id)inactive;
- (void)setInactive:(id)value;

@end
