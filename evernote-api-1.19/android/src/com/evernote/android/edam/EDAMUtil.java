/*
 * Copyright (c) 2011, Evernote Corporation
 * All rights reserved. 
 */
package com.evernote.android.edam;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.transport.TTransportException;

import com.evernote.edam.notestore.NoteStore;
import com.evernote.edam.type.Data;
import com.evernote.edam.type.User;
import com.evernote.edam.userstore.UserStore;

/**
 * Implements a set of static helper functions that may be useful when
 * accessing Evernote via the EDAM API.
 */
public class EDAMUtil {

  /**
   * All EDAM strings will be encoded as UTF-8.
   */
  public static final String DEFAULT_CHARSET = "UTF-8";

  /**
   * One-way hashing function used for providing a checksum of EDAM data
   */
  private static final String EDAM_HASH_ALGORITHM = "MD5";

  /**
   * A runtime exception that will be thrown when we hit an error that should
   * "never" occur ... e.g. if the JVM doesn't know about UTF-8 or MD5.
   */
  private static final class EDAMUtilException extends RuntimeException {

    private static final long serialVersionUID = -8099786694856724498L;

    public EDAMUtilException(String message, Throwable cause) {
      super(message, cause);
    }
  }

  /**
   * Creates a properly formated user agent string for the EDAM protocol in the
   * format:
   * 
   * <pre>
   * application / version ; platform / version ; [ device-make device-model / version ;]
   * </pre>
   * 
   * @param applicationName
   *          name of the application string
   * @param svnRevisionNumber
   *          the revision number of the application
   * @return A formated user agent string for use in
   *         {@link EDAMUtil#getNoteStoreClient(String, String, User)} and
   *         {@link EDAMUtil#getUserAgentString(String, String)}
   */
  public static final String getUserAgentString(String applicationName,
      String svnRevisionNumber) {
    return applicationName + "/" + svnRevisionNumber + ";"
        + System.getProperty("os.name") + "/"
        + System.getProperty("os.version") + "; Java "
        + System.getProperty("java.vendor") + "/"
        + System.getProperty("java.version") + ";";
  }

  /**
   * Creates a UserStore client interface that can be used to send requests to a
   * particular UserStore server. For example, the following would provide a
   * handle to make requests from the "MyClient" application to talk to the
   * Evernote server at "www.evernote.com" :
   * 
   * <pre>
   * UserStore.Iface userStore = EDAMUtil.getUserStoreClient(&quot;www.evernote.com&quot;,
   *     &quot;MyClient (Java)&quot;);
   * </pre>
   * 
   * This call does not actually initiate any communications with the UserStore,
   * it only creates the handle that will be used.
   * 
   * @param host
   *          the hostname (or numeric IP address) for the server that we should
   *          communicate with. This will attempt to use HTTPS to talk to that
   *          server unless the hostname contains a port number component, in
   *          which case we'll use plaintext HTTP.
   * @param userAgent
   *          if non-null, this is the User-Agent string that will be provided
   *          on all HTTP requests to the service. This allows for better
   *          logging and debugging if problems arise.
   * @param tempDir
   *          a temporary directory in which large outgoing Thrift messages will
   *          be cached to disk before they are sent.
   * @return The client interface that can be used to talk to the UserStore
   * @throws TTransportException
   *           if the provided information can't be used to construct a
   *           UserStore handle. (E.g. if the hostname is malformed.)
   */
  public static UserStore.Client getUserStoreClient(String host, String userAgent, File tempDir) 
    throws TTransportException
  {
	  return getUserStoreClient(host, 0, userAgent, null, tempDir);
  }
  
  public static UserStore.Client getUserStoreClient(String host, int port, String userAgent, File tempDir) 
    throws TTransportException
  {
      return getUserStoreClient(host, port, userAgent, null, tempDir);
  }
  
  
  	/**
  	 * Creates a UserStore client interface that can be used to send requests to a
  	 * particular UserStore server. For example, the following would provide a
  	 * handle to make requests from the "MyClient" application to talk to the
  	 * Evernote server at "www.evernote.com" :
  	 * 
  	 * <pre>
  	 * UserStore.Iface userStore = EDAMUtil.getUserStoreClient(&quot;www.evernote.com&quot;,
  	 *     &quot;MyClient (Java)&quot;);
  	 * </pre>
  	 * 
  	 * This call does not actually initiate any communications with the UserStore,
  	 * it only creates the handle that will be used.
  	 * 
  	 * @param host
  	 *          the hostname (or numeric IP address) for the server that we should
  	 *          communicate with. This will attempt to use HTTPS to talk to that
  	 *          server unless the hostname contains a port number component, in
  	 *          which case we'll use plaintext HTTP.
  	 * @param port
  	 * 			the port number
  	 * @param userAgent
  	 *          if non-null, this is the User-Agent string that will be provided
  	 *          on all HTTP requests to the service. This allows for better
  	 *          logging and debugging if problems arise.
  	 * @param customHeaders
  	 *          if non-null, this is a mapping of HTTP headers to values which
  	 *          will be included in the request.
  	 * @param tempDir
  	 *          a temporary directory in which large outgoing Thrift messages will
  	 *          be cached to disk before they are sent.
  	 * @return The client interface that can be used to talk to the UserStore
  	 * @throws TTransportException
  	 *           if the provided information can't be used to construct a
  	 *           UserStore handle. (E.g. if the hostname is malformed.)
  	 */
  	public static UserStore.Client getUserStoreClient(	String host,
  														int port,
  														String userAgent,
  														Map<String, String> customHeaders,
  														File tempDir)
  														throws TTransportException
	{
  		String url = host.contains(":") ? "http://" : "https://";
        if (port != 0) host += ":" + port;
        url += host + "/edam/user";
        TAndroidHttpClient transport = new TAndroidHttpClient(url, userAgent, tempDir);
	    if (customHeaders != null) {
	    	for (Entry<String, String> header : customHeaders.entrySet()) {
	    		transport.setCustomHeader(header.getKey(), header.getValue());
	    	}
	    }
	    if (userAgent != null) {
	    	transport.setCustomHeader("User-Agent", userAgent);
	    }
	    TBinaryProtocol protocol = new TBinaryProtocol(transport);
	    return new UserStore.Client(protocol, protocol);
	}

  /**
   * Creates a NoteStore client interface that can be used to send requests to a
   * particular NoteStore shard. For example, the following would provide a
   * handle to make requests from the "MyClient" application to talk to the
   * Evernote server at "www.evernote.com" :
   * 
   * <pre>
   *   User myUser = ...;
   *   NoteStore.Iface noteStore =
   *     EDAMUtil.getNoteStoreClient(&quot;www.evernote.com&quot;, &quot;MyClient (Java)&quot;,
   *       myUser);
   * </pre>
   * 
   * This call does not actually initiate any communications with the NoteStore,
   * it only creates the handle that will be used.
   * 
   * @param host
   *          the hostname (or numeric IP address) for the server that we should
   *          communicate with. This will attempt to use HTTPS to talk to that
   *          server unless the hostname contains a port number component, in
   *          which case we'll use plaintext HTTP.
   * @param userAgent
   *          if non-null, this is the User-Agent string that will be provided
   *          on all HTTP requests to the service. This allows for better
   *          logging and debugging if problems arise.
   * @param tempDir
   *          a temporary directory in which large outgoing Thrift messages will
   *          be cached to disk before they are sent.
   * @return The client interface that can be used to talk to the NoteStore
   * @throws TTransportException
   *           if the provided information can't be used to construct a
   *           NoteStore handle. (E.g. if the hostname is malformed.)
   */
  	public static NoteStore.Client getNoteStoreClient(	String host,
  														String userAgent,
  														String shardId,
  														File tempDir) 
  														throws TTransportException
	{
  		return getNoteStoreClient(host, 0, userAgent, shardId, null, tempDir);
	}
  
  	public static NoteStore.Client getNoteStoreClient(	String host,
  														int port,
  														String userAgent,
  														String shardId,
  														File tempDir)
  														throws TTransportException 
    {
	    return getNoteStoreClient(host, port, userAgent, shardId, null, tempDir);
    }
  
  
  /**
   * Creates a NoteStore client interface that can be used to send requests to a
   * particular NoteStore shard. For example, the following would provide a
   * handle to make requests from the "MyClient" application to talk to the
   * Evernote server at "www.evernote.com" :
   * 
   * <pre>
   *   User myUser = ...;
   *   NoteStore.Iface noteStore =
   *     EDAMUtil.getNoteStoreClient(&quot;www.evernote.com&quot;, &quot;MyClient (Java)&quot;,
   *       myUser);
   * </pre>
   * 
   * This call does not actually initiate any communications with the NoteStore,
   * it only creates the handle that will be used.
   * 
   * @param host
   *          the hostname (or numeric IP address) for the server that we should
   *          communicate with. This will attempt to use HTTPS to talk to that
   *          server unless the hostname contains a port number component, in
   *          which case we'll use plaintext HTTP.
   * @param port
   *          the port number
   * @param userAgent
   *          if non-null, this is the User-Agent string that will be provided
   *          on all HTTP requests to the service. This allows for better
   *          logging and debugging if problems arise.
   * @param shardId
   *          the logical "shard" on which the user's account is stored, such as "s39".
   *          obtained from AuthenticationResult.user.shardId after a successful 
   *          UserStore authentication. 
   * @param customHeaders
   *          if non-null, this is a mapping of HTTP headers to values which
   *          will be included in the request.
   * @param tempDir
   *          a temporary directory in which large outgoing Thrift messages will
   *          be cached to disk before they are sent.
   * @return The client interface that can be used to talk to the NoteStore
   * @throws TTransportException
   *           if the provided information can't be used to construct a
   *           NoteStore handle. (E.g. if the hostname is malformed.)
   */
  	public static NoteStore.Client getNoteStoreClient(	String host,
  														int port,
  														String userAgent,
  														String shardId,
  														Map<String, String> customHeaders,
  														File tempDir)
	  													throws TTransportException
	{
	    String url;
	    if (port != 0) host += ":" + port;      
	    	url = "https://" + host + "/edam/note/" + shardId;

	    TAndroidHttpClient transport = new TAndroidHttpClient(url, userAgent, tempDir);
	    if (customHeaders != null) {
	    	for (Entry<String, String> header : customHeaders.entrySet()) {
	    		transport.setCustomHeader(header.getKey(), header.getValue());
	    	}
	    }
	    if (userAgent != null) {
	    	transport.setCustomHeader("User-Agent", userAgent);
	    }
	    TBinaryProtocol protocol = new TBinaryProtocol(transport);
	    return new NoteStore.Client(protocol, protocol);
	}

  /**
   * Takes the provided byte array and converts it into a hexidecimal string
   * with two characters per byte.
   */
  public static String bytesToHex(byte[] bytes) {
    return bytesToHex(bytes, false);
  }

  /**
   * Takes the provided byte array and converts it into a hexidecimal string
   * with two characters per byte.
   * 
   * @param withSpaces
   *          if true, this will put a space character between each hex-rendered
   *          byte, for readability.
   */
  public static String bytesToHex(byte[] bytes, boolean withSpaces) {
    StringBuilder sb = new StringBuilder();
    for (byte hashByte : bytes) {
      int intVal = 0xff & hashByte;
      if (intVal < 0x10) {
        sb.append('0');
      }
      sb.append(Integer.toHexString(intVal));
      if (withSpaces) {
        sb.append(' ');
      }
    }
    return sb.toString();
  }

  /**
   * Takes a string in hexidecimal format and converts it to a binary byte
   * array. This does no checking of the format of the input, so this should
   * only be used after confirming the format or origin of the string. The input
   * string should only contain the hex data, two characters per byte.
   */
  public static byte[] hexToBytes(String hexString) {
    byte[] result = new byte[hexString.length() / 2];
    for (int i = 0; i < result.length; ++i) {
      int offset = i * 2;
      result[i] = (byte) Integer.parseInt(hexString.substring(offset,
          offset + 2), 16);
    }
    return result;
  }

  /**
   * Encodes a string as a byte array using the default encoding.
   */
  public static byte[] stringToBytes(String string) {
    try {
      return stringToBytes(string, DEFAULT_CHARSET);
    } catch (UnsupportedEncodingException e) {
      throw new EDAMUtilException(DEFAULT_CHARSET + " not supported", e);
    }
  }

  /**
   * Encodes a string as a byte array with a specified character set encoding.
   */
  public static byte[] stringToBytes(String string, String charSet)
      throws UnsupportedEncodingException {
    if (string == null) {
      return null;
    }
    return string.getBytes(charSet);
  }

  /**
   * Decodes a byte array as a string using the default encoding (UTF-8)
   */
  public static String bytesToString(byte[] bytes) {
    try {
      return bytesToString(bytes, DEFAULT_CHARSET);
    } catch (UnsupportedEncodingException e) {
      throw new EDAMUtilException(DEFAULT_CHARSET + " not supported", e);
    }
  }

  /**
   * Decodes a byte array as a string using the specified character set
   * encoding.
   */
  public static String bytesToString(byte[] bytes, String charSet)
      throws UnsupportedEncodingException {
    if (bytes == null) {
      return null;
    }
    return new String(bytes, charSet);
  }

  /**
   * Creates a Thrift Data object using the provided data blob.
   * 
   * @param body
   *          the binary contents of the Data object to be created
   */
  public static Data bytesToData(byte[] body) {
    return bytesToData(body, true);
  }

  /**
   * Creates a Thrift Data object using the provided data blob.
   * 
   * @param body
   *          the binary contents of the Data object to be created
   * @param includeBody
   *          if true, then the Data should contain the body bytes, otherwise it
   *          will just contain the metadata (hash, size) about the data.
   */
  public static Data bytesToData(byte[] body, boolean includeBody) {
    Data data = new Data();
    data.setSize(body.length);
    data.setBodyHash(hash(body));
    if (includeBody) {
      data.setBody(body);
    }
    return data;
  }

  /**
   * Returns an MD5 checksum of the provided array of bytes.
   */
  public static byte[] hash(byte[] body) {
    try {
      return MessageDigest.getInstance(EDAM_HASH_ALGORITHM).digest(body);
    } catch (NoSuchAlgorithmException e) {
      throw new EDAMUtilException(EDAM_HASH_ALGORITHM + " not supported", e);
    }
  }

  /**
   * Returns an MD5 checksum of the data read from the specified InputStream.
   */
  public static byte[] hash(InputStream data) 
    throws IOException
  {
    try {
      MessageDigest digest = MessageDigest.getInstance(EDAM_HASH_ALGORITHM);
      byte[] buf = new byte[4096];
      int len;
      while ((len = data.read(buf)) != -1) {
        digest.update(buf, 0, len);
      }
      return digest.digest();
    } catch (NoSuchAlgorithmException e) {
      throw new EDAMUtilException(EDAM_HASH_ALGORITHM + " not supported", e);
    }
  }
  
  /**
   * Returns an MD5 checksum of the provided string, which is encoded into UTF-8
   * format first for unambiguous hashing.
   */
  public static byte[] hash(String content) {
    return hash(stringToBytes(content));
  }

  /**
   * Converts content of edam.Data.body[] into a String. Assumes bytes contain
   * data encoded with UTF8 charset.
   */
  public static String dataToString(Data d) {
    try {
      return dataToString(d, DEFAULT_CHARSET);
    } catch (UnsupportedEncodingException e) {
      throw new EDAMUtilException(DEFAULT_CHARSET + " not supported", e);
    }
  }

  /**
   * @param d
   *          A Data object with some sort of content.
   * @param charset
   *          Character of Data.body. More info on charsets at
   *          http://java.sun.com/j2se/1.5.0/docs/api/java/nio/charset/Charset.html
   * @return Contents of Data.body[] as a string.
   * @throws UnsupportedEncodingException
   */
  public static String dataToString(Data d, String charSet)
      throws UnsupportedEncodingException {
    byte[] dataBytes = d.getBody();
    if (null == d.getBody()) {
      return null;
    }
    return bytesToString(dataBytes, charSet);
  }

  /**
   * Creates a Thrift Data object using the provided String data value.
   * 
   * @param body
   *          the body of the string to convert to binary form for the Data
   * @param includeBody
   *          if true, the Data object will include the binary encoded body
   *          itself, otherwise it will just contain metadata.
   */
  public static Data stringToData(String body, boolean includeBody) {
    return bytesToData(stringToBytes(body), includeBody);
  }

  /**
   * Creates a Thrift Data object using the provided String data value.
   * 
   * @param body
   *          the body of the string to convert to binary form for the Data
   * @param charSet
   *          the character set to use for converting the data from String to
   *          binary
   * @param includeBody
   *          if true, the Data object will include the binary encoded body
   *          itself, otherwise it will just contain metadata.
   * @throws UnsupportedEncodingException
   */
  public static Data stringToData(String body, String charSet,
      boolean includeBody) throws UnsupportedEncodingException {
    return bytesToData(stringToBytes(body, charSet), includeBody);
  }

  /**
   * Private constructor ... this class should not be instantiated, just use the
   * static helper functions.
   */
  private EDAMUtil() {
  }
}
