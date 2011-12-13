/*
 * Copyright (c) 2011, Evernote Corporation
 * All rights reserved. 
 */
package com.evernote.android.edam;

import org.apache.thrift.TException;

public class FileDataException extends TException {
	FileDataException(String message) {
		super(message);
	}

	FileDataException(Exception e) {
		super(e);
	}
}