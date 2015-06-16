package com.simularte.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPalette;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
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
		//HSSFColor myColor = palette.findSimilarColor(112, 48, 160); 
		//short palIndex = myColor.getIndex();
		//style.setFillForegroundColor(palIndex);
		palette.setColorAtIndex((short)57, (byte)112, (byte)48, (byte)160);
		style.setFillForegroundColor(palette.getColor(57).getIndex()); 
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		
		font.setColor(IndexedColors.WHITE.getIndex());
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		
		style.setFont(font);
		style.setBorderTop(CellStyle.BORDER_THIN);style.setBorderBottom(CellStyle.BORDER_THIN);
		
		Font fontBold = workbook.createFont();
		fontBold.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		
		CellStyle cellBold = workbook.createCellStyle();
		cellBold.setFont(fontBold);
		
		for(int x = 0; x < 2; x++){
			HSSFRow row = sheet.createRow(x);
			
			for(int y = 0; y < 10; y++){
				if(x == 0 && y == 0){
					row.createCell(y).setCellValue("REPORTE MASTER DEUDA");row.getCell(y).setCellStyle(cellBold);
				}else{
					row.createCell(y).setCellValue("");
				}
			}
		}
		
		
		
		HSSFRow header = sheet.createRow(2);
		
		header.createCell(0).setCellValue("Nombre");header.getCell(0).setCellStyle(style);
		switch(request.getSession().getAttribute("tipo").toString()){
		case "cliente":
			header.createCell(1).setCellValue("Proveedor");header.getCell(1).setCellStyle(style);
			break;
		case "proveedor":
			header.createCell(1).setCellValue("Cliente");header.getCell(1).setCellStyle(style);
			break;
		}
		
		header.createCell(2).setCellValue("Oferta");header.getCell(2).setCellStyle(style);
		header.createCell(3).setCellValue("Total");header.getCell(3).setCellStyle(style);
		header.createCell(4).setCellValue("Estado");header.getCell(4).setCellStyle(style);
		header.createCell(5).setCellValue("Deuda Corr.");header.getCell(5).setCellStyle(style);
		header.createCell(6).setCellValue("Pagado");header.getCell(6).setCellStyle(style);
		header.createCell(7).setCellValue("Deuda Actual");header.getCell(7).setCellStyle(style);
		header.createCell(8).setCellValue("Deuda Compr.");header.getCell(8).setCellStyle(style);
		header.createCell(9).setCellValue("% Pagado");header.getCell(9).setCellStyle(style);
		
		CellStyle cellRight = workbook.createCellStyle();
		cellRight.setAlignment(CellStyle.ALIGN_RIGHT);
		
		CellStyle cellCenter = workbook.createCellStyle();
		cellCenter.setAlignment(CellStyle.ALIGN_CENTER);
		
		int rowNum = 3;
		
		for(OrdenBean ob: tableData){
			HSSFRow row = sheet.createRow(rowNum++);
			
			row.createCell(0).setCellValue(ob.getNombre());
			row.createCell(1).setCellValue(ob.getNombreProveedor());
			row.createCell(2).setCellValue(ob.getOfertaS());row.getCell(2).setCellStyle(cellRight);
			row.createCell(3).setCellValue(ob.getsTotal());row.getCell(3).setCellStyle(cellRight);
			row.createCell(4).setCellValue(ob.getEstado());row.getCell(4).setCellStyle(cellCenter);
			row.createCell(5).setCellValue(ob.getDeudaCorrespondienteS());row.getCell(5).setCellStyle(cellRight);
			row.createCell(6).setCellValue(ob.getPagadoS());row.getCell(6).setCellStyle(cellRight);
			row.createCell(7).setCellValue(ob.getDeudaActualS());row.getCell(7).setCellStyle(cellRight);
			row.createCell(8).setCellValue(ob.getDeudaComprometidaS());row.getCell(8).setCellStyle(cellRight);
			row.createCell(9).setCellValue(ob.getPerPagado());row.getCell(9).setCellStyle(cellCenter);
		}
		
		OrdenBean ob = tableData.get(tableData.size() - 1);
		HSSFRow row = sheet.createRow(rowNum++);
		
		CellStyle styleFooterL = workbook.createCellStyle();
		CellStyle styleFooterR = workbook.createCellStyle();
		
		
		
		styleFooterL.setFont(fontBold);styleFooterL.setBorderTop(CellStyle.BORDER_THIN);styleFooterL.setBorderBottom(CellStyle.BORDER_THIN);
		
		styleFooterR.setBorderTop(CellStyle.BORDER_THIN);styleFooterR.setBorderBottom(CellStyle.BORDER_THIN);
		styleFooterR.setFont(fontBold);
		styleFooterR.setAlignment(CellStyle.ALIGN_RIGHT);
		
		row.createCell(0).setCellValue("TOTAL");row.getCell(0).setCellStyle(styleFooterL);
		row.createCell(1).setCellValue("");row.getCell(1).setCellStyle(styleFooterL);
		row.createCell(2).setCellValue("");row.getCell(2).setCellStyle(styleFooterL);
		row.createCell(3).setCellValue("");row.getCell(3).setCellStyle(styleFooterL);
		row.createCell(4).setCellValue("");row.getCell(4).setCellStyle(styleFooterL);
		row.createCell(5).setCellValue("");row.getCell(5).setCellStyle(styleFooterL);
		row.createCell(6).setCellValue(ob.getGtPagado());row.getCell(6).setCellStyle(styleFooterR);
		row.createCell(7).setCellValue(ob.getGtDeudaActual());row.getCell(7).setCellStyle(styleFooterR);
		row.createCell(8).setCellValue("");row.getCell(8).setCellStyle(styleFooterL);
		row.createCell(9).setCellValue("");row.getCell(9).setCellStyle(styleFooterL);
		
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
