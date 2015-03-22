package com.simularte.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.EmpresaBean;
import com.simularte.model.Empresa;

@Service
public class EmpresaServiceImpl implements EmpresaService {

	@PersistenceContext 
	EntityManager em;
	

	@Transactional
	public boolean modificarEmpresa(EmpresaBean empresa, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Empresa empresaX = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			Empresa empresaY = em.merge(empresaX);
			//
			empresaY.setNombre(empresa.getNombre());
			empresaY.setRuc(empresa.getRuc());
			empresaY.setFacebook(empresa.getFacebook());
			empresaY.setWebsite(empresa.getWebsite());
			
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	@Transactional
	public EmpresaBean extraerInformacionEmpresa(HttpServletRequest req) {
		Empresa lc = new Empresa();
		EmpresaBean lcb = new EmpresaBean();
		try{
			HttpSession session = req.getSession();
			Query query = null;

			String Squery = "";
			Squery = "SELECT c FROM Empresa c WHERE c.idEmpresa =:idEmpresa AND c.estado='enabled' ";
			query = em.createQuery(Squery);
			query.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));

			lc = (Empresa) query.getSingleResult();
			
			lcb.setIdEmpresa(lc.getIdEmpresa());
			lcb.setNombre(lc.getNombre());
			lcb.setRuc(lc.getRuc());
			lcb.setWebsite(lc.getWebsite());
			lcb.setFacebook(lc.getFacebook());
			lcb.setFechaCreacion(lc.getFechaCreacion());
			lcb.setEstado(lc.getEstado());
			
			
		} catch(IllegalArgumentException e){
			lcb = null;
		}
		
		return lcb;
	}

}
