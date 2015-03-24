package com.simularte.service;

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

@Service
public class CuentaServiceImpl implements CuentaService {

	@PersistenceContext 
	EntityManager em;
	

	@SuppressWarnings("unchecked")
	@Transactional
	public List<CuentaBean> listarCuentas(String tipo, Integer idOrder, HttpServletRequest req) {
		List<CuentaBean> lcueBean = new ArrayList<CuentaBean>();
		
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
				CuentaBean cuebean = new CuentaBean();
				
				cuebean.setIdCuenta(c.getIdCuenta());
				if(c.getCuentaOrden()!=null){
					cuebean.setIdOrden(c.getCuentaOrden().getIdOrden());
					cuebean.setIdCliente(c.getCuentaOrden().getOrdenCliente().getIdCliente());
				}
				if(c.getCuentaSubcontrato()!=null){
					cuebean.setIdSubcontrato(c.getCuentaSubcontrato().getIdSubcontrato());
					cuebean.setIdProveedor(c.getCuentaSubcontrato().getProveedorSubcontrato().getIdProveedor());
				}				
				cuebean.setTipo(c.getTipo());
				cuebean.setFechaVencimiento(c.getFechaVencimiento());
				cuebean.setFechaPagoProgramada(c.getFechaPagoProgramada());
				cuebean.setFechaPagoReal(c.getFechaPagoReal());
				cuebean.setTipoPago(c.getTipoPago());
				cuebean.setMonto(c.getMonto());
				cuebean.setPagador(c.getPagador());
				
				cuebean.setCreadoPor(c.getCreadoPor());
				cuebean.setFechaCreacion(c.getFechaCreacion());
				cuebean.setEstado(c.getEstado());
				
				lcueBean.add(cuebean);
			}
			
		} catch(IllegalArgumentException e){
			lcueBean = null;
		}
		
		return lcueBean;
	}

}
