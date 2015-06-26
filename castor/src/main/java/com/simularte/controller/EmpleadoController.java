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

import com.simularte.bean.EmpleadoBean;
import com.simularte.service.EmpleadoService;

@Controller
public class EmpleadoController {

	@Autowired
	EmpleadoService empleadoservice;
	
	@RequestMapping(value = "ajaxCrearEmpleado", method = RequestMethod.POST)
	@ResponseBody
	public List<EmpleadoBean> ajaxCrearEmpleado(@ModelAttribute("empleado") EmpleadoBean empleado, HttpServletRequest req){
		List<EmpleadoBean> Empleados = new ArrayList<EmpleadoBean>();		
		if(empleadoservice.crearEmpleado(empleado, req)){
			Empleados = empleadoservice.listarEmpleados(req);
		}else{
			Empleados = null;
		}
		return Empleados;
	}
	@RequestMapping(value = "ajaxModificarEmpleado", method = RequestMethod.POST)
	@ResponseBody
	public List<EmpleadoBean> ajaxModificarEmpleado(@ModelAttribute("empleado") EmpleadoBean empleado, HttpServletRequest req){
		List<EmpleadoBean> Empleados = new ArrayList<EmpleadoBean>();		
		if(empleadoservice.modificarEmpleado(empleado, req)){
			Empleados = empleadoservice.listarEmpleados(req);
		}else{
			Empleados = null;
		}
		
		return Empleados;
	}
	@RequestMapping(value = "ajaxEliminarEmpleado-{idEmpleado}", method = RequestMethod.POST)
	@ResponseBody
	public List<EmpleadoBean> ajaxEliminarEmpleado(@PathVariable("idEmpleado") Integer idEmpleado, HttpServletRequest req){
		List<EmpleadoBean> Empleados = new ArrayList<EmpleadoBean>();
		if(empleadoservice.eliminarEmpleado(idEmpleado, req)){
			Empleados = empleadoservice.listarEmpleados(req);
		}else{
			Empleados = null;
		}
		
		return Empleados;
	}
	@RequestMapping(value = "ajaxListarEmpleados", method = RequestMethod.POST) @ResponseBody
	public List<EmpleadoBean> ajaxListarEmpleados(HttpServletRequest req){
		List<EmpleadoBean> Empleados = new ArrayList<EmpleadoBean>();
		Empleados = empleadoservice.listarEmpleados(req);
		return Empleados;
	}
	
	
	@RequestMapping(value = "ajaxListarEmpleadosAutocomplete", method = RequestMethod.GET) @ResponseBody
	public List<EmpleadoBean> ajaxListarEmpleadosAutocomplete(HttpServletRequest req){
		String nombreEmp = (String)req.getParameter("q");
		System.out.println("nombreEmp: " + nombreEmp);
		return empleadoservice.getEmpleadosAutocomplete(nombreEmp, req);
	}
	
	@RequestMapping(value = "ajaxListarSupervisor", method = RequestMethod.POST) @ResponseBody
	public List<EmpleadoBean> ajaxListarSupervisor(HttpServletRequest req){
		return empleadoservice.listarSupervisores(req);
	}
}
