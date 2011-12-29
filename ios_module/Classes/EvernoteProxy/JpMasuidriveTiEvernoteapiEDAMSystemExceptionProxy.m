#import "Errors.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

@implementation EDAMSystemException (Dictionary)
-(NSDictionary*)dictionary
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
		NSStringFromClass([self class]), @"exceptionType",
		NUMLONG(self.errorCode), @"errorCode",
		self.message, @"message",
	nil];
}
@end
