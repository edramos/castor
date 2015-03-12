package com.simularte.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.OficinaBean;
import com.simularte.model.Empresa;
import com.simularte.model.Oficina;
import com.simularte.util.Dates;

@Service
public class OficinaServiceImpl implements OficinaService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearOficina(OficinaBean oficinab, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			//empresa.setIdEmpresa((Integer)session.getAttribute("idEmpresa"));
			//Oficina
			Oficina oficina = new Oficina();
			oficina.setNombre(oficinab.getNombre());
			oficina.setTelefonoOficina(oficinab.getTelefonoOficina());
			oficina.setOficinaEmpresa(empresa);
			//
			String[] direccionCompleta = oficinab.getDireccionCompleta().split(",");
			oficina.setDireccion(direccionCompleta[0]);
			oficina.setDistrito(direccionCompleta[1]);
			oficina.setCiudad(direccionCompleta[2]);
			oficina.setDepartamento(direccionCompleta[3]);
			//
			oficina.setLatitud(oficinab.getLatitud());
			oficina.setLongitud(oficinab.getLongitud());
			//
			oficina.setFechaCreacion(Dates.fechaCreacion());
			oficina.setEstado("enabled");
			oficina.setCreadoPor((Integer)session.getAttribute("idUser"));
			em.persist(oficina);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Transactional
	public boolean modificarOficina(OficinaBean oficinab, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Oficina OficinaX = em.find(Oficina.class, oficinab.getIdOficina());
			Oficina OficinaY = em.merge(OficinaX);
			//Oficina
			OficinaY.setNombre(oficinab.getNombre());
			OficinaY.setTelefonoOficina(oficinab.getTelefonoOficina());
			//
			String[] direccionCompleta = oficinab.getDireccionCompleta().split(",");
			OficinaY.setDireccion(direccionCompleta[0]);
			OficinaY.setDistrito(direccionCompleta[1]);
			OficinaY.setCiudad(direccionCompleta[2]);
			OficinaY.setDepartamento(direccionCompleta[3]);
			//
			OficinaY.setLatitud(oficinab.getLatitud());
			OficinaY.setLongitud(oficinab.getLongitud());
			//
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Transactional
	public boolean eliminarOficina(Integer idOficina, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Oficina OficinaX = em.find(Oficina.class, idOficina);
			Oficina OficinaY = em.merge(OficinaX);
			//Oficina
			OficinaY.setEstado("disabled");
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<OficinaBean> listarOficinas(HttpServletRequest req) {
		List<Oficina> lc = new ArrayList<Oficina>();
		List<OficinaBean> lcb = new ArrayList<OficinaBean>();
		try{
			HttpSession session = req.getSession();
			Query query = null;

			String Squery = "";
			Squery = "SELECT c FROM Oficina c WHERE c.oficinaEmpresa.idEmpresa =:idEmpresa AND c.estado='enabled' ";
			query = em.createQuery(Squery);
			query.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));

			lc = query.getResultList();
			for(int i =0; i < lc.size(); i++){
				Oficina c = lc.get(i);
				OficinaBean cb = new OficinaBean();
				
				cb.setIdOficina(c.getIdOficina());
				cb.setIdEmpresa(c.getOficinaEmpresa().getIdEmpresa());
				cb.setNombre(c.getNombre());
				cb.setTelefonoOficina(c.getTelefonoOficina());
				cb.setDireccionCompleta(c.getDireccion()+","+c.getDistrito()+","+c.getCiudad()+","+c.getDepartamento() );
				cb.setLatitud(c.getLatitud());
				cb.setLongitud(c.getLongitud());
				cb.setLatLng(c.getLatitud()+", "+c.getLongitud());
				cb.setFechaCreacion(c.getFechaCreacion());
				cb.setEstado(c.getEstado());
				cb.setCreadoPor(c.getCreadoPor());
				
				lcb.add(cb);
			}
			
		} catch(IllegalArgumentException e){
			lcb = null;
		}
		
		return lcb;
	}

}
