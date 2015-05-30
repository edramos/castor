package com.simularte.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.CuentaBean;
import com.simularte.model.Usuario;
import com.simularte.service.OrdenService;
import com.simularte.service.UserService;

@Controller
public class UserController {

	@Autowired UserService us; 
	@Autowired OrdenService os;
	
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
				model.addAttribute("panelOrden", os.buscarOrderPanel(req));
				path = "empresa/dashboard";
				break;
			case "cliente":
				model.addAttribute("panelOrden", os.buscarOrderPanel(req));
				path = "empresa/dashboard";
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
	
	//GENERAL NAVIGATION
	@RequestMapping("toDashboard")
	public String toDashboard(HttpServletRequest req, Model model){
		String path = null;
		
		switch(req.getSession().getAttribute("tipo").toString()){
		case "empresa":
			model.addAttribute("panelOrden", os.buscarOrderPanel(req));
			path = "empresa/dashboard";
			break;
		case "cliente":
			System.out.println("CLIENTE");
			model.addAttribute("panelOrden", os.buscarOrderPanel(req));
			path = "empresa/dashboard";
			break;
		}
		return path;
	}
	
	@RequestMapping("toMyCompany")
	public String toMyCompany(HttpServletRequest req){
		String path = "";
		
		switch(req.getSession().getAttribute("tipo").toString()){
		case "empresa":
			path = "empresa/miCompania";
			break;
		case "cliente":
			path = "empresa/miCompania";
			break;
		case "proveedor":
			break;
		}
		
		return path;
	}
	//EMPRESA NAVIGATION
	/*@RequestMapping("empNav")
	public String toCrearProyecto(@RequestParam("url")String url){
		String path = "";
		
		switch(url){
		case "toCrearOrden":
			path = "empresa/crearOrden";
			break;
		case "toOrden":
			path = "empresa/orden";
			break;
		}
		return path;
	}*/
	@RequestMapping("toCrearOrden")
	public String toCrearOrden(){
		return "empresa/crearOrden";
	}
	@RequestMapping("toBuscarOrden")
	public String toBuscarOrden(){
		return "empresa/buscarOrden";
	}
	@RequestMapping("toCrearCajaBanco")
	public String toCrearCajaBanco(){
		return "empresa/crearCajaBanco";
	}
	@RequestMapping("toCajaBanco")
	public String toCajaBanco(){
		return "empresa/cajaBanco";
	}
	@RequestMapping("toCajaChica")
	public String toCajaChica(){
		return "empresa/cajaChica";
	}
	@RequestMapping("toCrearFactura")
	public String toCrearFactura(){
		return "empresa/crearFactura";
	}
	@RequestMapping(value = "getChartDashboard", method = RequestMethod.GET) @ResponseBody
	public List<CuentaBean> getChartDashboard(HttpServletRequest req){
		return us.getCuentas(req);
	}
	@RequestMapping("toReporte")
	public String toReporte(){
		return "empresa/reportes/deudaActual";
	}
	@RequestMapping("toMasterOT")
	public String toMasterOT(){
		return "empresa/reportes/masterOrden";
	}
}