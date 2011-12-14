#import "EDAMNoteStoreClientProxy.h"
#import "TiUtils.h"
#import "TiThriftUtils.h"
#import "THTTPClient.h"
#import "TBinaryProtocol.h"

#import "EDAMSyncChunkFilterProxy.h"
#import "EDAMLinkedNotebookProxy.h"
#import "EDAMNotebookProxy.h"
#import "EDAMTagProxy.h"
#import "EDAMSavedSearchProxy.h"
#import "EDAMNoteFilterProxy.h"
#import "EDAMNotesMetadataResultSpecProxy.h"
#import "EDAMNoteProxy.h"
#import "EDAMResourceProxy.h"
#import "EDAMAdParametersProxy.h"
#import "EDAMSharedNotebookProxy.h"
#import "EDAMNoteEmailParametersProxy.h"
#import "EDAMSyncStateProxy.h"
#import "EDAMSyncChunkProxy.h"
#import "EDAMNoteListProxy.h"
#import "EDAMNotesMetadataListProxy.h"
#import "EDAMNoteCollectionCountsProxy.h"
#import "EDAMNoteVersionIdProxy.h"
#import "EDAMResourceAttributesProxy.h"
#import "EDAMAdProxy.h"
#import "EDAMAuthenticationResultProxy.h"


#import "JpMasuidriveTiEvernoteapiModule.h"

@interface JpMasuidriveTiEvernoteapiModule(EDAMNoteStoreClient)
-(id)createNoteStoreClient:(id)arg;
@end

@implementation JpMasuidriveTiEvernoteapiModule(EDAMNoteStoreClient)
-(id)createNoteStoreClient:(id)arg
{
    ENSURE_SINGLE_ARG(arg, NSString);
    return [[[EDAMNoteStoreClientProxy alloc] initWithUri:arg] autorelease];
}
@end


@implementation EDAMNoteStoreClientProxy 

@synthesize client;


- (id)initWithUri: (NSString*)uri
{
    NSURL* nsurl = [[[NSURL alloc] initWithString: uri] autorelease];
    
    THTTPClient* httpClient = [[[THTTPClient alloc] initWithURL: nsurl] autorelease];
    TBinaryProtocol* protocol = [[[TBinaryProtocol alloc] initWithTransport:httpClient] autorelease];
    
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
    ENSURE_ARG_COUNT(args, 1);
    return [[[EDAMSyncStateProxy alloc] initWithObject: [client getSyncState : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)getSyncChunk: (id)args
{
    ENSURE_ARG_COUNT(args, 4);
    return [[[EDAMSyncChunkProxy alloc] initWithObject: [client getSyncChunk : [TiUtils stringValue:[args objectAtIndex:0]] : [[args objectAtIndex:1] integerValue] : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] boolValue]]] autorelease];
}

- (id)getFilteredSyncChunk: (id)args
{
    ENSURE_ARG_COUNT(args, 4);
    return [[[EDAMSyncChunkProxy alloc] initWithObject: [client getFilteredSyncChunk : [TiUtils stringValue:[args objectAtIndex:0]] : [[args objectAtIndex:1] integerValue] : [[args objectAtIndex:2] integerValue] : ((EDAMSyncChunkFilterProxy*)[args objectAtIndex:3]).object]] autorelease];
}

- (id)getLinkedNotebookSyncState: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMSyncStateProxy alloc] initWithObject: [client getLinkedNotebookSyncState : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMLinkedNotebookProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)getLinkedNotebookSyncChunk: (id)args
{
    ENSURE_ARG_COUNT(args, 5);
    return [[[EDAMSyncChunkProxy alloc] initWithObject: [client getLinkedNotebookSyncChunk : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMLinkedNotebookProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] integerValue] : [[args objectAtIndex:4] boolValue]]] autorelease];
}

- (id)listNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return arrayMap([client listNotebooks : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[EDAMNotebookProxy alloc] initWithObject: item] autorelease]; });
}

- (id)getNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMNotebookProxy alloc] initWithObject: [client getNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

- (id)getDefaultNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[EDAMNotebookProxy alloc] initWithObject: [client getDefaultNotebook : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)createNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMNotebookProxy alloc] initWithObject: [client createNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNotebookProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)updateNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client updateNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNotebookProxy*)[args objectAtIndex:1]).object]);
}

- (id)expungeNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]);
}

- (id)listTags: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return arrayMap([client listTags : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[EDAMTagProxy alloc] initWithObject: item] autorelease]; });
}

- (id)listTagsByNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return arrayMap([client listTagsByNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], ^(id item) { return [[[EDAMTagProxy alloc] initWithObject: item] autorelease]; });
}

- (id)getTag: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMTagProxy alloc] initWithObject: [client getTag : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

- (id)createTag: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMTagProxy alloc] initWithObject: [client createTag : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMTagProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)updateTag: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client updateTag : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMTagProxy*)[args objectAtIndex:1]).object]);
}

- (id)untagAll: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return @"";
}

- (id)expungeTag: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeTag : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]);
}

- (id)listSearches: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return arrayMap([client listSearches : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[EDAMSavedSearchProxy alloc] initWithObject: item] autorelease]; });
}

- (id)getSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMSavedSearchProxy alloc] initWithObject: [client getSearch : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

- (id)createSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMSavedSearchProxy alloc] initWithObject: [client createSearch : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMSavedSearchProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)updateSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client updateSearch : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMSavedSearchProxy*)[args objectAtIndex:1]).object]);
}

- (id)expungeSearch: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeSearch : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]);
}

- (id)findNotes: (id)args
{
    ENSURE_ARG_COUNT(args, 4);
    return [[[EDAMNoteListProxy alloc] initWithObject: [client findNotes : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNoteFilterProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] integerValue]]] autorelease];
}

- (id)findNoteOffset: (id)args
{
    ENSURE_ARG_COUNT(args, 3);
    return NUMINT([client findNoteOffset : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNoteFilterProxy*)[args objectAtIndex:1]).object : [TiUtils stringValue:[args objectAtIndex:2]]]);
}

- (id)findNotesMetadata: (id)args
{
    ENSURE_ARG_COUNT(args, 5);
    return [[[EDAMNotesMetadataListProxy alloc] initWithObject: [client findNotesMetadata : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNoteFilterProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] integerValue] : ((EDAMNotesMetadataResultSpecProxy*)[args objectAtIndex:4]).object]] autorelease];
}

- (id)findNoteCounts: (id)args
{
    ENSURE_ARG_COUNT(args, 3);
    return [[[EDAMNoteCollectionCountsProxy alloc] initWithObject: [client findNoteCounts : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNoteFilterProxy*)[args objectAtIndex:1]).object : [[args objectAtIndex:2] boolValue]]] autorelease];
}

- (id)getNote: (id)args
{
    ENSURE_ARG_COUNT(args, 6);
    return [[[EDAMNoteProxy alloc] initWithObject: [client getNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] boolValue] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease];
}

- (id)getNoteContent: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [client getNoteContent : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]];
}

- (id)getNoteSearchText: (id)args
{
    ENSURE_ARG_COUNT(args, 4);
    return [client getNoteSearchText : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] boolValue] : [[args objectAtIndex:3] boolValue]];
}

- (id)getResourceSearchText: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [client getResourceSearchText : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]];
}

- (id)getNoteTagNames: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return arrayMap([client getNoteTagNames : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], ^(id item) { return item; });
}

- (id)createNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMNoteProxy alloc] initWithObject: [client createNote : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNoteProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)updateNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMNoteProxy alloc] initWithObject: [client updateNote : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMNoteProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)deleteNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client deleteNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]);
}

- (id)expungeNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]);
}

- (id)expungeNotes: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeNotes : [TiUtils stringValue:[args objectAtIndex:0]] : arrayMap([args objectAtIndex:1], ^(id item) { return item; })]);
}

- (id)expungeInactiveNotes: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return NUMINT([client expungeInactiveNotes : [TiUtils stringValue:[args objectAtIndex:0]]]);
}

- (id)copyNote: (id)args
{
    ENSURE_ARG_COUNT(args, 3);
    return [[[EDAMNoteProxy alloc] initWithObject: [client copyNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [TiUtils stringValue:[args objectAtIndex:2]]]] autorelease];
}

- (id)listNoteVersions: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return arrayMap([client listNoteVersions : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]], ^(id item) { return [[[EDAMNoteVersionIdProxy alloc] initWithObject: item] autorelease]; });
}

- (id)getNoteVersion: (id)args
{
    ENSURE_ARG_COUNT(args, 6);
    return [[[EDAMNoteProxy alloc] initWithObject: [client getNoteVersion : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] integerValue] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease];
}

- (id)getResource: (id)args
{
    ENSURE_ARG_COUNT(args, 6);
    return [[[EDAMResourceProxy alloc] initWithObject: [client getResource : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] boolValue] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease];
}

- (id)updateResource: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client updateResource : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMResourceProxy*)[args objectAtIndex:1]).object]);
}

- (id)getResourceData: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[TiBlob alloc] initWithData:[client getResourceData : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]] mimetype:@"application/octet-stream"] autorelease];
}

- (id)getResourceByHash: (id)args
{
    ENSURE_ARG_COUNT(args, 6);
    return [[[EDAMResourceProxy alloc] initWithObject: [client getResourceByHash : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]] : [[args objectAtIndex:2] data] : [[args objectAtIndex:3] boolValue] : [[args objectAtIndex:4] boolValue] : [[args objectAtIndex:5] boolValue]]] autorelease];
}

- (id)getResourceRecognition: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[TiBlob alloc] initWithData:[client getResourceRecognition : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]] mimetype:@"application/octet-stream"] autorelease];
}

- (id)getResourceAlternateData: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[TiBlob alloc] initWithData:[client getResourceAlternateData : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]] mimetype:@"application/octet-stream"] autorelease];
}

- (id)getResourceAttributes: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMResourceAttributesProxy alloc] initWithObject: [client getResourceAttributes : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

- (id)getAccountSize: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return NUMLONG([client getAccountSize : [TiUtils stringValue:[args objectAtIndex:0]]]);
}

- (id)getAds: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return arrayMap([client getAds : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMAdParametersProxy*)[args objectAtIndex:1]).object], ^(id item) { return [[[EDAMAdProxy alloc] initWithObject: item] autorelease]; });
}

- (id)getRandomAd: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMAdProxy alloc] initWithObject: [client getRandomAd : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMAdParametersProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)getPublicNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMNotebookProxy alloc] initWithObject: [client getPublicNotebook : [[args objectAtIndex:0] integerValue] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

- (id)createSharedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMSharedNotebookProxy alloc] initWithObject: [client createSharedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMSharedNotebookProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)listSharedNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return arrayMap([client listSharedNotebooks : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[EDAMSharedNotebookProxy alloc] initWithObject: item] autorelease]; });
}

- (id)expungeSharedNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeSharedNotebooks : [TiUtils stringValue:[args objectAtIndex:0]] : arrayMap([args objectAtIndex:1], ^(id item) { return item; })]);
}

- (id)createLinkedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMLinkedNotebookProxy alloc] initWithObject: [client createLinkedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMLinkedNotebookProxy*)[args objectAtIndex:1]).object]] autorelease];
}

- (id)updateLinkedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client updateLinkedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : ((EDAMLinkedNotebookProxy*)[args objectAtIndex:1]).object]);
}

- (id)listLinkedNotebooks: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return arrayMap([client listLinkedNotebooks : [TiUtils stringValue:[args objectAtIndex:0]]], ^(id item) { return [[[EDAMLinkedNotebookProxy alloc] initWithObject: item] autorelease]; });
}

- (id)expungeLinkedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return NUMINT([client expungeLinkedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]);
}

- (id)authenticateToSharedNotebook: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMAuthenticationResultProxy alloc] initWithObject: [client authenticateToSharedNotebook : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

- (id)getSharedNotebookByAuth: (id)args
{
    ENSURE_ARG_COUNT(args, 1);
    return [[[EDAMSharedNotebookProxy alloc] initWithObject: [client getSharedNotebookByAuth : [TiUtils stringValue:[args objectAtIndex:0]]]] autorelease];
}

- (id)emailNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return @"";
}

- (id)shareNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [client shareNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]];
}

- (id)stopSharingNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return @"";
}

- (id)authenticateToSharedNote: (id)args
{
    ENSURE_ARG_COUNT(args, 2);
    return [[[EDAMAuthenticationResultProxy alloc] initWithObject: [client authenticateToSharedNote : [TiUtils stringValue:[args objectAtIndex:0]] : [TiUtils stringValue:[args objectAtIndex:1]]]] autorelease];
}

@end
