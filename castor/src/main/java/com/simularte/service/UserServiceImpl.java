package com.simularte.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.CuentaBean;
import com.simularte.model.Empresa;
import com.simularte.model.Perfil;
import com.simularte.model.Usuario;
import com.simularte.util.Dates;

@Service
public class UserServiceImpl implements UserService{

	@PersistenceContext 
	EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<CuentaBean> getCuentas(HttpServletRequest req){
		List<CuentaBean> cuentas = new ArrayList<CuentaBean>();
		
		Query q01 = em.createNativeQuery("SELECT c.idcuenta, c.fechavencimiento, c.monto, c.tipo "
				+ "FROM cuenta c "
				+ "INNER JOIN orden o ON c.idorden = o.idorden "
				+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' ORDER BY c.fechavencimiento ASC");
		
		
		List<Object[]> rows01 = q01.getResultList();
		
		//Double sumCobrar = 0.0;
		//Double sumPagar = 0.0;
		Double saldo = 0.0;
		
		for(int x = 0; x < rows01.size(); x++){
			Object[] obj = rows01.get(x);
			CuentaBean cb = new CuentaBean();
			
			cb.setFechaOperacion(obj[1].toString());
			
			if(obj[3].toString().equals("cobrar")){
				cb.setMontoCobrar(obj[2].toString());
				cb.setMontoPagar("");
				
				saldo += Double.valueOf(obj[2].toString());
				
			}else{
				cb.setMontoPagar(obj[2].toString());
				//cb.setMontoCobrar(cuentas.get(x - 1).getMontoCobrar());
				cb.setMontoCobrar("");
				
				saldo -= Double.valueOf(obj[2].toString());
			}
			
			cb.setSaldo(saldo.toString());
			
			cuentas.add(cb);
		}
		
		return cuentas;
	}
	
	@Transactional
	public boolean crearCuenta(Usuario usuario){
		boolean result = false;
		
		try{
			Empresa empresa = new Empresa();
			
			//Por ahora solo se cambiara internamente, valores: empresa, proveedor y cliente
			empresa.setTipo("empresa");
			empresa.setFechaCreacion(Dates.fechaCreacion());
			empresa.setEstado("enabled");
			
			em.persist(empresa);
			
			usuario.setUsuarioEmpresa(empresa);
			usuario.setFechaCreacion(Dates.fechaCreacion());
			usuario.setEstado("enabled");
			
			em.persist(usuario);
			System.out.println(usuario.getEmail() + ", " + usuario.getPassword());
			Perfil perfil = new Perfil();
			
			perfil.setPerfilUsuario(usuario);
			perfil.setRol("Administrador");
			perfil.setFechaCreacion(Dates.fechaCreacion());
			perfil.setEstado("enabled");
			
			em.persist(perfil);
			
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
				session.setAttribute("idEmpresa", usuarioSR.getUsuarioEmpresa().getIdEmpresa());
				
				TypedQuery<Perfil> tqPerfil = em.createQuery("SELECT p FROM Perfil p JOIN p.perfilUsuario u WHERE u.idUsuario =:idusuario", Perfil.class);
				tqPerfil.setParameter("idusuario", usuarioSR.getIdUsuario());
				
				Perfil profileSR = tqPerfil.getSingleResult();
				session.setAttribute("rol", profileSR.getRol());
				
				TypedQuery<Empresa> tqEmpresa = em.createQuery("SELECT e FROM Empresa e WHERE e.idEmpresa =:idempresa", Empresa.class);
				tqEmpresa.setParameter("idempresa", usuarioSR.getUsuarioEmpresa().getIdEmpresa());
				
				Empresa empresaSR = tqEmpresa.getSingleResult();
				
				session.setAttribute("tipo", empresaSR.getTipo());
				
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