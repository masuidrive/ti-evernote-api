#import "JpMasuidriveTiEvernoteapiEDAMSavedSearchProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMSavedSearch)
-(id)createSavedSearch:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiEDAMSavedSearchProxy alloc] initWithObject: [[[EDAMSavedSearch alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiEDAMSavedSearchProxy
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
    return NUMINT(object.format);
}

-(void)setFormat:(id)value
{
    object.format = [value integerValue];
}


-(id)updateSequenceNum
{
    return NUMINT(object.updateSequenceNum);
}

-(void)setUpdateSequenceNum:(id)value
{
    object.updateSequenceNum = [value integerValue];
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
