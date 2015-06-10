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
	
	@RequestMapping(value = "ajaxBuscarOrdenFactura_{value}", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxBuscarOrdenFactura(@PathVariable("value")String value, HttpServletRequest req){
		return ordenserv.buscarOrdenFactura(value, req);
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
	@RequestMapping(value = "ajaxEditarEstadoOrden-{accion}-{idOrden}", method = RequestMethod.POST) @ResponseBody
	public String ajaxEditarEstadoOrden(@PathVariable("accion")String accion, @PathVariable("idOrden")int idOrden, HttpServletRequest req){
		String estado = "Aceptacion Pendiente";
		System.out.println("accion: " + accion + ", idOrden: " + idOrden);
		if(ordenserv.editarOrdenEstado(accion, idOrden).equals("Sin inicio")){
			estado = "Sin inicio";
		}else{
			estado = "Rechazada";
		}
		return estado;
	}
	
	
	//EDITAR
	@RequestMapping(value = "ajaxEditarOrden-{action}", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> ajaxEditarOrden(@ModelAttribute("ordenBean") OrdenBean ob,@PathVariable("action")String action, HttpServletRequest req){
		System.out.println("action: " + action + ", IdOrden: " + ob.getIdOrden() + ", pago: " + ob.getPagado() + ", estado: " + ob.getEstado());
		if(ordenserv.editarOrden(ob, action, req)){
			return ordenserv.mostrarMasterOT(req); 
		}else{
			return null;
		}
		//return null;
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
	/*MASTER DEUDA OT*/
	@RequestMapping(value = "reporteMasterDeudaOT", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> reporteMasterDeudaOT(@ModelAttribute("ordenBean")OrdenBean ob, HttpServletRequest req){
		return ordenserv.mostrarMasterDeudaOT(ob, req);	
	}
	@RequestMapping(value = "reporteMasterDinamicaOT", method = RequestMethod.POST) @ResponseBody
	public List<OrdenBean> reporteMasterDinamicaOT(HttpServletRequest req){
		return ordenserv.mostrarMasterDinamicaOT(req);
	}
	
	//CHART GENERAL
	@RequestMapping(value = "getChartOrden-{idOrden}", method = RequestMethod.GET) @ResponseBody
	public List<CuentaBean> getChartOrden(@PathVariable("idOrden")int idOrden, HttpServletRequest req){
		return ordenserv.grafOrdenGeneral(idOrden, req);
	}
	
	
	
	
	
	
	
	
	
	
	
}
