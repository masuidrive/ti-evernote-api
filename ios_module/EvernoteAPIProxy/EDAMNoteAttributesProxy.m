#import "EDAMNoteAttributesProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@interface JpMasuidriveTiEvernoteapiModule(EDAMNoteAttributes)
-(id)createNoteAttributes:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMNoteAttributes)
-(id)createNoteAttributes:(id)args
{
    return [[[EDAMNoteAttributesProxy alloc] initWithObject: [[[EDAMNoteAttributes alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMNoteAttributesProxy
@synthesize object;


-(id)subjectDate
{
    return NUMLONG(object.subjectDate);
}

-(void)setSubjectDate:(id)value
{
    object.subjectDate = [value longValue];
}


-(id)latitude
{
    return NUMDOUBLE(object.latitude);
}

-(void)setLatitude:(id)value
{
    object.latitude = [value doubleValue];
}


-(id)longitude
{
    return NUMDOUBLE(object.longitude);
}

-(void)setLongitude:(id)value
{
    object.longitude = [value doubleValue];
}


-(id)altitude
{
    return NUMDOUBLE(object.altitude);
}

-(void)setAltitude:(id)value
{
    object.altitude = [value doubleValue];
}


-(id)author
{
    return object.author;
}

-(void)setAuthor:(id)value
{
    object.author = [TiUtils stringValue:value];
}


-(id)source
{
    return object.source;
}

-(void)setSource:(id)value
{
    object.source = [TiUtils stringValue:value];
}


-(id)sourceURL
{
    return object.sourceURL;
}

-(void)setSourceURL:(id)value
{
    object.sourceURL = [TiUtils stringValue:value];
}


-(id)sourceApplication
{
    return object.sourceApplication;
}

-(void)setSourceApplication:(id)value
{
    object.sourceApplication = [TiUtils stringValue:value];
}


-(id)shareDate
{
    return NUMLONG(object.shareDate);
}

-(void)setShareDate:(id)value
{
    object.shareDate = [value longValue];
}



- (id)initWithObject:(EDAMNoteAttributes*)object_
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
