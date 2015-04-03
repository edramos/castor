package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.DetalleLibroBean;
import com.simularte.bean.LibroBean;

public interface LibroService {

	boolean crearDetalleLibro(LibroBean cajaBean, String tipoLibro, HttpServletRequest req);
	List<LibroBean> listarDetalleLibro(Integer idLibro, HttpServletRequest req);
	List<DetalleLibroBean> mostrarDetalleLibro(Integer idDetalleLibro, HttpServletRequest req);
}
