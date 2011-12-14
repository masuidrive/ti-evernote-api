#import "EDAMSharedNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule(EDAMSharedNotebook)
-(id)createSharedNotebook:(id)args
{
    return [[[EDAMSharedNotebookProxy alloc] initWithObject: [[[EDAMSharedNotebook alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMSharedNotebookProxy
@synthesize object;


-(id)id
{
    return NUMLONG(object.id);
}

-(void)setId:(id)value
{
    object.id = [value longValue];
}


-(id)userId
{
    return NUMINT(object.userId);
}

-(void)setUserId:(id)value
{
    object.userId = [value integerValue];
}


-(id)notebookGuid
{
    return object.notebookGuid;
}

-(void)setNotebookGuid:(id)value
{
    object.notebookGuid = [TiUtils stringValue:value];
}


-(id)email
{
    return object.email;
}

-(void)setEmail:(id)value
{
    object.email = [TiUtils stringValue:value];
}


-(id)notebookModifiable
{
    return NUMBOOL(object.notebookModifiable);
}

-(void)setNotebookModifiable:(id)value
{
    object.notebookModifiable = [value boolValue];
}


-(id)requireLogin
{
    return NUMBOOL(object.requireLogin);
}

-(void)setRequireLogin:(id)value
{
    object.requireLogin = [value boolValue];
}


-(id)serviceCreated
{
    return NUMLONG(object.serviceCreated);
}

-(void)setServiceCreated:(id)value
{
    object.serviceCreated = [value longValue];
}


-(id)shareKey
{
    return object.shareKey;
}

-(void)setShareKey:(id)value
{
    object.shareKey = [TiUtils stringValue:value];
}


-(id)username
{
    return object.username;
}

-(void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}



- (id)initWithObject:(EDAMSharedNotebook*)object_
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
