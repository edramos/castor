package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.ClienteBean;
import com.simularte.bean.SubcontratoBean;
import com.simularte.model.Cliente;

public interface SubcontratoService {

	public List<SubcontratoBean> listarSubcontratos(Integer idOrden, HttpServletRequest req);
	
}
