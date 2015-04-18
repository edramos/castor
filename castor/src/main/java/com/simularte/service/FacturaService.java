package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.FacturaBean;

public interface FacturaService {

	boolean emitirFactura(int idCuenta, String tipo, double detraccion, HttpServletRequest req);
	List<FacturaBean> cargarFacturas(HttpServletRequest req);
	List<FacturaBean> cargarFacturaOrden(int idOrden, HttpServletRequest req);
	List<FacturaBean> getFacturasSuggested(String codigoFactura, HttpServletRequest req);
}
