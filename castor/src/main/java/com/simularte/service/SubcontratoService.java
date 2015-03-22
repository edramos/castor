package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.SubcontratoBean;

public interface SubcontratoService {

	public List<SubcontratoBean> listarSubcontratos(Integer idOrden, HttpServletRequest req);
	
}
