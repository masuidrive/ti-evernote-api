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

			[NSDictionary dictionaryWithObjectsAndKeys:
				NUMDOUBLE(1), @"NORMAL",
				NUMDOUBLE(3), @"PREMIUM",
				NUMDOUBLE(7), @"MANAGER",
				NUMDOUBLE(8), @"SUPPORT",
				NUMDOUBLE(9), @"ADMIN",
				nil], @"PrivilegeLevel",
			[NSDictionary dictionaryWithObjectsAndKeys:
				NUMDOUBLE(1), @"USER",
				NUMDOUBLE(2), @"SEXP",
				nil], @"QueryFormat",
			[NSDictionary dictionaryWithObjectsAndKeys:
				NUMDOUBLE(1), @"CREATED",
				NUMDOUBLE(2), @"UPDATED",
				NUMDOUBLE(3), @"RELEVANCE",
				NUMDOUBLE(4), @"UPDATE_SEQUENCE_NUMBER",
				NUMDOUBLE(5), @"TITLE",
				nil], @"NoteSortOrder",
			[NSDictionary dictionaryWithObjectsAndKeys:
				NUMDOUBLE(0), @"NONE",
				NUMDOUBLE(1), @"PENDING",
				NUMDOUBLE(2), @"ACTIVE",
				NUMDOUBLE(3), @"FAILED",
				NUMDOUBLE(4), @"CANCELLATION_PENDING",
				NUMDOUBLE(5), @"CANCELED",
				nil], @"PremiumOrderStatus",

			nil];
	}
	return result;
}
@end