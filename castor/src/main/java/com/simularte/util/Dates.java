package com.simularte.util;

import java.sql.Date;
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
	
	public static java.sql.Date dateCreacion(){
		java.util.Date du = new java.util.Date(System.currentTimeMillis());
		
		return new java.sql.Date(du.getTime());
	}
	
	public static String stringToStringFechaCorta(String date){
		if(!date.equals("")){
			String[] fechas = date.split("-");		
			return fechas[2] + "/" + fechas[1] + "/" + fechas[0];
		}else{
			return "";
		}
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
	
	public static String fechaCorta(Date date){
		if(date != null){
			SimpleDateFormat formatoDiaNumero = new SimpleDateFormat("dd", new Locale("es", "PE"));
			SimpleDateFormat formatoMes = new SimpleDateFormat( "MM", new Locale("es", "PE"));
			SimpleDateFormat formatoAnio = new SimpleDateFormat("yyyy", new Locale("es", "PE"));
			
			String dia2Digitos = formatoDiaNumero.format(date);
			String mes2Digitos = formatoMes.format(date);
			String anio4Digitos = formatoAnio.format(date);
			
			return dia2Digitos + "/" + mes2Digitos + "/" + anio4Digitos;
		}else{
			return "";
		}
	}
	
	public static String fechaHoraEspaniol(Timestamp date, String tipo){
		if(date != null){
			SimpleDateFormat formatoDiaNumero = new SimpleDateFormat("dd", new Locale("es", "PE"));
			SimpleDateFormat formatoDia = new SimpleDateFormat( "EEEE", new Locale("es", "PE"));
			SimpleDateFormat formatoMesNumero = new SimpleDateFormat( "MM", new Locale("es", "PE"));
			SimpleDateFormat formatoMes = new SimpleDateFormat( "MMM", new Locale("es", "PE"));
			SimpleDateFormat formatoAnio = new SimpleDateFormat("yyyy", new Locale("es", "PE"));
			SimpleDateFormat formatoHora = new SimpleDateFormat("h:mm a", new Locale("es", "PE"));
			
			if(!TimeZone.getDefault().getID().equals("America/Bogota")){
				formatoHora.setTimeZone(TimeZone.getTimeZone("America/Bogota"));
			}
		
			String diaNormal = formatoDia.format(date);
			String dia = diaNormal.substring(0, 1).toUpperCase() + diaNormal.substring(1, diaNormal.length());
			String diaNumero = formatoDiaNumero.format(date);
			String mesNumero = formatoMesNumero.format(date);
			String mesNormal = formatoMes.format(date);
			String mes = mesNormal.substring(0, 1).toUpperCase() + mesNormal.substring(1, mesNormal.length());
			String anio = formatoAnio.format(date);
			String hora = formatoHora.format(date);
			
			if(tipo.equals("l")){
				return dia + ", " + diaNumero + " " + mes + " " + anio + " " + hora;
			}else{
				return diaNumero + "/" + mesNumero + "/" + anio + " " + hora;
			}
		
		}else{
			return "---";
		}
	}
	
	public static String fechaEspaniol(Date date){
		if(date != null){
		SimpleDateFormat formatoDiaNumero = new SimpleDateFormat("d", new Locale("es", "PE"));
		SimpleDateFormat formatoDia = new SimpleDateFormat( "EEEE", new Locale("es", "PE"));
		SimpleDateFormat formatoMes = new SimpleDateFormat( "MMM", new Locale("es", "PE"));
		SimpleDateFormat formatoAnio = new SimpleDateFormat("yyyy", new Locale("es", "PE"));
		
		String diaNormal = formatoDia.format(date);
		String dia = diaNormal.substring(0, 1).toUpperCase() + diaNormal.substring(1, diaNormal.length());
		String diaNumero = formatoDiaNumero.format(date);
		String mesNormal = formatoMes.format(date);
		String mes = mesNormal.substring(0, 1).toUpperCase() + mesNormal.substring(1, mesNormal.length());
		String anio = formatoAnio.format(date);
		
		return dia + ", " + diaNumero + " " + mes + " " + anio;
		
		}else{
			return "---";
		}
	}
	
	public static Timestamp stringToTimeStamp(String fechaHora){
		Timestamp ts = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		
		try{
			java.util.Date parsedDate = dateFormat.parse(fechaHora);
			ts = new java.sql.Timestamp(parsedDate.getTime());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return ts;
	}
}
