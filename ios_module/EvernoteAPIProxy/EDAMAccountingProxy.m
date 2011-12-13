#import "EDAMAccountingProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMAccounting)
-(id)createAccounting:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMAccounting)
-(id)createAccounting:(id)args
{
    return [[[EDAMAccountingProxy alloc] initWithObject: [[[EDAMAccounting alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMAccountingProxy
@synthesize object;


-(id)uploadLimit
{
    return NUMLONG(object.uploadLimit);
}

-(void)setUploadLimit:(id)value
{
    object.uploadLimit = [value longValue];
}

-(id)uploadLimitEnd
{
    return NUMLONG(object.uploadLimitEnd);
}

-(void)setUploadLimitEnd:(id)value
{
    object.uploadLimitEnd = [value longValue];
}

-(id)uploadLimitNextMonth
{
    return NUMLONG(object.uploadLimitNextMonth);
}

-(void)setUploadLimitNextMonth:(id)value
{
    object.uploadLimitNextMonth = [value longValue];
}

-(id)premiumServiceStatus
{
    return NUMINT(object.premiumServiceStatus);
}

-(void)setPremiumServiceStatus:(id)value
{
    object.premiumServiceStatus = [value integerValue];
}

-(id)premiumOrderNumber
{
    return object.premiumOrderNumber;
}

-(void)setPremiumOrderNumber:(id)value
{
    object.premiumOrderNumber = [TiUtils stringValue:value];
}

-(id)premiumCommerceService
{
    return object.premiumCommerceService;
}

-(void)setPremiumCommerceService:(id)value
{
    object.premiumCommerceService = [TiUtils stringValue:value];
}

-(id)premiumServiceStart
{
    return NUMLONG(object.premiumServiceStart);
}

-(void)setPremiumServiceStart:(id)value
{
    object.premiumServiceStart = [value longValue];
}

-(id)premiumServiceSKU
{
    return object.premiumServiceSKU;
}

-(void)setPremiumServiceSKU:(id)value
{
    object.premiumServiceSKU = [TiUtils stringValue:value];
}

-(id)lastSuccessfulCharge
{
    return NUMLONG(object.lastSuccessfulCharge);
}

-(void)setLastSuccessfulCharge:(id)value
{
    object.lastSuccessfulCharge = [value longValue];
}

-(id)lastFailedCharge
{
    return NUMLONG(object.lastFailedCharge);
}

-(void)setLastFailedCharge:(id)value
{
    object.lastFailedCharge = [value longValue];
}

-(id)lastFailedChargeReason
{
    return object.lastFailedChargeReason;
}

-(void)setLastFailedChargeReason:(id)value
{
    object.lastFailedChargeReason = [TiUtils stringValue:value];
}

-(id)nextPaymentDue
{
    return NUMLONG(object.nextPaymentDue);
}

-(void)setNextPaymentDue:(id)value
{
    object.nextPaymentDue = [value longValue];
}

-(id)premiumLockUntil
{
    return NUMLONG(object.premiumLockUntil);
}

-(void)setPremiumLockUntil:(id)value
{
    object.premiumLockUntil = [value longValue];
}

-(id)updated
{
    return NUMLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longValue];
}

-(id)premiumSubscriptionNumber
{
    return object.premiumSubscriptionNumber;
}

-(void)setPremiumSubscriptionNumber:(id)value
{
    object.premiumSubscriptionNumber = [TiUtils stringValue:value];
}

-(id)lastRequestedCharge
{
    return NUMLONG(object.lastRequestedCharge);
}

-(void)setLastRequestedCharge:(id)value
{
    object.lastRequestedCharge = [value longValue];
}

-(id)currency
{
    return object.currency;
}

-(void)setCurrency:(id)value
{
    object.currency = [TiUtils stringValue:value];
}

-(id)unitPrice
{
    return NUMINT(object.unitPrice);
}

-(void)setUnitPrice:(id)value
{
    object.unitPrice = [value integerValue];
}


- (id)initWithObject:(EDAMAccounting*)object_
{
    if(self = [super init]){
        self.object = object_;
    }
    return self;
}

- (void)dealloc
{
    self.object = nil;
    [super release];
}
@end
