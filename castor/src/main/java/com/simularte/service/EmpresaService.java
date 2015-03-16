package com.simularte.service;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.EmpresaBean;

public interface EmpresaService {

	boolean modificarEmpresa(EmpresaBean empresa, HttpServletRequest req);
	EmpresaBean extraerInformacionEmpresa(HttpServletRequest req);
	
}
