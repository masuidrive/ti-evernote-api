#import "JpMasuidriveTiEvernoteapiNoteEmailParametersProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiNoteProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteEmailParameters)
- (id)createNoteEmailParameters:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteEmailParameters* thrift_object = [[[EDAMNoteEmailParameters alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteEmailParametersProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteEmailParametersProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"guid"];
        if(val) {
            [proxy setGuid:val];
        }

        val = [args objectForKey:@"note"];
        if(val) {
            [proxy setNote:val];
        }

        val = [args objectForKey:@"toAddresses"];
        if(val) {
            [proxy setToAddresses:val];
        }

        val = [args objectForKey:@"ccAddresses"];
        if(val) {
            [proxy setCcAddresses:val];
        }

        val = [args objectForKey:@"subject"];
        if(val) {
            [proxy setSubject:val];
        }

        val = [args objectForKey:@"message"];
        if(val) {
            [proxy setMessage:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteEmailParametersProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteEmailParameters*)thrift_object
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
        object.guid, @"guid",
        [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: object.note] autorelease], @"note",
        arrayMap(object.toAddresses, ^(id item) { return item; }), @"toAddresses",
        arrayMap(object.ccAddresses, ^(id item) { return item; }), @"ccAddresses",
        object.subject, @"subject",
        object.message, @"message",
    nil];
}


- (id)guid
{
    return object.guid;
}

- (void)setGuid:(id)value
{
    object.guid = [TiUtils stringValue:value];
}


- (id)note
{
    return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: object.note] autorelease];
}

- (void)setNote:(id)value
{
    object.note = ((JpMasuidriveTiEvernoteapiNoteProxy*)value).object;
}


- (id)toAddresses
{
    return arrayMap(object.toAddresses, ^(id item) { return item; });
}

- (void)setToAddresses:(id)value
{
    object.toAddresses = arrayMap(value, ^(id item) { return item; });
}


- (id)ccAddresses
{
    return arrayMap(object.ccAddresses, ^(id item) { return item; });
}

- (void)setCcAddresses:(id)value
{
    object.ccAddresses = arrayMap(value, ^(id item) { return item; });
}


- (id)subject
{
    return object.subject;
}

- (void)setSubject:(id)value
{
    object.subject = [TiUtils stringValue:value];
}


- (id)message
{
    return object.message;
}

- (void)setMessage:(id)value
{
    object.message = [TiUtils stringValue:value];
}



@end
