#import "JpMasuidriveTiEvernoteapiNoteStoreClientProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "THTTPClient.h"
#import "TBinaryProtocol.h"

#import "JpMasuidriveTiEvernoteapiSyncChunkFilterProxy.h"
#import "JpMasuidriveTiEvernoteapiLinkedNotebookProxy.h"
#import "JpMasuidriveTiEvernoteapiNotebookProxy.h"
#import "JpMasuidriveTiEvernoteapiTagProxy.h"
#import "JpMasuidriveTiEvernoteapiSavedSearchProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteFilterProxy.h"
#import "JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteProxy.h"
#import "JpMasuidriveTiEvernoteapiResourceProxy.h"
#import "JpMasuidriveTiEvernoteapiAdParametersProxy.h"
#import "JpMasuidriveTiEvernoteapiSharedNotebookProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteEmailParametersProxy.h"
#import "JpMasuidriveTiEvernoteapiSyncStateProxy.h"
#import "JpMasuidriveTiEvernoteapiSyncChunkProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteListProxy.h"
#import "JpMasuidriveTiEvernoteapiNotesMetadataListProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy.h"
#import "JpMasuidriveTiEvernoteapiNoteVersionIdProxy.h"
#import "JpMasuidriveTiEvernoteapiResourceAttributesProxy.h"
#import "JpMasuidriveTiEvernoteapiAdProxy.h"
#import "JpMasuidriveTiEvernoteapiAuthenticationResultProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@implementation JpMasuidriveTiEvernoteapiModule (EDAMNoteStoreClient)
-(id)createNoteStoreClient:(id)arg
{
    ENSURE_SINGLE_ARG(arg, NSString);
    return [[[JpMasuidriveTiEvernoteapiNoteStoreClientProxy alloc] initWithUri:arg] autorelease];
}
@end


@implementation JpMasuidriveTiEvernoteapiNoteStoreClientProxy 

@synthesize client;


- (id)initWithUri: (NSString*)uri
{
    [super initWithUri:uri];
    
    self.client = [[[EDAMNoteStoreClient alloc] initWithProtocol:protocol] autorelease];
    
    return self;
}

- (void)dealloc
{
    self.client = nil;
    [super dealloc];
}


- (id)getSyncState: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSyncStateProxy alloc] initWithObject: [client getSyncState : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getSyncChunk: (id)args
{
    ENSURE_ARG_COUNT(args, 5);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:4];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSyncChunkProxy alloc] initWithObject: [client getSyncChunk : [TiUtils stringValue:[args objectAtIndex:0]] : [[args objectAtIndex:1] integerValue] : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getFilteredSyncChunk: (id)args
{
    ENSURE_ARG_COUNT(args, 5);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:4];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSyncChunkProxy alloc] initWithObject: [client getFilteredSyncChunk : [TiUtils stringValue:[args objectAtIndex:0]] : [[args objectAtIndex:1] integerValue] : [[args objectAtIndex:2] integerValue] : ((JpMasuidriveTiEvernoteapiSyncChunkFilterProxy*)[args objectAtIndex:3]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getLinkedNotebookSyncState: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSyncStateProxy alloc] initWithObject: [client getLinkedNotebookSyncState : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiLinkedNotebookProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getLinkedNotebookSyncChunk: (id)args
{
    ENSURE_ARG_COUNT(args, 6);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:5];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSyncChunkProxy alloc] initWithObject: [client getLinkedNotebookSyncChunk : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiLinkedNotebookProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] integerValue] : [[args objectAtIndex:4] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listNotebooks : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: [client getNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getDefaultNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: [client getDefaultNotebook : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)createNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: [client createNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNotebookProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)updateNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client updateNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNotebookProxy*)[args objectAtIndex:1]).object]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listTags: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listTags : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listTagsByNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listTagsByNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getTag: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: [client getTag : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)createTag: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiTagProxy alloc] initWithObject: [client createTag : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiTagProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)updateTag: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client updateTag : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiTagProxy*)[args objectAtIndex:1]).object]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)untagAll: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            [client untagAll : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]];
                    NSDictionary *event = [NSDictionary dictionary];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeTag: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeTag : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listSearches: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listSearches : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: [client getSearch : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)createSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSavedSearchProxy alloc] initWithObject: [client createSearch : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiSavedSearchProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)updateSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client updateSearch : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiSavedSearchProxy*)[args objectAtIndex:1]).object]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeSearch : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)findNotes: (id)args
{
    ENSURE_ARG_COUNT(args, 5);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:4];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteListProxy alloc] initWithObject: [client findNotes : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteFilterProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] integerValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)findNoteOffset: (id)args
{
    ENSURE_ARG_COUNT(args, 4);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:3];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client findNoteOffset : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteFilterProxy*)[args objectAtIndex:1]).object : [TiUtils stringValue:[args objectAtIndex:2]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)findNotesMetadata: (id)args
{
    ENSURE_ARG_COUNT(args, 6);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:5];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNotesMetadataListProxy alloc] initWithObject: [client findNotesMetadata : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteFilterProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] integerValue] : ((JpMasuidriveTiEvernoteapiNotesMetadataResultSpecProxy*)[args objectAtIndex:4]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)findNoteCounts: (id)args
{
    ENSURE_ARG_COUNT(args, 4);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:3];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteCollectionCountsProxy alloc] initWithObject: [client findNoteCounts : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteFilterProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getNote: (id)args
{
    ENSURE_ARG_COUNT(args, 7);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:6];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: [client getNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] boolValue] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getNoteContent: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [client getNoteContent : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getNoteSearchText: (id)args
{
    ENSURE_ARG_COUNT(args, 5);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:4];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [client getNoteSearchText : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] boolValue] : [[args objectAtIndex:3] boolValue]], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResourceSearchText: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [client getResourceSearchText : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getNoteTagNames: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client getNoteTagNames : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], ^(id item) { return item; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)createNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: [client createNote : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)updateNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: [client updateNote : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)deleteNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client deleteNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeNotes: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeNotes : [TiUtils stringValue:[args objectAtIndex:0]] : arrayMap([args objectAtIndex:1], ^(id item) { return item; })]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeInactiveNotes: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeInactiveNotes : [TiUtils stringValue:[args objectAtIndex:0]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)copyNote: (id)args
{
    ENSURE_ARG_COUNT(args, 4);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:3];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: [client copyNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [TiUtils stringValue:[args objectAtIndex:2]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listNoteVersions: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listNoteVersions : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiNoteVersionIdProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getNoteVersion: (id)args
{
    ENSURE_ARG_COUNT(args, 7);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:6];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNoteProxy alloc] initWithObject: [client getNoteVersion : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResource: (id)args
{
    ENSURE_ARG_COUNT(args, 7);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:6];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: [client getResource : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] boolValue] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)updateResource: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client updateResource : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiResourceProxy*)[args objectAtIndex:1]).object]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResourceData: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[TiBlob alloc] initWithData:[client getResourceData : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]] mimetype:@"application/octet-stream"] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResourceByHash: (id)args
{
    ENSURE_ARG_COUNT(args, 7);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:6];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiResourceProxy alloc] initWithObject: [client getResourceByHash : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] data] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResourceRecognition: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[TiBlob alloc] initWithData:[client getResourceRecognition : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]] mimetype:@"application/octet-stream"] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResourceAlternateData: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[TiBlob alloc] initWithData:[client getResourceAlternateData : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]] mimetype:@"application/octet-stream"] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getResourceAttributes: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiResourceAttributesProxy alloc] initWithObject: [client getResourceAttributes : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getAccountSize: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMLONG([client getAccountSize : [TiUtils stringValue:[args objectAtIndex:0]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getAds: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client getAds : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiAdParametersProxy*)[args objectAtIndex:1]).object], ^(id item) { return [[[JpMasuidriveTiEvernoteapiAdProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getRandomAd: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiAdProxy alloc] initWithObject: [client getRandomAd : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiAdParametersProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getPublicNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiNotebookProxy alloc] initWithObject: [client getPublicNotebook : [[args objectAtIndex:0] integerValue] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)createSharedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSharedNotebookProxy alloc] initWithObject: [client createSharedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiSharedNotebookProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listSharedNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listSharedNotebooks : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiSharedNotebookProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeSharedNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeSharedNotebooks : [TiUtils stringValue:[args objectAtIndex:0]] : arrayMap([args objectAtIndex:1], ^(id item) { return item; })]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)createLinkedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: [client createLinkedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiLinkedNotebookProxy*)[args objectAtIndex:1]).object]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)updateLinkedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client updateLinkedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiLinkedNotebookProxy*)[args objectAtIndex:1]).object]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)listLinkedNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: arrayMap([client listLinkedNotebooks : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[JpMasuidriveTiEvernoteapiLinkedNotebookProxy alloc] initWithObject: item] autorelease]; }), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)expungeLinkedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: NUMINT([client expungeLinkedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]), @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)authenticateToSharedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiAuthenticationResultProxy alloc] initWithObject: [client authenticateToSharedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)getSharedNotebookByAuth: (id)args
{
    ENSURE_ARG_COUNT(args, 2);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:1];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiSharedNotebookProxy alloc] initWithObject: [client getSharedNotebookByAuth : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)emailNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            [client emailNote : [TiUtils stringValue:[args objectAtIndex:0]] : ((JpMasuidriveTiEvernoteapiNoteEmailParametersProxy*)[args objectAtIndex:1]).object];
                    NSDictionary *event = [NSDictionary dictionary];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)shareNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [client shareNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)stopSharingNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            [client stopSharingNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]];
                    NSDictionary *event = [NSDictionary dictionary];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

- (id)authenticateToSharedNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);

    dispatch_async(queue, ^{
        KrollCallback* callback = [args objectAtIndex:2];
        @try {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: [[[JpMasuidriveTiEvernoteapiAuthenticationResultProxy alloc] initWithObject: [client authenticateToSharedNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease], @"result", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"success", event, callback, nil]];
        }
        @catch (NSException *exception) {
            NSDictionary *event = [NSDictionary dictionaryWithObjectsAndKeys: exception, @"error", nil];
            [NSThread detachNewThreadSelector:@selector(dispatchCallback:) toTarget:self withObject:[NSArray arrayWithObjects:@"error", event, callback, nil]];
        }
    });
    return self;
}

@end
