package com.simularte.service;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.OrdenBean;
import com.simularte.model.Cliente;
import com.simularte.model.Cuenta;
import com.simularte.model.Empresa;
import com.simularte.model.Orden;
import com.simularte.model.Proveedor;
import com.simularte.model.Subcontrato;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;

@Service
public class OrdenServiceImpl implements OrdenService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public int crearOrden(OrdenBean ordenBean, int idCliente, String[] subCont, String[] pagProv, HttpServletRequest req) {
		int idOrden = -1;
		
		try{
			HttpSession session = req.getSession();
			
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			Cliente cliente = em.find(Cliente.class, idCliente);
			
			Orden orden = new Orden();
			
			orden.setOrdenCliente(cliente);
			orden.setOrdenEmpresa(empresa);
			orden.setCodigo("");
			orden.setNombre(ordenBean.getNombre());
			orden.setTipoOrden(ordenBean.getTipoOrden());
			orden.setTipoTrabajo(ordenBean.getTipoTrabajo());
			orden.setLat(Double.parseDouble(ordenBean.getLat().replace("°", "")));
			orden.setLon(Double.parseDouble(ordenBean.getLon().replace("°", "")));
			orden.setCiudad(ordenBean.getCiudad());
			orden.setDepartamento(ordenBean.getDepartamento());
			orden.setOferta(ordenBean.getOferta());
			orden.setMoneda(ordenBean.getMoneda());
			
			orden.setEficiencia(ordenBean.getEficiencia());
			orden.setUtilidadBruta(ordenBean.getUtilidadBruta());
			orden.setSubTotal(ordenBean.getSubTotal());
			orden.setGastosGenerales(ordenBean.getGastosGenerales());
			orden.setTotal(ordenBean.getTotal());	
			orden.setFechaEntrega(Dates.stringToDate(ordenBean.getFechaEntrega(), "yyyy-MM-dd"));
						
			orden.setCreadoPor((Integer)session.getAttribute("idUser"));
			orden.setFechaCreacion(Dates.fechaCreacion());
			orden.setEstado("sin inicio");
			
			em.persist(orden);
			
			Orden ordenY = em.merge(orden);
			ordenY.setCodigo("OT-" + orden.getTipoOrden() + "-" + String.format("%05d", orden.getIdOrden()));
			
			//Convierte el array de String a un array de Subcontratos, con JSON esta parte ya seria automatica
			ArrayList<Subcontrato> subContratos = new ArrayList<Subcontrato>();
			int resto;		
			System.out.println("subCont.length: " + subCont.length);
			for(int x = 0; x < subCont.length; x++){
				resto = x%6;
				if(resto == 0){
					System.out.println("resto: " + resto + "creo Proveedor");
					Subcontrato subc = new Subcontrato();
					
					
					Proveedor proveedor = em.find(Proveedor.class, Integer.parseInt(subCont[x]));
					
					subc.setProveedorSubcontrato(proveedor);
					subc.setOrdenSubcontrato(orden);
					
					subContratos.add(subc);
				}else{
					System.out.println("size Subcontratos: " + subContratos.size());
					int index = subContratos.size()-1;
					System.out.println("index: " + index);
					switch(resto){
					case 1:
						System.out.println("resto " + resto + ", x: " + x + ", tipo trabajo: " + subCont[x]);
						subContratos.get(index).setTipoTrabajo(subCont[x]);
						break;
					case 2:
						System.out.println("resto " + resto + ", x: " + x + ", moneda: " + subCont[x]);
						subContratos.get(index).setMoneda(subCont[x]);
						break;
					case 3:
						subContratos.get(index).setMonto(Formatos.StringToBigDecimal(subCont[x]));
						System.out.println("resto " + resto + ", x: " + x + ", monto: " + subContratos.get(index).getMonto());
						break;
					case 4:
						System.out.println("resto " + resto + ", x: " + x + ", termino: " + subCont[x]);
						subContratos.get(index).setFechaTerminoObra(Dates.stringToDate(subCont[x], "yyyy-MM-dd"));
						break;
					case 5:
						System.out.println("resto " + resto + ", x: " + x + ", estado: " + subCont[x]);
						subContratos.get(index).setEstado(subCont[x]);
						break;	
					}
				}
			}
			
			Map<Integer, Subcontrato> subcontratosMap = new HashMap<Integer, Subcontrato>();
			
			//El Array de Subcontratos se graba, con JSON esto ya seria directo aqui
			for(int x = 0; x < subContratos.size(); x++){			
				subContratos.get(x).setCreadoPor((Integer)session.getAttribute("idUser"));
				subContratos.get(x).setFechaCreacion(Dates.fechaCreacion());
				//subContratos.get(x).setEstado("enabled");
				System.out.println("Grabar Subcontrato: " + subContratos.get(x).getMonto());
				if(subContratos.get(x).getEstado().equals("enabled")){
					em.persist(subContratos.get(x));
					//
					subcontratosMap.put(subContratos.get(x).getProveedorSubcontrato().getIdProveedor(), subContratos.get(x));
				}				
			}
			
			//Grabamos las cuentas de tipo pago
			ArrayList<Cuenta> cuenta_prov = new ArrayList<Cuenta>();
			int resto2;		
			for(int x = 0; x < pagProv.length; x++){
				resto2 = x%5;				
				if(resto2 == 0){					
					Cuenta cu = new Cuenta();
					
					Subcontrato sbcontrato = subcontratosMap.get(Integer.parseInt(pagProv[x]));
					
					cu.setCuentaSubcontrato(sbcontrato);
					cu.setTipo("pago");
					cuenta_prov.add(cu);
				}else{
					System.out.println("size cuentas: " + cuenta_prov.size());
					int index = cuenta_prov.size()-1;
					System.out.println("index: " + index);
					switch(resto2){
						case 1:
							cuenta_prov.get(index).setMonto(Formatos.StringToBigDecimal(pagProv[x]));						
							break;
						case 2:
							cuenta_prov.get(index).setTipoPago(pagProv[x]);						
							break;	
						case 3:
							cuenta_prov.get(index).setFechaVencimiento(Dates.stringToDate(pagProv[x], "yyyy-MM-dd"));
							break;
						case 4:
							cuenta_prov.get(index).setFechaPagoProgramada(Dates.stringToDate(pagProv[x], "yyyy-MM-dd"));
							break;
					}
				}
					
			}
				
						
			//El Array de Subcontratos se graba, con JSON esto ya seria directo aqui
			for(int x = 0; x < cuenta_prov.size(); x++){	
				cuenta_prov.get(x).setCreadoPor((Integer)session.getAttribute("idUser"));
				cuenta_prov.get(x).setFechaCreacion(Dates.fechaCreacion());
				cuenta_prov.get(x).setEstado("enabled");
				em.persist(cuenta_prov.get(x));
				
				//if(pagosprov.get(x).getEstado().equals("enabled")){
					//em.persist(pagosprov.get(x));
				//}				
			}
			
			
			idOrden = orden.getIdOrden();
		}catch(Exception e){
			e.printStackTrace();
		}
		return idOrden;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> buscarOrden(OrdenBean ordenBean, HttpServletRequest req){
		List<OrdenBean> ordenBeans = new ArrayList<OrdenBean>();
		String campos = "";
		String from = "";
		String join = "";
		String condiciones = "";
		
		HttpSession session = req.getSession();
		
		campos = "o.idOrden, o.codigo, o.nombre, cli.nombre, o.oferta ";
		from = "FROM Orden o ";
		join = "INNER JOIN o.ordenCliente cli ";
		join += "INNER JOIN o.ordenEmpresa empr ";
		condiciones = "WHERE empr.idEmpresa = :idEmpresa ";

		if(!ordenBean.getCodigo().equals("")){
			condiciones += "AND o.codigo LIKE :codigo AND o.estado != 'disable' ";
		}
		if(!ordenBean.getNombreCliente().equals("")){
			condiciones += "AND cli.nombre LIKE :nombreCliente AND cli.estado != 'disable' ";
		}
		if(ordenBean.getOfertaMinima()!=null){
			condiciones += "AND o.oferta > :ofertaMinima ";
		}
		if(ordenBean.getOfertaMaxima()!=null){
			condiciones += "AND o.oferta < :ofertaMaxima ";
		}
		if(!ordenBean.getFechaCreacionMinima().equals("")){
			condiciones += "AND o.fechaCreacion > :fechaCreacionMinima ";
		}
		if(!ordenBean.getFechaCreacionMaxima().equals("")){
			condiciones += "AND o.fechaCreacion < :fechaCreacionMaxima ";
		}
		
		
		System.out.println("QUERY: SELECT DISTINCT " + campos + from + join + condiciones + "--- BASIC" );
		Query q = em.createQuery("SELECT DISTINCT " + campos + from + join + condiciones);

		q.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));
		
		if(!ordenBean.getCodigo().equals("")){
			q.setParameter("codigo", "%" + ordenBean.getCodigo() + "%");
		}
		if(!ordenBean.getNombreCliente().equals("")){
			q.setParameter("nombreCliente", "%" + ordenBean.getNombreCliente() + "%");
		}
		if(ordenBean.getOfertaMinima()!=null){
			q.setParameter("ofertaMinima", ordenBean.getOfertaMinima());
		}
		if(ordenBean.getOfertaMaxima()!=null){
			q.setParameter("ofertaMaxima", ordenBean.getOfertaMaxima());
		}
		if(!ordenBean.getFechaCreacionMinima().equals("")){
			String[] dateSearchArray = ordenBean.getFechaCreacionMinima().split("/");
			String dateSearch = dateSearchArray[2]+"-"+dateSearchArray[1]+"-"+dateSearchArray[0];
			SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
			try{
				 q.setParameter("fechaCreacionMinima", formatoFecha.parse(dateSearch));		
			}catch(Exception e){
				 
			}
		}
		if(!ordenBean.getFechaCreacionMaxima().equals("")){
			String[] dateSearchArray = ordenBean.getFechaCreacionMaxima().split("/");
			String dateSearch = dateSearchArray[2]+"-"+dateSearchArray[1]+"-"+dateSearchArray[0];
			SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
			try{
				 q.setParameter("fechaCreacionMaxima", formatoFecha.parse(dateSearch));		
			}catch(Exception e){
				 
			}
		}
		
		List<Object[]> rows = q.getResultList();
		System.out.println("SIZE: " + rows.size());
		for(int x = 0; x < rows.size(); x++){
			Object[] ord = rows.get(x);
			OrdenBean ordenB = new OrdenBean();
			ordenB.setIdOrden((Integer)ord[0]);
			ordenB.setCodigo(ord[1].toString());
			ordenB.setNombre(ord[2].toString());
			ordenB.setNombreCliente(ord[3].toString());			
			ordenB.setOferta(new BigDecimal(ord[4].toString()));
			
			ordenBeans.add(ordenB);
		}
		
		return ordenBeans;
	}
	
	
	public List<OrdenBean> buscarOrderPanel(HttpServletRequest req){
		List<OrdenBean> ordenBeans = new ArrayList<OrdenBean>();
		String estado = "";
		
		Query q01, q02;
		
		for(int estados = 0; estados < 5; estados++){
			switch(estados){
			case 0:
				estado = "Sin inicio";break;
			case 1:
				estado = "Por iniciar";break;
			case 2:
				estado = "Proceso";break;
			case 3:
				estado = "Terminado";break;
			case 4:
				estado = "Aceptado";break;
			}
			q01 = em.createNativeQuery("SELECT COUNT(codigo)as contador, SUM(oferta) as sumOferta, moneda FROM orden WHERE estado = '" + estado + "'");
			q02 = em.createNativeQuery("SELECT SUM(subcontrato.monto) as sumMonto FROM subcontrato INNER JOIN orden ON subcontrato.idorden  =  orden.idorden "
					+ "WHERE orden.estado = '" + estado + "'");
			
			Object[] obj = (Object[])q01.getSingleResult();			
			BigDecimal rsMonto = (BigDecimal)q02.getSingleResult();
			
			OrdenBean ordenBean = new OrdenBean();
			
			if(!obj[0].toString().equals("0")){
				ordenBean.setContador(obj[0].toString());
				ordenBean.setEstado(estado);				
				
				if(obj[2].toString().equals("dolar americano")){
					ordenBean.setSumOferta(NumberFormat.getCurrencyInstance(Locale.US).format(Formatos.StringToBigDecimal(obj[1].toString())));
					ordenBean.setSumMonto(NumberFormat.getCurrencyInstance(Locale.US).format(rsMonto));
					ordenBean.setUtilidad(NumberFormat.getCurrencyInstance(Locale.US).format(Formatos.StringToBigDecimal(obj[1].toString()).subtract(rsMonto)));
				}else{
					//La conversion de usd a pen es mas compleja cuando se combinan en un OT tipos de moneda
				}
			}else{
				ordenBean.setContador(obj[0].toString());
				ordenBean.setEstado(estado);
				
				ordenBean.setSumOferta("$0.00");
				ordenBean.setSumMonto("$0.00");
				ordenBean.setUtilidad("$0.00");
			}
			
			ordenBeans.add(ordenBean);
			
		}

		return ordenBeans;
	}
	
	public OrdenBean obtenerInformacionOrden(Integer idOrden, HttpServletRequest req){
		Orden orden = new Orden();

		Query q = em.createQuery("SELECT o FROM Orden o WHERE o.idOrden = :idOrden AND o.estado != 'disable' ");
		q.setParameter("idOrden", idOrden);
		
		orden = (Orden)q.getSingleResult();
		
		OrdenBean ordenB = new OrdenBean();		
		
		Cliente cli = orden.getOrdenCliente();
		ordenB.setIdCliente(cli.getIdCliente());
		ordenB.setNombreCliente(cli.getNombre());
		
		ordenB.setIdOrden(orden.getIdOrden());
		ordenB.setCodigo(orden.getCodigo());
		ordenB.setNombre(orden.getNombre());
		ordenB.setTipoOrden(orden.getTipoOrden());
		ordenB.setTipoTrabajo(orden.getTipoTrabajo());
		ordenB.setLat(""+orden.getLat());
		ordenB.setLon(""+orden.getLon());
		ordenB.setCiudad(orden.getCiudad());
		ordenB.setDepartamento(orden.getDepartamento());
		ordenB.setOferta(orden.getOferta());
		ordenB.setMoneda(orden.getMoneda());
		ordenB.setFechaEntrega(Dates.fechaEspaniol(orden.getFechaEntrega()));
		
		ordenB.setEficiencia(orden.getEficiencia());
		ordenB.setUtilidadBruta(orden.getUtilidadBruta());
		ordenB.setSubTotal(orden.getSubTotal());
		ordenB.setGastosGenerales(orden.getGastosGenerales());
		ordenB.setTotal(orden.getTotal());			
					
		ordenB.setCreadoPor(orden.getCreadoPor());
		
		ordenB.setFechaCreacion(Dates.fechaHoraEspaniol(orden.getFechaCreacion(), "l"));
		ordenB.setEstado(orden.getEstado());
		
		//Solo por ahora, cambiar a JOIN
		Query q01 = em.createNativeQuery("SELECT primernombre, apellidopaterno FROM perfil WHERE idusuario = '"+ orden.getCreadoPor() +"' AND estado != 'disable' ");
		
		Object[] perfil = (Object[])q01.getSingleResult();
		ordenB.setCreadoPorNombre(perfil[0].toString() + " " + perfil[1].toString());
		
		return ordenB;
	}
	
	
	
	
	
}