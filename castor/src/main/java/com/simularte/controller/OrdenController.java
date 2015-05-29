package com.simularte.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simularte.bean.CuentaBean;
import com.simularte.bean.OrdenBean;
import com.simularte.service.OrdenService;

@Controller
public class OrdenController {

	@Autowired
	OrdenService ordenserv;
	
	
	@RequestMapping(value = "crearOrden", method = RequestMethod.POST)
	public String crearOrden(@ModelAttribute("ordenBean")OrdenBean ordenBean, @RequestParam("cobroscliente") String[] cobrosCliente, @RequestParam("subcontratos") String[] subCont, 
			@RequestParam("pagoproveedores") String[] pagProv, Model model, HttpServletRequest req){		
		String path = "";
		System.out.println("termino obra: " + subCont[4]);
		
		int idOrden = ordenserv.crearOrden(ordenBean, ordenBean.getIdCliente(), cobrosCliente, subCont, pagProv, req);
		
		if(idOrden != -1){
			path = "redirect:ordenPag-" + idOrden;
		}else{
			System.out.println("NO Grabe!");
		}
		return path;
	}
	
	@RequestMapping(value = "ajaxBuscarOrden", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxBuscarOrden(@ModelAttribute("ordenBean") OrdenBean ordenBean, HttpServletRequest req){
		List<OrdenBean> ordenes = new ArrayList<OrdenBean>();		
		ordenes = ordenserv.buscarOrden(ordenBean, req);
		return ordenes;
	}
	
	@RequestMapping(value = "ajaxBuscarOrdenFactura", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxBuscarOrdenFactura(HttpServletRequest req){
		return ordenserv.buscarOrdenFactura(req);
	}
	
	@RequestMapping("ordenPag-{idOrden}")
	public String ordenPag(@PathVariable("idOrden") Integer idOrden, Model model, HttpServletRequest req){
		String path = "empresa/orden";
		model.addAttribute("idOrden", idOrden);
		return path;
	}
	
	@RequestMapping(value = "ajaxObtenerInformacionOrden-{tipo}-{idOrden}", method = RequestMethod.POST) @ResponseBody
	public OrdenBean ajaxObtenerInformacionOrden(@PathVariable("tipo")String tipo, @PathVariable("idOrden")int idOrden, HttpServletRequest req){
		OrdenBean orden = new OrdenBean();		
		orden = ordenserv.obtenerInformacionOrden(idOrden, tipo, req);
		return orden;
	}
	
	@RequestMapping(value = "ajaxBuscarOrdenCaja-{idFactura}", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxBuscarOrdenCaja(@PathVariable("idFactura")int idFactura, HttpServletRequest req){
		return ordenserv.buscarOrdenCaja(idFactura, req);
	}
	@RequestMapping(value = "ajaxListarOrdenesSuggest", method = RequestMethod.GET) @ResponseBody
	public List<OrdenBean> ajaxListarFacturaDetraccionSuggest(HttpServletRequest req){
		String codigo = (String)req.getParameter("q");
				
		return ordenserv.getOrdenesSuggest(codigo, req);
	}
	//EDITAR
	@RequestMapping(value = "ajaxEditarOrden", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxEditarOrden(@ModelAttribute("ordenBean") OrdenBean ob, HttpServletRequest req){
			
		if(ordenserv.editarOrden(ob, req)){
			return ordenserv.mostrarMasterOT(req); 
		}else{
			return null;
		}
		
	} 
	
	//REPORTES 
	@RequestMapping(value = "mostrarMasterOT", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> mostrarMasterOT(HttpServletRequest req){
		return ordenserv.mostrarMasterOT(req);
	}
	/*Deuda Actual*/
	@RequestMapping(value = "mostrarReporteOT", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> mostrarReporteOT(HttpServletRequest req){
		return ordenserv.mostrarReporteOT(req);
	}
	
	
	
	//CHART GENERAL
	@RequestMapping(value = "getChartOrden-{idOrden}", method = RequestMethod.GET) @ResponseBody
	public List<CuentaBean> getChartOrden(@PathVariable("idOrden")int idOrden, HttpServletRequest req){
		return ordenserv.grafOrdenGeneral(idOrden, req);
	}
	
	
	
	
	
	
	
	
	
	
	
}
