package com.simularte.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPalette;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.simularte.bean.OrdenBean;

public class ReportesExcel extends AbstractExcelView{
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<OrdenBean> tableData = (List<OrdenBean>)model.get("tableData");
		
		HSSFSheet sheet = workbook.createSheet("Reporte Master Deuda");
		
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		
		HSSFPalette palette = workbook.getCustomPalette();
		HSSFColor myColor = palette.findSimilarColor(255, 255, 0);
		short palIndex = myColor.getIndex();
		style.setFillForegroundColor(palIndex);
		
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//style.setFillForegroundColor(HSSFColor.YELLOW.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		
		
		style.setFont(font);
		
		HSSFRow header = sheet.createRow(0);
		
		header.createCell(0).setCellValue("Nombre");header.getCell(0).setCellStyle(style);
		header.createCell(1).setCellValue("Proveedor");header.getCell(1).setCellStyle(style);
		header.createCell(2).setCellValue("Estado");header.getCell(2).setCellStyle(style);
		header.createCell(3).setCellValue("Oferta");header.getCell(3).setCellStyle(style);
		header.createCell(4).setCellValue("IGV");header.getCell(4).setCellStyle(style);
		header.createCell(5).setCellValue("Total");header.getCell(5).setCellStyle(style);
		header.createCell(6).setCellValue("Pagado");header.getCell(6).setCellStyle(style);
		header.createCell(7).setCellValue("Deuda Actual");header.getCell(7).setCellStyle(style);
		header.createCell(8).setCellValue("Deuda Comp.");header.getCell(8).setCellStyle(style);
		header.createCell(9).setCellValue("Deuda Corr.");header.getCell(9).setCellStyle(style);
		
		int rowNum = 1;
		
		for(OrdenBean ob: tableData){
			HSSFRow row = sheet.createRow(rowNum++);
			
			row.createCell(0).setCellValue(ob.getNombre());
			row.createCell(1).setCellValue(ob.getNombreProveedor());
			row.createCell(2).setCellValue(ob.getEstado());
			row.createCell(3).setCellValue(ob.getOfertaS());
			row.createCell(4).setCellValue(ob.getIgv());
			row.createCell(5).setCellValue(ob.getsTotal());
			row.createCell(6).setCellValue(ob.getPagadoS());
			row.createCell(7).setCellValue(ob.getDeudaActualS());
			row.createCell(8).setCellValue(ob.getDeudaComprometidaS());
			row.createCell(9).setCellValue(ob.getDeudaCorrespondienteS());
		}
		OrdenBean ob = tableData.get(tableData.size() - 1);
		HSSFRow row = sheet.createRow(rowNum++);
		row.createCell(0).setCellValue("TOTAL");
		row.createCell(1).setCellValue("");
		row.createCell(2).setCellValue("");
		row.createCell(3).setCellValue("");
		row.createCell(4).setCellValue("");
		row.createCell(5).setCellValue("");
		row.createCell(6).setCellValue(ob.getGtPagado());
		row.createCell(7).setCellValue(ob.getGtDeudaActual());
		row.createCell(8).setCellValue("");
		row.createCell(9).setCellValue("");
		
		sheet.setDefaultColumnWidth(15);
		sheet.autoSizeColumn(0);
		sheet.autoSizeColumn(1);
		sheet.autoSizeColumn(2);
		/*sheet.autoSizeColumn(3);
		sheet.autoSizeColumn(4);
		sheet.autoSizeColumn(5);
		sheet.autoSizeColumn(6);
		sheet.autoSizeColumn(7);
		sheet.autoSizeColumn(8);
		sheet.autoSizeColumn(9);*/
	}
}
