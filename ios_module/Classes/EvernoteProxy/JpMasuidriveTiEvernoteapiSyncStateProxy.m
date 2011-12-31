#import "JpMasuidriveTiEvernoteapiSyncStateProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSyncState)
- (id)createSyncState:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMSyncState* thrift_object = [[[EDAMSyncState alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiSyncStateProxy* proxy = [[[JpMasuidriveTiEvernoteapiSyncStateProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"currentTime"];
        if(val) {
            [proxy setCurrentTime:val];
        }

        val = [args objectForKey:@"fullSyncBefore"];
        if(val) {
            [proxy setFullSyncBefore:val];
        }

        val = [args objectForKey:@"updateCount"];
        if(val) {
            [proxy setUpdateCount:val];
        }

        val = [args objectForKey:@"uploaded"];
        if(val) {
            [proxy setUploaded:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiSyncStateProxy
@synthesize object;

- (id)initWithObject:(EDAMSyncState*)thrift_object
{
    if(self = [super init]){
        self.object = thrift_object;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super release];
}

- (NSDictionary*)toHash:(id)args
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        NUMLONGLONG(object.currentTime), @"currentTime",
        NUMLONGLONG(object.fullSyncBefore), @"fullSyncBefore",
        NUMLONG(object.updateCount), @"updateCount",
        NUMLONGLONG(object.uploaded), @"uploaded",
    nil];
}


- (id)currentTime
{
    return NUMLONGLONG(object.currentTime);
}

- (void)setCurrentTime:(id)value
{
    object.currentTime = [value longLongValue];
}


- (id)fullSyncBefore
{
    return NUMLONGLONG(object.fullSyncBefore);
}

- (void)setFullSyncBefore:(id)value
{
    object.fullSyncBefore = [value longLongValue];
}


- (id)updateCount
{
    return NUMLONG(object.updateCount);
}

- (void)setUpdateCount:(id)value
{
    object.updateCount = [value longValue];
}


- (id)uploaded
{
    return NUMLONGLONG(object.uploaded);
}

- (void)setUploaded:(id)value
{
    object.uploaded = [value longLongValue];
}



@end
