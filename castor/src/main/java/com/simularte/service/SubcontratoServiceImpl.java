package com.simularte.service;

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

@Service
public class SubcontratoServiceImpl implements SubcontratoService {

	@PersistenceContext 
	EntityManager em;
	

	@SuppressWarnings("unchecked")
	@Transactional
	public List<SubcontratoBean> listarSubcontratos(Integer idOrder, HttpServletRequest req) {
		List<Subcontrato> lc = new ArrayList<Subcontrato>();
		List<SubcontratoBean> lcb = new ArrayList<SubcontratoBean>();
		
		try{
			Query query = null;

			String Squery = "";
			Squery = "SELECT s FROM Subcontrato s WHERE s.ordenSubcontrato.idOrden =:idOrden AND s.estado='enabled' ";
			query = em.createQuery(Squery);
			query.setParameter("idOrden", idOrder);

			lc = query.getResultList();
			for(int i =0; i < lc.size(); i++){
				Subcontrato c = lc.get(i);
				SubcontratoBean cb = new SubcontratoBean();
				
				cb.setIdSubcontrato(c.getIdSubcontrato());
				cb.setIdOrden(c.getOrdenSubcontrato().getIdOrden());
				cb.setIdProveedor(c.getProveedorSubcontrato().getIdProveedor());
				cb.setNombreProveedor(c.getProveedorSubcontrato().getNombre());
				cb.setMoneda(c.getMoneda());
				cb.setMonto(c.getMonto());
				cb.setTipoTrabajo(c.getTipoTrabajo());
				cb.setFechaCreacion(c.getFechaCreacion());
				cb.setCreadoPor(c.getCreadoPor());
				cb.setEstado(c.getEstado());
				
				lcb.add(cb);
			}
			
		} catch(IllegalArgumentException e){
			lcb = null;
		}
		
		return lcb;
	}

}
