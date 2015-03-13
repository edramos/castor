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

import com.simularte.bean.ProyectoBean;
import com.simularte.model.Cliente;
import com.simularte.model.Empresa;
import com.simularte.model.Orden;
import com.simularte.model.Proyecto;
import com.simularte.util.Dates;

@Service
public class ProyectoServiceImpl implements ProyectoService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearProyecto(ProyectoBean proyb, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			
			
			
			//Empresa
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));

			Cliente cliente = em.find(Cliente.class, proyb.getIdCliente());			
			
			//Proyecto
			Proyecto proy = new Proyecto();
			proy.setCodigo("PROY");
			proy.setNombre(proyb.getNombre());
			proy.setTipo(proyb.getTipo());
			proy.setProyectoEmpresa(empresa);
			proy.setProyectoCliente(cliente);
			
			proy.setDireccion(proyb.getDireccion());
			proy.setDistrito(proyb.getDistrito());
			proy.setCiudad(proyb.getCiudad());
			proy.setDepartamento(proyb.getDepartamento());
			//
			proy.setOferta(proyb.getOferta());
			proy.setEficiencia(proyb.getEficiencia());
			proy.setUtilidadBruta(proyb.getUtilidadBruta());
			//
			proy.setSubTotal(proyb.getSubTotal());
			proy.setGastosGenerales(proyb.getGastosGenerales());
			proy.setTotal(proyb.getTotal());
			
			proy.setFechaCreacion(Dates.fechaCreacion());
			proy.setEstado("enabled");
			proy.setCreadoPor((Integer)session.getAttribute("idUser"));
			em.persist(proy);
			
			//
			Orden orden = new Orden();
			orden.setOrdenProyecto(proy);
			orden.setCodigo("ORD");
			orden.setOferta(proy.getOferta());
			orden.setFechaCreacion(Dates.fechaCreacion());
			orden.setEstado("enabled");
			orden.setCreadoPor((Integer)session.getAttribute("idUser"));
			
			em.persist(orden);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

}
