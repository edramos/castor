package com.simularte.util;

import java.sql.Timestamp;

public class Dates {

	public static Timestamp fechaCreacion(){
		java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
		java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());    	
    	return ts;
	}
}
