#import "JpMasuidriveTiEvernoteapiAdParametersProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiAdImpressionsProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAdParameters)
- (id)createAdParameters:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMAdParameters* thrift_object = [[[EDAMAdParameters alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiAdParametersProxy* proxy = [[[JpMasuidriveTiEvernoteapiAdParametersProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"clientLanguage"];
        if(val) {
            [proxy setClientLanguage:val];
        }

        val = [args objectForKey:@"impressions"];
        if(val) {
            [proxy setImpressions:val];
        }

        val = [args objectForKey:@"supportHtml"];
        if(val) {
            [proxy setSupportHtml:val];
        }

        val = [args objectForKey:@"clientProperties"];
        if(val) {
            [proxy setClientProperties:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiAdParametersProxy
@synthesize object;

- (id)initWithObject:(EDAMAdParameters*)thrift_object
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
        object.clientLanguage, @"clientLanguage",
        arrayMap(object.impressions, ^(id item) { return [[[JpMasuidriveTiEvernoteapiAdImpressionsProxy alloc] initWithObject: item] autorelease]; }), @"impressions",
        NUMBOOL(object.supportHtml), @"supportHtml",
        dictionaryMap(object.clientProperties, ^(id key, id obj) {
        return [NSArray arrayWithObjects: key, obj, nil];
    }), @"clientProperties",
    nil];
}


- (id)clientLanguage
{
    return object.clientLanguage;
}

- (void)setClientLanguage:(id)value
{
    object.clientLanguage = [TiUtils stringValue:value];
}


- (id)impressions
{
    return arrayMap(object.impressions, ^(id item) { return [[[JpMasuidriveTiEvernoteapiAdImpressionsProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setImpressions:(id)value
{
    object.impressions = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiAdImpressionsProxy*)item).object; });
}


- (id)supportHtml
{
    return NUMBOOL(object.supportHtml);
}

- (void)setSupportHtml:(id)value
{
    object.supportHtml = [value boolValue];
}


- (id)clientProperties
{
    return dictionaryMap(object.clientProperties, ^(id key, id obj) {
        return [NSArray arrayWithObjects: key, obj, nil];
    });
}

- (void)setClientProperties:(id)value
{
    object.clientProperties = dictionaryMap(value, ^(id key, id obj) {
        return [NSArray arrayWithObjects: key, obj, nil];
    });
}



@end
