package com.simularte.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.simularte.bean.EmpleadoBean;

public interface EmpleadoService {
	boolean crearEmpleado(EmpleadoBean empleado, HttpServletRequest req);
	boolean modificarEmpleado(EmpleadoBean empleado, HttpServletRequest req);
	boolean eliminarEmpleado(Integer idEmpleado, HttpServletRequest req);
	public List<EmpleadoBean> listarEmpleados(HttpServletRequest req);	//Estos que llevan el scope public se podria borrar de aqui
	List<EmpleadoBean> getEmpleadosAutocomplete(String nombreEmp, HttpServletRequest req);
	List<EmpleadoBean> listarSupervisores(HttpServletRequest req);
	
}
