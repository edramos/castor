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

import com.simularte.bean.ProveedorBean;
import com.simularte.model.Empresa;
import com.simularte.model.Proveedor;
import com.simularte.util.Dates;

@Service
public class ProveedorServiceImpl implements ProveedorService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearProveedor(Proveedor cliente, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			//empresa.setIdEmpresa((Integer)session.getAttribute("idEmpresa"));
			//Proveedor
			cliente.setProveedorEmpresa(empresa);
			cliente.setFechaCreacion(Dates.fechaCreacion());
			cliente.setEstado("enabled");
			cliente.setCreadoPor((Integer)session.getAttribute("idUser"));
			em.persist(cliente);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Transactional
	public boolean modificarProveedor(Proveedor proveedor, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Proveedor proveedorX = em.find(Proveedor.class, proveedor.getIdProveedor());
			Proveedor proveedorY = em.merge(proveedorX);
			//Proveedor
			proveedorY.setNombre(proveedor.getNombre());
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Transactional
	public boolean eliminarProveedor(Integer idProveedor, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//Empresa
			Proveedor proveedorX = em.find(Proveedor.class, idProveedor);
			Proveedor proveedorY = em.merge(proveedorX);
			//Proveedor
			proveedorY.setEstado("disabled");
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<ProveedorBean> listarProveedores(HttpServletRequest req) {
		List<Proveedor> lc = new ArrayList<Proveedor>();
		List<ProveedorBean> lcb = new ArrayList<ProveedorBean>();
		try{
			HttpSession session = req.getSession();
			Query query = null;

			String Squery = "";
			Squery = "SELECT c FROM Proveedor c WHERE c.proveedorEmpresa.idEmpresa =:idEmpresa AND c.estado='enabled' ";
			query = em.createQuery(Squery);
			query.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));

			lc = query.getResultList();
			for(int i =0; i < lc.size(); i++){
				Proveedor c = lc.get(i);
				ProveedorBean cb = new ProveedorBean();
				
				cb.setIdProveedor(c.getIdProveedor());
				cb.setIdEmpresa(c.getProveedorEmpresa().getIdEmpresa());
				cb.setNombre(c.getNombre());
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
