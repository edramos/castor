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

import com.simularte.bean.CajaBean;
import com.simularte.service.CajaService;

@Controller
public class CajaController {

	@Autowired
	CajaService cs;
	
	@RequestMapping(value = "ajaxCrearCajaBanco", method = RequestMethod.POST)@ResponseBody
	public List<CajaBean> ajaxCrearCajaBanco(@ModelAttribute("cajaBean")CajaBean cajaBean, HttpServletRequest req){
		List<CajaBean> registrosCaja = new ArrayList<CajaBean>();
		
		if(cs.crearCaja(cajaBean, req)){
			System.out.println("GRABO!!!");
			//registrosCaja = cs.listarRegistrosCaja(req);
		}else{
			System.out.println("NO GRABO");
		}
	
		return registrosCaja;
	}
	
	
	@RequestMapping(value = "listarCajaBanco", method = RequestMethod.POST)@ResponseBody
	public List<CajaBean> listarCajaBanco(HttpServletRequest req){
		List<CajaBean> registrosCaja = new ArrayList<CajaBean>();
		registrosCaja = cs.listarRegistrosCaja(req);
	
		return registrosCaja;
	}
}
