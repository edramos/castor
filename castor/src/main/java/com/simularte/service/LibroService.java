package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.LibroBean;
import com.simularte.model.DetalleLibro;

public interface LibroService {

	boolean crearDetalleLibro(LibroBean cajaBean, String tipoLibro, HttpServletRequest req);
	List<LibroBean> listarDetalleLibro(Integer idLibro, HttpServletRequest req);
	List<DetalleLibro> mostrarDetalleLibro(Integer idDetalleLibro, HttpServletRequest req);
}
