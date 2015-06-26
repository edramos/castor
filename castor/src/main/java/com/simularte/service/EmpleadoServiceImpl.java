package com.simularte.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.EmpleadoBean;
import com.simularte.model.Empresa;
import com.simularte.model.Perfil;
import com.simularte.model.Usuario;
import com.simularte.util.Dates;

@Service
public class EmpleadoServiceImpl implements EmpleadoService {

	@PersistenceContext 
	EntityManager em;
	
	
	@SuppressWarnings("unchecked")
	public List<EmpleadoBean> listarSupervisores(HttpServletRequest req){
		List<EmpleadoBean> lcb = new ArrayList<EmpleadoBean>();
		
		Query q01 = em.createNativeQuery("SELECT p.idusuario, p.primernombre, p.apellidopaterno, p.rol FROM perfil p "
			+ "INNER JOIN usuario u ON u.idusuario = p.idusuario "
			+ "INNER JOIN empresa e ON e.idempresa = u.idempresa "
			+ "WHERE u.idempresa = '"+ req.getSession().getAttribute("idEmpresa") +"' AND p.rol = 'Supervisor' AND u.estado = 'enabled'");
		
		try{
			List<Object[]> rows01 = q01.getResultList();
			for(int x = 0; x < rows01.size(); x++){
				Object[] obj = rows01.get(x);
				EmpleadoBean eb = new EmpleadoBean();
				
				eb.setIdUsuario((Integer)obj[0]);
				eb.setPrimerNombre(obj[1].toString());
				eb.setApellidoPaterno(obj[2].toString());
				
				lcb.add(eb);
			}
		}catch(NoResultException e){
			e.printStackTrace();
		}
		
		return lcb;
	}
	
	
	@Transactional
	public boolean crearEmpleado(EmpleadoBean empb, HttpServletRequest req) {
		boolean result = false;
		try{
			HttpSession session = req.getSession();
			//EMPRESA
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			//USUARIO
			Usuario usu = new Usuario();
			usu.setEmail(empb.getEmail());
			usu.setPassword("pass");
			usu.setFechaCreacion(Dates.fechaCreacion());
			usu.setEstado("enabled");
			usu.setUsuarioEmpresa(empresa);
			em.persist(usu);
			
			//PERFIL
			Perfil per = new Perfil();
			per.setPerfilUsuario(usu);
			per.setPrimerNombre(empb.getPrimerNombre());
			per.setSegundoNombre(empb.getSegundoNombre());
			per.setApellidoPaterno(empb.getApellidoPaterno());
			per.setApellidoMaterno(empb.getApellidoMaterno());
			per.setTelefonoCasa(empb.getTelefonoCasa());
			per.setCelularPrimario(empb.getCelularPrimario());
			per.setRol(empb.getRol());			
			per.setFechaCreacion(Dates.fechaCreacion());
			per.setEstado("enabled");
			
			em.persist(per);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Transactional
	public boolean modificarEmpleado(EmpleadoBean empb, HttpServletRequest req) {
		boolean result = false;
		
		try{
			//Empleado
			Perfil perfilX = em.find(Perfil.class, empb.getIdPerfil());
			Perfil perfilY = em.merge(perfilX);
			
			perfilY.setPrimerNombre(empb.getPrimerNombre());
			perfilY.setSegundoNombre(empb.getSegundoNombre());
			perfilY.setApellidoPaterno(empb.getApellidoPaterno());
			perfilY.setApellidoMaterno(empb.getApellidoMaterno());
			perfilY.setTelefonoCasa(empb.getTelefonoCasa());
			perfilY.setCelularPrimario(empb.getCelularPrimario());
			perfilY.setRol(empb.getRol());		
			
			Usuario usuarioY = em.merge(perfilX.getPerfilUsuario());
			usuarioY.setEmail(empb.getEmail());
			
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@Transactional
	public boolean eliminarEmpleado(Integer idEmpleado, HttpServletRequest req) {
		boolean result = false;
		
		try{
			//PERFIL
			Perfil perfilX = em.find(Perfil.class, idEmpleado);
			Perfil perfilY = em.merge(perfilX);
			//
			perfilY.setEstado("disabled");
			
			//USUARIO
			Usuario usuarioY = em.merge(perfilX.getPerfilUsuario());
			usuarioY.setEstado("disabled");
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
			result = false;
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<EmpleadoBean> listarEmpleados(HttpServletRequest req) {
		List<Perfil> lc = new ArrayList<Perfil>();
		List<EmpleadoBean> lcb = new ArrayList<EmpleadoBean>();
		try{
			HttpSession session = req.getSession();
			Query query = null;

			String Squery = "";
			Squery = "SELECT p FROM Perfil p WHERE p.perfilUsuario.usuarioEmpresa.idEmpresa =:idEmpresa AND p.estado='enabled' ";
			query = em.createQuery(Squery);
			query.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));

			lc = query.getResultList();
			for(int i = 0; i < lc.size(); i++){
				Perfil c = lc.get(i);
				EmpleadoBean cb = new EmpleadoBean();
				
				cb.setIdPerfil(c.getIdPerfil());
				cb.setIdUsuario(c.getPerfilUsuario().getIdUsuario());
				cb.setPrimerNombre(c.getPrimerNombre());
				cb.setSegundoNombre(c.getSegundoNombre());
				cb.setApellidoPaterno(c.getApellidoPaterno());
				cb.setApellidoMaterno(c.getApellidoMaterno());
				cb.setEmail(c.getPerfilUsuario().getEmail());
				cb.setCelularPrimario(c.getCelularPrimario());
				cb.setTelefonoCasa(c.getTelefonoCasa());
				cb.setRol(c.getRol());
				
				cb.setEstado(c.getEstado());
				cb.setFechaCreacion(c.getFechaCreacion());
				
				
				lcb.add(cb);
			}
			
		} catch(IllegalArgumentException e){
			lcb = null;
		}
		
		return lcb;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<EmpleadoBean> getEmpleadosAutocomplete(String nombreEmp, HttpServletRequest req) {
		List<Perfil> lc = new ArrayList<Perfil>();
		List<EmpleadoBean> lcb = new ArrayList<EmpleadoBean>();
		try{
			HttpSession session = req.getSession();
			Query query = null;

			String Squery = "";
			Squery = "SELECT c FROM Perfil c "
					+ "WHERE c.perfilUsuario.usuarioEmpresa.idEmpresa =:idEmpresa AND c.estado='enabled' AND CONCAT(c.primerNombre, ' ', c.apellidoPaterno) LIKE '%" + nombreEmp + "%'";
			query = em.createQuery(Squery);
			query.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));

			lc = query.getResultList();
			for(int i =0; i < lc.size(); i++){
				Perfil c = lc.get(i);
				EmpleadoBean cb = new EmpleadoBean();
				
				//cb.setIdPerfil(c.getIdPerfil());
				cb.setIdUsuario(c.getPerfilUsuario().getIdUsuario());
				cb.setPrimerNombre(c.getPrimerNombre() + " " + c.getApellidoPaterno());
				//cb.setSegundoNombre(c.getSegundoNombre());
				//cb.setApellidoPaterno(c.getApellidoPaterno());
				/*cb.setApellidoMaterno(c.getApellidoMaterno());
				cb.setEmail(c.getPerfilUsuario().getEmail());
				cb.setCelularPrimario(c.getCelularPrimario());
				cb.setTelefonoCasa(c.getTelefonoCasa());
				cb.setRol(c.getRol());
				
				cb.setEstado(c.getEstado());
				cb.setFechaCreacion(c.getFechaCreacion());*/
				
				
				lcb.add(cb);
			}
			
		} catch(IllegalArgumentException e){
			lcb = null;
		}
		
		return lcb;
	}
	
}
