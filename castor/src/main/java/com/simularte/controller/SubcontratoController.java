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

import com.simularte.bean.SubcontratoBean;
import com.simularte.service.SubcontratoService;


@Controller
public class SubcontratoController {

	@Autowired
	SubcontratoService subcontratoservice;
	
	@RequestMapping(value = "ajaxListarSubcontratos-{idOrden}", method = RequestMethod.POST)@ResponseBody
	public List<SubcontratoBean> ajaxListarSubcontratos(@PathVariable("idOrden") Integer idOrden, HttpServletRequest req){
		List<SubcontratoBean> clientes = new ArrayList<SubcontratoBean>();
		clientes = subcontratoservice.listarSubcontratos(idOrden, req);
		return clientes;
	}
	
}
