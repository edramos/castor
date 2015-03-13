package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.ProyectoBean;
import com.simularte.service.ProyectoService;


@Controller
public class ProyectoController {

	@Autowired
	ProyectoService proyectoservice;
	
	/*@RequestMapping(value = "ajaxCrearProyecto", method = RequestMethod.POST)
	@ResponseBody
	public List<ProyectoBean> ajaxCrearProyecto(@ModelAttribute("Proyecto") ProyectoBean Proyecto, HttpServletRequest req){
		List<ProyectoBean> Proyectos = new ArrayList<ProyectoBean>();		
		if(Proyectoservice.crearProyecto(Proyecto, req)){
			//Proyectos = Proyectoservice.listarProyectos(req);
		}else{
			Proyectos = null;
		}
		return Proyectos;
	}*/
	
	@RequestMapping(value = "ajaxCrearProyecto", method = RequestMethod.POST)
	public String ajaxCrearProyecto(@ModelAttribute("proyecto") ProyectoBean proyecto, HttpServletRequest req) {
		if(proyectoservice.crearProyecto(proyecto, req)){
			//Proyectos = Proyectoservice.listarProyectos(req);
		}else{
			//Proyectos = null;
		}
		return "redirect:toCrearProyecto";
	}
	
}
