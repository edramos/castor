package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.ClienteBean;
import com.simularte.model.Cliente;

public interface ClienteService {

	boolean crearCliente(Cliente cliente, HttpServletRequest req);
	boolean modificarCliente(Cliente cliente, HttpServletRequest req);
	boolean eliminarCliente(Integer idCliente, HttpServletRequest req);
	public List<ClienteBean> listarClientes(HttpServletRequest req);
	
}
