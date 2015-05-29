package com.simularte.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.DetalleLibroBean;
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
			detalleLibro.setTipoCompra(dlb.getTipoCompra());
			detalleLibro.setTipoDocumento(dlb.getTipoDocumento());
			detalleLibro.setCodigoDocumento(dlb.getCodigoDocumento());
			detalleLibro.setNombreTercero(dlb.getNombreTercero());
			
			detalleLibro.setCreadoPor((Integer)session.getAttribute("idUser"));
			detalleLibro.setFechaCreacion(Dates.fechaCreacion());
			detalleLibro.setEstado("enabled");
		
			em.persist(detalleLibro);
			
			/*if(dlb.getTipoOperacion().equals("Cobranza Venta/Servicio") || dlb.getTipoOperacion().equals("Pago Proveedor")){
				Factura facturaX = em.find(Factura.class, dlb.getIdFactura());
				Factura facturaY = em.merge(facturaX);
				
				facturaY.setEstado("Falta Detraccion");	//Ha pagao el total - detraccion, con el checkbox Pagar Detraccion se cambiaria a Cancelado
				facturaY.setFechaCancelacion(detalleLibro.getFechaOperacion());
			}*/
			Factura facturaX = null;
			Factura facturaY = null;
			
			switch(dlb.getTipoOperacion()){
			
			case "Pago Proveedor":
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
			}
			
			
			
			/*if(dlb.getTipoOperacion().equals("Detraccion")){
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
				
			}*/
			//Por ahora mientras se crea el modulo de Gestion de Obras el estado se cambia segun la condicion de pago al Proveedor 
			//Recordas que podria traer problemas si 2 o mas proveedores vienen con el mismo codigo de factura
			Query q01 = em.createNativeQuery("SELECT o.idorden, c.estadotrabajo, c.avance FROM factura f "
					+ "INNER JOIN cuenta c ON f.idcuenta = c.idcuenta "
					+ "INNER JOIN orden o ON c.idorden = o.idorden "
					+ "WHERE f.tipo = 'Recibida' AND f.codigo = '" + detalleLibro.getFactura() + "' AND o.idempresa = '" + session.getAttribute("idEmpresa") + "'");
			
			Object[] obj = (Object[])q01.getSingleResult();				//Cuando se inicializa DB da un error 500 porque no encuentra nada
			System.out.println("AVANCE: " + obj[2].toString());
			String estadoObra = "";
			if(obj[2].toString().equals("0.0")){
				estadoObra = obj[1].toString();
			}else{
				estadoObra = obj[1].toString() + " " + obj[2].toString() + "%";
			}
			
			Query q02 = em.createNativeQuery("UPDATE orden SET estado = '" + estadoObra + "' WHERE idorden = '" + (Integer)obj[0] + "'");
			q02.executeUpdate();
			
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
		Query q = em.createNativeQuery("SELECT iddetallelibro, fechaoperacion, tipooperacion, operacion, monto, descripcion "
				+ "FROM detallelibro "
				+ "WHERE idlibro = '" + idLibro + "' ORDER BY fechaoperacion");
		
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
