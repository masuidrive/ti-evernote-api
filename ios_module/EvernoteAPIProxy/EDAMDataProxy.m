#import "EDAMDataProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@interface JpMasuidriveTiEvernoteapiModule(EDAMData)
-(id)createData:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMData)
-(id)createData:(id)args
{
    return [[[EDAMDataProxy alloc] initWithObject: [[[EDAMData alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMDataProxy
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
