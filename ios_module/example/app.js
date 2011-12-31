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
userstore.authenticate(config.demo.email, config.demo.password, config.consumerKey, config.consumerSecret, function(event) {
	if(event.type == 'success') {
		Ti.API.info(event.result.toHash());

		var notestore = evernote.createNoteStoreClient(config.url+"note/"+event.result.user.shardId);
		
		var notes = notestore.listNotebooks(event.result.authenticationToken, function(event2) {
			table.data = event2.result.map(function(note){ return({title: note.name}); });
			
			var note = evernote.createNote({title: "Test"});
			note.tagNames = ['tag1', 'tag2'];
			
			var data = evernote.createData();
			var file = Ti.Filesystem.getFile(
				Titanium.Filesystem.resourcesDirectory + '/appcelerator_ja.png'
			);
			data.body = file.read();
			data.size = data.body.length;

			var attrs = evernote.createResourceAttributes();
			attrs.fileName = "appcelerator_ja.png";
			
			var res = evernote.createResource();
			res.data = data;
			res.mime = "image/png";
			res.attributes = attrs;
			
			note.resources = [res];
			
			notestore.createNote(event.result.authenticationToken, note, function(event) {
				Ti.API.info(event);
				if(event.type == 'success') {
					alert("Create new note");
				}
				else {
					alert(event.error);
				}
			});
		});
	}
	else {
		Ti.API.info(event);
		alert(event.error.message);
	}
});
