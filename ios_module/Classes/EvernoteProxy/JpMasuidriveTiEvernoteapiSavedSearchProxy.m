#import "JpMasuidriveTiEvernoteapiSavedSearchProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSavedSearch)
-(id)createSavedSearch:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: [[[EDAMSavedSearch alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiSavedSearchProxy
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


-(id)query
{
    return object.query;
}

-(void)setQuery:(id)value
{
    object.query = [TiUtils stringValue:value];
}


-(id)format
{
    return NUMLONG(object.format);
}

-(void)setFormat:(id)value
{
    object.format = [value longValue];
}


-(id)updateSequenceNum
{
    return NUMLONG(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value longValue];
}



- (id)initWithObject:(EDAMSavedSearch*)object_
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
