package com.simularte.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simularte.bean.OrdenBean;
import com.simularte.service.OrdenService;


@Controller
public class OrdenController {

	@Autowired
	OrdenService ordenserv;
	
	@RequestMapping(value = "crearOrden", method = RequestMethod.POST)
	public String crearOrden(@ModelAttribute("ordenBean") OrdenBean ordenBean, @RequestParam("subcontratos") String[] subCont, HttpServletRequest req) {		
		String path = "";
		int idCliente = ordenBean.getIdCliente();
		
		if(ordenserv.crearOrden(ordenBean, idCliente, subCont, req)){
			path = "empresa/orden";
		}else{
			System.out.println("NO Grabe!");
		}
		return path;
	}
	
}
