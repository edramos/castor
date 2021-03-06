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

import com.simularte.bean.SubcontratoBean;
import com.simularte.model.Subcontrato;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;

@Service
public class SubcontratoServiceImpl implements SubcontratoService {

	@PersistenceContext 
	EntityManager em;
	

	@SuppressWarnings("unchecked")
	@Transactional
	public List<SubcontratoBean> listarSubcontratos(Integer idOrder, HttpServletRequest req) {
		List<SubcontratoBean> subcontratosBean = new ArrayList<SubcontratoBean>();
		double totalMonto = 0;
		
		try{
			Query query;

			query = em.createQuery("SELECT s FROM Subcontrato s WHERE s.ordenSubcontrato.idOrden =:idOrden AND s.estado != 'disable'");
			query.setParameter("idOrden", idOrder);

			List<Subcontrato> subcontratos = query.getResultList();
			for(int i = 0; i < subcontratos.size(); i++){
				Subcontrato c = subcontratos.get(i);
				SubcontratoBean subConB = new SubcontratoBean();
				
				subConB.setIdSubcontrato(c.getIdSubcontrato());
				subConB.setIdOrden(c.getOrdenSubcontrato().getIdOrden());
				subConB.setIdProveedor(c.getProveedorSubcontrato().getIdProveedor());
				subConB.setNombreProveedor(c.getProveedorSubcontrato().getNombre());
				subConB.setMoneda(c.getMoneda());
				
				subConB.setMonto(Formatos.BigBecimalToString(c.getMonto()));
				totalMonto += c.getMonto().doubleValue();
				subConB.setTotalMonto(Formatos.BigBecimalToString(BigDecimal.valueOf(totalMonto)));
				
				subConB.setTipoTrabajo(c.getTipoTrabajo());
				subConB.setFechaTerminoObra(Dates.fechaCorta(c.getFechaTerminoObra()));
				subConB.setFechaCreacion(Dates.fechaHoraEspaniol(c.getFechaCreacion(), ""));
				subConB.setCreadoPor(c.getCreadoPor());
				subConB.setEstado(c.getEstado());
				
				subcontratosBean.add(subConB);
			}
			
		} catch(IllegalArgumentException e){
			subcontratosBean = null;
		}
		
		return subcontratosBean;
	}

}
