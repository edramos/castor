package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.FacturaBean;

public interface FacturaService {

	List<FacturaBean> grabarFactura(int idCuenta, String tipo, HttpServletRequest req);
	List<FacturaBean> cargarFactura(int idOrden, HttpServletRequest req);
}
