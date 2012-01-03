/*
 * Copyright (c) 2011, Evernote Corporation
 * All rights reserved. 
 */
package com.evernote.android.edam;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.nio.ByteBuffer;

import org.apache.thrift.TException;
import org.apache.thrift.protocol.TField;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.protocol.TStruct;
import org.apache.thrift.protocol.TType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.evernote.edam.type.Data;

/**
 * Implements a replacement for com.evernote.edam.type.Data that retrieves
 * the actual binary data to be sent from a File instead of a byte array.
 * This allows large Thrift messages to be assembled without the entire message
 * being stored in memory.
 * 
 * To use this class, simply replace all uses of com.evernote.edam.type.Data with
 * com.evernote.android.edam.FileData when creating new Data objects to send to
 * Evernote.
 */
public class FileData extends Data {
  private static final Logger LOGGER = LoggerFactory.getLogger(FileData.class);
  private static final TStruct STRUCT_DESC = new TStruct("Data");
  private static final TField BODY_HASH_FIELD_DESC =
      new TField("bodyHash", TType.STRING, (short) 1);
  private static final TField SIZE_FIELD_DESC =
      new TField("size", TType.I32, (short) 2);
  private static final TField BODY_FIELD_DESC =
      new TField("body", TType.STRING, (short) 3);

  private static final long serialVersionUID = 1L;
  private static boolean mbStop = false;
  private File mBodyFile;

  public static synchronized void cancel() {
    mbStop = true;
  }

  /**
   * Create a new FileData.
   * 
   * @param bodyHash An MD5 hash of the binary data contained in the file.
   * @param file The file containing the binary data.
   */
  public FileData(byte[] bodyHash, File file) {
    mbStop = false;
    mBodyFile = file;
    setBodyHash(bodyHash);
    setSize((int) file.length());
  }

  public void write(TProtocol oprot) throws TException {
    validate();
    oprot.writeStructBegin(STRUCT_DESC);
    if (this.getBodyHash() != null) {
      if (isSetBodyHash()) {
        oprot.writeFieldBegin(BODY_HASH_FIELD_DESC);
        oprot.writeBinary(ByteBuffer.wrap(this.getBodyHash()));
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldBegin(SIZE_FIELD_DESC);
    oprot.writeI32(this.getSize());
    oprot.writeFieldEnd();
    if (this.mBodyFile != null && this.mBodyFile.isFile()) {
      oprot.writeFieldBegin(BODY_FIELD_DESC);
      InputStream s = null;
      try {
        s = new FileInputStream(mBodyFile);
        oprot.writeStream(s, this.mBodyFile.length());
      } catch (FileNotFoundException e) {
        throw new TException("Failed to write binary body:" + mBodyFile, e);
      } finally {
        try {
          if (s != null) {
            s.close();
          }
        } catch (Exception e) {
        }
      }
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
      FileInputStream in = new FileInputStream(mBodyFile);
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
      LOGGER.info("File: " + mBodyFile + " failed to transmit.");
      throw e;
    } catch (Exception e) {
      LOGGER.info("File: " + mBodyFile + " failed to transmit.");
      throw new FileDataException(e);
    }
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }
}
