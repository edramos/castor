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

import com.simularte.bean.ProveedorBean;
import com.simularte.model.Proveedor;
import com.simularte.service.ProveedorService;


@Controller
public class ProveedorController {

	@Autowired
	ProveedorService proveedorservice;
	
	@RequestMapping(value = "ajaxCrearProveedor", method = RequestMethod.POST)@ResponseBody
	public List<ProveedorBean> ajaxCrearProveedor(@ModelAttribute Proveedor proveedor, HttpServletRequest req){
		List<ProveedorBean> proveedores = new ArrayList<ProveedorBean>();		
		if(proveedorservice.crearProveedor(proveedor, req)){
			proveedores = proveedorservice.listarProveedores(req);
		}else{
			proveedores = null;
		}
		return proveedores;
	}
	@RequestMapping(value = "ajaxModificarProveedor", method = RequestMethod.POST)@ResponseBody
	public List<ProveedorBean> ajaxModificarProveedor(@ModelAttribute Proveedor proveedor, HttpServletRequest req){
		List<ProveedorBean> proveedores = new ArrayList<ProveedorBean>();		
		if(proveedorservice.modificarProveedor(proveedor, req)){
			proveedores = proveedorservice.listarProveedores(req);
		}else{
			proveedores = null;
		}
		
		return proveedores;
	}
	@RequestMapping(value = "ajaxEliminarProveedor-{idProveedor}", method = RequestMethod.POST)@ResponseBody
	public List<ProveedorBean> ajaxEliminarProveedor(@PathVariable("idProveedor") Integer idProveedor, HttpServletRequest req){
		List<ProveedorBean> proveedores = new ArrayList<ProveedorBean>();
		if(proveedorservice.eliminarProveedor(idProveedor, req)){
			proveedores = proveedorservice.listarProveedores(req);
		}else{
			proveedores = null;
		}
		
		return proveedores;
	}
	@RequestMapping(value = "ajaxListarProveedores", method = RequestMethod.POST)
	@ResponseBody
	public List<ProveedorBean> ajaxListarProveedores(HttpServletRequest req){
		List<ProveedorBean> proveedores = new ArrayList<ProveedorBean>();
		proveedores = proveedorservice.listarProveedores(req);
		return proveedores;
	}
	
}
