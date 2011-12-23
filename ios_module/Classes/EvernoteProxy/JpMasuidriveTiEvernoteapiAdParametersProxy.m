#import "JpMasuidriveTiEvernoteapiAdParametersProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiAdImpressionsProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAdParameters)
-(id)createAdParameters:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiAdParametersProxy alloc] initWithObject: [[[EDAMAdParameters alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiAdParametersProxy
@synthesize object;


-(id)clientLanguage
{
    return object.clientLanguage;
}

-(void)setClientLanguage:(id)value
{
    object.clientLanguage = [TiUtils stringValue:value];
}


-(id)impressions
{
    return arrayMap(object.impressions, ^(id item) { return [[[JpMasuidriveTiEvernoteapiAdImpressionsProxy alloc] initWithObject: item] autorelease]; });
}

-(void)setImpressions:(id)value
{
    object.impressions = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiAdImpressionsProxy*)item).object; });
}


-(id)supportHtml
{
    return NUMBOOL(object.supportHtml);
}

-(void)setSupportHtml:(id)value
{
    object.supportHtml = [value boolValue];
}


-(id)clientProperties
{
    return 				dictionaryMap(object.clientProperties, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

-(void)setClientProperties:(id)value
{
    object.clientProperties = 				dictionaryMap(value, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}



- (id)initWithObject:(EDAMAdParameters*)object_
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
