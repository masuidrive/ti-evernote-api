#import "EDAMAdProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule(EDAMAd)
-(id)createAd:(id)args
{
    return [[[EDAMAdProxy alloc] initWithObject: [[[EDAMAd alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMAdProxy
@synthesize object;


-(id)id
{
    return NUMINT(object.id);
}

-(void)setId:(id)value
{
    object.id = [value integerValue];
}


-(id)width
{
    return NUMINT(object.width);
}

-(void)setWidth:(id)value
{
    object.width = [value integerValue];
}


-(id)height
{
    return NUMINT(object.height);
}

-(void)setHeight:(id)value
{
    object.height = [value integerValue];
}


-(id)advertiserName
{
    return object.advertiserName;
}

-(void)setAdvertiserName:(id)value
{
    object.advertiserName = [TiUtils stringValue:value];
}


-(id)imageUrl
{
    return object.imageUrl;
}

-(void)setImageUrl:(id)value
{
    object.imageUrl = [TiUtils stringValue:value];
}


-(id)destinationUrl
{
    return object.destinationUrl;
}

-(void)setDestinationUrl:(id)value
{
    object.destinationUrl = [TiUtils stringValue:value];
}


-(id)displaySeconds
{
    return NUMINT(object.displaySeconds);
}

-(void)setDisplaySeconds:(id)value
{
    object.displaySeconds = [value integerValue];
}


-(id)score
{
    return NUMDOUBLE(object.score);
}

-(void)setScore:(id)value
{
    object.score = [value doubleValue];
}


-(id)image
{
    return [[[TiBlob alloc] initWithData:object.image mimetype:@"application/octet-stream"] autorelease];
}

-(void)setImage:(id)value
{
    object.image = [value data];
}


-(id)imageMime
{
    return object.imageMime;
}

-(void)setImageMime:(id)value
{
    object.imageMime = [TiUtils stringValue:value];
}


-(id)html
{
    return object.html;
}

-(void)setHtml:(id)value
{
    object.html = [TiUtils stringValue:value];
}


-(id)displayFrequency
{
    return NUMDOUBLE(object.displayFrequency);
}

-(void)setDisplayFrequency:(id)value
{
    object.displayFrequency = [value doubleValue];
}


-(id)openInTrunk
{
    return NUMBOOL(object.openInTrunk);
}

-(void)setOpenInTrunk:(id)value
{
    object.openInTrunk = [value boolValue];
}



- (id)initWithObject:(EDAMAd*)object_
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
