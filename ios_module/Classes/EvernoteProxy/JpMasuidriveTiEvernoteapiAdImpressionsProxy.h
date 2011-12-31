#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiAdImpressionsProxy : TiProxy {
@private
    EDAMAdImpressions* object;
}
@property (nonatomic, retain) EDAMAdImpressions* object;

- (id)initWithObject:(EDAMAdImpressions*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)adId;
- (void)setAdId:(id)value;

- (id)impressionCount;
- (void)setImpressionCount:(id)value;

- (id)impressionTime;
- (void)setImpressionTime:(id)value;

@end
