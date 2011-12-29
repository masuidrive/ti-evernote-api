#import "JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"



#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteCollectionCounts)
-(id)createNoteCollectionCounts:(id)args
{
    return [[[JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy alloc] initWithObject: [[[EDAMNoteCollectionCounts alloc] init] autorelease]] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy
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
    return NUMLONG(object.trashCount);
}

-(void)setTrashCount:(id)value
{
    object.trashCount = [value longValue];
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
