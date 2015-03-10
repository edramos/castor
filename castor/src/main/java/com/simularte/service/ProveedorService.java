package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.ProveedorBean;
import com.simularte.model.Proveedor;

public interface ProveedorService {

	boolean crearProveedor(Proveedor Proveedor, HttpServletRequest req);
	boolean modificarProveedor(Proveedor Proveedor, HttpServletRequest req);
	boolean eliminarProveedor(Integer idProveedor, HttpServletRequest req);
	public List<ProveedorBean> listarProveedores(HttpServletRequest req);
	
}
