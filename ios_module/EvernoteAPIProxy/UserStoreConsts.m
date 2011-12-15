#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule(UserStoreConstValues)

-(id)UserStore
{
	id result = [consts objectForKey:@"UserStore"];
	if(!result) {
		result = [NSDictionary dictionaryWithObjectsAndKeys:
			NUMDOUBLE(1.0), @"EDAM_VERSION_MAJOR",
			NUMDOUBLE(19.0), @"EDAM_VERSION_MINOR",
			nil];
	}
	return result;
}
@end