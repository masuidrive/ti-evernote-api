#import "TiProxy.h"
#import "Types.h"

@interface JpMasuidriveTiEvernoteapiAccountingProxy : TiProxy {
@private
    EDAMAccounting* object;
}
@property (nonatomic, retain) EDAMAccounting* object;

- (id)initWithObject:(EDAMAccounting*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)uploadLimit;
- (void)setUploadLimit:(id)value;

- (id)uploadLimitEnd;
- (void)setUploadLimitEnd:(id)value;

- (id)uploadLimitNextMonth;
- (void)setUploadLimitNextMonth:(id)value;

- (id)premiumServiceStatus;
- (void)setPremiumServiceStatus:(id)value;

- (id)premiumOrderNumber;
- (void)setPremiumOrderNumber:(id)value;

- (id)premiumCommerceService;
- (void)setPremiumCommerceService:(id)value;

- (id)premiumServiceStart;
- (void)setPremiumServiceStart:(id)value;

- (id)premiumServiceSKU;
- (void)setPremiumServiceSKU:(id)value;

- (id)lastSuccessfulCharge;
- (void)setLastSuccessfulCharge:(id)value;

- (id)lastFailedCharge;
- (void)setLastFailedCharge:(id)value;

- (id)lastFailedChargeReason;
- (void)setLastFailedChargeReason:(id)value;

- (id)nextPaymentDue;
- (void)setNextPaymentDue:(id)value;

- (id)premiumLockUntil;
- (void)setPremiumLockUntil:(id)value;

- (id)updated;
- (void)setUpdated:(id)value;

- (id)premiumSubscriptionNumber;
- (void)setPremiumSubscriptionNumber:(id)value;

- (id)lastRequestedCharge;
- (void)setLastRequestedCharge:(id)value;

- (id)currency;
- (void)setCurrency:(id)value;

- (id)unitPrice;
- (void)setUnitPrice:(id)value;

@end
