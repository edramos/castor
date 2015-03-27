package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.CajaBean;

public interface CajaService {

	boolean crearCaja(CajaBean cajaBean, HttpServletRequest req);
	List<CajaBean> listarRegistrosCaja(HttpServletRequest req);
}
