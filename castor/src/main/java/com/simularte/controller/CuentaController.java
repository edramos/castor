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

import com.simularte.bean.CuentaBean;
import com.simularte.service.CuentaService;


@Controller
public class CuentaController {

	@Autowired
	CuentaService cuentaservice;
	
	@RequestMapping(value = "ajaxListarCuentas-{tipo}-{idOrden}", method = RequestMethod.POST)@ResponseBody
	public List<CuentaBean> ajaxListarCuentas(@PathVariable("tipo") String tipo, @PathVariable("idOrden") Integer idOrden, HttpServletRequest req){
		List<CuentaBean> cuentas = new ArrayList<CuentaBean>();
		cuentas = cuentaservice.listarCuentas(tipo, idOrden, req);
		return cuentas;
	}
	
	@RequestMapping(value = "ajaxDetalleCuenta-{idCuenta}", method = RequestMethod.POST)@ResponseBody
	public CuentaBean ajaxDetalleCuenta(@PathVariable("idCuenta") int idCuenta, HttpServletRequest req){
		return cuentaservice.listarDetalleCuenta(idCuenta, req);
	}
}
