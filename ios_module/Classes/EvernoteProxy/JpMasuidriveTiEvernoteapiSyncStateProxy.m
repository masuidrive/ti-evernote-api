#import "JpMasuidriveTiEvernoteapiSyncStateProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSyncState)
-(id)createSyncState:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiSyncStateProxy alloc] initWithObject: [[[EDAMSyncState alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiSyncStateProxy
@synthesize object;


-(id)currentTime
{
    return NUMLONGLONG(object.currentTime);
}

-(void)setCurrentTime:(id)value
{
    object.currentTime = [value longLongValue];
}


-(id)fullSyncBefore
{
    return NUMLONGLONG(object.fullSyncBefore);
}

-(void)setFullSyncBefore:(id)value
{
    object.fullSyncBefore = [value longLongValue];
}


-(id)updateCount
{
    return NUMLONG(object.updateCount);
}

-(void)setUpdateCount:(id)value
{
    object.updateCount = [value longValue];
}


-(id)uploaded
{
    return NUMLONGLONG(object.uploaded);
}

-(void)setUploaded:(id)value
{
    object.uploaded = [value longLongValue];
}



- (id)initWithObject:(EDAMSyncState*)object_
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
