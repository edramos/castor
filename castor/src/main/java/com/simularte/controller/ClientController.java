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

import com.simularte.bean.ClienteBean;
import com.simularte.model.Cliente;
import com.simularte.service.ClienteService;

@Controller
public class ClientController {

	@Autowired
	ClienteService clienteservice;
	
	@RequestMapping(value = "ajaxCrearCliente", method = RequestMethod.POST)@ResponseBody
	public List<ClienteBean> ajaxCrearCliente(@ModelAttribute Cliente cliente, HttpServletRequest req){
		List<ClienteBean> clientes = new ArrayList<ClienteBean>();		
		if(clienteservice.crearCliente(cliente, req)){
			clientes = clienteservice.listarClientes(req);
		}else{
			clientes = null;
		}
		return clientes;
	}
	@RequestMapping(value = "ajaxModificarCliente", method = RequestMethod.POST)@ResponseBody
	public List<ClienteBean> ajaxModificarCliente(@ModelAttribute Cliente cliente, HttpServletRequest req){
		List<ClienteBean> clientes = new ArrayList<ClienteBean>();		
		if(clienteservice.modificarCliente(cliente, req)){
			clientes = clienteservice.listarClientes(req);
		}else{
			clientes = null;
		}
		
		return clientes;
	}
	@RequestMapping(value = "ajaxEliminarCliente-{idCliente}", method = RequestMethod.POST)@ResponseBody
	public List<ClienteBean> ajaxEliminarCliente(@PathVariable("idCliente") Integer idCliente, HttpServletRequest req){
		List<ClienteBean> clientes = new ArrayList<ClienteBean>();
		if(clienteservice.eliminarCliente(idCliente, req)){
			clientes = clienteservice.listarClientes(req);
		}else{
			clientes = null;
		}
		
		return clientes;
	}
	@RequestMapping(value = "ajaxListarClientes", method = RequestMethod.POST)
	@ResponseBody
	public List<ClienteBean> ajaxListarClientes(HttpServletRequest req){
		List<ClienteBean> clientes = new ArrayList<ClienteBean>();
		clientes = clienteservice.listarClientes(req);
		return clientes;
	}
	
}
