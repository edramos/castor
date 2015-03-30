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

import com.simularte.bean.LibroBean;
import com.simularte.model.DetalleLibro;
import com.simularte.model.Libro;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;

@Service
public class LibroServiceImpl implements LibroService{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearDetalleLibro(LibroBean libroBean, String tipoLibro, HttpServletRequest req){
		boolean result = false;
		
		try{
			HttpSession session = req.getSession();
			DetalleLibro detalleLibro = new DetalleLibro();
			Libro libro = em.find(Libro.class, libroBean.getIdLibro());
			
			detalleLibro.setDetalleLibroLibro(libro);
			detalleLibro.setFechaOperacion(Dates.stringToDate(libroBean.getFechaOperacion(), "yyyy-MM-dd"));
			detalleLibro.setOperacion(libroBean.getOperacion());
			detalleLibro.setTipoOperacion(libroBean.getTipoOperacion());
			detalleLibro.setDescripcion(libroBean.getDescripcion());
			detalleLibro.setMonto(Formatos.StringToBigDecimal(libroBean.getMonto()));
			
			detalleLibro.setIdCliente(libroBean.getIdCliente());
			detalleLibro.setIdProveedor(libroBean.getIdProveedor());
			detalleLibro.setFactura(libroBean.getFactura());
			detalleLibro.setIdOrden(libroBean.getIdOrden());
			detalleLibro.setCuentaBancoOrigen(libroBean.getCuentaBancoOrigen());
			detalleLibro.setCuentaBancoDestino(libroBean.getCuentaBancoDestino());
			detalleLibro.setCodigoOperacion(libroBean.getCodigoOperacion());
			detalleLibro.setIdEmpleado(libroBean.getIdEmpleado());			
			
			detalleLibro.setCreadoPor((Integer)session.getAttribute("idUser"));
			detalleLibro.setFechaCreacion(Dates.fechaCreacion());
			detalleLibro.setEstado("enabled");
		
		
			em.persist(detalleLibro);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<LibroBean> listarDetalleLibro(Integer idLibro, HttpServletRequest req){
		List<LibroBean> registros = new ArrayList<LibroBean>();
		
		double saldo = 0;
		Query q = em.createNativeQuery("SELECT idDetalleLibro, fechaoperacion, tipooperacion, operacion, monto , descripcion "
				+ "FROM detallelibro "
				+ "WHERE idLibro = '" + idLibro + "' ORDER BY fechaoperacion");
		
		try{
			List<Object[]> rows = q.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] caja = rows.get(x);
				LibroBean LibroB = new LibroBean();
				
				LibroB.setIdDetalleLibro((Integer)caja[0]);
				LibroB.setFechaOperacion(Dates.stringToStringFechaCorta(caja[1].toString()));
				LibroB.setTipoOperacion(caja[2].toString());
				if(caja[3].equals("Ingreso")){
					LibroB.setIngreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(caja[4].toString())));
					saldo += Formatos.StringToBigDecimal(caja[4].toString()).doubleValue();
					
					System.out.println("Ingreso Saldo" + saldo);
				}else{
					LibroB.setEgreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(caja[4].toString())));
					saldo -= Formatos.StringToBigDecimal(caja[4].toString()).doubleValue();
					System.out.println("Egreso Saldo" + saldo);
				}
				LibroB.setDescripcion(caja[5].toString());
				LibroB.setSaldo(Formatos.BigBecimalToString(BigDecimal.valueOf(saldo)));
				
				registros.add(LibroB);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return registros;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<DetalleLibro> mostrarDetalleLibro(Integer idDetalleLibro, HttpServletRequest req){
		List<DetalleLibro> registro = new ArrayList<DetalleLibro>();
		DetalleLibro detalleLibro = null;
		Query q = em.createNativeQuery("SELECT idcliente, idproveedor, idorden, idempleado, cuentabancoorigen, cuentabancodestino, factura, codigooperacion"
				+ " FROM detallelibro"
				+ " WHERE iddetallelibro = '" + idDetalleLibro + "'");
		
		try{
			List<Object[]> rows = q.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] dlo = rows.get(x);
				detalleLibro = new DetalleLibro();
				
				detalleLibro.setIdCliente((Integer)dlo[0]);
				detalleLibro.setIdProveedor((Integer)dlo[1]);
				detalleLibro.setIdOrden((Integer)dlo[2]);
				detalleLibro.setIdEmpleado((Integer)dlo[3]);
				detalleLibro.setCuentaBancoOrigen((dlo[4] == null) ? "" : dlo[4].toString());
				detalleLibro.setCuentaBancoDestino((dlo[5] == null) ? "" : dlo[5].toString());
				detalleLibro.setFactura((dlo[6] == null) ? "" : dlo[6].toString());
				detalleLibro.setCodigoOperacion((dlo[7] == null) ? "" : dlo[7].toString());
				
				registro.add(detalleLibro);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return registro;
	}
}
