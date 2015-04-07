package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.ArchivoBean;

public interface S3Service {

	boolean subirArchivo(ArchivoBean ab, HttpServletRequest req);
	List<ArchivoBean> cargarArchivos(int idEntidad, String tipoEntidad);
}
