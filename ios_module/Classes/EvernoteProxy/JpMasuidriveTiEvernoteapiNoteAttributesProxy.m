#import "JpMasuidriveTiEvernoteapiNoteAttributesProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteAttributes)
- (id)createNoteAttributes:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteAttributes* thrift_object = [[[EDAMNoteAttributes alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteAttributesProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteAttributesProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"subjectDate"];
        if(val) {
            [proxy setSubjectDate:val];
        }

        val = [args objectForKey:@"latitude"];
        if(val) {
            [proxy setLatitude:val];
        }

        val = [args objectForKey:@"longitude"];
        if(val) {
            [proxy setLongitude:val];
        }

        val = [args objectForKey:@"altitude"];
        if(val) {
            [proxy setAltitude:val];
        }

        val = [args objectForKey:@"author"];
        if(val) {
            [proxy setAuthor:val];
        }

        val = [args objectForKey:@"source"];
        if(val) {
            [proxy setSource:val];
        }

        val = [args objectForKey:@"sourceURL"];
        if(val) {
            [proxy setSourceURL:val];
        }

        val = [args objectForKey:@"sourceApplication"];
        if(val) {
            [proxy setSourceApplication:val];
        }

        val = [args objectForKey:@"shareDate"];
        if(val) {
            [proxy setShareDate:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteAttributesProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteAttributes*)thrift_object
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
        NUMLONGLONG(object.subjectDate), @"subjectDate",
        NUMDOUBLE(object.latitude), @"latitude",
        NUMDOUBLE(object.longitude), @"longitude",
        NUMDOUBLE(object.altitude), @"altitude",
        object.author, @"author",
        object.source, @"source",
        object.sourceURL, @"sourceURL",
        object.sourceApplication, @"sourceApplication",
        NUMLONGLONG(object.shareDate), @"shareDate",
    nil];
}


- (id)subjectDate
{
    return NUMLONGLONG(object.subjectDate);
}

- (void)setSubjectDate:(id)value
{
    object.subjectDate = [value longLongValue];
}


- (id)latitude
{
    return NUMDOUBLE(object.latitude);
}

- (void)setLatitude:(id)value
{
    object.latitude = [value doubleValue];
}


- (id)longitude
{
    return NUMDOUBLE(object.longitude);
}

- (void)setLongitude:(id)value
{
    object.longitude = [value doubleValue];
}


- (id)altitude
{
    return NUMDOUBLE(object.altitude);
}

- (void)setAltitude:(id)value
{
    object.altitude = [value doubleValue];
}


- (id)author
{
    return object.author;
}

- (void)setAuthor:(id)value
{
    object.author = [TiUtils stringValue:value];
}


- (id)source
{
    return object.source;
}

- (void)setSource:(id)value
{
    object.source = [TiUtils stringValue:value];
}


- (id)sourceURL
{
    return object.sourceURL;
}

- (void)setSourceURL:(id)value
{
    object.sourceURL = [TiUtils stringValue:value];
}


- (id)sourceApplication
{
    return object.sourceApplication;
}

- (void)setSourceApplication:(id)value
{
    object.sourceApplication = [TiUtils stringValue:value];
}


- (id)shareDate
{
    return NUMLONGLONG(object.shareDate);
}

- (void)setShareDate:(id)value
{
    object.shareDate = [value longLongValue];
}



@end
