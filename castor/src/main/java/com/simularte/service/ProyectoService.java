package com.simularte.service;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.ProyectoBean;

public interface ProyectoService {
	boolean crearProyecto(ProyectoBean proyecto, HttpServletRequest req);
}
