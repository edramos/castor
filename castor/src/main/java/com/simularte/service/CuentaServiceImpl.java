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
import com.simularte.model.Proveedor;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;
import com.simularte.util.Valores;

@Service
public class CuentaServiceImpl implements CuentaService {

	@PersistenceContext 
	EntityManager em;	

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
