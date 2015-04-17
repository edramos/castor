package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.CuentaBean;

public interface CuentaService {

	List<CuentaBean> listarCuentas(String tipo, Integer idOrden, HttpServletRequest req);
	CuentaBean listarDetalleCuenta(int idCuenta, HttpServletRequest req);
	
}
