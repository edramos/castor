package com.simularte.service;

import javax.servlet.http.HttpServletRequest;

import com.simularte.model.Orden;

public interface OrdenService {
	boolean crearOrden(Orden orden, int idCliente, HttpServletRequest req);
}
