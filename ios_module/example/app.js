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
Ti.API.info(evernote.Types.EDAM_NOTE_SOURCE_MAIL_CLIP);
Ti.API.info(evernote.Types.PrivilegeLevel);
Ti.API.info(evernote.Types.PrivilegeLevel.SUPPORT);

var userstore = evernote.createUserStoreClient(config.url+"user");
Ti.API.info(userstore);
userstore.authenticate(config.demo.email, config.demo.password, config.consumerKey, config.consumerSecret, function(event) {
//	Ti.API.info(event.error);
//	Ti.API.info(event);
//	Ti.API.info(event.result.user.username);
	var notestore = evernote.createNoteStoreClient(config.url+"note/"+event.result.user.shardId);
	
	var notes = notestore.listNotebooks(event.result.authenticationToken, function(event2) {
		table.data = event2.result.map(function(note){ return({title: note.name}); });
		/*
		var note = evernote.createNote();
		note.title = 'Te222st';
		note.tagNames = ['tag1', 'tag222'];
		notestore.createNote(event.result.authenticationToken, note, function(e) {
			Ti.API.info(e);
		});
		*/
	});
});
