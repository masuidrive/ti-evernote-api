#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiNoteProxy : TiProxy {
@private
    EDAMNote* object;
}
@property (nonatomic, retain) EDAMNote* object;

- (id)initWithObject:(EDAMNote*)object_;
@end
