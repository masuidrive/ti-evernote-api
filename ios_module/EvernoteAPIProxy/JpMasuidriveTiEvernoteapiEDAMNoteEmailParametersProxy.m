#import "JpMasuidriveTiEvernoteapiEDAMNoteEmailParametersProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiEDAMNoteProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteEmailParameters)
-(id)createNoteEmailParameters:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiEDAMNoteEmailParametersProxy alloc] initWithObject: [[[EDAMNoteEmailParameters alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiEDAMNoteEmailParametersProxy
@synthesize object;


-(id)guid
{
    return object.guid;
}

-(void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


-(id)note
{
    return [[[JpMasuidriveTiEvernoteapiEDAMNoteProxy alloc] initWithObject: object.note] autorelease];
}

-(void)setNote:(id)value
{
    object.note = ((JpMasuidriveTiEvernoteapiEDAMNoteProxy*)value).object;
}


-(id)toAddresses
{
    return arrayMap(object.toAddresses, ^(id item) { return item; });
}

-(void)setToAddresses:(id)value
{
    object.toAddresses = arrayMap(value, ^(id item) { return item; });
}


-(id)ccAddresses
{
    return arrayMap(object.ccAddresses, ^(id item) { return item; });
}

-(void)setCcAddresses:(id)value
{
    object.ccAddresses = arrayMap(value, ^(id item) { return item; });
}


-(id)subject
{
    return object.subject;
}

-(void)setSubject:(id)value
{
    object.subject = [TiUtils stringValue:value];
}


-(id)message
{
    return object.message;
}

-(void)setMessage:(id)value
{
    object.message = [TiUtils stringValue:value];
}



- (id)initWithObject:(EDAMNoteEmailParameters*)object_
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
