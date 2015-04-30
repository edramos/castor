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

import com.simularte.bean.DetalleLibroBean;
import com.simularte.model.Cliente;
import com.simularte.model.DetalleLibro;
import com.simularte.model.Factura;
import com.simularte.model.Libro;
import com.simularte.model.Proveedor;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;

@Service
public class LibroServiceImpl implements LibroService{

	@PersistenceContext 
	EntityManager em;
	
	@Transactional
	public boolean crearDetalleLibro(DetalleLibroBean dlb, Integer idLibro, HttpServletRequest req){
		boolean result = false;
		
		try{
			HttpSession session = req.getSession();
			DetalleLibro detalleLibro = new DetalleLibro();
			Libro libro = em.find(Libro.class, idLibro);
		
			detalleLibro.setDetalleLibroLibro(libro);
			detalleLibro.setFechaOperacion(Dates.stringToDate(dlb.getFechaOperacion(), "yyyy-MM-dd"));
			detalleLibro.setOperacion(dlb.getOperacion());
			detalleLibro.setTipoOperacion(dlb.getTipoOperacion());
			detalleLibro.setDescripcion(dlb.getDescripcion());
			detalleLibro.setMonto(Formatos.StringToBigDecimal(dlb.getMonto()));
			
			detalleLibro.setIdCliente(dlb.getIdCliente());
			detalleLibro.setIdProveedor(dlb.getIdProveedor());
			detalleLibro.setFactura(dlb.getFactura());
			detalleLibro.setIdOrden(dlb.getIdOrden());
			detalleLibro.setCuentaBancoOrigen(dlb.getCuentaBancoOrigen());
			detalleLibro.setCuentaBancoDestino(dlb.getCuentaBancoDestino());
			detalleLibro.setCodigoOperacion(dlb.getCodigoOperacion());
			detalleLibro.setIdEmpleado(dlb.getIdEmpleado());			
			
			detalleLibro.setCreadoPor((Integer)session.getAttribute("idUser"));
			detalleLibro.setFechaCreacion(Dates.fechaCreacion());
			detalleLibro.setEstado("enabled");
		
			em.persist(detalleLibro);
			
			if(dlb.getTipoOperacion().equals("Cobranza Venta/Servicio") || dlb.getTipoOperacion().equals("Pago Proveedor")){
				Factura facturaX = em.find(Factura.class, dlb.getIdFactura());
				Factura facturaY = em.merge(facturaX);
				
				facturaY.setEstado("Cancelado");
				facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
			}
			if(dlb.getTipoOperacion().equals("Detraccion")){
				Factura facturaX = em.find(Factura.class, dlb.getIdFactura());
				Factura facturaY = em.merge(facturaX);
				
				facturaY.setEstadoDetraccion("Cancelado");
				facturaY.setFechaCancelacionDetraccion(detalleLibro.getFechaOperacion());
				
				//Se asume que primero pagan el monto de la factura y luego la detraccion, asi se cambia el estado de la cuenta
				if(facturaX.getEstado().equals("Cancelado") && facturaX.getEstadoDetraccion().equals("Cancelado")){
					Query q01 = em.createNativeQuery("SELECT c.idcuenta FROM cuenta c "
							+ "INNER JOIN factura f "
							+ "ON c.idcuenta = f.idcuenta WHERE f.idfactura = '" + facturaX.getIdFactura() + "'");
					
					int idCuenta = (Integer)q01.getSingleResult();
					Query q02 = em.createNativeQuery("UPDATE cuenta SET estado = 'Cancelado' WHERE idcuenta = '" + idCuenta + "'");
					
					q02.executeUpdate();
					
				}
				
			}
			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<DetalleLibroBean> listarDetalleLibro(Integer idLibro, HttpServletRequest req){
		List<DetalleLibroBean> registros = new ArrayList<DetalleLibroBean>();
		
		double saldo = 0;
		Query q = em.createNativeQuery("SELECT idDetalleLibro, fechaoperacion, tipooperacion, operacion, monto , descripcion "
				+ "FROM detallelibro "
				+ "WHERE idLibro = '" + idLibro + "' ORDER BY fechaoperacion");
		
		try{
			List<Object[]> rows = q.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] caja = rows.get(x);
				DetalleLibroBean dlb = new DetalleLibroBean();
				
				dlb.setIdDetalleLibro((Integer)caja[0]);
				dlb.setFechaOperacion(Dates.stringToStringFechaCorta(caja[1].toString()));
				dlb.setTipoOperacion(caja[2].toString());
				if(caja[3].equals("Ingreso")){
					dlb.setIngreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(caja[4].toString())));
					saldo += Formatos.StringToBigDecimal(caja[4].toString()).doubleValue();
					
					System.out.println("Ingreso Saldo" + saldo);
				}else{
					dlb.setEgreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(caja[4].toString())));
					saldo -= Formatos.StringToBigDecimal(caja[4].toString()).doubleValue();
					System.out.println("Egreso Saldo" + saldo);
				}
				dlb.setDescripcion(caja[5].toString());
				dlb.setSaldo(Formatos.BigBecimalToString(BigDecimal.valueOf(saldo)));
				
				registros.add(dlb);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return registros;
	}
		
	public List<DetalleLibroBean> mostrarDetalleLibro(Integer idDetalleLibro, HttpServletRequest req){
		List<DetalleLibroBean> registros = new ArrayList<DetalleLibroBean>();
		DetalleLibroBean dlb = new DetalleLibroBean();
		
		DetalleLibro dl = em.find(DetalleLibro.class, idDetalleLibro);
		
		Query q1 = em.createNativeQuery("SELECT p.primernombre, p.apellidopaterno FROM perfil p "
				+ "INNER JOIN usuario u ON u.idusuario = p.idusuario WHERE u.idusuario = " + dl.getCreadoPor());
		
		try{
			Object[] perfilUsuario = (Object[])q1.getSingleResult();
			if(dl.getIdCliente() != null){
				Cliente cliente = em.find(Cliente.class, dl.getIdCliente());
				dlb.setNombreCliente(cliente.getNombre());
			}
			if(dl.getIdEmpleado() != null){
				Query q2 = em.createNativeQuery("SELECT p.primernombre, p.apellidopaterno FROM perfil p "
						+ "INNER JOIN usuario u ON u.idusuario = p.idusuario WHERE u.idusuario = " + dl.getIdEmpleado());
				Object[] perfilEmp = (Object[])q2.getSingleResult();
				dlb.setNombreEmpleado(perfilEmp[0] + " " + perfilEmp[1]);
			}
			if(dl.getIdProveedor() != null){
				Proveedor proveedor = em.find(Proveedor.class, dl.getIdProveedor());
				dlb.setNombreProveedor(proveedor.getNombre());
			}
			dlb.setCodigoOperacion(dl.getCodigoOperacion());
			dlb.setCreadoPor(dl.getCreadoPor());
			dlb.setCuentaBancoDestino(dl.getCuentaBancoDestino());
			dlb.setCuentaBancoOrigen(dl.getCuentaBancoOrigen());
			dlb.setDescripcion(dl.getDescripcion());
			dlb.setEstado(dl.getEstado());
			dlb.setFactura(dl.getFactura());
			
			dlb.setFechaCreacion(Dates.fechaHoraEspaniol(dl.getFechaCreacion(), "s"));
			dlb.setFechaOperacion(Dates.fechaEspaniol(dl.getFechaOperacion()));
			
			dlb.setIdCliente(dl.getIdCliente());
			dlb.setIdDetalleLibro(dl.getIdDetalleLibro());
			dlb.setIdEmpleado(dl.getIdEmpleado());
			dlb.setIdOrden(dl.getIdOrden());
			dlb.setIdProveedor(dl.getIdProveedor());
			
			dlb.setMonto(Formatos.BigBecimalToString(dl.getMonto()));
			
			dlb.setNombreCreadoPor(perfilUsuario[0] + " " + perfilUsuario[1]);
			
			dlb.setOperacion(dl.getOperacion());
			dlb.setTipoOperacion(dl.getTipoOperacion());
			
			registros.add(dlb);
						
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return registros;
	}
}
