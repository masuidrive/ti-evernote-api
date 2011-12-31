#import "JpMasuidriveTiEvernoteapiDataProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMData)
- (id)createData:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMData* thrift_object = [[[EDAMData alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiDataProxy* proxy = [[[JpMasuidriveTiEvernoteapiDataProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"bodyHash"];
        if(val) {
            [proxy setBodyHash:val];
        }

        val = [args objectForKey:@"size"];
        if(val) {
            [proxy setSize:val];
        }

        val = [args objectForKey:@"body"];
        if(val) {
            [proxy setBody:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiDataProxy
@synthesize object;

- (id)initWithObject:(EDAMData*)thrift_object
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
        [[[TiBlob alloc] initWithData:object.bodyHash mimetype:@"application/octet-stream"] autorelease], @"bodyHash",
        NUMLONG(object.size), @"size",
        [[[TiBlob alloc] initWithData:object.body mimetype:@"application/octet-stream"] autorelease], @"body",
    nil];
}


- (id)bodyHash
{
    return [[[TiBlob alloc] initWithData:object.bodyHash mimetype:@"application/octet-stream"] autorelease];
}

- (void)setBodyHash:(id)value
{
    object.bodyHash = [value data];
}


- (id)size
{
    return NUMLONG(object.size);
}

- (void)setSize:(id)value
{
    object.size = [value longValue];
}


- (id)body
{
    return [[[TiBlob alloc] initWithData:object.body mimetype:@"application/octet-stream"] autorelease];
}

- (void)setBody:(id)value
{
    object.body = [value data];
}



@end
