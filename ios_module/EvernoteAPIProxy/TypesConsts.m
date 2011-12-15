#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule(TypesConstValues)

-(id)Types
{
	id result = [consts objectForKey:@"Types"];
	if(!result) {
		result = [NSDictionary dictionaryWithObjectsAndKeys:
			@"web.clip", @"EDAM_NOTE_SOURCE_WEB_CLIP",
			@"mail.clip", @"EDAM_NOTE_SOURCE_MAIL_CLIP",
			@"mail.smtp", @"EDAM_NOTE_SOURCE_MAIL_SMTP_GATEWAY",
			nil];
	}
	return result;
}
@end