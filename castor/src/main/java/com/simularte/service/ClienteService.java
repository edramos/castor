package com.simularte.service;

import javax.servlet.http.HttpServletRequest;

import com.simularte.model.Cliente;

public interface ClienteService {

	boolean crearCliente(Cliente cliente, HttpServletRequest req);
}
