package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.FacturaBean;

public interface FacturaService {

	boolean crearFactura(int idCuenta, String tipo, double detraccion, String codigo, HttpServletRequest req);
	List<FacturaBean> cargarFacturas(HttpServletRequest req);
	List<FacturaBean> cargarFacturaOrden(int idOrden, String tipo, HttpServletRequest req);
	List<FacturaBean> getFacturasSuggested(String codigoFactura, String tipo, HttpServletRequest req);
	List<FacturaBean> getFacturasDetraccionSuggested(String codigoFactura, HttpServletRequest req);
}
