package com.simularte.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.model.Cliente;
import com.simularte.model.Empresa;
import com.simularte.model.Orden;
import com.simularte.util.Dates;

@Service
public class OrdenServiceImpl implements OrdenService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearOrden(Orden orden, int idCliente, HttpServletRequest req) {
		boolean result = false;
		
		try{
			HttpSession session = req.getSession();
			
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			Cliente cliente = em.find(Cliente.class, idCliente);			
			
			orden.setOrdenCliente(cliente);
			orden.setOrdenEmpresa(empresa);
			orden.setCodigo("ORD-" + orden.getTipoOrden() + "-" + orden.getIdOrden());
						
			orden.setCreadoPor((Integer)session.getAttribute("idUser"));
			orden.setFechaCreacion(Dates.fechaCreacion());
			orden.setEstado("enabled");
			
			em.persist(orden);
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

}
