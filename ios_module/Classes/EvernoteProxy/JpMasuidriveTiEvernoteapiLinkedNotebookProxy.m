#import "JpMasuidriveTiEvernoteapiLinkedNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMLinkedNotebook)
- (id)createLinkedNotebook:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMLinkedNotebook* thrift_object = [[[EDAMLinkedNotebook alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiLinkedNotebookProxy* proxy = [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"shareName"];
        if(val) {
            [proxy setShareName:val];
        }

        val = [args objectForKey:@"username"];
        if(val) {
            [proxy setUsername:val];
        }

        val = [args objectForKey:@"shardId"];
        if(val) {
            [proxy setShardId:val];
        }

        val = [args objectForKey:@"shareKey"];
        if(val) {
            [proxy setShareKey:val];
        }

        val = [args objectForKey:@"uri"];
        if(val) {
            [proxy setUri:val];
        }

        val = [args objectForKey:@"guid"];
        if(val) {
            [proxy setGuid:val];
        }

        val = [args objectForKey:@"updateSequenceNum"];
        if(val) {
            [proxy setUpdateSequenceNum:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiLinkedNotebookProxy
@synthesize object;

- (id)initWithObject:(EDAMLinkedNotebook*)thrift_object
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
        object.shareName, @"shareName",
        object.username, @"username",
        object.shardId, @"shardId",
        object.shareKey, @"shareKey",
        object.uri, @"uri",
        object.guid, @"guid",
        NUMLONG(object.updateSequenceNum), @"updateSequenceNum",
    nil];
}


- (id)shareName
{
    return object.shareName;
}

- (void)setShareName:(id)value
{
    object.shareName = [TiUtils stringValue:value];
}


- (id)username
{
    return object.username;
}

- (void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}


- (id)shardId
{
    return object.shardId;
}

- (void)setShardId:(id)value
{
    object.shardId = [TiUtils stringValue:value];
}


- (id)shareKey
{
    return object.shareKey;
}

- (void)setShareKey:(id)value
{
    object.shareKey = [TiUtils stringValue:value];
}


- (id)uri
{
    return object.uri;
}

- (void)setUri:(id)value
{
    object.uri = [TiUtils stringValue:value];
}


- (id)guid
{
    return object.guid;
}

- (void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


- (id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

- (void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}



@end
