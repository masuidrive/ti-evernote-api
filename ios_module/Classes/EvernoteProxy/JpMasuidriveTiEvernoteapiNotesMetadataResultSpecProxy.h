#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy : TiProxy {
@private
    EDAMNotesMetadataResultSpec* object;
}
@property (nonatomic, retain) EDAMNotesMetadataResultSpec* object;

- (id)initWithObject:(EDAMNotesMetadataResultSpec*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)includeTitle;
- (void)setIncludeTitle:(id)value;

- (id)includeContentLength;
- (void)setIncludeContentLength:(id)value;

- (id)includeCreated;
- (void)setIncludeCreated:(id)value;

- (id)includeUpdated;
- (void)setIncludeUpdated:(id)value;

- (id)includeUpdateSequenceNum;
- (void)setIncludeUpdateSequenceNum:(id)value;

- (id)includeNotebookGuid;
- (void)setIncludeNotebookGuid:(id)value;

- (id)includeTagGuids;
- (void)setIncludeTagGuids:(id)value;

- (id)includeAttributes;
- (void)setIncludeAttributes:(id)value;

- (id)includeLargestResourceMime;
- (void)setIncludeLargestResourceMime:(id)value;

- (id)includeLargestResourceSize;
- (void)setIncludeLargestResourceSize:(id)value;

@end
