// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.

var config = require('config');

var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var table = Ti.UI.createTableView({
	data: [{title: "loading..."}]
});
window.add(table);
window.open();

// TODO: write your module tests here
var evernote = require('jp.masuidrive.ti.evernoteapi');
Ti.API.info("module is => " + evernote);
Ti.API.info(evernote.Types);
Ti.API.info(evernote.Types.EDAM_NOTE_SOURCE_MAIL_CLIP);

var userstore = evernote.createUserStoreClient(config.url+"user");
var session = userstore.authenticate(config.demo.email, config.demo.password, config.consumerKey, config.consumerSecret);

Ti.API.info(session.authenticationToken);
Ti.API.info(session.user);
Ti.API.info(session.user.username);

var notestore = evernote.createNoteStoreClient(config.url+"note/"+session.user.shardId);
var notes = notestore.listNotebooks(session.authenticationToken);

table.data = notes.map(function(note){ return({title: note.name}); })

Ti.API.info(notes.length);
Ti.API.info(notes[0]);
Ti.API.info(notes[0].name);



/*
var note = evernote.createNote();
note.title = 'Test';
note.tagNames = ['tag1', 'tag2'];
Ti.API.info(notestore.createNote(session.authenticationToken, note));
*/