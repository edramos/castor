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
			Empresa empresa = em.find(Empresa.class, (Integer)req.getSession().getAttribute("idEmpresa"));
			
			cliente.setProveedorEmpresa(empresa);
			cliente.setFechaCreacion(Dates.fechaCreacion());
			cliente.setEstado("enabled");
			cliente.setCreadoPor((Integer)req.getSession().getAttribute("idUser"));
			
			em.persist(cliente);
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	@Transactional
	public boolean modificarProveedor(Proveedor proveedor, HttpServletRequest req) {
		boolean result = false;
		
		try{
			Proveedor proveedorX = em.find(Proveedor.class, proveedor.getIdProveedor());
			Proveedor proveedorY = em.merge(proveedorX);
			
			proveedorY.setNombre(proveedor.getNombre());
			proveedorY.setRuc(proveedor.getRuc());
			proveedorY.setDireccion(proveedor.getDireccion());
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	@Transactional
	public boolean eliminarProveedor(Integer idProveedor, HttpServletRequest req) {
		boolean result = false;
		
		try{
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
				cb.setRuc(c.getRuc());
				cb.setDireccion(c.getDireccion());
				
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
