#import "JpMasuidriveTiEvernoteapiDataProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMData)
-(id)createData:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: [[[EDAMData alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiDataProxy
@synthesize object;


-(id)bodyHash
{
    return [[[TiBlob alloc] initWithData:object.bodyHash mimetype:@"application/octet-stream"] autorelease];
}

-(void)setBodyHash:(id)value
{
    object.bodyHash = [value data];
}


-(id)size
{
    return NUMINT(object.size);
}

-(void)setSize:(id)value
{
    object.size = [value integerValue];
}


-(id)body
{
    return [[[TiBlob alloc] initWithData:object.body mimetype:@"application/octet-stream"] autorelease];
}

-(void)setBody:(id)value
{
    object.body = [value data];
}



- (id)initWithObject:(EDAMData*)object_
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
