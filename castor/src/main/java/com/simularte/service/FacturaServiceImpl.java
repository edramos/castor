package com.simularte.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.FacturaBean;
import com.simularte.model.Cuenta;
import com.simularte.model.Factura;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;
import com.simularte.util.Valores;

@Service
public class FacturaServiceImpl implements FacturaService{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearFactura(int idCuenta, String tipo, double detraccion, String codigo, HttpServletRequest req){
		boolean result = false;
		
		Cuenta cuenta = em.find(Cuenta.class, idCuenta);
		Factura factura = new Factura();
		
		if(tipo.equals("cobrar")){
			factura.setTipo("Emitida");		//Emitida o por Cobrar?
			factura.setEstado("Emitido");
		}else{
			factura.setCodigo(codigo);
			factura.setTipo("Recibida");	//Recibida o por Pagar?
			factura.setEstado("Recibido");
		}
		factura.setFacturaCuenta(cuenta);			
		factura.setFechaEmision(Dates.dateCreacion());
		
		
		factura.setSubTotal(cuenta.getMonto().subtract(cuenta.getMonto().multiply(Valores.IGV)));
		factura.setConIgv(cuenta.getMonto());
		factura.setTotal(factura.getConIgv());		//Por ahora porque son facturas emitidas por 1 solo concepto, cuando sean grupales se creara DetalleFactura
		
		factura.setDetraccion(detraccion);
		factura.setMontoDetraccion(factura.getConIgv().multiply(BigDecimal.valueOf(factura.getDetraccion() * 0.01)));
		
		factura.setCobrarFactura(factura.getConIgv().subtract(factura.getMontoDetraccion()));
		factura.setEstadoDetraccion("Pendiente");
		
		factura.setCreadoPor((Integer)req.getSession().getAttribute("idUser"));
		factura.setFechaCreacion(Dates.fechaCreacion());
		
		int idFactura = 0;
		if(tipo.equals("cobrar")){
			//Factura facturaY = em.merge(factura);
			//facturaY.setCodigo(String.format("%05d", factura.getIdFactura()));
			Query q01 = em.createNativeQuery("SELECT f.idfactura FROM factura f WHERE f.tipo = 'Emitida' ORDER BY f.idfactura DESC LIMIT 1");
			try{
				idFactura = (Integer)q01.getSingleResult();
				idFactura++;
			}catch(NoResultException e){
				idFactura++;	//Solo se ejectutara para la primera factura
			}
		}
				
		em.persist(factura);
		
		if(tipo.equals("cobrar")){
			Factura facturaY = em.merge(factura);
			facturaY.setCodigo(String.format("%05d", idFactura));
		}
		
		Cuenta cuentaX = em.find(Cuenta.class, idCuenta);
		Cuenta cuentaY = em.merge(cuentaX);
		
		cuentaY.setEstado("Facturado");
		
		result = true;
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<FacturaBean> cargarFacturas(HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		//Hacer que el orden de los f sea igual que el de cargarFacturaOrden
		Query q1 = em.createNativeQuery("SELECT f.idfactura, f.codigo, f.subtotal, f.conigv, f.total, f.montodetraccion, f.cobrarfactura, f.estadodetraccion, f.estado, f.fechaemision, "
				+ "f.detraccion, f.fechacancelacion, f.fechacancelaciondetraccion "
				+ "FROM factura f "
				+ "INNER JOIN cuenta c ON c.idcuenta = f.idcuenta "
				+ "INNER JOIN orden o ON o.idorden = c.idorden "
				+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "'");
		
		List<Object[]> rows = q1.getResultList();
		
		for(int x = 0; x < rows.size(); x++){
			Object[] obj = rows.get(x);
			FacturaBean fb = new FacturaBean();
			
			fb.setIdFactura((Integer)obj[0]);
			fb.setCodigo(obj[1].toString());
			fb.setSubTotal(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[2].toString())));
			fb.setIgv(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[3].toString()).subtract(Formatos.StringToBigDecimal(obj[2].toString()))));
			fb.setConIgv(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[3].toString()))));
			fb.setDetraccion(obj[10].toString());
			fb.setMontoDetraccion(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[5].toString()))));
			fb.setEstadoDetraccion(obj[7].toString());
			fb.setCobrarFactura(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[6].toString()))));
			fb.setEstado(obj[8].toString());
			fb.setFechaEmision(Dates.stringToStringFechaCorta(obj[9].toString()));
			
			facturas.add(fb);
		}
		
		return facturas;
	}
	
	@SuppressWarnings("unchecked")
	public List<FacturaBean> cargarFacturaOrden(int idOrden, String tipo, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		double totalMonto = 0;
		double totalIgv = 0;
		double totalConIgv = 0;
		double totalDetraccion = 0;
		double totalCobrar = 0;
		System.out.println("TIPO FACTURA: " + tipo);
		Query q1 = em.createNativeQuery("SELECT f.idfactura, f.cobrarfactura, f.codigo, f.conigv, f.detraccion, f.estado, f.fechacreacion, f.montodetraccion, f.subtotal, f.tipo, "
				+ "f.total, f.idcuenta, f.estadodetraccion, f.fechaemision, f.fechacancelacion, f.fechacancelaciondetraccion "
				+ "FROM factura f "
				+ "INNER JOIN cuenta c ON f.idcuenta = c. idcuenta "
				+ "WHERE c.idorden = '" + idOrden + "' AND f.tipo = '" + tipo + "'");
		
		try{
			List<Object[]> rows = q1.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] obj = rows.get(x);
				
				FacturaBean fb = new FacturaBean();
				fb.setIdFactura((Integer)obj[0]);
				fb.setCobrarFactura(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[1].toString()))));
				fb.setCodigo(obj[2].toString());
				fb.setConIgv(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[3].toString()))));
				fb.setDetraccion(Integer.toString(Double.valueOf(obj[4].toString()).intValue()));
				fb.setEstado(obj[5].toString());
				fb.setMontoDetraccion(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[7].toString()))));
				fb.setSubTotal(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[8].toString()))));
				fb.setTipo(obj[9].toString());
				fb.setTotal(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[10].toString()))));
				fb.setIdCuenta((Integer)obj[11]);
				fb.setEstadoDetraccion(obj[12].toString());
				fb.setIgv(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[3].toString()).subtract(Formatos.StringToBigDecimal(obj[8].toString()))));
				
				totalMonto += Formatos.StringToBigDecimal(obj[8].toString()).doubleValue();
				fb.setTotalMonto(Formatos.BigBecimalToString(BigDecimal.valueOf(totalMonto)));
				totalIgv += Formatos.StringToBigDecimal(obj[3].toString()).subtract(Formatos.StringToBigDecimal(obj[8].toString())).doubleValue();
				fb.setTotalIgv(Formatos.BigBecimalToString(BigDecimal.valueOf(totalIgv)));
				totalConIgv += Formatos.StringToBigDecimal(obj[3].toString()).doubleValue();
				fb.setTotalConIgv(Formatos.BigBecimalToString(BigDecimal.valueOf(totalConIgv)));
				
				totalDetraccion += Formatos.StringToBigDecimal(obj[7].toString()).doubleValue();
				fb.setTotalDetraccion(Formatos.BigBecimalToString(BigDecimal.valueOf(totalDetraccion)));
				
				totalCobrar += Formatos.StringToBigDecimal(obj[1].toString()).doubleValue();
				fb.setTotalCobrar(Formatos.BigBecimalToString(BigDecimal.valueOf(totalCobrar)));
				
				fb.setFechaCreacion(obj[6].toString());
				fb.setFechaEmision(Dates.stringToStringFechaCorta(obj[13].toString()));
				//Se podria mejorar esto desde el model con ColumnDefinition para que en vez de null por defecto sea string vacio ""
				if(obj[14] != null)fb.setFechaCancelacion(Dates.stringToStringFechaCorta(obj[14].toString())); else fb.setFechaCancelacion("---");
				if(obj[15] != null)fb.setFechaCancelacionDetraccion(Dates.stringToStringFechaCorta(obj[15].toString())); else fb.setFechaCancelacionDetraccion("---");
				
				facturas.add(fb);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return facturas;
	}
	
	@SuppressWarnings("unchecked")
	public List<FacturaBean> getFacturasSuggested(String codigoFactura, String tipo, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		Query q01 = null;
		System.out.println("tipo: " + tipo);
		if(tipo.equals("cobrar")){
		q01 = em.createNativeQuery("SELECT f.idfactura, f.codigo, f.estado, f.conigv, f.cobrarfactura, f.montodetraccion FROM factura f "
				+ "INNER JOIN cuenta c ON c.idcuenta = f.idcuenta "
				+ "INNER JOIN orden o ON o.idorden = c.idorden "
				+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' AND f.codigo LIKE '%" + codigoFactura + "%' AND f.estado = 'Emitido'");
		}else{
			q01 = em.createNativeQuery("SELECT f.idfactura, f.codigo, f.estado, f.conigv, f.cobrarfactura, f.montodetraccion FROM factura f "
					+ "INNER JOIN cuenta c ON c.idcuenta = f.idcuenta "
					+ "INNER JOIN orden o ON o.idorden = c.idorden "
					+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' AND f.codigo LIKE '%" + codigoFactura + "%' AND f.estado = 'Recibido'");
		}
		List<Object[]> rows = q01.getResultList();
		
		for(int x = 0; x < rows.size(); x++){
			Object[] obj = rows.get(x);
			FacturaBean fb = new FacturaBean();
			
			fb.setIdFactura((Integer)obj[0]);
			fb.setCodigo(obj[1].toString());
			fb.setConIgv(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[3].toString())));
			fb.setCobrarFactura(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[4].toString())));
			fb.setMontoDetraccion(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[5].toString())));
			
			facturas.add(fb);
		}
		
		return facturas;
	}
	
	@SuppressWarnings("unchecked")
	public List<FacturaBean> getFacturasDetraccionSuggested(String codigoFactura, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		
		Query q01 = em.createNativeQuery("SELECT f.idfactura, f.codigo, f.montodetraccion FROM factura f "
				+ "INNER JOIN cuenta c ON c.idcuenta = f.idcuenta "
				+ "INNER JOIN orden o ON o.idorden = c.idorden "
				+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' AND f.codigo LIKE '%" + codigoFactura + "%' AND f.estadodetraccion = 'Pendiente'");
		
		List<Object[]> rows = q01.getResultList();
		
		for(int x = 0; x < rows.size(); x++){
			Object[] obj = rows.get(x);
			FacturaBean fb = new FacturaBean();
			
			fb.setIdFactura((Integer)obj[0]);
			fb.setCodigo(obj[1].toString());
			fb.setMontoDetraccion(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[2].toString())));
			
			facturas.add(fb);
		}
		
		return facturas;
	}
}
