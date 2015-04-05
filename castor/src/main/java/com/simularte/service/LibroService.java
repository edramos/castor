package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.DetalleLibroBean;

public interface LibroService {

	boolean crearDetalleLibro(DetalleLibroBean dlb, Integer idLibro, HttpServletRequest req);
	List<DetalleLibroBean> listarDetalleLibro(Integer idLibro, HttpServletRequest req);
	List<DetalleLibroBean> mostrarDetalleLibro(Integer idDetalleLibro, HttpServletRequest req);
}
