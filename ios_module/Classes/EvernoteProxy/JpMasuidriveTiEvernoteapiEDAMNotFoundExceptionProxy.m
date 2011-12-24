#import "Errors.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

@implementation EDAMNotFoundException (Dictionary)
-(NSDictionary*)dictionary
{
	return [NSDictionary dictionaryWithObjectsAndKeys:
		NSStringFromClass([self class]), @"exceptionType",
		self.identifier, @"identifier",
		self.key, @"key",
	nil];
}
@end
