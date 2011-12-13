/*
 * Copyright (c) 2011, Evernote Corporation
 * All rights reserved. 
 */
package com.evernote.android.edam;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Formatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Implements an OutputStream that stores data to a temporary file on disk.
 * Used by TAndroidHttpClient to write Thrift messages to disk before
 * POSTing them to the Thrift server.
 * 
 * You should not need to interact with this class directly. 
 */
public class DiskBackedByteStore extends OutputStream {

  private static final Logger LOGGER =
      LoggerFactory.getLogger(DiskBackedByteStore.class);
  protected File file;
  protected int maxMemory;
  protected FileOutputStream fileoutputStream = null;
  protected ByteArrayOutputStream byteArray = null;
  protected FileInputStream fileInputStream = null;
  protected OutputStream current = null;
  protected int size = 0;
  protected Exception exception;
  protected File tempPath;

  public DiskBackedByteStore(File file, int maxMemory) {
    this.file = file;
    this.maxMemory = maxMemory;
  }

  protected File makeTempFile() {
    return new File(tempPath, (Math.random() * Long.MAX_VALUE) + ".tft");
  }

  public DiskBackedByteStore(File parentDir, String prefix, int maxMemory)
      throws IOException {
    parentDir.mkdirs();
    tempPath = parentDir;
    this.file = makeTempFile();
    this.maxMemory = maxMemory;
  }

  @Override
  public void write(byte[] buffer, int offset, int count) {
    initBuffers();
    try {
      if (isSwapRequired(count)) {
        swapToDisk();
      }
//      if (LOGGER.isDebugEnabled()) {
//        LOGGER.debug(new Formatter().format(
//            "Size %d Count: %d Buffer type: %s", size, count,
//            current.getClass().toString()).toString());
//      }
      size += count;
      current.write(buffer, offset, count);
    } catch (Exception e) {
      exception = e;
      LOGGER.warn("Failed to write request:", e);
    }
  }

  private boolean isSwapRequired(int delta) {
    return size + delta > maxMemory && byteArray != null;
  }

  @Override
  public void write(int oneByte) {
    try {
      initBuffers();
      if (isSwapRequired(1)) {
        swapToDisk();
      }
      size++;
      current.write(oneByte);
    } catch (Exception e) {
      LOGGER.warn("Failed to write request:", e);
      exception = e;
    }
  }

  private void initBuffers() {
    if (current == null) {
      current = byteArray = new ByteArrayOutputStream();
    }
  }

  protected void swapToDisk() throws FileNotFoundException, IOException {
    // Swap in disk
    LOGGER.info(new Formatter().format("Swapping to disk. Size: %d", size)
        .toString());
    fileoutputStream = new FileOutputStream(file);
    byteArray.writeTo(fileoutputStream);
    byteArray = null;
    current = fileoutputStream;
  }

  public void clear() {
//    if (LOGGER.isDebugEnabled()) {
//      LOGGER.debug(new Formatter().format("Wrote %d bytes", size).toString());
//    }
    byteArray = null;
    current = null;
    if (fileInputStream != null) {
      try {
        fileInputStream.close();
      } catch (IOException e) {
      }
    }
    fileInputStream = null;
    size = 0;
  }

  public int getSize() {
    return size;
  }

  public InputStream getInputStream() throws IOException {
    current.close();
    if (byteArray != null) {
      return new ByteArrayInputStream(byteArray.toByteArray());
    } else {
      return fileInputStream = new FileInputStream(file);
    }
  }

  public Exception getException() {
    return exception;
  }

  public void reset() throws IOException {
    clear();
    if (file.isFile()) {
      file.delete();
    }
    file = makeTempFile();
    exception = null;
  }
}
