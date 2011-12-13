package com.evernote.android.sample;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.thrift.protocol.TBinaryProtocol;

import com.evernote.edam.error.EDAMUserException;
import com.evernote.edam.notestore.NoteStore;
import com.evernote.edam.type.Note;
import com.evernote.edam.type.Resource;
import com.evernote.edam.type.User;
import com.evernote.edam.userstore.AuthenticationResult;
import com.evernote.edam.userstore.Constants;
import com.evernote.edam.userstore.UserStore;

import com.evernote.android.edam.EDAMUtil;
import com.evernote.android.edam.FileData;
import com.evernote.android.edam.TAndroidHttpClient;

import com.evernote.android.sample.R;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

/**
 * This simple Android Activity demonstrates how to integrate with the 
 * Evernote web service API, EDAM, to create a note.
 * 
 * In this sample, the user is prompted to choose an image from the device's
 * image gallery. The image is then saved directly to Evernote using the web
 * service API.
 * 
 * To build this project, you must first copy lib/java/libthrift.jar
 * and lib/java/evernote-api-*.jar into the project's lib directory.
 */
public class HelloEDAM extends Activity {
  
  // NOTE: You must change the consumer key and consumer secret to the 
  //       key and secret that you received from Evernote.
  private static final String CONSUMER_KEY = "edamtest";
  private static final String CONSUMER_SECRET = "0123456789abcdef";

  // NOTE: You must change the username and password to real values that
  //       will work on the Evernote server that you are using.
  //       You can create an account on sandbox.evernote.com at
  //       https://sandbox.evernote.com/Registration.action
  private String username = "replace";
  private String password = "me";

  // Change the User Agent to a string that describes your application, using 
  // the form company name/app name and version. Using a unique user agent string 
  // allows us to identify applications in our logs and provide you with better support. 
  private static final String USER_AGENT = "Evernote/HelloEDAM (Android) " + 
                                           Constants.EDAM_VERSION_MAJOR + "." + 
                                           Constants.EDAM_VERSION_MINOR;

  // The directory on disk where we store application data
  private static final String APP_DATA_PATH = "/Android/data/com.evernote.android.sample/files/";

  // Activity result request codes
  private static final int SELECT_IMAGE = 1;

  // Name of this application, for logging
  private static final String TAG = "HelloEDAM";

  // The ENML preamble to every Evernote note. 
  // Note content goes between <en-note> and </en-note>
  private static final String NOTE_PREFIX = 
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
    "<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">" +
    "<en-note>";

  // The ENML postamble to every Evernote note 
  private static final String NOTE_SUFFIX = "</en-note>";

  // Change this value to "www.evernote.com" to use the Evernote production
  // server instead of the sandbox server.
  private static final String EVERNOTE_HOST = "sandbox.evernote.com";
  private static final String USERSTORE_URL = "https://" + EVERNOTE_HOST + "/edam/user";
  private static final String NOTESTORE_URL_BASE = "https://" + EVERNOTE_HOST + "/edam/note/";

  // Client classes used to interact with the Evernote web service
  private UserStore.Client userStore;
  private NoteStore.Client noteStore;

  // The authentication token retrieved from the Evernote web service after
  // the user authenticates successfully
  private String authToken;
  
  // UI elements that we update
  private Button btnSave;
  private TextView msgArea;
  
  // The path to and MIME type of the currently selected image from the gallery
  private String filePath;
  private String mimeType;
  private String fileName;

  /** Called when the activity is first created. */
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.main);
    
    this.msgArea = (TextView)findViewById(R.id.message);
    this.btnSave = (Button) findViewById(R.id.save_button);
    this.btnSave.setEnabled(false);
    
    setupApi();
  }
  
  /**
   * Called when the user taps the "Select Image" button.
   * 
   * Sends the user to the image gallery to choose an image to share.
   */
  public void startSelectImage(View view) {
    Intent intent = new Intent(Intent.ACTION_PICK, 
                               MediaStore.Images.Media.INTERNAL_CONTENT_URI);
    startActivityForResult(intent, SELECT_IMAGE);
  }

  /**
   * Called when the control returns from an activity that we launched.
   */
  @Override
  public void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    if (requestCode == SELECT_IMAGE)
      // Callback from our 'startSelectImage' action
      if (resultCode == Activity.RESULT_OK) {
        endSelectImage(data);
      } 
  }

  /**
   * Called when control returns from the image gallery picker.
   * Loads the image that the user selected.
   * 
   * @param data The data returned from the activity.
   */
  private void endSelectImage(Intent data) {
    // The callback from the gallery contains a pointer into a table.
    // Look up the appropriate record and pull out the information that we need,
    // in this case, the path to the file on disk, the file name and the MIME type. 
    Uri selectedImage = data.getData();
    String[] queryColumns = { MediaStore.Images.Media.DATA, 
                              MediaStore.Images.Media.MIME_TYPE, 
                              MediaStore.Images.Media.DISPLAY_NAME };
    Cursor cursor = getContentResolver().query(selectedImage, queryColumns, null, null, null);
    cursor.moveToFirst();
    this.filePath = cursor.getString(cursor.getColumnIndex(queryColumns[0]));
    this.mimeType = cursor.getString(cursor.getColumnIndex(queryColumns[1]));
    this.fileName = cursor.getString(cursor.getColumnIndex(queryColumns[2]));
    cursor.close();

    if (getNoteStore() != null) {
      this.msgArea.setText(this.fileName);
      this.btnSave.setEnabled(true);
    }
  }

  /**
   * Called when the user taps the "Save Image" button.
   * 
   * Saves the currently selected image to the user's Evernote account using
   * the Evernote web service API.
   * 
   * Does nothing if the Evernote API wasn't successfully initialized
   * when the activity started.
   */
  public void saveImage(View view) {
    if (getNoteStore() != null) {
      String f = this.filePath;
      try {
        // Hash the data in the image file. The hash is used to refernece the
        // file in the ENML note content.
        InputStream in = new BufferedInputStream(new FileInputStream(f)); 
        FileData data = new FileData(EDAMUtil.hash(in), new File(f));
        in.close();

        // Create a new Resource
        Resource resource = new Resource();
        resource.setData(data);
        resource.setMime(this.mimeType);
        
        // Create a new Note
        Note note = new Note();
        note.setTitle("Android test note");
        note.addToResources(resource);
        
        // Set the note's ENML content. The ENML specification can be found in
        // appendix A of the Evernote API Overview at 
        // http://www.evernote.com/about/developer/api/evernote-api.htm
        String content = 
          NOTE_PREFIX +
          "<p>This note was uploaded from Android. It contains an image.</p>" +
          "<en-media type=\"" + this.mimeType + "\" hash=\"" +
          EDAMUtil.bytesToHex(resource.getData().getBodyHash()) + "\"/>" +
          NOTE_SUFFIX;
        note.setContent(content);
        
        // Create the note on the server. The returned Note object
        // will contain server-generated attributes such as the note's
        // unique ID (GUID), the Resource's GUID, and the creation and update time.
        Note createdNote = getNoteStore().createNote(getAuthToken(), note);

        Toast.makeText(this, R.string.msg_image_saved, Toast.LENGTH_LONG).show();
      } catch (Throwable t) {
        // It's generally bad form to catch Throwable, but for this simple demo, 
        // we want to trap and log all errors.
        Toast.makeText(this, R.string.err_creating_note, Toast.LENGTH_LONG).show();
        Log.e(TAG, getString(R.string.err_creating_note), t);
      }  
    }
  }

  /**
   * Set up communications with the Evernote web service API, including
   * authenticating the user.
   */
  private void setupApi() {
    try {
      // You can also use EDAMUtil.getUserStoreClient() to build a UserStore.client
      TAndroidHttpClient userStoreTrans = 
        new TAndroidHttpClient(USERSTORE_URL, USER_AGENT, getTempDir());
      TBinaryProtocol userStoreProt = new TBinaryProtocol(userStoreTrans);
      setUserStore(new UserStore.Client(userStoreProt, userStoreProt));
      
      // Verify that the Evernote API version we're using is compatible with the server
      boolean versionOk = userStore.checkVersion("HelloEDAM (Android)",
          com.evernote.edam.userstore.Constants.EDAM_VERSION_MAJOR,
          com.evernote.edam.userstore.Constants.EDAM_VERSION_MINOR);
      if (!versionOk) {
        this.msgArea.setText(R.string.err_protocol_version);
        Log.e(TAG, getString(R.string.err_protocol_version));
        Toast.makeText(this, R.string.err_protocol_version, Toast.LENGTH_LONG).show();
        return;
      }

      // Authenticate. Note that this will fail if:
      // - You did not replace the dummy API consumer key and consumer secret with your own
      // - You requested a web service API key, which must authenticate using OAuth
      // - You are pointing at sandbox.evernote.com but using a username and password from
      //   www.evernote.com.
      AuthenticationResult authResult = null;
      try {
        authResult = getUserStore().authenticate(username, password, CONSUMER_KEY, CONSUMER_SECRET);
      } catch (EDAMUserException ex) {
        this.msgArea.setText(R.string.err_authentication);
        Log.e(TAG, getString(R.string.err_authentication), ex);
        Toast.makeText(this, R.string.err_authentication, Toast.LENGTH_LONG).show();
        return;
      }
      User user = authResult.getUser();
      setAuthToken(authResult.getAuthenticationToken());

      // After successful authentication, configure a connection to the NoteStore
      String noteStoreUrl = NOTESTORE_URL_BASE + user.getShardId();
      TAndroidHttpClient noteStoreTrans = 
        new TAndroidHttpClient(noteStoreUrl, USER_AGENT, getTempDir());
      TBinaryProtocol noteStoreProt = new TBinaryProtocol(noteStoreTrans);
      setNoteStore(new NoteStore.Client(noteStoreProt, noteStoreProt));
    } catch (Throwable t) {
      // It's generally bad form to catch Throwable, but for this simple demo, 
      // we want to trap and log all errors.
      this.msgArea.setText(R.string.err_api_setup);
      Log.e(TAG, getString(R.string.err_api_setup), t);
      Toast.makeText(this, R.string.err_api_setup, Toast.LENGTH_LONG).show();
    }
  }

  private UserStore.Client getUserStore() {
    return this.userStore;
  }
  
  private void setUserStore(UserStore.Client userStore) {
    this.userStore = userStore;
  }
  
  private NoteStore.Client getNoteStore() {
    return this.noteStore;
  }
  
  private void setNoteStore(NoteStore.Client noteStore) {
    this.noteStore = noteStore;
  }
  
  private String getAuthToken() {
    return this.authToken;
  }
  
  private void setAuthToken(String authToken) {
    this.authToken = authToken;
  }
  
  private File getTempDir() {
    return new File(Environment.getExternalStorageDirectory(), APP_DATA_PATH);
  }
}