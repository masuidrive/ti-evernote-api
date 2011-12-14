#import "EDAMAdImpressionsProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@interface JpMasuidriveTiEvernoteapiModule(EDAMAdImpressions)
-(id)createAdImpressions:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMAdImpressions)
-(id)createAdImpressions:(id)args
{
    return [[[EDAMAdImpressionsProxy alloc] initWithObject: [[[EDAMAdImpressions alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMAdImpressionsProxy
@synthesize object;


-(id)adId
{
    return NUMINT(object.adId);
}

-(void)setAdId:(id)value
{
    object.adId = [value integerValue];
}


-(id)impressionCount
{
    return NUMINT(object.impressionCount);
}

-(void)setImpressionCount:(id)value
{
    object.impressionCount = [value integerValue];
}


-(id)impressionTime
{
    return NUMINT(object.impressionTime);
}

-(void)setImpressionTime:(id)value
{
    object.impressionTime = [value integerValue];
}



- (id)initWithObject:(EDAMAdImpressions*)object_
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
