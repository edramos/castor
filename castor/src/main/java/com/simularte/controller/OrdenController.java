package com.simularte.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.simularte.bean.OrdenBean;
import com.simularte.model.Orden;
import com.simularte.service.OrdenService;


@Controller
public class OrdenController {

	@Autowired
	OrdenService ordenserv;
	
	@RequestMapping(value = "crearOrden", method = RequestMethod.POST)
	public String crearOrden(@ModelAttribute("orden") OrdenBean orden, HttpServletRequest req) {
		
		
		System.out.println(orden.getTipoOrden() + orden.getTipoTrabajo() + ", " + orden.getIdCliente() + "-" + orden.getOferta());
		
		/*if(ordenserv.crearOrden(orden, idCliente, req)){
			
		}else{
			
		}*/
		return "redirect:toCrearOrden";
	}
	
}