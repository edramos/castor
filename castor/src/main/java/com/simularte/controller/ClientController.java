package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.model.Cliente;

@Controller
public class ClientController {

	@RequestMapping(value = "ajaxCrearCliente", method = RequestMethod.POST)@ResponseBody
	public List<Cliente> ajaxCrearCliente(@ModelAttribute Cliente cliente, HttpServletRequest req){
		List<Cliente> clientes = new ArrayList<Cliente>();
		
		return clientes;
	}
}
