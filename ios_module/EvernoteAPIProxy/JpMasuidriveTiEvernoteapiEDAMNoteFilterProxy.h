#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiEDAMNoteFilterProxy : TiProxy {
@private
    EDAMNoteFilter* object;
}
@property (nonatomic, retain) EDAMNoteFilter* object;

- (id)initWithObject:(EDAMNoteFilter*)object_;
@end
