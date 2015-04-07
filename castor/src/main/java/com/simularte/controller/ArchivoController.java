package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.simularte.bean.ArchivoBean;
import com.simularte.bean.S3Bean;
import com.simularte.service.S3Service;

@Controller
public class ArchivoController {

	@Autowired
	S3Service s3;
	
	@RequestMapping(value = "cargarArchivoAjax", method = RequestMethod.POST) @ResponseBody
	public List<ArchivoBean> cargarArchivoAjax(@ModelAttribute("arregloArchivos")ArchivoBean ab, HttpServletRequest req, Model map){
		List<ArchivoBean> resultados = new ArrayList<ArchivoBean>();
		
		System.out.println("size: " + ab.getFiles().size());
		
		if(s3.subirArchivo(ab, req)){
			resultados = s3.cargarArchivos(ab.getIdEntidad(), ab.getTipoEntidad());
		}
		
		return resultados;
	}
	
}
