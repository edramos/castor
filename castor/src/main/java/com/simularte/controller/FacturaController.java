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
	
	@RequestMapping(value = "crearFacturaAjax-{idCuenta}-{tipo}", method = RequestMethod.POST) @ResponseBody
	public List<FacturaBean> crearFacturaAjax (@PathVariable("idCuenta")int idCuenta, @PathVariable("tipo")String tipo, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		
		facturas = fs.grabarFactura(idCuenta, tipo, req);
		
		return facturas;
	}
	
	@RequestMapping(value = "cargarFactura-{idOrden}", method = RequestMethod.POST) @ResponseBody
	public List<FacturaBean> cargarFactura(@PathVariable("idOrden")int idOrden, HttpServletRequest req){
		return fs.cargarFactura(idOrden, req);
	}
}
