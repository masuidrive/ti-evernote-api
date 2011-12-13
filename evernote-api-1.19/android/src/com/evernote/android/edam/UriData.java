/*
 * Copyright (c) 2011, Evernote Corporation
 * All rights reserved. 
 */
package com.evernote.android.edam;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.thrift.TException;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import android.content.Context;
import android.net.Uri;
import android.os.ParcelFileDescriptor;

import com.evernote.edam.type.Data;

/**
 * Implements a replacement for com.evernote.edam.type.Data that retrieves
 * the actual binary data to be sent from an Android file or content Uri.
 */
public class UriData extends Data {
  private static final Logger LOGGER =
    LoggerFactory.getLogger(UriData.class);

  private static final TStruct STRUCT_DESC = new TStruct("Data");
  private static final TField BODY_HASH_FIELD_DESC =
      new TField("bodyHash", TType.STRING, (short) 1);
  private static final TField SIZE_FIELD_DESC =
      new TField("size", TType.I32, (short) 2);
  private static final TField BODY_FIELD_DESC =
      new TField("body", TType.STRING, (short) 3);

  private static final long serialVersionUID = 1L;
  private static boolean mbStop = false;
  private Uri mUri;
  private Context mContext;
  
  public static synchronized void cancel() {
    mbStop = true;
  }

  /**
   * Create a new UriData.
   * 
   * @param bodyHash An MD5 hash of the binary data represented by the Uri.
   * @param uri The Android file or content Uri containing the binary data.
   * @param context Your application's context, used to get a ContentResolver 
   * to open the Uri.
   */
  public UriData(byte[] bodyHash, Uri uri, Context context) {
    mbStop = false;
    mContext = context;
    mUri = uri;
    try {
      ParcelFileDescriptor pfd = context.getContentResolver().openFileDescriptor(uri, "r");
      setSize((int) pfd.getStatSize());
      pfd.close();
    } catch (IOException e) {
      LOGGER.error(e.toString(), e);
    }
    setBodyHash(bodyHash);
  }

  public void write(TProtocol oprot) throws TException {
    validate();
    oprot.writeStructBegin(STRUCT_DESC);
    if (this.getBodyHash() != null) {
      if (isSetBodyHash()) {
        oprot.writeFieldBegin(BODY_HASH_FIELD_DESC);
        oprot.writeBinary(this.getBodyHash());
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldBegin(SIZE_FIELD_DESC);
    oprot.writeI32(this.getSize());
    oprot.writeFieldEnd();
    if (mUri != null && this.getSize() > 0) {
      oprot.writeFieldBegin(BODY_FIELD_DESC);
      InputStream s;
      try {
        s = mContext.getContentResolver().openInputStream(mUri);
      } catch (FileNotFoundException e) {
        throw new TException("Failed to write binary body:" + mUri, e);
      }
      oprot.writeStream(s,this.getSize());
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  public void writexx(TProtocol oprot) throws TException {
    if (getBodyHash() == null) {
      throw new TProtocolException("Invalid null field: bodyHash");
    }
    TStruct struct = new TStruct("Data");
    oprot.writeStructBegin(struct);
    TField field = new TField("bodyHash", TType.STRING, (short) 1);
    oprot.writeFieldBegin(field);
    oprot.writeBinary(getBodyHash());
    oprot.writeFieldEnd();
    field = new TField("size", TType.I32, (short) 2);
    oprot.writeFieldBegin(field);
    int size = getSize();
    oprot.writeI32(size);
    oprot.writeFieldEnd();
    field = new TField("body", TType.STRING, (short) 3);
    oprot.writeFieldBegin(field);
    oprot.writeI32(size);
    // oprot.prepareWriteBytes(size);
    try {
      byte buffer[] = new byte[4096];
      InputStream in = mContext.getContentResolver().openInputStream(mUri);
      int len;
      while ((len = in.read(buffer)) >= 0) {
        if (mbStop) {
          throw new FileDataException("Output canceled");
        }
        if (len == buffer.length) {
          oprot.writeBinary(buffer);
        } else {
          ByteArrayOutputStream dest = new ByteArrayOutputStream();
          dest.write(buffer, 0, len);
          oprot.writeBinary(dest.toByteArray());
        }
      }
      in.close();
    } catch (FileDataException e) {
      LOGGER.info("File: "+ mUri + " failed to transmit.");
      throw e;
    } catch (Exception e) {
      LOGGER.info("File: "+ mUri + " failed to transmit.");
      throw new FileDataException(e);
    }
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }
}

