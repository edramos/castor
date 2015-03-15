package com.simularte.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.simularte.model.Orden;
import com.simularte.service.OrdenService;


@Controller
public class ProyectoController {

	@Autowired
	OrdenService ordenserv;
	
	@RequestMapping(value = "ajaxCrearProyecto", method = RequestMethod.POST)
	public String ajaxCrearProyecto(@ModelAttribute("orden") Orden orden, HttpServletRequest req) {
		int idCliente = Integer.parseInt(req.getParameter("idClient"));
		
		if(ordenserv.crearOrden(orden, idCliente, req)){
			
		}else{
			
		}
		return "redirect:toCrearOrden";
	}
	
}
