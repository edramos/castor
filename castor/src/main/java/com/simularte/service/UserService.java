package com.simularte.service;

import javax.servlet.http.HttpServletRequest;

import com.simularte.model.Usuario;

public interface UserService {

	boolean crearCuenta(Usuario usuario);
	boolean login(String username, String password, HttpServletRequest req);
	boolean logout(HttpServletRequest req);
}
