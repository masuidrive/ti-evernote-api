#import "Errors.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

@implementation EDAMUserException (Dictionary)
-(NSDictionary*)dictionary
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
		NSStringFromClass([self class]), @"exceptionType",
		NUMINT(self.errorCode), @"errorCode",
		self.parameter, @"parameter",
	nil];
}
@end
