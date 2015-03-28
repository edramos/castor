package com.simularte.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.CajaBean;
import com.simularte.model.Caja;
import com.simularte.model.Empresa;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;

@Service
public class CajaServiceImpl implements CajaService{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearCaja(CajaBean cajaBean, HttpServletRequest req){
		boolean result = false;
		
		try{
			HttpSession session = req.getSession();
			Caja caja = new Caja();
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			
			caja.setFechaOperacion(Dates.stringToDate(cajaBean.getFechaOperacion(), "yyyy-MM-dd"));
			caja.setMonto(Formatos.StringToBigDecimal(cajaBean.getMonto()));
			caja.setOperacion(cajaBean.getOperacion());
			caja.setTipoOperacion(cajaBean.getTipoOperacion());
			caja.setCajaEmpresa(empresa);
			caja.setIdCuentaBanco(cajaBean.getIdCuentaBanco());
			
			caja.setIdCliente(cajaBean.getIdCliente());
			caja.setFactura(cajaBean.getFactura());
			caja.setIdOrden(cajaBean.getIdOrden());
			caja.setCuentaBancoOrigen(cajaBean.getCuentaBancoOrigen());
			caja.setCuentaBancoDestino(cajaBean.getCuentaBancoDestino());
			caja.setCodigoOperacion(cajaBean.getCodigoOperacion());
			caja.setIdProveedor(cajaBean.getIdProveedor());
			caja.setIdEmpleado(cajaBean.getIdEmpleado());
			caja.setDescripcion(cajaBean.getDescripcion());
			
			caja.setCreadoPor((Integer)session.getAttribute("idUser"));
			caja.setFechaCreacion(Dates.fechaCreacion());
			caja.setEstado("enabled");
		
		
			em.persist(caja);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<CajaBean> listarRegistrosCaja(HttpServletRequest req){
		List<CajaBean> registros = new ArrayList<CajaBean>();
		
		double saldo = 0;
		Query q = em.createNativeQuery("SELECT fechaOperacion, tipoOperacion, operacion, monto "
				+ "FROM caja WHERE idEmpresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' ORDER BY fechaoperacion");
		
		try{
			List<Object[]> rows = q.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] caja = rows.get(x);
				CajaBean cajaB = new CajaBean();
				
				cajaB.setFechaOperacion(Dates.stringToStringFechaCorta(caja[0].toString()));
				cajaB.setTipoOperacion(caja[1].toString());
				if(caja[2].equals("Ingreso")){
					cajaB.setIngreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(caja[3].toString())));
					saldo += Formatos.StringToBigDecimal(caja[3].toString()).doubleValue();
					
					System.out.println("Ingreso Saldo" + saldo);
				}else{
					cajaB.setEgreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(caja[3].toString())));
					saldo -= Formatos.StringToBigDecimal(caja[3].toString()).doubleValue();
					System.out.println("Egreso Saldo" + saldo);
				}
				
				cajaB.setSaldo(Formatos.BigBecimalToString(BigDecimal.valueOf(saldo)));
				
				registros.add(cajaB);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return registros;
	}
}
