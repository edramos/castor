package com.simularte.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simularte.model.Usuario;
import com.simularte.service.UserService;

@Controller
public class UserController {

	@Autowired UserService us;
	
	@RequestMapping("toLogin")
	public String toLogin(){
		return "login";
	}
	
	@RequestMapping(value = "toCrearCuenta", method = RequestMethod.POST)
	public String toCrearCuenta(@ModelAttribute("usuario")Usuario usuario, Model model){
		String path = "";
		
		if(us.crearCuenta(usuario)){
			model.addAttribute("msg", "Cuenta creada");
		}else{
			model.addAttribute("msg", "Error crear cuenta");
		}
		path = "login";
		
		return path;
	}
	
	@RequestMapping(value = "toLogin", method = RequestMethod.POST)
	public String toLogin(@RequestParam("username")String username, @RequestParam("password")String password, HttpServletRequest req, Model model){
		String path = "login";
				
		if(us.login(username, password, req)){
			switch(req.getSession().getAttribute("tipo").toString()){
			case "empresa":
				path = "empresa/dashboard";
				break;
			case "cliente":
				break;
			case "proveedor":
				break;
			}
		}else{
			model.addAttribute("msg","Login incorrecto");
		}
		
		return path;
	}
	
	@RequestMapping(value = "toLogout")
	public String toLogout(HttpServletRequest req, Model model){
		String path = "";
		
		if(us.logout(req)){
			model.addAttribute("msg", "Sesion terminada");
			path = "login";
		}
		
		return path;
	}
	
	//NAVIGATION
	@RequestMapping("toMyCompany")
	public String toMyCompany(HttpServletRequest req){
		String path = "";
		
		switch(req.getSession().getAttribute("tipo").toString()){
		case "empresa":
			path = "empresa/miCompania";
			break;
		case "cliente":
			break;
		case "proveedor":
			break;
		}
		
		return path;
	}
}