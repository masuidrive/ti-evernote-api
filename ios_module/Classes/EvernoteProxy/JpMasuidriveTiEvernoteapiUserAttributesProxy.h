#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiUserAttributesProxy : TiProxy {
@private
    EDAMUserAttributes* object;
}
@property (nonatomic, retain) EDAMUserAttributes* object;

- (id)initWithObject:(EDAMUserAttributes*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)defaultLocationName;
- (void)setDefaultLocationName:(id)value;

- (id)defaultLatitude;
- (void)setDefaultLatitude:(id)value;

- (id)defaultLongitude;
- (void)setDefaultLongitude:(id)value;

- (id)preactivation;
- (void)setPreactivation:(id)value;

- (id)viewedPromotions;
- (void)setViewedPromotions:(id)value;

- (id)incomingEmailAddress;
- (void)setIncomingEmailAddress:(id)value;

- (id)recentMailedAddresses;
- (void)setRecentMailedAddresses:(id)value;

- (id)comments;
- (void)setComments:(id)value;

- (id)dateAgreedToTermsOfService;
- (void)setDateAgreedToTermsOfService:(id)value;

- (id)maxReferrals;
- (void)setMaxReferrals:(id)value;

- (id)referralCount;
- (void)setReferralCount:(id)value;

- (id)refererCode;
- (void)setRefererCode:(id)value;

- (id)sentEmailDate;
- (void)setSentEmailDate:(id)value;

- (id)sentEmailCount;
- (void)setSentEmailCount:(id)value;

- (id)dailyEmailLimit;
- (void)setDailyEmailLimit:(id)value;

- (id)emailOptOutDate;
- (void)setEmailOptOutDate:(id)value;

- (id)partnerEmailOptInDate;
- (void)setPartnerEmailOptInDate:(id)value;

- (id)preferredLanguage;
- (void)setPreferredLanguage:(id)value;

- (id)preferredCountry;
- (void)setPreferredCountry:(id)value;

- (id)clipFullPage;
- (void)setClipFullPage:(id)value;

- (id)twitterUserName;
- (void)setTwitterUserName:(id)value;

- (id)twitterId;
- (void)setTwitterId:(id)value;

- (id)groupName;
- (void)setGroupName:(id)value;

- (id)recognitionLanguage;
- (void)setRecognitionLanguage:(id)value;

- (id)customerProfileId;
- (void)setCustomerProfileId:(id)value;

- (id)referralProof;
- (void)setReferralProof:(id)value;

- (id)educationalDiscount;
- (void)setEducationalDiscount:(id)value;

- (id)businessAddress;
- (void)setBusinessAddress:(id)value;

- (id)hideSponsorBilling;
- (void)setHideSponsorBilling:(id)value;

@end
