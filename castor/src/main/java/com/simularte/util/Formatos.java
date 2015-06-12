package com.simularte.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

public class Formatos {

	public static BigDecimal StringToBigDecimal(String string){
		BigDecimal bd = null;
		
		DecimalFormatSymbols symbols = new DecimalFormatSymbols();
		symbols.setGroupingSeparator(',');
		symbols.setDecimalSeparator('.');
		String pattern = "#,##0.0#";
		DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
		decimalFormat.setParseBigDecimal(true);
		
		try {
			bd = (BigDecimal) decimalFormat.parse(string);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return bd;
	}
	
	public static String BigBecimalToString(BigDecimal monto){
		return NumberFormat.getCurrencyInstance(Locale.US).format(monto);
	}
	
	public static String bytesToString(long bytes) {
		int unit = 1024;
	    if (bytes < unit) return bytes + " B";
	    int exp = (int) (Math.log(bytes) / Math.log(unit));
	    String pre = ("KMGTPE").charAt(exp-1) + "";
	    return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
	}
	
}