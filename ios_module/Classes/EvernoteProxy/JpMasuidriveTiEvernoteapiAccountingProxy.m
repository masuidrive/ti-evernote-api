#import "JpMasuidriveTiEvernoteapiAccountingProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMAccounting)
- (id)createAccounting:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMAccounting* thrift_object = [[[EDAMAccounting alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiAccountingProxy* proxy = [[[JpMasuidriveTiEvernoteapiAccountingProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"uploadLimit"];
        if(val) {
            [proxy setUploadLimit:val];
        }

        val = [args objectForKey:@"uploadLimitEnd"];
        if(val) {
            [proxy setUploadLimitEnd:val];
        }

        val = [args objectForKey:@"uploadLimitNextMonth"];
        if(val) {
            [proxy setUploadLimitNextMonth:val];
        }

        val = [args objectForKey:@"premiumServiceStatus"];
        if(val) {
            [proxy setPremiumServiceStatus:val];
        }

        val = [args objectForKey:@"premiumOrderNumber"];
        if(val) {
            [proxy setPremiumOrderNumber:val];
        }

        val = [args objectForKey:@"premiumCommerceService"];
        if(val) {
            [proxy setPremiumCommerceService:val];
        }

        val = [args objectForKey:@"premiumServiceStart"];
        if(val) {
            [proxy setPremiumServiceStart:val];
        }

        val = [args objectForKey:@"premiumServiceSKU"];
        if(val) {
            [proxy setPremiumServiceSKU:val];
        }

        val = [args objectForKey:@"lastSuccessfulCharge"];
        if(val) {
            [proxy setLastSuccessfulCharge:val];
        }

        val = [args objectForKey:@"lastFailedCharge"];
        if(val) {
            [proxy setLastFailedCharge:val];
        }

        val = [args objectForKey:@"lastFailedChargeReason"];
        if(val) {
            [proxy setLastFailedChargeReason:val];
        }

        val = [args objectForKey:@"nextPaymentDue"];
        if(val) {
            [proxy setNextPaymentDue:val];
        }

        val = [args objectForKey:@"premiumLockUntil"];
        if(val) {
            [proxy setPremiumLockUntil:val];
        }

        val = [args objectForKey:@"updated"];
        if(val) {
            [proxy setUpdated:val];
        }

        val = [args objectForKey:@"premiumSubscriptionNumber"];
        if(val) {
            [proxy setPremiumSubscriptionNumber:val];
        }

        val = [args objectForKey:@"lastRequestedCharge"];
        if(val) {
            [proxy setLastRequestedCharge:val];
        }

        val = [args objectForKey:@"currency"];
        if(val) {
            [proxy setCurrency:val];
        }

        val = [args objectForKey:@"unitPrice"];
        if(val) {
            [proxy setUnitPrice:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiAccountingProxy
@synthesize object;

- (id)initWithObject:(EDAMAccounting*)thrift_object
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
        NUMLONGLONG(object.uploadLimit), @"uploadLimit",
        NUMLONGLONG(object.uploadLimitEnd), @"uploadLimitEnd",
        NUMLONGLONG(object.uploadLimitNextMonth), @"uploadLimitNextMonth",
        NUMLONG(object.premiumServiceStatus), @"premiumServiceStatus",
        object.premiumOrderNumber, @"premiumOrderNumber",
        object.premiumCommerceService, @"premiumCommerceService",
        NUMLONGLONG(object.premiumServiceStart), @"premiumServiceStart",
        object.premiumServiceSKU, @"premiumServiceSKU",
        NUMLONGLONG(object.lastSuccessfulCharge), @"lastSuccessfulCharge",
        NUMLONGLONG(object.lastFailedCharge), @"lastFailedCharge",
        object.lastFailedChargeReason, @"lastFailedChargeReason",
        NUMLONGLONG(object.nextPaymentDue), @"nextPaymentDue",
        NUMLONGLONG(object.premiumLockUntil), @"premiumLockUntil",
        NUMLONGLONG(object.updated), @"updated",
        object.premiumSubscriptionNumber, @"premiumSubscriptionNumber",
        NUMLONGLONG(object.lastRequestedCharge), @"lastRequestedCharge",
        object.currency, @"currency",
        NUMLONG(object.unitPrice), @"unitPrice",
    nil];
}


- (id)uploadLimit
{
    return NUMLONGLONG(object.uploadLimit);
}

- (void)setUploadLimit:(id)value
{
    object.uploadLimit = [value longLongValue];
}


- (id)uploadLimitEnd
{
    return NUMLONGLONG(object.uploadLimitEnd);
}

- (void)setUploadLimitEnd:(id)value
{
    object.uploadLimitEnd = [value longLongValue];
}


- (id)uploadLimitNextMonth
{
    return NUMLONGLONG(object.uploadLimitNextMonth);
}

- (void)setUploadLimitNextMonth:(id)value
{
    object.uploadLimitNextMonth = [value longLongValue];
}


- (id)premiumServiceStatus
{
    return NUMLONG(object.premiumServiceStatus);
}

- (void)setPremiumServiceStatus:(id)value
{
    object.premiumServiceStatus = [value longValue];
}


- (id)premiumOrderNumber
{
    return object.premiumOrderNumber;
}

- (void)setPremiumOrderNumber:(id)value
{
    object.premiumOrderNumber = [TiUtils stringValue:value];
}


- (id)premiumCommerceService
{
    return object.premiumCommerceService;
}

- (void)setPremiumCommerceService:(id)value
{
    object.premiumCommerceService = [TiUtils stringValue:value];
}


- (id)premiumServiceStart
{
    return NUMLONGLONG(object.premiumServiceStart);
}

- (void)setPremiumServiceStart:(id)value
{
    object.premiumServiceStart = [value longLongValue];
}


- (id)premiumServiceSKU
{
    return object.premiumServiceSKU;
}

- (void)setPremiumServiceSKU:(id)value
{
    object.premiumServiceSKU = [TiUtils stringValue:value];
}


- (id)lastSuccessfulCharge
{
    return NUMLONGLONG(object.lastSuccessfulCharge);
}

- (void)setLastSuccessfulCharge:(id)value
{
    object.lastSuccessfulCharge = [value longLongValue];
}


- (id)lastFailedCharge
{
    return NUMLONGLONG(object.lastFailedCharge);
}

- (void)setLastFailedCharge:(id)value
{
    object.lastFailedCharge = [value longLongValue];
}


- (id)lastFailedChargeReason
{
    return object.lastFailedChargeReason;
}

- (void)setLastFailedChargeReason:(id)value
{
    object.lastFailedChargeReason = [TiUtils stringValue:value];
}


- (id)nextPaymentDue
{
    return NUMLONGLONG(object.nextPaymentDue);
}

- (void)setNextPaymentDue:(id)value
{
    object.nextPaymentDue = [value longLongValue];
}


- (id)premiumLockUntil
{
    return NUMLONGLONG(object.premiumLockUntil);
}

- (void)setPremiumLockUntil:(id)value
{
    object.premiumLockUntil = [value longLongValue];
}


- (id)updated
{
    return NUMLONGLONG(object.updated);
}

- (void)setUpdated:(id)value
{
    object.updated = [value longLongValue];
}


- (id)premiumSubscriptionNumber
{
    return object.premiumSubscriptionNumber;
}

- (void)setPremiumSubscriptionNumber:(id)value
{
    object.premiumSubscriptionNumber = [TiUtils stringValue:value];
}


- (id)lastRequestedCharge
{
    return NUMLONGLONG(object.lastRequestedCharge);
}

- (void)setLastRequestedCharge:(id)value
{
    object.lastRequestedCharge = [value longLongValue];
}


- (id)currency
{
    return object.currency;
}

- (void)setCurrency:(id)value
{
    object.currency = [TiUtils stringValue:value];
}


- (id)unitPrice
{
    return NUMLONG(object.unitPrice);
}

- (void)setUnitPrice:(id)value
{
    object.unitPrice = [value longValue];
}



@end
