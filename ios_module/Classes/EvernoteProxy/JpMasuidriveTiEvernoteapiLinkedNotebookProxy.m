#import "JpMasuidriveTiEvernoteapiLinkedNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMLinkedNotebook)
-(id)createLinkedNotebook:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: [[[EDAMLinkedNotebook alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiLinkedNotebookProxy
@synthesize object;


-(id)shareName
{
    return object.shareName;
}

-(void)setShareName:(id)value
{
    object.shareName = [TiUtils stringValue:value];
}


-(id)username
{
    return object.username;
}

-(void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}


-(id)shardId
{
    return object.shardId;
}

-(void)setShardId:(id)value
{
    object.shardId = [TiUtils stringValue:value];
}


-(id)shareKey
{
    return object.shareKey;
}

-(void)setShareKey:(id)value
{
    object.shareKey = [TiUtils stringValue:value];
}


-(id)uri
{
    return object.uri;
}

-(void)setUri:(id)value
{
    object.uri = [TiUtils stringValue:value];
}


-(id)guid
{
    return object.guid;
}

-(void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


-(id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}



- (id)initWithObject:(EDAMLinkedNotebook*)object_
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
