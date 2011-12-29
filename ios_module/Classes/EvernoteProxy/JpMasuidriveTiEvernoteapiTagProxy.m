#import "JpMasuidriveTiEvernoteapiTagProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMTag)
-(id)createTag:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: [[[EDAMTag alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiTagProxy
@synthesize object;


-(id)guid
{
    return object.guid;
}

-(void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


-(id)name
{
    return object.name;
}

-(void)setName:(id)value
{
    object.name = [TiUtils stringValue:value];
}


-(id)parentGuid
{
    return object.parentGuid;
}

-(void)setParentGuid:(id)value
{
    object.parentGuid = [TiUtils stringValue:value];
}


-(id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}



- (id)initWithObject:(EDAMTag*)object_
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
