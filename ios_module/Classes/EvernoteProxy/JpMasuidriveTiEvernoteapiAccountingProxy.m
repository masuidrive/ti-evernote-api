#import "JpMasuidriveTiEvernoteapiAccountingProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAccounting)
-(id)createAccounting:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiAccountingProxy alloc] initWithObject: [[[EDAMAccounting alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiAccountingProxy
@synthesize object;


-(id)uploadLimit
{
    return NUMLONGLONG(object.uploadLimit);
}

-(void)setUploadLimit:(id)value
{
    object.uploadLimit = [value longLongValue];
}


-(id)uploadLimitEnd
{
    return NUMLONGLONG(object.uploadLimitEnd);
}

-(void)setUploadLimitEnd:(id)value
{
    object.uploadLimitEnd = [value longLongValue];
}


-(id)uploadLimitNextMonth
{
    return NUMLONGLONG(object.uploadLimitNextMonth);
}

-(void)setUploadLimitNextMonth:(id)value
{
    object.uploadLimitNextMonth = [value longLongValue];
}


-(id)premiumServiceStatus
{
    return NUMLONG(object.premiumServiceStatus);
}

-(void)setPremiumServiceStatus:(id)value
{
    object.premiumServiceStatus = [value longValue];
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
    return NUMLONGLONG(object.premiumServiceStart);
}

-(void)setPremiumServiceStart:(id)value
{
    object.premiumServiceStart = [value longLongValue];
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
    return NUMLONGLONG(object.lastSuccessfulCharge);
}

-(void)setLastSuccessfulCharge:(id)value
{
    object.lastSuccessfulCharge = [value longLongValue];
}


-(id)lastFailedCharge
{
    return NUMLONGLONG(object.lastFailedCharge);
}

-(void)setLastFailedCharge:(id)value
{
    object.lastFailedCharge = [value longLongValue];
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
    return NUMLONGLONG(object.nextPaymentDue);
}

-(void)setNextPaymentDue:(id)value
{
    object.nextPaymentDue = [value longLongValue];
}


-(id)premiumLockUntil
{
    return NUMLONGLONG(object.premiumLockUntil);
}

-(void)setPremiumLockUntil:(id)value
{
    object.premiumLockUntil = [value longLongValue];
}


-(id)updated
{
    return NUMLONGLONG(object.updated);
}

-(void)setUpdated:(id)value
{
    object.updated = [value longLongValue];
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
    return NUMLONGLONG(object.lastRequestedCharge);
}

-(void)setLastRequestedCharge:(id)value
{
    object.lastRequestedCharge = [value longLongValue];
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
    return NUMLONG(object.unitPrice);
}

-(void)setUnitPrice:(id)value
{
    object.unitPrice = [value longValue];
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
