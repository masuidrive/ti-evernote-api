#import "JpMasuidriveTiEvernoteapiAdImpressionsProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAdImpressions)
- (id)createAdImpressions:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMAdImpressions* thrift_object = [[[EDAMAdImpressions alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiAdImpressionsProxy* proxy = [[[JpMasuidriveTiEvernoteapiAdImpressionsProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"adId"];
        if(val) {
            [proxy setAdId:val];
        }

        val = [args objectForKey:@"impressionCount"];
        if(val) {
            [proxy setImpressionCount:val];
        }

        val = [args objectForKey:@"impressionTime"];
        if(val) {
            [proxy setImpressionTime:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiAdImpressionsProxy
@synthesize object;

- (id)initWithObject:(EDAMAdImpressions*)thrift_object
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
        NUMLONG(object.adId), @"adId",
        NUMLONG(object.impressionCount), @"impressionCount",
        NUMLONG(object.impressionTime), @"impressionTime",
    nil];
}


- (id)adId
{
    return NUMLONG(object.adId);
}

- (void)setAdId:(id)value
{
    object.adId = [value longValue];
}


- (id)impressionCount
{
    return NUMLONG(object.impressionCount);
}

- (void)setImpressionCount:(id)value
{
    object.impressionCount = [value longValue];
}


- (id)impressionTime
{
    return NUMLONG(object.impressionTime);
}

- (void)setImpressionTime:(id)value
{
    object.impressionTime = [value longValue];
}



@end
