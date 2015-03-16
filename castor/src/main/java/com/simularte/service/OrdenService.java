package com.simularte.service;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.OrdenBean;

public interface OrdenService {
	boolean crearOrden(OrdenBean ordenBean, int idCliente, String[] subCont, HttpServletRequest req);
}
