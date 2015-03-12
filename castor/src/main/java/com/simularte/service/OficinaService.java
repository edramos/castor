package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.OficinaBean;

public interface OficinaService {

	boolean crearOficina(OficinaBean Oficina, HttpServletRequest req);
	boolean modificarOficina(OficinaBean Oficina, HttpServletRequest req);
	boolean eliminarOficina(Integer idOficina, HttpServletRequest req);
	public List<OficinaBean> listarOficinas(HttpServletRequest req);
	
}
