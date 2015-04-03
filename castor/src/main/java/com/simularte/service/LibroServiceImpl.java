package com.simularte.service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.DetalleLibroBean;
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
	public List<DetalleLibroBean> mostrarDetalleLibro(Integer idDetalleLibro, HttpServletRequest req){
		List<DetalleLibroBean> registro = new ArrayList<DetalleLibroBean>();
		DetalleLibroBean detalleLibroB = null;
		//Despues todo se cambiara con querys dinamicos e INNER and LEFT OUTER JOINs
		Query q = em.createNativeQuery("SELECT idcliente, idproveedor, idorden, idempleado, cuentabancoorigen, cuentabancodestino, factura, codigooperacion, fechaCreacion"
				+ " FROM detallelibro"
				+ " WHERE iddetallelibro = '" + idDetalleLibro + "'");
		
		
		try{
			List<Object[]> rows = q.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] dlo = rows.get(x);
				detalleLibroB = new DetalleLibroBean();
				
				if((Integer)dlo[0] != null){
					Query q1 = em.createNativeQuery("SELECT nombre, idcliente FROM cliente WHERE idcliente = '" + (Integer)dlo[0] + "'");
					
					List<Object[]> clientes = q1.getResultList();
					for(int y = 0; y < clientes.size(); y++){
						Object[] cliente = clientes.get(y);
						detalleLibroB.setNombreCliente(cliente[0].toString());
					}
				}
				
				if((Integer)dlo[1] != null){
					Query q1 = em.createNativeQuery("SELECT nombre, idproveedor FROM proveedor WHERE idproveedor = '" + (Integer)dlo[1] + "'");
					
					List<Object[]> objs = q1.getResultList();
					for(int y = 0; y < objs.size(); y++){
						Object[] cliente = objs.get(y);
						detalleLibroB.setNombreProveedor(cliente[0].toString());
					}
				}
				
				detalleLibroB.setIdCliente((Integer)dlo[0]);
				detalleLibroB.setIdProveedor((Integer)dlo[1]);
				detalleLibroB.setIdOrden((Integer)dlo[2]);
				detalleLibroB.setIdEmpleado((Integer)dlo[3]);
				detalleLibroB.setCuentaBancoOrigen((dlo[4] == null) ? "" : dlo[4].toString());
				detalleLibroB.setCuentaBancoDestino((dlo[5] == null) ? "" : dlo[5].toString());
				detalleLibroB.setFactura((dlo[6] == null) ? "" : dlo[6].toString());
				detalleLibroB.setCodigoOperacion((dlo[7] == null) ? "" : dlo[7].toString());
				System.out.println(dlo[8].toString());
				detalleLibroB.setFechaCreacion(Dates.fechaHoraEspaniol(Dates.stringToTimeStamp(dlo[8].toString())));
				registro.add(detalleLibroB);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return registro;
	}
}
