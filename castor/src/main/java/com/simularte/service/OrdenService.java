package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.OrdenBean;

public interface OrdenService {
	boolean crearOrden(OrdenBean ordenBean, int idCliente, String[] subCont, HttpServletRequest req);
	//Por ahora es 1 solo campo para probar, luego esto sera por JSON(cadena busqueda,campo)
	List<OrdenBean> buscarOrden(OrdenBean ordenBean , HttpServletRequest req);
}
