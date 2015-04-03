package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.DetalleLibroBean;
import com.simularte.bean.LibroBean;
import com.simularte.service.LibroService;

@Controller
public class LibroController {

	@Autowired
	LibroService cs;
	
	@RequestMapping(value = "ajaxCrearRegistroLibro", method = RequestMethod.POST) @ResponseBody
	public Boolean ajaxCrearRegistroLibro(@ModelAttribute("cajaBean")LibroBean libroBean, String tipoLibro, HttpServletRequest req){
		Boolean resultado = false;
		
		if(cs.crearDetalleLibro(libroBean, tipoLibro, req)){
			System.out.println("GRABO!!!");
			resultado = true;
		}else{
			System.out.println("NO GRABO");
			resultado = false;
		}
	
		return resultado;
	}
	
	
	@RequestMapping(value = "listarDetalleLibro-{idLibro}", method = RequestMethod.POST) @ResponseBody
	public List<LibroBean> listarDetalleLibro(@PathVariable("idLibro") Integer idLibro, HttpServletRequest req){
		List<LibroBean> registros = new ArrayList<LibroBean>();
		registros = cs.listarDetalleLibro(idLibro, req);
	
		return registros;
	}
	
	@RequestMapping(value = "mostrarDetalleRegistro-{idDetalleLibro}", method = RequestMethod.POST) @ResponseBody
	public List<DetalleLibroBean> mostrarDetalleRegistro(@PathVariable("idDetalleLibro") Integer idDetalleLibro, HttpServletRequest req){
		List<DetalleLibroBean> registros = new ArrayList<DetalleLibroBean>();
		registros = cs.mostrarDetalleLibro(idDetalleLibro, req);
	
		return registros;
	}
}
