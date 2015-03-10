package com.simularte.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.model.Empresa;
import com.simularte.model.Perfil;
import com.simularte.model.Usuario;
import com.simularte.util.Dates;

@Service
public class UserServiceImpl implements UserService{

	@PersistenceContext EntityManager em;
	
	@Transactional
	public boolean crearCuenta(Usuario usuario){
		boolean result = false;
		
		usuario.setFechaCreacion(Dates.fechaCreacion());
		usuario.setEstado("enabled");
		
		try{
			em.persist(usuario);
			System.out.println(usuario.getEmail() + ", " + usuario.getPassword());
			Perfil perfil = new Perfil();
			
			perfil.setPerfilUsuario(usuario);
			perfil.setRol("administrador");
			perfil.setFechaCreacion(Dates.fechaCreacion());
			perfil.setEstado("enabled");
			
			em.persist(perfil);
			System.out.println(perfil.getEstado());
			Empresa empresa = new Empresa();
			
			empresa.setFechaCreacion(Dates.fechaCreacion());
			empresa.setEstado("enabled");
			
			em.persist(empresa);
			System.out.println(empresa.getEstado());
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean login(String username, String password, HttpServletRequest req){
		boolean result = false;
		
		TypedQuery<Usuario> tqUsuario = em.createQuery("SELECT u FROM Usuario u WHERE u.email =:email AND u.password =:password AND u.estado='enabled'", Usuario.class);
		tqUsuario.setParameter("email", username);
		tqUsuario.setParameter("password", password);
		
		try{
			Usuario usuarioSR = tqUsuario.getSingleResult();
			HttpSession session = req.getSession(true);
			
			if(usuarioSR.getIdUsuario() != null){
				session.setAttribute("idUser", usuarioSR.getIdUsuario());
				
				TypedQuery<Perfil> tqPerfil = em.createQuery("SELECT p FROM Perfil p JOIN p.usuario u WHERE u.idUsuario =:idusuario", Perfil.class);
				tqPerfil.setParameter("idusuario", usuarioSR.getIdUsuario());
				
				Perfil profileSR = tqPerfil.getSingleResult();
				session.setAttribute("tipo", profileSR.getTipo());
				session.setAttribute("rol", profileSR.getRol());
				
				TypedQuery<Empresa> tqEmpresa = em.createQuery("SELECT e FROM Empresa e JOIN e.usuario u WHERE u.idUsuario =:idusuario", Empresa.class);
				tqEmpresa.setParameter("idusuario", usuarioSR.getIdUsuario());
				
				Empresa empresaSR = tqEmpresa.getSingleResult();
				session.setAttribute("idEmpresa", empresaSR.getIdEmpresa());
				
				result = true;
			}			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public boolean logout(HttpServletRequest req){
		boolean result = false;
		
		if(req.getSession() != null){
			req.getSession().invalidate();
			result = true;
		}
		
		return result;
	}
}