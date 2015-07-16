package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.OficinaBean;
import com.simularte.service.OficinaService;
import com.simularte.service.YelpAPIServiceImpl;


@Controller
public class OficinaController {

	@Autowired OficinaService Oficinaservice;
	@Autowired YelpAPIServiceImpl yelpAPI;
	
	@RequestMapping(value = "ajaxCrearOficina", method = RequestMethod.POST)
	@ResponseBody
	public List<OficinaBean> ajaxCrearOficina(@ModelAttribute("oficina") OficinaBean oficina, HttpServletRequest req){
		List<OficinaBean> oficinas = new ArrayList<OficinaBean>();		
		if(Oficinaservice.crearOficina(oficina, req)){
			oficinas = Oficinaservice.listarOficinas(req);
		}else{
			oficinas = null;
		}
		return oficinas;
	}
	@RequestMapping(value = "ajaxModificarOficina", method = RequestMethod.POST)
	@ResponseBody
	public List<OficinaBean> ajaxModificarOficina(@ModelAttribute("oficina") OficinaBean oficina, HttpServletRequest req){
		List<OficinaBean> oficinas = new ArrayList<OficinaBean>();		
		if(Oficinaservice.modificarOficina(oficina, req)){
			oficinas = Oficinaservice.listarOficinas(req);
		}else{
			oficinas = null;
		}
		
		return oficinas;
	}
	@RequestMapping(value = "ajaxEliminarOficina-{idOficina}", method = RequestMethod.POST)
	@ResponseBody
	public List<OficinaBean> ajaxEliminarOficina(@PathVariable("idOficina") Integer idOficina, HttpServletRequest req){
		List<OficinaBean> oficinas = new ArrayList<OficinaBean>();
		if(Oficinaservice.eliminarOficina(idOficina, req)){
			oficinas = Oficinaservice.listarOficinas(req);
		}else{
			oficinas = null;
		}
		
		return oficinas;
	}
	@RequestMapping(value = "ajaxListarOficinas", method = RequestMethod.POST)
	@ResponseBody
	public List<OficinaBean> ajaxListarOficinas(HttpServletRequest req){
		List<OficinaBean> oficinas = new ArrayList<OficinaBean>();
		oficinas = Oficinaservice.listarOficinas(req);
		return oficinas;
	}
	/*TEMPORAL PARA ALOJAR A SIMULARTE*/
	@RequestMapping("simularte")
	public String toReporte(){
		return "simularte";
	}
	/*TEMPORAL PARA ALOJAR A YELP IREX*/
	@RequestMapping("yelp")
	public String toYelp(){
		return "yelp";
	}
	@RequestMapping(value = "ajaxYelp", method = RequestMethod.POST)@ResponseBody
	public String ajaxYelp(@ModelAttribute("oficina") OficinaBean oficina){
		System.out.println("C: " + oficina.getCiudad());
		return yelpAPI.searchForBusinessesByLocation("video game", "790 Grand St Brooklyn, NY 11211", oficina);
	}
}
