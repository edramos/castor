package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.CuentaBean;

public interface CuentaService {

	public List<CuentaBean> listarCuentas(String tipo, Integer idOrden, HttpServletRequest req);
	
}
