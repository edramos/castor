package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.FacturaBean;
import com.simularte.service.FacturaService;

@Controller
public class FacturaController {

	@Autowired
	FacturaService fs;
	
	@RequestMapping(value = "crearFacturaAjax_{idCuenta}_{tipo}_{detraccion}_{codigo}", method = RequestMethod.POST) @ResponseBody	//Mejorar a enviar objeto y no vars
	public List<FacturaBean> crearFacturaAjax (@PathVariable("idCuenta")int idCuenta, @PathVariable("tipo")String tipo, 
			@PathVariable("detraccion")double detraccion, @PathVariable("codigo")String codigo, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		
		if(fs.crearFactura(idCuenta, tipo, detraccion, codigo, req)){
			facturas = fs.cargarFacturas(req);
		}
		
		return facturas;
	}
	
	@RequestMapping(value = "cargarFacturasEmpresa", method = RequestMethod.POST) @ResponseBody
	public List<FacturaBean> cargarFacturasEmpresa(HttpServletRequest req){
		return fs.cargarFacturas(req);
	}
	
	@RequestMapping(value = "cargarFactura-{tipo}-{idOrden}", method = RequestMethod.POST) @ResponseBody
	public List<FacturaBean> cargarFactura(@PathVariable("tipo")String tipo, @PathVariable("idOrden")int idOrden, HttpServletRequest req){
		return fs.cargarFacturaOrden(idOrden, tipo, req);
	}
	
	@RequestMapping(value = "ajaxListarFacturaSuggest", method = RequestMethod.GET) @ResponseBody
	public List<FacturaBean> ajaxListarFacturaSuggest(HttpServletRequest req){
		String codigoFactura = (String)req.getParameter("q");
		String[] arr = codigoFactura.split("-");
		codigoFactura = arr[0];
		String tipo = arr[1];
		
		return fs.getFacturasSuggested(codigoFactura, tipo, req);
	}
	
	@RequestMapping(value = "ajaxListarFacturaDetraccionSuggest", method = RequestMethod.GET) @ResponseBody
	public List<FacturaBean> ajaxListarFacturaDetraccionSuggest(HttpServletRequest req){
		String codigoFactura = (String)req.getParameter("q");
		String[] arr = codigoFactura.split("-");
		codigoFactura = arr[0];
		String operacion = arr[1];
				
		return fs.getFacturasDetraccionSuggested(codigoFactura, operacion, req);
	}
	
	@RequestMapping(value = "cargarFacturaCajaBanco_{idFactura}", method = RequestMethod.POST) @ResponseBody
	public List<FacturaBean> cargarFacturaCajaBanco(@PathVariable("idFactura")int idFactura, HttpServletRequest req){
		return fs.getFacturaCajaBanco(idFactura, req);
	}
}
