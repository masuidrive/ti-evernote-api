#import "JpMasuidriveTiEvernoteapiUserAttributesProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMUserAttributes)
- (id)createUserAttributes:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMUserAttributes* thrift_object = [[[EDAMUserAttributes alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiUserAttributesProxy* proxy = [[[JpMasuidriveTiEvernoteapiUserAttributesProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"defaultLocationName"];
        if(val) {
            [proxy setDefaultLocationName:val];
        }

        val = [args objectForKey:@"defaultLatitude"];
        if(val) {
            [proxy setDefaultLatitude:val];
        }

        val = [args objectForKey:@"defaultLongitude"];
        if(val) {
            [proxy setDefaultLongitude:val];
        }

        val = [args objectForKey:@"preactivation"];
        if(val) {
            [proxy setPreactivation:val];
        }

        val = [args objectForKey:@"viewedPromotions"];
        if(val) {
            [proxy setViewedPromotions:val];
        }

        val = [args objectForKey:@"incomingEmailAddress"];
        if(val) {
            [proxy setIncomingEmailAddress:val];
        }

        val = [args objectForKey:@"recentMailedAddresses"];
        if(val) {
            [proxy setRecentMailedAddresses:val];
        }

        val = [args objectForKey:@"comments"];
        if(val) {
            [proxy setComments:val];
        }

        val = [args objectForKey:@"dateAgreedToTermsOfService"];
        if(val) {
            [proxy setDateAgreedToTermsOfService:val];
        }

        val = [args objectForKey:@"maxReferrals"];
        if(val) {
            [proxy setMaxReferrals:val];
        }

        val = [args objectForKey:@"referralCount"];
        if(val) {
            [proxy setReferralCount:val];
        }

        val = [args objectForKey:@"refererCode"];
        if(val) {
            [proxy setRefererCode:val];
        }

        val = [args objectForKey:@"sentEmailDate"];
        if(val) {
            [proxy setSentEmailDate:val];
        }

        val = [args objectForKey:@"sentEmailCount"];
        if(val) {
            [proxy setSentEmailCount:val];
        }

        val = [args objectForKey:@"dailyEmailLimit"];
        if(val) {
            [proxy setDailyEmailLimit:val];
        }

        val = [args objectForKey:@"emailOptOutDate"];
        if(val) {
            [proxy setEmailOptOutDate:val];
        }

        val = [args objectForKey:@"partnerEmailOptInDate"];
        if(val) {
            [proxy setPartnerEmailOptInDate:val];
        }

        val = [args objectForKey:@"preferredLanguage"];
        if(val) {
            [proxy setPreferredLanguage:val];
        }

        val = [args objectForKey:@"preferredCountry"];
        if(val) {
            [proxy setPreferredCountry:val];
        }

        val = [args objectForKey:@"clipFullPage"];
        if(val) {
            [proxy setClipFullPage:val];
        }

        val = [args objectForKey:@"twitterUserName"];
        if(val) {
            [proxy setTwitterUserName:val];
        }

        val = [args objectForKey:@"twitterId"];
        if(val) {
            [proxy setTwitterId:val];
        }

        val = [args objectForKey:@"groupName"];
        if(val) {
            [proxy setGroupName:val];
        }

        val = [args objectForKey:@"recognitionLanguage"];
        if(val) {
            [proxy setRecognitionLanguage:val];
        }

        val = [args objectForKey:@"customerProfileId"];
        if(val) {
            [proxy setCustomerProfileId:val];
        }

        val = [args objectForKey:@"referralProof"];
        if(val) {
            [proxy setReferralProof:val];
        }

        val = [args objectForKey:@"educationalDiscount"];
        if(val) {
            [proxy setEducationalDiscount:val];
        }

        val = [args objectForKey:@"businessAddress"];
        if(val) {
            [proxy setBusinessAddress:val];
        }

        val = [args objectForKey:@"hideSponsorBilling"];
        if(val) {
            [proxy setHideSponsorBilling:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiUserAttributesProxy
@synthesize object;

- (id)initWithObject:(EDAMUserAttributes*)thrift_object
{
    if(self = [super init]){
        self.object = thrift_object;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super release];
}

- (NSDictionary*)toHash:(id)args
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        object.defaultLocationName, @"defaultLocationName",
        NUMDOUBLE(object.defaultLatitude), @"defaultLatitude",
        NUMDOUBLE(object.defaultLongitude), @"defaultLongitude",
        NUMBOOL(object.preactivation), @"preactivation",
        arrayMap(object.viewedPromotions, ^(id item) { return item; }), @"viewedPromotions",
        object.incomingEmailAddress, @"incomingEmailAddress",
        arrayMap(object.recentMailedAddresses, ^(id item) { return item; }), @"recentMailedAddresses",
        object.comments, @"comments",
        NUMLONGLONG(object.dateAgreedToTermsOfService), @"dateAgreedToTermsOfService",
        NUMLONG(object.maxReferrals), @"maxReferrals",
        NUMLONG(object.referralCount), @"referralCount",
        object.refererCode, @"refererCode",
        NUMLONGLONG(object.sentEmailDate), @"sentEmailDate",
        NUMLONG(object.sentEmailCount), @"sentEmailCount",
        NUMLONG(object.dailyEmailLimit), @"dailyEmailLimit",
        NUMLONGLONG(object.emailOptOutDate), @"emailOptOutDate",
        NUMLONGLONG(object.partnerEmailOptInDate), @"partnerEmailOptInDate",
        object.preferredLanguage, @"preferredLanguage",
        object.preferredCountry, @"preferredCountry",
        NUMBOOL(object.clipFullPage), @"clipFullPage",
        object.twitterUserName, @"twitterUserName",
        object.twitterId, @"twitterId",
        object.groupName, @"groupName",
        object.recognitionLanguage, @"recognitionLanguage",
        NUMLONGLONG(object.customerProfileId), @"customerProfileId",
        object.referralProof, @"referralProof",
        NUMBOOL(object.educationalDiscount), @"educationalDiscount",
        object.businessAddress, @"businessAddress",
        NUMBOOL(object.hideSponsorBilling), @"hideSponsorBilling",
    nil];
}


- (id)defaultLocationName
{
    return object.defaultLocationName;
}

- (void)setDefaultLocationName:(id)value
{
    object.defaultLocationName = [TiUtils stringValue:value];
}


- (id)defaultLatitude
{
    return NUMDOUBLE(object.defaultLatitude);
}

- (void)setDefaultLatitude:(id)value
{
    object.defaultLatitude = [value doubleValue];
}


- (id)defaultLongitude
{
    return NUMDOUBLE(object.defaultLongitude);
}

- (void)setDefaultLongitude:(id)value
{
    object.defaultLongitude = [value doubleValue];
}


- (id)preactivation
{
    return NUMBOOL(object.preactivation);
}

- (void)setPreactivation:(id)value
{
    object.preactivation = [value boolValue];
}


- (id)viewedPromotions
{
    return arrayMap(object.viewedPromotions, ^(id item) { return item; });
}

- (void)setViewedPromotions:(id)value
{
    object.viewedPromotions = arrayMap(value, ^(id item) { return item; });
}


- (id)incomingEmailAddress
{
    return object.incomingEmailAddress;
}

- (void)setIncomingEmailAddress:(id)value
{
    object.incomingEmailAddress = [TiUtils stringValue:value];
}


- (id)recentMailedAddresses
{
    return arrayMap(object.recentMailedAddresses, ^(id item) { return item; });
}

- (void)setRecentMailedAddresses:(id)value
{
    object.recentMailedAddresses = arrayMap(value, ^(id item) { return item; });
}


- (id)comments
{
    return object.comments;
}

- (void)setComments:(id)value
{
    object.comments = [TiUtils stringValue:value];
}


- (id)dateAgreedToTermsOfService
{
    return NUMLONGLONG(object.dateAgreedToTermsOfService);
}

- (void)setDateAgreedToTermsOfService:(id)value
{
    object.dateAgreedToTermsOfService = [value longLongValue];
}


- (id)maxReferrals
{
    return NUMLONG(object.maxReferrals);
}

- (void)setMaxReferrals:(id)value
{
    object.maxReferrals = [value longValue];
}


- (id)referralCount
{
    return NUMLONG(object.referralCount);
}

- (void)setReferralCount:(id)value
{
    object.referralCount = [value longValue];
}


- (id)refererCode
{
    return object.refererCode;
}

- (void)setRefererCode:(id)value
{
    object.refererCode = [TiUtils stringValue:value];
}


- (id)sentEmailDate
{
    return NUMLONGLONG(object.sentEmailDate);
}

- (void)setSentEmailDate:(id)value
{
    object.sentEmailDate = [value longLongValue];
}


- (id)sentEmailCount
{
    return NUMLONG(object.sentEmailCount);
}

- (void)setSentEmailCount:(id)value
{
    object.sentEmailCount = [value longValue];
}


- (id)dailyEmailLimit
{
    return NUMLONG(object.dailyEmailLimit);
}

- (void)setDailyEmailLimit:(id)value
{
    object.dailyEmailLimit = [value longValue];
}


- (id)emailOptOutDate
{
    return NUMLONGLONG(object.emailOptOutDate);
}

- (void)setEmailOptOutDate:(id)value
{
    object.emailOptOutDate = [value longLongValue];
}


- (id)partnerEmailOptInDate
{
    return NUMLONGLONG(object.partnerEmailOptInDate);
}

- (void)setPartnerEmailOptInDate:(id)value
{
    object.partnerEmailOptInDate = [value longLongValue];
}


- (id)preferredLanguage
{
    return object.preferredLanguage;
}

- (void)setPreferredLanguage:(id)value
{
    object.preferredLanguage = [TiUtils stringValue:value];
}


- (id)preferredCountry
{
    return object.preferredCountry;
}

- (void)setPreferredCountry:(id)value
{
    object.preferredCountry = [TiUtils stringValue:value];
}


- (id)clipFullPage
{
    return NUMBOOL(object.clipFullPage);
}

- (void)setClipFullPage:(id)value
{
    object.clipFullPage = [value boolValue];
}


- (id)twitterUserName
{
    return object.twitterUserName;
}

- (void)setTwitterUserName:(id)value
{
    object.twitterUserName = [TiUtils stringValue:value];
}


- (id)twitterId
{
    return object.twitterId;
}

- (void)setTwitterId:(id)value
{
    object.twitterId = [TiUtils stringValue:value];
}


- (id)groupName
{
    return object.groupName;
}

- (void)setGroupName:(id)value
{
    object.groupName = [TiUtils stringValue:value];
}


- (id)recognitionLanguage
{
    return object.recognitionLanguage;
}

- (void)setRecognitionLanguage:(id)value
{
    object.recognitionLanguage = [TiUtils stringValue:value];
}


- (id)customerProfileId
{
    return NUMLONGLONG(object.customerProfileId);
}

- (void)setCustomerProfileId:(id)value
{
    object.customerProfileId = [value longLongValue];
}


- (id)referralProof
{
    return object.referralProof;
}

- (void)setReferralProof:(id)value
{
    object.referralProof = [TiUtils stringValue:value];
}


- (id)educationalDiscount
{
    return NUMBOOL(object.educationalDiscount);
}

- (void)setEducationalDiscount:(id)value
{
    object.educationalDiscount = [value boolValue];
}


- (id)businessAddress
{
    return object.businessAddress;
}

- (void)setBusinessAddress:(id)value
{
    object.businessAddress = [TiUtils stringValue:value];
}


- (id)hideSponsorBilling
{
    return NUMBOOL(object.hideSponsorBilling);
}

- (void)setHideSponsorBilling:(id)value
{
    object.hideSponsorBilling = [value boolValue];
}



@end
