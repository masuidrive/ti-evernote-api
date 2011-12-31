#import "Errors.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

@implementation EDAMNotFoundException (Dictionary)
-(NSDictionary*)dictionary
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        self.identifier, @"identifier",
        self.key, @"key",
        nil];
}

-(NSString*)exceptionName
{
    return @"EDAMNotFoundException";
}

@end
