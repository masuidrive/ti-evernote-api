#import "EDAMNoteCollectionCountsProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"
@interface JpMasuidriveTiEvernoteapiModule(EDAMNoteCollectionCounts)
-(id)createNoteCollectionCounts:(id)args;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMNoteCollectionCounts)
-(id)createNoteCollectionCounts:(id)args
{
    return [[[EDAMNoteCollectionCountsProxy alloc] initWithObject: [[[EDAMNoteCollectionCounts alloc] init] autorelease]] autorelease];
}
@end


@implementation EDAMNoteCollectionCountsProxy
@synthesize object;


-(id)notebookCounts
{
    return 				dictionaryMap(object.notebookCounts, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

-(void)setNotebookCounts:(id)value
{
    object.notebookCounts = 				dictionaryMap(value, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

-(id)tagCounts
{
    return 				dictionaryMap(object.tagCounts, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

-(void)setTagCounts:(id)value
{
    object.tagCounts = 				dictionaryMap(value, ^(id key, id obj) {
					return [NSArray arrayWithObjects:
						key,
						obj,
					nil];
				})
;
}

-(id)trashCount
{
    return NUMINT(object.trashCount);
}

-(void)setTrashCount:(id)value
{
    object.trashCount = [value integerValue];
}


- (id)initWithObject:(EDAMNoteCollectionCounts*)object_
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
