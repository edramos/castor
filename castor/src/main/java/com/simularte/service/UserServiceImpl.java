package com.simularte.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
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
import com.simularte.util.Formatos;

@Service
public class UserServiceImpl implements UserService{

	@PersistenceContext 
	EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<CuentaBean> getCuentas(HttpServletRequest req){
		List<CuentaBean> cuentas = new ArrayList<CuentaBean>();
		
		Query q01 = em.createNativeQuery("SELECT c.fechavencimiento, SUM(IF(c.tipo = 'cobrar', c.monto, 0)) AS cobrar, SUM(IF(c.tipo = 'pagar', c.monto, 0)) AS pagar "
				+ "FROM cuenta c "
				+ "INNER JOIN orden o ON c.idorden = o.idorden "
				+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' "
				+ "GROUP BY c.fechavencimiento ASC");
		
		double saldo = 0;
		
		List<Object[]> rows01 = q01.getResultList();
		for(int x = 0; x < rows01.size(); x++){
			Object[] obj = rows01.get(x);
			CuentaBean cb = new CuentaBean();
			
			cb.setFechaOperacion(obj[0].toString());
			cb.setMontoCobrar(obj[1].toString());
			cb.setMontoPagar(obj[2].toString());
			
			//double cobrar = Double.parseDouble(cb.getMontoCobrar());
			//double pagar = Double.parseDouble(cb.getMontoPagar());
			
			BigDecimal cobrar = Formatos.StringToBigDecimal(cb.getMontoCobrar());
			BigDecimal pagar = Formatos.StringToBigDecimal(cb.getMontoPagar());
			
			saldo += cobrar.subtract(pagar).doubleValue();
			
			BigDecimal fSaldo = new BigDecimal(saldo);
			System.out.println("fSaldo: " + fSaldo.setScale(2, RoundingMode.HALF_UP));
			cb.setSaldo(fSaldo.setScale(2, RoundingMode.HALF_UP).toString());
			
			//System.out.println(cb.getFechaOperacion() + ", " + cb.getMontoCobrar() + ", " + cb.getMontoPagar() + ", " + saldo);
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
				
				String nombreUsuario = (profileSR.getPrimerNombre() != null)? profileSR.getPrimerNombre() : "Usuario";
				
				session.setAttribute("nombreUsuario", nombreUsuario);
				
				TypedQuery<Empresa> tqEmpresa = em.createQuery("SELECT e FROM Empresa e WHERE e.idEmpresa =:idempresa", Empresa.class);
				tqEmpresa.setParameter("idempresa", usuarioSR.getUsuarioEmpresa().getIdEmpresa());
				
				Empresa empresaSR = tqEmpresa.getSingleResult();
				
				session.setAttribute("tipo", empresaSR.getTipo());
				session.setAttribute("ruc", empresaSR.getRuc());
				session.setAttribute("nombreEmpresa", empresaSR.getNombre());
				session.setAttribute("codigo",empresaSR.getCodigo());
				
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