#import "JpMasuidriveTiEvernoteapiSharedNotebookProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSharedNotebook)
- (id)createSharedNotebook:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMSharedNotebook* thrift_object = [[[EDAMSharedNotebook alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiSharedNotebookProxy* proxy = [[[JpMasuidriveTiEvernoteapiSharedNotebookProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"id"];
        if(val) {
            [proxy setId:val];
        }

        val = [args objectForKey:@"userId"];
        if(val) {
            [proxy setUserId:val];
        }

        val = [args objectForKey:@"notebookGuid"];
        if(val) {
            [proxy setNotebookGuid:val];
        }

        val = [args objectForKey:@"email"];
        if(val) {
            [proxy setEmail:val];
        }

        val = [args objectForKey:@"notebookModifiable"];
        if(val) {
            [proxy setNotebookModifiable:val];
        }

        val = [args objectForKey:@"requireLogin"];
        if(val) {
            [proxy setRequireLogin:val];
        }

        val = [args objectForKey:@"serviceCreated"];
        if(val) {
            [proxy setServiceCreated:val];
        }

        val = [args objectForKey:@"shareKey"];
        if(val) {
            [proxy setShareKey:val];
        }

        val = [args objectForKey:@"username"];
        if(val) {
            [proxy setUsername:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiSharedNotebookProxy
@synthesize object;

- (id)initWithObject:(EDAMSharedNotebook*)thrift_object
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
        NUMLONGLONG(object.id), @"id",
        NUMLONG(object.userId), @"userId",
        object.notebookGuid, @"notebookGuid",
        object.email, @"email",
        NUMBOOL(object.notebookModifiable), @"notebookModifiable",
        NUMBOOL(object.requireLogin), @"requireLogin",
        NUMLONGLONG(object.serviceCreated), @"serviceCreated",
        object.shareKey, @"shareKey",
        object.username, @"username",
    nil];
}


- (id)id
{
    return NUMLONGLONG(object.id);
}

- (void)setId:(id)value
{
    object.id = [value longLongValue];
}


- (id)userId
{
    return NUMLONG(object.userId);
}

- (void)setUserId:(id)value
{
    object.userId = [value longValue];
}


- (id)notebookGuid
{
    return object.notebookGuid;
}

- (void)setNotebookGuid:(id)value
{
    object.notebookGuid = [TiUtils stringValue:value];
}


- (id)email
{
    return object.email;
}

- (void)setEmail:(id)value
{
    object.email = [TiUtils stringValue:value];
}


- (id)notebookModifiable
{
    return NUMBOOL(object.notebookModifiable);
}

- (void)setNotebookModifiable:(id)value
{
    object.notebookModifiable = [value boolValue];
}


- (id)requireLogin
{
    return NUMBOOL(object.requireLogin);
}

- (void)setRequireLogin:(id)value
{
    object.requireLogin = [value boolValue];
}


- (id)serviceCreated
{
    return NUMLONGLONG(object.serviceCreated);
}

- (void)setServiceCreated:(id)value
{
    object.serviceCreated = [value longLongValue];
}


- (id)shareKey
{
    return object.shareKey;
}

- (void)setShareKey:(id)value
{
    object.shareKey = [TiUtils stringValue:value];
}


- (id)username
{
    return object.username;
}

- (void)setUsername:(id)value
{
    object.username = [TiUtils stringValue:value];
}



@end
