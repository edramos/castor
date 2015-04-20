package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.CuentaBean;
import com.simularte.model.Usuario;

public interface UserService {

	boolean crearCuenta(Usuario usuario);
	boolean login(String username, String password, HttpServletRequest req);
	boolean logout(HttpServletRequest req);
	List<CuentaBean> getCuentas(HttpServletRequest req);
}
