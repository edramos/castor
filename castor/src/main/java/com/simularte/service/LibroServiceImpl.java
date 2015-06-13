package com.simularte.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.simularte.bean.DetalleLibroBean;
import com.simularte.bean.LibroBean;
import com.simularte.model.Cliente;
import com.simularte.model.Cuenta;
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
	
	@Autowired
	S3Service s3;
	
	@SuppressWarnings("unchecked") @JsonIgnore
	public List<LibroBean> listarLibros(HttpServletRequest req){
		List<LibroBean> libros = new ArrayList<LibroBean>();
		
		Query q01 = em.createNativeQuery("SELECT l.idlibro, l.nombre FROM libro l WHERE l.estado = 'enabled' AND l.idempresa = '"+ req.getSession().getAttribute("idEmpresa") +"'");
		
		try{
			List<Object[]> rows01 = q01.getResultList();
			for(int x = 0; x < rows01.size(); x++){
				Object[] obj = rows01.get(x);
				LibroBean lb = new LibroBean();
				
				lb.setIdLibro((Integer)obj[0]);
				lb.setNombre(obj[1].toString());
				
				libros.add(lb);
			}
			
		}catch(NoResultException e){
			System.out.println("No encontre nada");
			e.printStackTrace();
		}
		
		return libros;
	}
	
	@Transactional
	public boolean crearDetalleLibro(DetalleLibroBean dlb, Integer idLibro, HttpServletRequest req){
		boolean result = false;
		
		try{
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
			detalleLibro.setIdOrden(dlb.getIdOrden());
			detalleLibro.setIdEmpleado(dlb.getIdEmpleado());
			detalleLibro.setIdFactura(dlb.getIdFactura());
			
			detalleLibro.setCuentaBancoOrigen(dlb.getCuentaBancoOrigen());
			detalleLibro.setCuentaBancoDestino(dlb.getCuentaBancoDestino());
			detalleLibro.setCodigoOperacion(dlb.getCodigoOperacion());
			detalleLibro.setTipoCompra(dlb.getTipoCompra());
			detalleLibro.setTipoDocumento(dlb.getTipoDocumento());
			detalleLibro.setCodigoDocumento(dlb.getCodigoDocumento());
			detalleLibro.setNombreTercero(dlb.getNombreTercero());
			
			detalleLibro.setCreadoPor((Integer)req.getSession().getAttribute("idUser"));
			detalleLibro.setFechaCreacion(Dates.fechaCreacion());
			detalleLibro.setEstado("enabled");
		
			em.persist(detalleLibro);
			

			Factura facturaX = null;
			Factura facturaY = null;
			
			switch(dlb.getTipoOperacion()){
			case "Pago Proveedor":				
				facturaX = em.find(Factura.class, dlb.getIdFactura());
				facturaY = em.merge(facturaX);	//Esta y la de arriba linea podrian ir al comienzo 
				
				switch(dlb.getAction()){
				case "pTotal":
					facturaY.setEstado("Cancelado");
					facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
					facturaY.setEstadoDetraccion("Cancelado");
					facturaY.setFechaCancelacionDetraccion(detalleLibro.getFechaOperacion());
					
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Cancelado");
					break;
				case "pDetraccion":
					if(facturaX.getEstado().equals("Falta Detraccion")){
						facturaY.setEstado("Cancelado");
						facturaY.setEstadoDetraccion("Cancelado");
						facturaY.setFechaCancelacionDetraccion(detalleLibro.getFechaOperacion());
						
						actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Cancelado");
					}else{
						facturaY.setEstado("Solo Detraccion");
						facturaY.setEstadoDetraccion("Cancelado");
						facturaY.setFechaCancelacionDetraccion(detalleLibro.getFechaOperacion());
					
						actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Solo Detraccion");
					}
					break;
				case "pSinDetraccion":
					if(facturaX.getEstado().equals("Solo Detraccion")){
						facturaY.setEstado("Cancelado");
						facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
						
						actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Cancelado");
					}else{
						facturaY.setEstado("Falta Detraccion");
						facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
					
						actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Falta Detraccion");
					}
					break;
				}
				break;
				
				
				
			case "Detraccion Proveedor":
				facturaX = em.find(Factura.class, dlb.getIdFactura());
				facturaY = em.merge(facturaX);
				if(facturaX.getEstado().equals("Falta Detraccion")){
					facturaY.setEstado("Cancelado");
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Cancelado");
				}else{
					facturaY.setEstado("Solo Detraccion");
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Solo Detraccion");
				}
				facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
				
				facturaY.setEstadoDetraccion("Cancelado");
				facturaY.setFechaCancelacionDetraccion(detalleLibro.getFechaOperacion());
				break;
			case "Cobranza Venta/Servicio":
				//Lo mismo que Pago Proveedor
				facturaX = em.find(Factura.class, dlb.getIdFactura());
				facturaY = em.merge(facturaX);
				if(facturaX.getEstado().equals("Solo Detraccion")){
					facturaY.setEstado("Cancelado");
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Cancelado");
				}else{
					facturaY.setEstado("Falta Detraccion");	//Ha pagao el total - detraccion, con el checkbox Pagar Detraccion se cambiaria a Cancelado
					
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Falta Detraccion");
				}
				facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
				break;
			case "Detraccion":
				facturaX = em.find(Factura.class, dlb.getIdFactura());
				facturaY = em.merge(facturaX);
				if(facturaX.getEstado().equals("Falta Detraccion")){
					facturaY.setEstado("Cancelado");
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Cancelado");
				}else{
					facturaY.setEstado("Solo Detraccion");
					actualizarEstadoCuenta(facturaX.getFacturaCuenta().getIdCuenta(), "Solo Detraccion");
				}
				facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
				
				facturaY.setEstadoDetraccion("Cancelado");
				facturaY.setFechaCancelacionDetraccion(detalleLibro.getFechaOperacion());
				break;
			}

			
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	@Transactional
	private void actualizarEstadoCuenta(int idCuenta, String estado){
		Cuenta cX = em.find(Cuenta.class, idCuenta);
		Cuenta cY = em.merge(cX);
		
		cY.setEstado(estado);
	}
	
	@SuppressWarnings("unchecked")
	public List<DetalleLibroBean> listarDetalleLibro(Integer idLibro, HttpServletRequest req){
		List<DetalleLibroBean> registros = new ArrayList<DetalleLibroBean>();
		
		double saldo = 0;
		Query q01 = em.createNativeQuery("SELECT dl.iddetallelibro, dl.fechaoperacion, dl.tipooperacion, dl.operacion, dl.monto, dl.descripcion, f.codigo, "
			+ "o.idorden, o.nombre, p.nombre AS np FROM detallelibro dl "
			+ "INNER JOIN factura f ON f.idfactura = dl.idfactura "
			+ "INNER JOIN orden o ON o.idorden = dl.idorden "
			+ "INNER JOIN proveedor p ON p.idproveedor = dl.idproveedor "
			+ "WHERE dl.idlibro = '"+ idLibro +"' ORDER BY dl.fechaoperacion AND dl.estado = 'enabled'");
		
		try{
			List<Object[]> rows = q01.getResultList();
			
			for(int x = 0; x < rows.size(); x++){
				Object[] obj = rows.get(x);
				DetalleLibroBean dlb = new DetalleLibroBean();
				
				dlb.setIdDetalleLibro((Integer)obj[0]);
				dlb.setFechaOperacion(Dates.stringToStringFechaCorta(obj[1].toString()));
				dlb.setTipoOperacion(obj[2].toString());
				
				dlb.setCodigoDocumento(obj[6].toString());
				dlb.setIdOrden((Integer)obj[7]);
				dlb.setNombreOrden(obj[8].toString());
				dlb.setNombreProveedor(obj[9].toString());
				
				if(obj[3].equals("Ingreso")){
					dlb.setIngreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[4].toString())));
					saldo += Formatos.StringToBigDecimal(obj[4].toString()).doubleValue();
					
					System.out.println("Ingreso Saldo" + saldo);
				}else{
					dlb.setEgreso(Formatos.BigBecimalToString(Formatos.StringToBigDecimal(obj[4].toString())));
					saldo -= Formatos.StringToBigDecimal(obj[4].toString()).doubleValue();
					System.out.println("Egreso Saldo" + saldo);
				}
				
				dlb.setDescripcion(obj[5].toString());
				
				switch(req.getSession().getAttribute("tipo").toString()){
				case "cliente":
					dlb.setSaldo(Formatos.BigBecimalToString(BigDecimal.valueOf(saldo * -1)));
					break;
				}
				
				//dlb.setSaldo(Formatos.BigBecimalToString(BigDecimal.valueOf(saldo)));
				
				registros.add(dlb);
			}
			Collections.reverse(registros);
			
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
