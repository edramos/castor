package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.OrdenBean;

public interface OrdenService {
	int crearOrden(OrdenBean ordenBean, int idCliente, String[] cobrosCliente, String[] subCont, String[] pagProv, HttpServletRequest req);
	List<OrdenBean> buscarOrden(OrdenBean ordenBean , HttpServletRequest req);
	OrdenBean obtenerInformacionOrden(Integer idOrden , HttpServletRequest req);
	List<OrdenBean> buscarOrderPanel(HttpServletRequest req);
}
