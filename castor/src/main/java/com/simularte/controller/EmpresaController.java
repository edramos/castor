package com.simularte.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.EmpresaBean;
import com.simularte.service.EmpresaService;


@Controller
public class EmpresaController {

	@Autowired
	EmpresaService empresaservice;
	
	@RequestMapping(value = "ajaxModificarEmpresa", method = RequestMethod.POST)
	@ResponseBody
	public EmpresaBean ajaxModificarEmpresa(@ModelAttribute EmpresaBean empresa, HttpServletRequest req){
		EmpresaBean empresab = new EmpresaBean();		
		if(empresaservice.modificarEmpresa(empresa, req)){
			empresab = empresaservice.extraerInformacionEmpresa(req);
		}else{
			empresab = null;
		}
		
		return empresab;
	}
	
	@RequestMapping(value = "ajaxExtraerInformacionEmpresa", method = RequestMethod.POST)
	@ResponseBody
	public EmpresaBean ajaxExtraerInformacionEmpresa(HttpServletRequest req){
		EmpresaBean empresa = new EmpresaBean();
		empresa = empresaservice.extraerInformacionEmpresa(req);
		return empresa;
	}
	
}
