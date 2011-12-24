# Evernote API for Titanium Mobile

## Progress

### iOS

* Implemented all services, structs, enums, const values
* I'll test file upload
* It's worked on 1.7.5 and 1.8.0.1

### Android

Not yet


## Documents

Sorry, This module's documentation is nothing now. My English skill is horrible. :-(

Please see 'examples/app.js' and 'doc/html/index.html'


## Example

#### app.js
    var config = require('config');
    
    var window = Ti.UI.createWindow();
    var table = Ti.UI.createTableView();
    window.add(table);
    window.open();
    
    var evernote = require('jp.masuidrive.ti.evernoteapi');
    
    var userstore = evernote.createUserStoreClient(config.url+"user");
    userstore.authenticate(config.demo.email, config.demo.password, config.consumerKey, config.consumerSecret, function(event) {
        if(event.type == 'success') {
            var notestore = evernote.createNoteStoreClient(config.url+"note/"+event.result.user.shardId);
            
            var notes = notestore.listNotebooks(event.result.authenticationToken, function(event2) {
                table.data = event2.result.map(function(note){ return({title: note.name}); });
                /*
                var note = evernote.createNote();
                note.title = 'Test';
                note.tagNames = ['tag1', 'tag2'];
                notestore.createNote(event.result.authenticationToken, note, function(e) {
                    Ti.API.info(e);
                });
                */
            });
        }
        else {
            alert(event.error.message);
        }
    });


#### config.js
    exports = {
        url: "https://sandbox.evernote.com/edam/",
        
        consumerKey: "You can get from http://www.evernote.com/about/developer/api/",
        consumerSecret: "You can get from http://www.evernote.com/about/developer/api/",
        
        demo: {
            email: "nobody@example.com",
            password: "your password"
        }
    };


## License

2011 Yuichiro MASUI. &lt;masui@masuidrive.jp&gt; All rights reserved.

License: Apache License 2.0
