#import "JpMasuidriveTiEvernoteapiPublishingProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMPublishing)
-(id)createPublishing:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiPublishingProxy alloc] initWithObject: [[[EDAMPublishing alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiPublishingProxy
@synthesize object;


-(id)uri
{
    return object.uri;
}

-(void)setUri:(id)value
{
    object.uri = [TiUtils stringValue:value];
}


-(id)order
{
    return NUMINT(object.order);
}

-(void)setOrder:(id)value
{
    object.order = [value integerValue];
}


-(id)ascending
{
    return NUMBOOL(object.ascending);
}

-(void)setAscending:(id)value
{
    object.ascending = [value boolValue];
}


-(id)publicDescription
{
    return object.publicDescription;
}

-(void)setPublicDescription:(id)value
{
    object.publicDescription = [TiUtils stringValue:value];
}



- (id)initWithObject:(EDAMPublishing*)object_
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
