package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.CuentaBean;

public interface CuentaService {

	List<CuentaBean> listarCuentas(String tipo, Integer idOrden, HttpServletRequest req);
	CuentaBean listarDetalleCuenta(String tipo, int idCuenta, HttpServletRequest req);
	List<CuentaBean> listarCuentasFactura(int idOrder, String tipo, HttpServletRequest req);
}
