package com.simularte.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.OrdenBean;
import com.simularte.model.Cliente;
import com.simularte.model.Empresa;
import com.simularte.model.Orden;
import com.simularte.model.Proveedor;
import com.simularte.model.Subcontrato;
import com.simularte.util.Dates;

@Service
public class OrdenServiceImpl implements OrdenService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearOrden(OrdenBean ordenBean, int idCliente, String[] subCont, HttpServletRequest req) {
		boolean result = false;
		
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
			orden.setLat(ordenBean.getLat());
			orden.setLon(ordenBean.getLon());
			orden.setCiudad(ordenBean.getCiudad());
			orden.setDepartamento(ordenBean.getDepartamento());
			orden.setOferta(ordenBean.getOferta());
			orden.setMoneda(ordenBean.getMoneda());
			
			orden.setEficiencia(ordenBean.getEficiencia());
			orden.setUtilidadBruta(ordenBean.getUtilidadBruta());
			orden.setSubTotal(ordenBean.getSubTotal());
			orden.setGastosGenerales(ordenBean.getGastosGenerales());
			orden.setTotal(ordenBean.getTotal());			
						
			orden.setCreadoPor((Integer)session.getAttribute("idUser"));
			orden.setFechaCreacion(Dates.fechaCreacion());
			orden.setEstado("enabled");
			
			em.persist(orden);
			
			Orden ordenY = em.merge(orden);
			ordenY.setCodigo("ORD-" + orden.getTipoOrden() + "-" + String.format("%05d", orden.getIdOrden()));
			
			//Convierte el array de String a un array de Subcontratos, con JSON esta parte ya seria automatica
			ArrayList<Subcontrato> subContratos = new ArrayList<Subcontrato>();
			int resto;		
			
			for(int x = 0; x < subCont.length; x++){
				resto = x%4;
				if(resto == 0){
					System.out.println("resto: " + resto);
					Subcontrato subc = new Subcontrato();
					
					Proveedor proveedor = em.find(Proveedor.class, Integer.parseInt(subCont[x]));
					
					subc.setProveedorSubcontrato(proveedor);
					subc.setOrdenSubcontrato(orden);
					
					subContratos.add(subc);
				}else{
					System.out.println("resto: " + resto + "size: " + subContratos.size());
					int index = subContratos.size()-1;
					System.out.println("index: " + index);
					switch(resto){
					case 1:
						subContratos.get(index).setTipoTrabajo(subCont[x]);
						break;
					case 2:
						subContratos.get(index).setMoneda(subCont[x]);
						break;
					case 3:
						DecimalFormatSymbols symbols = new DecimalFormatSymbols();
						symbols.setGroupingSeparator(',');
						symbols.setDecimalSeparator('.');
						String pattern = "#,##0.0#";
						DecimalFormat decimalFormat = new DecimalFormat(pattern, symbols);
						decimalFormat.setParseBigDecimal(true);

						BigDecimal bigDecimal;
						try {
							bigDecimal = (BigDecimal) decimalFormat.parse(subCont[x]);
							subContratos.get(index).setMonto(bigDecimal);
						} catch (ParseException e) {
							e.printStackTrace();
						}
						System.out.println("Moneda: " + subContratos.get(index).getMonto());
						break;
					}
				}
			}
						
			//El Array de Subcontratos se graba, con JSON esto ya seria directo aqui
			for(int x = 0; x < subContratos.size(); x++){			
				subContratos.get(x).setCreadoPor((Integer)session.getAttribute("idUser"));
				subContratos.get(x).setFechaCreacion(Dates.fechaCreacion());
				subContratos.get(x).setEstado("enabled");
				System.out.println("Grabar Subcontrato: " + subContratos.get(x).getMonto());
				em.persist(subContratos.get(x));
			}
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
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
			condiciones += "AND o.codigo LIKE :codigo AND o.estado = 'enabled' ";
		}
		if(!ordenBean.getNombreCliente().equals("")){
			condiciones += "AND cli.nombre LIKE :nombreCliente AND cli.estado = 'enabled' ";
		}
		if(ordenBean.getOferta()!=null){
			condiciones += "AND o.oferta = :oferta ";
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
		if(ordenBean.getOferta()!=null){
			q.setParameter("oferta", ordenBean.getOferta());
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
	
	
	@SuppressWarnings("unchecked")
	public OrdenBean obtenerInformacionOrden(Integer idOrden, HttpServletRequest req){
		Orden orden = new Orden();

		HttpSession session = req.getSession();

		Query q = em.createQuery("SELECT o FROM Orden o WHERE o.idOrden = :idOrden AND o.estado = 'enabled' ");

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
		ordenB.setLat(orden.getLat());
		ordenB.setLon(orden.getLon());
		ordenB.setCiudad(orden.getCiudad());
		ordenB.setDepartamento(orden.getDepartamento());
		ordenB.setOferta(orden.getOferta());
		ordenB.setMoneda(orden.getMoneda());
		
		ordenB.setEficiencia(orden.getEficiencia());
		ordenB.setUtilidadBruta(orden.getUtilidadBruta());
		ordenB.setSubTotal(orden.getSubTotal());
		ordenB.setGastosGenerales(orden.getGastosGenerales());
		ordenB.setTotal(orden.getTotal());			
					
		ordenB.setCreadoPor(orden.getCreadoPor());
		ordenB.setFechaCreacion(orden.getFechaCreacion());
		ordenB.setEstado(orden.getEstado());
		
		
		return ordenB;
	}
	
	
	
	
	
}