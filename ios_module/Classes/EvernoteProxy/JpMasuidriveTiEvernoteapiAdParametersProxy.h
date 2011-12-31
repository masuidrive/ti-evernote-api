#import "TiProxy.h"
#import "NoteStore.h"

@interface JpMasuidriveTiEvernoteapiAdParametersProxy : TiProxy {
@private
    EDAMAdParameters* object;
}
@property (nonatomic, retain) EDAMAdParameters* object;

- (id)initWithObject:(EDAMAdParameters*)thrift_object;
- (NSDictionary*)toHash:(id)args;


- (id)clientLanguage;
- (void)setClientLanguage:(id)value;

- (id)impressions;
- (void)setImpressions:(id)value;

- (id)supportHtml;
- (void)setSupportHtml:(id)value;

- (id)clientProperties;
- (void)setClientProperties:(id)value;

@end
