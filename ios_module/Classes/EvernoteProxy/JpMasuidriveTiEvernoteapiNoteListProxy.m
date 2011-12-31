#import "JpMasuidriveTiEvernoteapiNoteListProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"

#import "JpMasuidriveTiEvernoteapiNoteProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteList)
- (id)createNoteList:(id)args
{
    ENSURE_SINGLE_ARG_OR_NIL(args, NSDictionary);
    EDAMNoteList* thrift_object = [[[EDAMNoteList alloc] init] autorelease];
    JpMasuidriveTiEvernoteapiNoteListProxy* proxy = [[[JpMasuidriveTiEvernoteapiNoteListProxy alloc] initWithObject: thrift_object] autorelease];
    if(args) {
        id val;

        val = [args objectForKey:@"startIndex"];
        if(val) {
            [proxy setStartIndex:val];
        }

        val = [args objectForKey:@"totalNotes"];
        if(val) {
            [proxy setTotalNotes:val];
        }

        val = [args objectForKey:@"notes"];
        if(val) {
            [proxy setNotes:val];
        }

        val = [args objectForKey:@"stoppedWords"];
        if(val) {
            [proxy setStoppedWords:val];
        }

        val = [args objectForKey:@"searchedWords"];
        if(val) {
            [proxy setSearchedWords:val];
        }

        val = [args objectForKey:@"updateCount"];
        if(val) {
            [proxy setUpdateCount:val];
        }

    }
    return proxy;
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteListProxy
@synthesize object;

- (id)initWithObject:(EDAMNoteList*)thrift_object
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
        NUMLONG(object.startIndex), @"startIndex",
        NUMLONG(object.totalNotes), @"totalNotes",
        arrayMap(object.notes, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: item] autorelease]; }), @"notes",
        arrayMap(object.stoppedWords, ^(id item) { return item; }), @"stoppedWords",
        arrayMap(object.searchedWords, ^(id item) { return item; }), @"searchedWords",
        NUMLONG(object.updateCount), @"updateCount",
    nil];
}


- (id)startIndex
{
    return NUMLONG(object.startIndex);
}

- (void)setStartIndex:(id)value
{
    object.startIndex = [value longValue];
}


- (id)totalNotes
{
    return NUMLONG(object.totalNotes);
}

- (void)setTotalNotes:(id)value
{
    object.totalNotes = [value longValue];
}


- (id)notes
{
    return arrayMap(object.notes, ^(id item) { return [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: item] autorelease]; });
}

- (void)setNotes:(id)value
{
    object.notes = arrayMap(value, ^(id item) { return ((JpMasuidriveTiEvernoteapiNoteProxy*)item).object; });
}


- (id)stoppedWords
{
    return arrayMap(object.stoppedWords, ^(id item) { return item; });
}

- (void)setStoppedWords:(id)value
{
    object.stoppedWords = arrayMap(value, ^(id item) { return item; });
}


- (id)searchedWords
{
    return arrayMap(object.searchedWords, ^(id item) { return item; });
}

- (void)setSearchedWords:(id)value
{
    object.searchedWords = arrayMap(value, ^(id item) { return item; });
}


- (id)updateCount
{
    return NUMLONG(object.updateCount);
}

- (void)setUpdateCount:(id)value
{
    object.updateCount = [value longValue];
}



@end
