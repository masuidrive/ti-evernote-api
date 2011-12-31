#import "Errors.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

@implementation EDAMUserException (Dictionary)
-(NSDictionary*)dictionary
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        NUMLONG(self.errorCode), @"errorCode",
        self.parameter, @"parameter",
        nil];
}

-(NSString*)exceptionName
{
    return @"EDAMUserException";
}

@end
