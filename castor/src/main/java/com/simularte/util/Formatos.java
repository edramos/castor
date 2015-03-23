package com.simularte.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;

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
}