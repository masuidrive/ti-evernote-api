#import "JpMasuidriveTiEvernoteapiNoteVersionIdProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteVersionId)
-(id)createNoteVersionId:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiNoteVersionIdProxy alloc] initWithObject: [[[EDAMNoteVersionId alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteVersionIdProxy
@synthesize object;


-(id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}


-(id)updated
{
    return NUMLONGLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longLongValue];
}


-(id)saved
{
    return NUMLONGLONG(object.saved);
}

-(void)setSaved:(id)value
{
    object.saved = [value longLongValue];
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
