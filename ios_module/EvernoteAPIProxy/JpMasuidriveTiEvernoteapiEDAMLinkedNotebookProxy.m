#import "JpMasuidriveTiEvernoteapiEDAMLinkedNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMLinkedNotebook)
-(id)createLinkedNotebook:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiEDAMLinkedNotebookProxy alloc] initWithObject: [[[EDAMLinkedNotebook alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiEDAMLinkedNotebookProxy
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
    return NUMINT(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value integerValue];
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
