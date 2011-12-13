//
//  Evernote.m
//  
//  A simple application demonstrating the use of the Evernote API
//  on iOS.
//
//  Before running this sample, you must change the API consumer key
//  and consumer secret to the values that you received from Evernote.
//
//  Evernote API sample code is provided under the terms specified 
//  in the file LICENSE.txt which was included with this distribution.
//

#import "Evernote.h"


// NOTE: You must change the consumer key and consumer secret to the
// key and secret that you received from Evernote. If you do not have
// an API key, visit http://www.evernote.com/about/developer/api/ to
// get one.
NSString * const consumerKey  = @"XXXXXXXX";
NSString * const consumerSecret = @"XXXXXXXX";

// NOTE: You must change the username and password to the username and
// password of an account that you have created on the appropriate
// Evernote service. If you are testing against the sandbox service,
// you must create an account by visiting
NSString * const username = @"XXXXXXXX";
NSString * const password = @"XXXXXXXX";  

NSString * const userStoreUri = @"https://sandbox.evernote.com/edam/user";
NSString * const noteStoreUriBase = @"https://sandbox.evernote.com/edam/note/"; 


@implementation Evernote

@synthesize shardId, authToken, noteStoreUri, user, noteStore;

/************************************************************
 *
 *  Implementing the singleton pattern
 *
 ************************************************************/

static Evernote *sharedEvernoteManager = nil;

/************************************************************
 *
 *  Accessing the static version of the instance
 *
 ************************************************************/

+ (Evernote *)sharedInstance {

    if (sharedEvernoteManager == nil) {        
        sharedEvernoteManager = [[Evernote alloc] init];
    }
    
    return sharedEvernoteManager;
    
}

-(id)init{
  self = [super init];
    
  return self;
}

/************************************************************
 *
 *  Connecting to the Evernote server using simple
 *  authentication
 *
 ************************************************************/

- (void) connect {
    
    if (authToken == nil) 
    {      
        // In the case we are not connected we don't have an authToken
        // Instantiate the Thrift objects
        NSURL * NSURLuserStoreUri = [[[NSURL alloc] initWithString: userStoreUri] autorelease];
        
        THTTPClient *userStoreHttpClient = [[[THTTPClient alloc] initWithURL:  NSURLuserStoreUri] autorelease];
        TBinaryProtocol *userStoreProtocol = [[[TBinaryProtocol alloc] initWithTransport:userStoreHttpClient] autorelease];
        EDAMUserStoreClient *userStore = [[[EDAMUserStoreClient alloc] initWithProtocol:userStoreProtocol] autorelease];
 
        // Returned result from the Evernote servers after authentication
        EDAMAuthenticationResult* authResult =[userStore authenticate:username :password : consumerKey :consumerSecret];
        
        // User object describing the account
        self.user = [authResult user];
        // We are going to save the authentication token
        self.authToken = [authResult authenticationToken];
        // and the shard id
        self.shardId = [user shardId];
        
        // Creating the user's noteStore's URL
        noteStoreUri =  [[[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", noteStoreUriBase, shardId] ] autorelease];
        
        
        // Initializing the NoteStore client
        THTTPClient *noteStoreHttpClient = [[[THTTPClient alloc] initWithURL:noteStoreUri userAgent: @"iosdemo" timeout:15000] autorelease];
        TBinaryProtocol *noteStoreProtocol = [[[TBinaryProtocol alloc] initWithTransport:noteStoreHttpClient] autorelease];
        noteStore = [[[EDAMNoteStoreClient alloc] initWithProtocol:noteStoreProtocol] retain];
        
    }
}

/************************************************************
 *
 *  Listing all the user's notebooks
 *
 ************************************************************/

- (NSArray *) listNotebooks {   
    
    // Checking the connection
    [self connect];
    
    // Calling a function in the API
    NSArray *notebooks = [[NSArray alloc] initWithArray:[[self noteStore] listNotebooks:authToken] ];
    
    return notebooks;
}


/************************************************************
 *
 *  Searching for notes using a EDAM Note Filter
 *
 ************************************************************/

- (EDAMNoteList *) findNotes: (EDAMNoteFilter *) filter {
    // Checking the connection
    [self connect];
    
    
    // Calling a function in the API 
    return [noteStore findNotes:authToken:filter:0 :100];
}


/************************************************************
 *
 *  Loading a note using the guid
 *
 ************************************************************/

- (EDAMNote *) getNote: (NSString *) guid {
    // Checking the connection
    [self connect];
    
    // Calling a function in the API
    return [noteStore getNote:authToken :guid :true :true :true :true];
}


/************************************************************
 *
 *  Deleting a note using the guid
 *
 ************************************************************/

- (void) deleteNote: (NSString *) guid {
    // Checking the connection
    [self connect];

    // Calling a function in the API
    [noteStore deleteNote:authToken :guid];
}


/************************************************************
 *
 *  Creating a note
 *
 ************************************************************/

- (void) createNote: (EDAMNote *) note {
    // Checking the connection
    [self connect];

    // Calling a function in the API
    [noteStore createNote:authToken :note];
}

- (void)dealloc
{
    [noteStore release];
    [super dealloc];

}

@end
