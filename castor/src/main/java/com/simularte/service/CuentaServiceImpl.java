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

import com.simularte.bean.CuentaBean;
import com.simularte.model.Cuenta;
import com.simularte.model.Orden;
import com.simularte.model.Proveedor;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;
import com.simularte.util.Valores;

@Service
public class CuentaServiceImpl implements CuentaService {

	@PersistenceContext 
	EntityManager em;	

	
	public CuentaBean listarDetalleCuenta(String tipo, int idCuenta, HttpServletRequest req){
		CuentaBean  cb = new CuentaBean();
		
		Query q01 = em.createQuery("SELECT c FROM Cuenta c WHERE c.idCuenta = :idCuenta AND c.estado != 'disable'");
		q01.setParameter("idCuenta", idCuenta);
		
		Cuenta cuenta = (Cuenta)q01.getSingleResult();
		
		cb.setMonto(Formatos.BigBecimalToString(cuenta.getMonto().subtract(cuenta.getMonto().multiply(Valores.IGV))));
		cb.setIgv(Formatos.BigBecimalToString(cuenta.getMonto().multiply(Valores.IGV)));
		cb.setConIgv(Formatos.BigBecimalToString(cuenta.getMonto()));
		
		if(tipo.equals("pagar")){
			cb.setIdSubcontrato(cuenta.getCuentaSubcontrato().getIdSubcontrato());
			
			Query q03 = em.createNativeQuery("SELECT sc.idsubcontrato, sc.tipotrabajo, p.nombre FROM subcontrato sc "
					+ "INNER JOIN proveedor p "
					+ " ON sc.idproveedor = p.idproveedor WHERE sc.idsubcontrato = '" + cuenta.getCuentaSubcontrato().getIdSubcontrato() + "'");
			
			Object obj[] = (Object[])q03.getSingleResult();
			
			cb.setScTipoTrabajo(obj[1].toString());
			cb.setNombreProveedor(obj[2].toString());
		}
		
		Orden orden = em.find(Orden.class, cuenta.getCuentaOrden().getIdOrden());
		
		Query q02 = em.createNativeQuery("SELECT p.primernombre, p.apellidopaterno FROM perfil p "
				+ "INNER JOIN usuario u ON p.idusuario = u.idusuario WHERE u.idusuario = '" + cuenta.getCreadoPor() + "'");
		
		Object[] us = (Object[])q02.getSingleResult();
		cb.setNombreCreador(us[0].toString() + " " + us[1].toString());
		
		if(tipo.equals("cobrar")){
			if(orden.getTipoTrabajo().equals("Estudio")){
				cb.setMontoDetraccion(Formatos.BigBecimalToString(cuenta.getMonto().multiply(BigDecimal.valueOf(0.1))) + "  (10%)");
				cb.setCobrar(Formatos.BigBecimalToString(cuenta.getMonto().subtract(cuenta.getMonto().multiply(BigDecimal.valueOf(0.1)))));
			}else{
				cb.setMontoDetraccion(Formatos.BigBecimalToString(cuenta.getMonto().multiply(BigDecimal.valueOf(0.04))) + "  (4%)");
				cb.setCobrar(Formatos.BigBecimalToString(cuenta.getMonto().subtract(cuenta.getMonto().multiply(BigDecimal.valueOf(0.04)))));
			}
		}else{
			if(cb.getScTipoTrabajo().equals("Estudio")){
				cb.setMontoDetraccion(Formatos.BigBecimalToString(cuenta.getMonto().multiply(BigDecimal.valueOf(0.1))) + "  (10%)");
				cb.setCobrar(Formatos.BigBecimalToString(cuenta.getMonto().subtract(cuenta.getMonto().multiply(BigDecimal.valueOf(0.1)))));
			}else{
				cb.setMontoDetraccion(Formatos.BigBecimalToString(cuenta.getMonto().multiply(BigDecimal.valueOf(0.04))) + "  (4%)");
				cb.setCobrar(Formatos.BigBecimalToString(cuenta.getMonto().subtract(cuenta.getMonto().multiply(BigDecimal.valueOf(0.04)))));
			}
		}
		cb.setFechaVencimiento(Dates.fechaCorta(cuenta.getFechaVencimiento()));
		cb.setFechaCreacion(Dates.fechaHoraEspaniol(cuenta.getFechaCreacion(), ""));
		
		return cb;
	}
	
	@SuppressWarnings("unchecked")
	public List<CuentaBean> listarCuentasFactura(int idOrden, String tipo, HttpServletRequest req) {
		List<CuentaBean> lcb = new ArrayList<CuentaBean>();
		System.out.println("Listar Cuentas: " + idOrden + ", tipo: " + tipo);
		Query q01 = em.createQuery("SELECT c FROM Cuenta c WHERE idOrden = :idOrden AND tipo = :tipo AND estado != 'Facturado'", Cuenta.class);
		q01.setParameter("idOrden", idOrden);		
		q01.setParameter("tipo", tipo);
		
		List<Cuenta> cuentas = q01.getResultList();
		
		for(int i = 0; i < cuentas.size(); i++){
			Cuenta c = cuentas.get(i);
			CuentaBean cb = new CuentaBean();
			
			cb.setIdCuenta(c.getIdCuenta());
			cb.setMonto(Formatos.BigBecimalToString(c.getMonto()));
			cb.setFechaVencimiento(Dates.fechaCorta(c.getFechaVencimiento()));
			System.out.println(cb.getFechaVencimiento());
			lcb.add(cb);
		}
		
		return lcb;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<CuentaBean> listarCuentas(String tipo, Integer idOrder, HttpServletRequest req) {
		List<CuentaBean> lcueBean = new ArrayList<CuentaBean>();
		double totalConIgv = 0;
		double totalMonto = 0;
		double totalIgv = 0;
		
		try{
			Query query;

			String Squery = "SELECT c FROM Cuenta c WHERE c.estado != 'disable' ";
			
			if(tipo.equals("pago")){// Tipo: Pagos Proveedores
				Squery += "AND c.cuentaSubcontrato.ordenSubcontrato.idOrden =:idOrden AND c.tipo =:tipo ";
			}else{//Tipo: Cobro Cliente
				Squery += "AND c.cuentaOrden.idOrden =:idOrden AND c.tipo =:tipo ";
			}
			
			query = em.createQuery(Squery);
			query.setParameter("idOrden", idOrder);
			query.setParameter("tipo", tipo);

			List<Cuenta> Cuentas = query.getResultList();
			
			for(int i = 0; i < Cuentas.size(); i++){
				Cuenta c = Cuentas.get(i);
				CuentaBean cb = new CuentaBean();
				
				cb.setIdCuenta(c.getIdCuenta());
				if(c.getCuentaOrden() != null){
					cb.setIdOrden(c.getCuentaOrden().getIdOrden());
					cb.setIdCliente(c.getCuentaOrden().getOrdenCliente().getIdCliente());
				}
				if(c.getCuentaSubcontrato() != null){
					cb.setIdSubcontrato(c.getCuentaSubcontrato().getIdSubcontrato());
					Proveedor prov = c.getCuentaSubcontrato().getProveedorSubcontrato();
					cb.setIdProveedor(prov.getIdProveedor());
					cb.setNombreProveedor(prov.getNombre());
				}				
				cb.setTipo(c.getTipo());
				cb.setTipoPago(c.getTipoPago());
				
				cb.setFechaVencimiento(Dates.fechaCorta(c.getFechaVencimiento()));
				cb.setFechaPagoProgramada(Dates.fechaCorta(c.getFechaPagoProgramada()));
				cb.setFechaPagoReal(Dates.fechaCorta(c.getFechaPagoReal()));
				
				cb.setMonto(Formatos.BigBecimalToString(c.getMonto().subtract(c.getMonto().multiply(Valores.IGV))));
				cb.setIgv(Formatos.BigBecimalToString(c.getMonto().multiply(Valores.IGV)));
				cb.setConIgv(Formatos.BigBecimalToString(c.getMonto()));
				
				totalMonto += c.getMonto().subtract(c.getMonto().multiply(Valores.IGV)).doubleValue();
				cb.setTotalMonto(Formatos.BigBecimalToString(BigDecimal.valueOf(totalMonto)));
				
				totalIgv += c.getMonto().multiply(Valores.IGV).doubleValue();
				cb.setTotalIgv(Formatos.BigBecimalToString(BigDecimal.valueOf(totalIgv)));
				
				totalConIgv += c.getMonto().doubleValue();
				cb.setTotalConIgv((Formatos.BigBecimalToString(BigDecimal.valueOf(totalConIgv))));
				
				cb.setPagador(c.getPagador());
				cb.setEstadoTrabajo(c.getEstadoTrabajo());
				if(c.getEstadoTrabajo() != null){
					if(c.getEstadoTrabajo().equals("Proceso")){
						cb.setAvance("(" + Double.toString(c.getAvance()) + "%)");
					}else{
						cb.setAvance("");
					}
				}
				cb.setCreadoPor(c.getCreadoPor());
				cb.setFechaCreacion(Dates.fechaHoraEspaniol(c.getFechaCreacion(), ""));
				cb.setEstado(c.getEstado());
				
				lcueBean.add(cb);
			}
			
		} catch(IllegalArgumentException e){
			lcueBean = null;
		}
		
		return lcueBean;
	}

}
