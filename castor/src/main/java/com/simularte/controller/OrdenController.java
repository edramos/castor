package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.OrdenBean;
import com.simularte.service.OrdenService;

@Controller
public class OrdenController {

	@Autowired
	OrdenService ordenserv;
	
	@RequestMapping(value = "crearOrden", method = RequestMethod.POST)
	public String crearOrden(@ModelAttribute("ordenBean") OrdenBean ordenBean, @RequestParam("subcontratos") String[] subCont, Model model, HttpServletRequest req) {		
		String path = "";
		System.out.println("termino obra: " + subCont[4]);
		int idOrden = ordenserv.crearOrden(ordenBean, ordenBean.getIdCliente(), subCont, req);
		
		if(idOrden != -1){
			path = "redirect:ordenPag-" + idOrden;
		}else{
			System.out.println("NO Grabe!");
		}
		return path;
	}
	
	@RequestMapping(value = "ajaxBuscarOrden", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxBuscarOrden(@ModelAttribute("ordenBean") OrdenBean ordenBean, HttpServletRequest req){
		List<OrdenBean> ordenes = new ArrayList<OrdenBean>();		
		ordenes = ordenserv.buscarOrden(ordenBean, req);
		return ordenes;
	}
	
	@RequestMapping("ordenPag-{idOrden}")
	public String ordenPag(@PathVariable("idOrden") Integer idOrden, Model model, HttpServletRequest req){
		String path = "empresa/orden";
		model.addAttribute("idOrden", idOrden);
		return path;
	}
	
	@RequestMapping(value = "ajaxObtenerInformacionOrden-{idOrden}", method = RequestMethod.POST) @ResponseBody
	public OrdenBean ajaxObtenerInformacionOrden(@PathVariable("idOrden") Integer idOrden, HttpServletRequest req){
		OrdenBean orden = new OrdenBean();		
		orden = ordenserv.obtenerInformacionOrden(idOrden, req);
		return orden;
	}
}
