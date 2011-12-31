#import "JpMasuidriveTiEvernoteapiAdProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAd)
- (id)createAd:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMAd* thrift_object = [[[EDAMAd alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiAdProxy* proxy = [[[JpMasuidriveTiEvernoteapiAdProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"id"];
        if(val) {
            [proxy setId:val];
        }

        val = [args objectForKey:@"width"];
        if(val) {
            [proxy setWidth:val];
        }

        val = [args objectForKey:@"height"];
        if(val) {
            [proxy setHeight:val];
        }

        val = [args objectForKey:@"advertiserName"];
        if(val) {
            [proxy setAdvertiserName:val];
        }

        val = [args objectForKey:@"imageUrl"];
        if(val) {
            [proxy setImageUrl:val];
        }

        val = [args objectForKey:@"destinationUrl"];
        if(val) {
            [proxy setDestinationUrl:val];
        }

        val = [args objectForKey:@"displaySeconds"];
        if(val) {
            [proxy setDisplaySeconds:val];
        }

        val = [args objectForKey:@"score"];
        if(val) {
            [proxy setScore:val];
        }

        val = [args objectForKey:@"image"];
        if(val) {
            [proxy setImage:val];
        }

        val = [args objectForKey:@"imageMime"];
        if(val) {
            [proxy setImageMime:val];
        }

        val = [args objectForKey:@"html"];
        if(val) {
            [proxy setHtml:val];
        }

        val = [args objectForKey:@"displayFrequency"];
        if(val) {
            [proxy setDisplayFrequency:val];
        }

        val = [args objectForKey:@"openInTrunk"];
        if(val) {
            [proxy setOpenInTrunk:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiAdProxy
@synthesize object;

- (id)initWithObject:(EDAMAd*)thrift_object
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
        NUMLONG(object.id), @"id",
        NUMINT(object.width), @"width",
        NUMINT(object.height), @"height",
        object.advertiserName, @"advertiserName",
        object.imageUrl, @"imageUrl",
        object.destinationUrl, @"destinationUrl",
        NUMINT(object.displaySeconds), @"displaySeconds",
        NUMDOUBLE(object.score), @"score",
        [[[TiBlob alloc] initWithData:object.image mimetype:@"application/octet-stream"] autorelease], @"image",
        object.imageMime, @"imageMime",
        object.html, @"html",
        NUMDOUBLE(object.displayFrequency), @"displayFrequency",
        NUMBOOL(object.openInTrunk), @"openInTrunk",
    nil];
}


- (id)id
{
    return NUMLONG(object.id);
}

- (void)setId:(id)value
{
    object.id = [value longValue];
}


- (id)width
{
    return NUMINT(object.width);
}

- (void)setWidth:(id)value
{
    object.width = [value integerValue];
}


- (id)height
{
    return NUMINT(object.height);
}

- (void)setHeight:(id)value
{
    object.height = [value integerValue];
}


- (id)advertiserName
{
    return object.advertiserName;
}

- (void)setAdvertiserName:(id)value
{
    object.advertiserName = [TiUtils stringValue:value];
}


- (id)imageUrl
{
    return object.imageUrl;
}

- (void)setImageUrl:(id)value
{
    object.imageUrl = [TiUtils stringValue:value];
}


- (id)destinationUrl
{
    return object.destinationUrl;
}

- (void)setDestinationUrl:(id)value
{
    object.destinationUrl = [TiUtils stringValue:value];
}


- (id)displaySeconds
{
    return NUMINT(object.displaySeconds);
}

- (void)setDisplaySeconds:(id)value
{
    object.displaySeconds = [value integerValue];
}


- (id)score
{
    return NUMDOUBLE(object.score);
}

- (void)setScore:(id)value
{
    object.score = [value doubleValue];
}


- (id)image
{
    return [[[TiBlob alloc] initWithData:object.image mimetype:@"application/octet-stream"] autorelease];
}

- (void)setImage:(id)value
{
    object.image = [value data];
}


- (id)imageMime
{
    return object.imageMime;
}

- (void)setImageMime:(id)value
{
    object.imageMime = [TiUtils stringValue:value];
}


- (id)html
{
    return object.html;
}

- (void)setHtml:(id)value
{
    object.html = [TiUtils stringValue:value];
}


- (id)displayFrequency
{
    return NUMDOUBLE(object.displayFrequency);
}

- (void)setDisplayFrequency:(id)value
{
    object.displayFrequency = [value doubleValue];
}


- (id)openInTrunk
{
    return NUMBOOL(object.openInTrunk);
}

- (void)setOpenInTrunk:(id)value
{
    object.openInTrunk = [value boolValue];
}



@end
