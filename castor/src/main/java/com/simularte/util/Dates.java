package com.simularte.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;

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
		
		//in: dd/mm/yyyy
		String[] fechas = date.split("/");
		//out: yyyy-mm-dd
		date = fechas[2] + "-" + fechas[1] + "-" + fechas[0];
		
		try {
			utilDate = df.parse(date);
			sqlDate = new java.sql.Date(utilDate.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		return sqlDate;
	}
	
	public static String fechaHoraEspaniol(Timestamp date){
		SimpleDateFormat formatoDiaNumero = new SimpleDateFormat("d", new Locale("es", "PE"));
		SimpleDateFormat formatoDia = new SimpleDateFormat( "EEEE", new Locale("es", "PE"));
		SimpleDateFormat formatoMes = new SimpleDateFormat( "MMM", new Locale("es", "PE"));
		SimpleDateFormat formatoAnio = new SimpleDateFormat("yyyy", new Locale("es", "PE"));
		SimpleDateFormat formatoHora = new SimpleDateFormat("h:mm a", new Locale("es", "PE"));
		if(!TimeZone.getDefault().getID().equals("America/Bogota")){
			formatoHora.setTimeZone(TimeZone.getTimeZone("America/Bogota"));
		}
		
		String diaNormal = formatoDia.format(date);
		String dia = diaNormal.substring(0, 1).toUpperCase() + diaNormal.substring(1, diaNormal.length());
		String diaNumero = formatoDiaNumero.format(date);
		String mesNormal = formatoMes.format(date);
		String mes = mesNormal.substring(0, 1).toUpperCase() + mesNormal.substring(1, mesNormal.length());
		String anio = formatoAnio.format(date);
		String hora = formatoHora.format(date);
		
		return dia + " " + diaNumero + " de " + mes + " de " + anio + " " + hora;
	}
}
