package com.simularte.util;

import java.sql.Timestamp;
import java.text.ParseException;

public class Dates {

	public static Timestamp fechaCreacion(){
		java.util.Date d = new java.util.Date(System.currentTimeMillis()); 
		java.sql.Timestamp ts = new java.sql.Timestamp(d.getTime());    	
    	return ts;
	}
	
	public static java.sql.Date stringToDate(String date, String format){
		java.text.DateFormat df = new java.text.SimpleDateFormat(format);
		java.util.Date utilDate;
		java.sql.Date sqlDate = null;
		try {
			utilDate = df.parse(date);
			sqlDate = new java.sql.Date(utilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		return sqlDate;
	}
}
