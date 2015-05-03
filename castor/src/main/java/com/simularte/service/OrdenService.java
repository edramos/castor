package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.CuentaBean;
import com.simularte.bean.OrdenBean;

public interface OrdenService {
	int crearOrden(OrdenBean ordenBean, int idCliente, String[] cobrosCliente, String[] subCont, String[] pagProv, HttpServletRequest req);
	List<OrdenBean> buscarOrden(OrdenBean ordenBean , HttpServletRequest req);
	OrdenBean obtenerInformacionOrden(int idOrden , String tipo, HttpServletRequest req);
	List<OrdenBean> buscarOrderPanel(HttpServletRequest req);
	List<OrdenBean> buscarOrdenFactura(HttpServletRequest req);
	List<OrdenBean> buscarOrdenCaja(int idFactura, HttpServletRequest req);
	
	//CHART
	List<CuentaBean> grafOrdenGeneral(int idOrden, HttpServletRequest req);
}
