#import "EDAMNoteVersionIdProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMNoteVersionId)
-(id)createNoteVersionId:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMNoteVersionId)
-(id)createNoteVersionId:(id)args
{
    return [[[EDAMNoteVersionIdProxy alloc] initWithObject: [[[EDAMNoteVersionId alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMNoteVersionIdProxy
@synthesize object;


-(id)updateSequenceNum
{
    return NUMINT(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value integerValue];
}

-(id)updated
{
    return NUMLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longValue];
}

-(id)saved
{
    return NUMLONG(object.saved);
}

-(void)setSaved:(id)value
{
    object.saved = [value longValue];
}

-(id)title
{
    return object.title;
}

-(void)setTitle:(id)value
{
    object.title = [TiUtils stringValue:value];
}


- (id)initWithObject:(EDAMNoteVersionId*)object_
{
    if(self = [super init]){
        self.object = object_;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super release];
}
@end
