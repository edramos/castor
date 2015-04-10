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

import com.simularte.bean.ClienteBean;
import com.simularte.model.Cliente;
import com.simularte.model.Empresa;
import com.simularte.util.Dates;

@Service
public class ClienteServiceImpl implements ClienteService {

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearCliente(Cliente cliente, HttpServletRequest req) {
		boolean result = false;
		
		try{
			Empresa empresa = em.find(Empresa.class, (Integer)req.getSession().getAttribute("idEmpresa"));
			
			cliente.setClienteEmpresa(empresa);
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
	public boolean modificarCliente(Cliente cliente, HttpServletRequest req) {
		boolean result = false;
		
		try{
			Cliente clienteX = em.find(Cliente.class, cliente.getIdCliente());
			Cliente clienteY = em.merge(clienteX);
			
			clienteY.setRuc(cliente.getRuc());
			clienteY.setNombre(cliente.getNombre());
			clienteY.setDireccion(cliente.getDireccion());
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	@Transactional
	public boolean eliminarCliente(Integer idCliente, HttpServletRequest req) {
		boolean result = false;
		try{
			//HttpSession session = req.getSession();
			//Empresa
			Cliente clienteX = em.find(Cliente.class, idCliente);
			Cliente clienteY = em.merge(clienteX);
			//Cliente
			clienteY.setEstado("disabled");
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<ClienteBean> listarClientes(HttpServletRequest req) {
		List<Cliente> lc = new ArrayList<Cliente>();
		List<ClienteBean> lcb = new ArrayList<ClienteBean>();
		
		try{
			HttpSession session = req.getSession();
			Query query = null;

			String Squery = "";
			Squery = "SELECT c FROM Cliente c WHERE c.clienteEmpresa.idEmpresa =:idEmpresa AND c.estado='enabled' ";
			query = em.createQuery(Squery);
			query.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));

			lc = query.getResultList();
			for(int i =0; i < lc.size(); i++){
				Cliente c = lc.get(i);
				ClienteBean cb = new ClienteBean();
				
				cb.setIdCliente(c.getIdCliente());
				cb.setIdEmpresa(c.getClienteEmpresa().getIdEmpresa());
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
