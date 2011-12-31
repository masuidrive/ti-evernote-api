#import "Errors.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

@implementation EDAMSystemException (Dictionary)
-(NSDictionary*)dictionary
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        NUMLONG(self.errorCode), @"errorCode",
        self.message, @"message",
        nil];
}

-(NSString*)exceptionName
{
    return @"EDAMSystemException";
}

@end
