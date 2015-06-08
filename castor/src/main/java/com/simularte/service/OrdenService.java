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
	List<OrdenBean> buscarOrdenFactura(String value, HttpServletRequest req);
	List<OrdenBean> buscarOrdenCaja(int idFactura, HttpServletRequest req);
	List<OrdenBean> getOrdenesSuggest(String codigo, HttpServletRequest req);
	
	boolean editarOrden(OrdenBean ob, String action, HttpServletRequest req);
	String editarOrdenEstado(String accion, int idOrden);	//Temporal
	
	//REPORTE
	List<OrdenBean> mostrarReporteOT(HttpServletRequest req);
	List<OrdenBean> mostrarMasterOT(HttpServletRequest req);
	List<OrdenBean> mostrarMasterDeudaOT(String tipo, HttpServletRequest req);
	List<OrdenBean> mostrarMasterDinamicaOT(HttpServletRequest req);
	
	//CHART
	List<CuentaBean> grafOrdenGeneral(int idOrden, HttpServletRequest req);
}
