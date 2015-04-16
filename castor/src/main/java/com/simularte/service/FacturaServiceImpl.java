package com.simularte.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
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

@Service
public class FacturaServiceImpl implements FacturaService{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public List<FacturaBean> grabarFactura(int idCuenta, String tipo, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		
		double igv = 0.18;
		Cuenta cuenta = em.find(Cuenta.class, idCuenta);
		Factura factura = new Factura();
		
		if(tipo.equals("cobro")){
			factura.setTipo("Emitida");
		}else{
			factura.setTipo("Recibida");
		}
		factura.setFechaCancelacion(Dates.dateCreacion());			
		factura.setFechaEmision(Dates.dateCreacion());
		
		factura.setSubTotal(cuenta.getMonto());
		factura.setConIgv(cuenta.getMonto().multiply(BigDecimal.valueOf(igv)));
		factura.setTotal(cuenta.getMonto().multiply(BigDecimal.valueOf(igv)));
		
		factura.setCreadoPor((Integer)req.getSession().getAttribute("idUser"));
		factura.setFechaCreacion(Dates.fechaCreacion());
		factura.setEstado("Emitido");
		
		em.persist(factura);
		
		return facturas;
	}
	
	@SuppressWarnings("unchecked")
	public List<FacturaBean> cargarFactura(int idOrden, HttpServletRequest req){
		List<FacturaBean> facturas = new ArrayList<FacturaBean>();
		double totalMonto = 0;
		double totalIgv = 0;
		double totalConIgv = 0;
		double totalDetraccion = 0;
		double totalCobrar = 0;
		
		Query q1 = em.createNativeQuery("SELECT f.idfactura, f.cobrarfactura, f.codigo, f.conigv, f.detraccion, f.estado, f.fechacreacion, f.montodetraccion, f.subtotal, f.tipo, f.total, f.idcuenta, f.estadodetraccion "
				+ "FROM factura f INNER JOIN cuenta c ON f.idcuenta = c. idcuenta WHERE c.idorden = '" + idOrden + "'");
		
		try{
			List<Object[]> rows = q1.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] obj = rows.get(x);
				
				FacturaBean fb = new FacturaBean();
				fb.setIdFactura((Integer)obj[0]);
				fb.setCobrarFactura(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[1].toString()))));
				fb.setCodigo(obj[2].toString());
				fb.setConIgv(Formatos.BigBecimalToString(Formatos.StringToBigDecimal((obj[3].toString()))));
				fb.setDetraccion(obj[4].toString());
				fb.setEstado(obj[5].toString());
				fb.setFechaCreacion(obj[6].toString());
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
				
				facturas.add(fb);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return facturas;
	}
}
