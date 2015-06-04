package com.simularte.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.CuentaBean;
import com.simularte.bean.OrdenBean;
import com.simularte.model.Cliente;
import com.simularte.model.Cuenta;
import com.simularte.model.Empresa;
import com.simularte.model.Orden;
import com.simularte.model.Proveedor;
import com.simularte.model.Subcontrato;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;
import com.simularte.util.Valores;

@Service
public class OrdenServiceImpl implements OrdenService {

	@PersistenceContext 
	EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> mostrarMasterDeudaOT(String tipo, HttpServletRequest req){
		List<OrdenBean> ordenes = new ArrayList<OrdenBean>();
		//Funciona para 1 solo Proveedor, mejorarlo a n Proveedores
		Query q01 = null;
		if(tipo.equals("cliente")){
			q01 = em.createNativeQuery("SELECT o.idorden, o.nombre, o.oferta, o.estado, o.pagado, sc.monto, p.nombre as np FROM orden o "
					+ "INNER JOIN subcontrato sc ON sc.idorden = o.idorden "
					+ "INNER JOIN proveedor p ON p.idproveedor = sc.idproveedor "
					+ "WHERE o.idempresa = '"+ (Integer)req.getSession().getAttribute("idEmpresa") +"'");
		}else{
			q01 = em.createNativeQuery("SELECT o.idorden, o.nombre, o.oferta, o.estado, o.pagado, sc.monto, p.nombre as np, e.nombre as ne FROM orden o "
					+ "INNER JOIN subcontrato sc ON sc.idorden = o.idorden "
					+ "INNER JOIN proveedor p ON p.idproveedor = sc.idproveedor "
					+ "INNER JOIN empresa e ON e.idempresa = o.idempresa "
					+ "WHERE p.ruc = '"+ req.getSession().getAttribute("ruc") +"'");
		}
		
		try{
			List<Object[]> rows01 = q01.getResultList();
			
			for(int x = 0; x < rows01.size(); x++){
					
				Object[] obj01 = rows01.get(x);
				OrdenBean ob = new OrdenBean();
				
				ob.setIdOrden((Integer)obj01[0]);
				ob.setNombre(obj01[1].toString());
				//El Cliente debe ver el monto que le tiene que pagar al Proveedor
				//ob.setOferta(Formatos.StringToBigDecimal(obj01[2].toString()));
				ob.setOferta(Formatos.StringToBigDecimal(obj01[5].toString()));
				
				if(tipo.equals("cliente")){
					ob.setNombreProveedor(obj01[6].toString());
				}else{
				ob.setNombreCliente(obj01[7].toString());
				}
				
				ob.setEstado(obj01[3].toString());
				ob.setPagado(Formatos.StringToBigDecimal(obj01[4].toString()));
				
				Query q02 = em.createNativeQuery("SELECT c.idcuenta, c.estadotrabajo, c.monto FROM cuenta c WHERE c.tipo = 'pagar' AND c.idorden = '"+ ob.getIdOrden() +"'");
				List<Object[]> rows02 = q02.getResultList();
				
				BigDecimal totalDeudaCorrespondiente = BigDecimal.ZERO;
				BigDecimal deudaActual = BigDecimal.ZERO;
				BigDecimal deudaComprometida = BigDecimal.ZERO;
								
				for(int y = 0; y < rows02.size(); y++){
					Object[] obj02 = rows02.get(y);
							
					if(ob.getEstado().equals(obj02[1].toString())){
						System.out.println("COINCIDIO: " + ob.getEstado() + ", idCuenta: " + obj02[0]);
						Query q03 = null;
						
						switch(obj02[1].toString()){
						case "Sin inicio":
							q03 = em.createNativeQuery("SELECT SUM(c.monto) as acumuladoDeudaComprometida FROM cuenta c "
									+ "WHERE c.tipo = 'pagar' AND c.idorden = '"+ ob.getIdOrden() +"' AND c.estadotrabajo = 'Sin inicio'");
							break;
						case "Por iniciar":
							q03 = em.createNativeQuery("SELECT SUM(c.monto) as acumuladoDeudaComprometida FROM cuenta c "
									+ "WHERE c.tipo = 'pagar' AND c.idorden = '"+ ob.getIdOrden() +"' AND (c.estadotrabajo = 'Sin inicio' OR c.estadotrabajo = 'Por iniciar')");
							break;
						case "Proceso":
							q03 = em.createNativeQuery("SELECT SUM(c.monto) as acumuladoDeudaComprometida FROM cuenta c "
									+ "WHERE c.tipo = 'pagar' AND c.idorden = '"+ ob.getIdOrden() +"' AND (c.estadotrabajo = 'Sin inicio' OR c.estadotrabajo = 'Por iniciar' OR c.estadotrabajo = 'Proceso')");
							break;
						case "Terminado":
							q03 = em.createNativeQuery("SELECT SUM(c.monto) as acumuladoDeudaComprometida FROM cuenta c "
									+ "WHERE c.tipo = 'pagar' AND c.idorden = '"+ ob.getIdOrden() +"' AND (c.estadotrabajo = 'Sin inicio' OR c.estadotrabajo = 'Por iniciar' OR c.estadotrabajo = 'Proceso' OR c.estadotrabajo = 'Terminado')");
							break;
						case "Aceptado":
							q03 = em.createNativeQuery("SELECT SUM(c.monto) as acumuladoDeudaComprometida FROM cuenta c "
									+ "WHERE c.tipo = 'pagar' AND c.idorden = '"+ ob.getIdOrden() +"'");
							break;
						}
						
						try{
							totalDeudaCorrespondiente = (BigDecimal)q03.getSingleResult();
						}catch(NullPointerException e){
							;
						}
						deudaActual = totalDeudaCorrespondiente.subtract(ob.getPagado());
						deudaComprometida = ob.getOferta().subtract(ob.getPagado());
						
					}else{
						System.out.println("Conidicion de Pago no encotntrada: " + ob.getEstado());	//Se podria hacer un case con los estados parecido al anterior
					}
				}
				
					
				
				
				ob.setDeudaCorrespondiente(totalDeudaCorrespondiente);
				ob.setDeudaActual(deudaActual);
				ob.setDeudaComprometida(deudaComprometida);
				
				ordenes.add(ob);
			}
		}catch(NoResultException e){
			e.printStackTrace();
		}
		
		return ordenes;
	}
		
	@Transactional
	public String editarOrdenEstado(String accion, int idOrden){
		//Aqui el Jefe (Cliente) aprueba la orden, podria mejorarse o cambiar
		String result = "";
		
		Orden ordenX = em.find(Orden.class, idOrden);
		Orden ordenY = em.merge(ordenX);
		
		if(accion.equals("aceptar")){
			ordenY.setEstado("Sin inicio");
			result = "Sin inicio";
		}else{
			ordenY.setEstado("Rechazada");
			result = "Rechazada";
		}
		
		return result;
	}
	
	@Transactional
	public boolean editarOrden(OrdenBean ob, String action, HttpServletRequest req){
		boolean result = false;
		
		Orden ordenX = em.find(Orden.class, ob.getIdOrden());
		Orden ordenY = em.merge(ordenX);
		
		switch(action){
		case "masOrd":
			Cliente cliente = em.find(Cliente.class, ob.getIdCliente());
			
			ordenY.setNombre(ob.getNombre());
			ordenY.setCiudad(ob.getCiudad());
			ordenY.setOrdenCliente(cliente);
			ordenY.setTipoTrabajo(ob.getTipoTrabajo());
			ordenY.setFechaInicio(Dates.stringToDate(ob.getFechaInicio(), "yyyy-MM-dd"));
			ordenY.setFechaEntrega(Dates.stringToDate(ob.getFechaEntrega(), "yyyy-MM-dd"));
			ordenY.setEstado(ob.getEstado());
			break;		
		case "masDeu":
			switch(req.getSession().getAttribute("rol").toString()){
			case "Supervisor":
				ordenY.setEstado(ob.getEstado());
				break;
			case "Contable":
				ordenY.setPagado(ob.getPagado());
				break;
			}
			break;
		}
		result = true;
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> mostrarMasterOT(HttpServletRequest req){
		List<OrdenBean> ordenes = new ArrayList<OrdenBean>();
		
		Query q01 = em.createNativeQuery("SELECT o.idorden, o.codigo, o.nombre, c.idcliente, c.nombre as cliente, "
				+ "o.tipoorden, o.tipotrabajo, o.fechainicio, o.fechaentrega, o.estado, o.oferta, o.ciudad FROM orden o "
				+ "INNER JOIN cliente c ON o.idcliente = c.idcliente "
				+ "WHERE o.idempresa = "+ (Integer)req.getSession().getAttribute("idEmpresa") +" AND o.estado != 'Borrado'");
		
		List<Object[]> rows01 = q01.getResultList();
		
		for(int x = 0; x < rows01.size(); x++){
			Object[] obj01 = rows01.get(x);
			OrdenBean ob = new OrdenBean();
			
			ob.setIdOrden((Integer)obj01[0]);
			ob.setCodigo(obj01[1].toString());
			ob.setNombre(obj01[2].toString());
			ob.setIdCliente((Integer)obj01[3]);
			ob.setNombreCliente(obj01[4].toString());
			ob.setTipoOrden(obj01[5].toString());
			ob.setTipoTrabajo(obj01[6].toString());
			ob.setFechaInicio(Dates.stringToStringFechaCorta(obj01[7].toString()));
			ob.setFechaEntrega(Dates.stringToStringFechaCorta(obj01[8].toString()));
			ob.setEstado(obj01[9].toString());
			ob.setOferta(Formatos.StringToBigDecimal(obj01[10].toString()));
			ob.setCiudad(obj01[11].toString());
			

			ordenes.add(ob);
		}
		
		return ordenes;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> mostrarReporteOT(HttpServletRequest req){
		List<OrdenBean> ordenes = new ArrayList<OrdenBean>();
		
		Query q01 = em.createNativeQuery("SELECT o.codigo, o.nombre, p.nombre as nombreProv, o.estado, SUM(c.monto) as pagar, o.idorden FROM orden o "
				+ "INNER JOIN cuenta c ON o.idorden = c.idorden "
				+ "INNER JOIN subcontrato sc ON c.idsubcontrato = sc.idsubcontrato "
				+ "INNER JOIN proveedor p ON sc.idproveedor = p.idproveedor "
				+ "WHERE c.tipo = 'pagar' GROUP BY codigo");
		
		Query q02 = em.createNativeQuery("SELECT o.codigo, f.cobrarfactura, f.estado, f.montodetraccion, f.estadodetraccion, "
				+ "SUM((CASE WHEN (f.estadodetraccion = 'Cancelado') THEN f.montodetraccion ELSE 0 END)) as DetraccionPagada, "
				+ "SUM((CASE WHEN (f.estadodetraccion = 'Cancelado') THEN (CASE WHEN (f.estado != 'Solo Detraccion') THEN f.cobrarfactura + f.montodetraccion ELSE f.montodetraccion END) ELSE f.cobrarfactura END)) as TotalPagado "
				+ "FROM orden o "
				+ "INNER JOIN cuenta c ON o.idorden = c.idorden "
				+ "INNER JOIN factura f ON c.idcuenta = f.idcuenta "
				+ "INNER JOIN subcontrato sc ON c.idsubcontrato = sc.idsubcontrato "
				+ "INNER JOIN proveedor p ON sc.idproveedor = p.idproveedor "
				+ "WHERE f.tipo = 'Recibida' AND f.estado = 'Cancelado' OR f.estado = 'Falta Detraccion' OR f.estado = 'Solo Detraccion' GROUP BY o.codigo");
		
		List<Object[]> rows01 = q01.getResultList();
		List<Object[]> rows02 = q02.getResultList();
		
		double totalPagar = 0;
		double totalPagado = 0;
		double totalDetraccionPagado = 0;
		double totalDeuda = 0;
		
		for(int x = 0; x < rows01.size(); x++){
			Object[] obj01 = rows01.get(x);
			OrdenBean ob = new OrdenBean();
			
			ob.setIdOrden((Integer)obj01[5]);
			ob.setCodigo(obj01[0].toString());
			ob.setNombre(obj01[1].toString());
			ob.setNombreProveedor(obj01[2].toString());
			ob.setEstado(obj01[3].toString());
			
			BigDecimal tMonto = Formatos.StringToBigDecimal(obj01[4].toString());
			BigDecimal igv = tMonto.multiply(Valores.IGV).setScale(2, RoundingMode.HALF_UP);
			BigDecimal tPagar = tMonto.add(igv);
			
			ob.setTotalPagarProveedor(Formatos.BigBecimalToString(tPagar));
			System.out.println("tMonto: " + tMonto + ", igv: " + igv + ", totalPagar " + ob.getCodigo() + " : " + ob.getTotalPagarProveedor());
			BigDecimal tPagado = BigDecimal.ZERO;
			BigDecimal tPagadoDetraccion = BigDecimal.ZERO;
			ob.setTotalPagadoProveedor(Formatos.BigBecimalToString(tPagado));		//DB inicializada no entra al segundo For
			
			for(int y = 0; y < rows02.size(); y++){
				Object[] obj02 = rows02.get(y);
				
				if(obj01[0].toString().equals(obj02[0].toString())){
					tPagado = Formatos.StringToBigDecimal(obj02[6].toString());			//Total Pagado (Monto + IGV + Detraccion)
					ob.setTotalPagadoProveedor(Formatos.BigBecimalToString(tPagado));
					break;
					
				}else{
					tPagado = BigDecimal.ZERO;
					ob.setTotalPagadoProveedor(Formatos.BigBecimalToString(tPagado));
				}
			} 
			
			BigDecimal perc = new BigDecimal("100");
			double pagadoPerc = tPagado.multiply(perc).divide(tPagar, 2, RoundingMode.HALF_UP).doubleValue();
			BigDecimal tDeu = tPagar.subtract(tPagado);
			
			ob.setPorcentajePagado(Double.toString(pagadoPerc));
			ob.setTotalDeudaProveedor(Formatos.BigBecimalToString(tDeu));
			
			totalPagar += tPagar.doubleValue();
			totalPagado += tPagado.doubleValue();
			totalDeuda += tDeu.doubleValue();
			totalDetraccionPagado += tPagadoDetraccion.doubleValue();
			
			ob.setTotalPagar(Formatos.BigBecimalToString(BigDecimal.valueOf(totalPagar)));
			ob.setTotalPagado(Formatos.BigBecimalToString(BigDecimal.valueOf(totalPagado)));
			ob.setTotalDeuda(Formatos.BigBecimalToString(BigDecimal.valueOf(totalDeuda)));
			ob.setTotalPagadoDetraccionProveedor(Formatos.BigBecimalToString(BigDecimal.valueOf(totalDetraccionPagado)));
			
			double totalPercPagado = (totalPagado * 100) / totalPagar;
			ob.setTotalPorcentajePagado(BigDecimal.valueOf(totalPercPagado).setScale(2, RoundingMode.HALF_UP) + "%");
			
			ordenes.add(ob);
		}
		
		return ordenes;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> getOrdenesSuggest(String codigo, HttpServletRequest req){
		List<OrdenBean> resultados = new ArrayList<OrdenBean>();
		
		Query q01 = em.createNativeQuery("SELECT o.idorden, o.codigo FROM orden o "
				+ "WHERE o.estado != 'disabled' AND o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") +"' AND o.codigo LIKE '%" + codigo + "%'");
		
		List<Object[]> rows = q01.getResultList();
		
		for(int x = 0; x < rows.size(); x++){
			Object[] obj = rows.get(x);
			OrdenBean ob = new OrdenBean();
			
			ob.setIdOrden((Integer)obj[0]);
			ob.setCodigo(obj[1].toString());
			
			resultados.add(ob);
		}
		
		return resultados;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> buscarOrdenCaja(int idFactura, HttpServletRequest req){
		List<OrdenBean> resultados = new ArrayList<OrdenBean>();
		
		Query q01 = em.createNativeQuery("SELECT o.idorden, o.codigo, f.idfactura FROM factura f "
				+ "INNER JOIN cuenta c ON c.idcuenta = f.idcuenta "
				+ "INNER JOIN orden o ON o.idorden = c.idorden "
				+ "WHERE o.idempresa = '" + (Integer)req.getSession().getAttribute("idEmpresa") + "' AND f.idfactura = '" + idFactura + "'");
		
		List<Object[]> rows = q01.getResultList();
		
		for(int x = 0; x < rows.size(); x++){
			Object[] obj = rows.get(x);
			OrdenBean ob = new OrdenBean();
			
			ob.setIdOrden((Integer)obj[0]);
			ob.setCodigo(obj[1].toString());
			
			resultados.add(ob);
		}
		
		return resultados;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> buscarOrdenFactura(HttpServletRequest req){
		List<OrdenBean> resultados = new ArrayList<OrdenBean>();
		
		Query q01 = em.createQuery("SELECT o FROM Orden o WHERE estado != :estado AND idempresa = :idEmpresa");
		q01.setParameter("estado", "Aceptado");
		q01.setParameter("idEmpresa", (Integer)req.getSession().getAttribute("idEmpresa"));
		
		List<Orden> ordenes = q01.getResultList();
		
		for(int x = 0; x < ordenes.size(); x++){
			Orden orden = ordenes.get(x);
			OrdenBean ob = new OrdenBean();
			
			ob.setIdOrden(orden.getIdOrden());
			ob.setCodigo(orden.getCodigo());
			
			resultados.add(ob);
		}
		
		return resultados;
	}
	
	@Transactional
	public int crearOrden(OrdenBean ordenBean, int idCliente, String[] cobrosCliente, String[] subCont, String[] pagProv, HttpServletRequest req) {
		int idOrden = -1;
		//Preguntar si el IGV  y la Detraccion se redondea a 3 o 2 digitos, porque en algunos casos hay una diferencia de -1 centimo,
		//EJEMPLO: Ofera = 10,344.24, igv = 1861.9632, redondeado a 2 IGV sale la detraccion 488.24, pero sin rendondeo sale 488.248128
		//si lo ultimo que redondeo a 2 es 488.248128 entonces tengo 488.25 
		try{
			HttpSession session = req.getSession();
			
			Empresa empresa = em.find(Empresa.class, (Integer)session.getAttribute("idEmpresa"));
			Cliente cliente = em.find(Cliente.class, idCliente);
			
			Orden orden = new Orden();
			
			orden.setOrdenCliente(cliente);
			orden.setOrdenEmpresa(empresa);
			orden.setCodigo("");
			orden.setNombre(ordenBean.getNombre());
			orden.setTipoOrden(ordenBean.getTipoOrden());
			orden.setTipoTrabajo(ordenBean.getTipoTrabajo());
			orden.setLat(Double.parseDouble(ordenBean.getLat().replace("°", "")));
			orden.setLon(Double.parseDouble(ordenBean.getLon().replace("°", "")));
			orden.setCiudad(ordenBean.getCiudad());
			orden.setDepartamento(ordenBean.getDepartamento());
			//orden.setOferta(ordenBean.getOferta());
			orden.setOferta(BigDecimal.ZERO);
			//orden.setOfertaIgv(ordenBean.getOfertaIgv());
			orden.setOfertaIgv(BigDecimal.ZERO);
			//orden.setMoneda(ordenBean.getMoneda());
			orden.setMoneda("dolar americano");
			
			orden.setEficiencia(ordenBean.getEficiencia());
			orden.setUtilidadBruta(ordenBean.getUtilidadBruta());
			orden.setGastosGenerales(ordenBean.getGastosGenerales());
			orden.setTotal(ordenBean.getTotal());	
			orden.setFechaInicio(Dates.stringToDate(ordenBean.getFechaInicio(), "yyyy-MM-dd"));
			orden.setFechaEntrega(Dates.stringToDate(ordenBean.getFechaEntrega(), "yyyy-MM-dd"));
			orden.setDetraccion(ordenBean.getDetraccion());
			orden.setGananciaProyectada(ordenBean.getGananciaProyectada());
			orden.setGananciaDisponible(ordenBean.getGananciaDisponible());
						
			orden.setCreadoPor((Integer)session.getAttribute("idUser"));
			orden.setFechaCreacion(Dates.fechaCreacion());
			orden.setEstado("Aceptacion Pendiente");
			orden.setPagado(BigDecimal.ZERO);
			
			em.persist(orden);
			
			Orden ordenY = em.merge(orden);
			ordenY.setCodigo("OT-" + orden.getTipoOrden() + "-" + String.format("%05d", orden.getIdOrden()));
		
			/*ArrayList<Cuenta> cobros = new ArrayList<Cuenta>();
			int restoCobros;
			for(int x = 0; x < cobrosCliente.length; x++){
				//System.out.println("valor: " + cobrosCliente[x]);
				restoCobros = x%5;
				if(restoCobros == 0){
					System.out.println("resto " + restoCobros + ", creo Cuenta y monto: " + cobrosCliente[x]);
					Cuenta cu = new Cuenta();

					cu.setTipo("cobrar");
					cu.setMonto(Formatos.StringToBigDecimal(cobrosCliente[x]));
					cu.setCuentaOrden(orden);
					
					cobros.add(cu);
				}else{
					int index = cobros.size()-1;
					
					switch(restoCobros){
					case 1:
						System.out.println("resto " + restoCobros + ", x: " + x + ", tipoPago: " + cobrosCliente[x]);
						cobros.get(index).setTipoPago(cobrosCliente[x]);
						break;
					case 2:
						System.out.println("resto " + restoCobros + ", x: " + x + ", condicion: " + cobrosCliente[x]);
						cobros.get(index).setEstadoTrabajo(cobrosCliente[x]);
						break;
					case 3:
						System.out.println("resto " + restoCobros + ", x: " + x + ", avance: " + cobrosCliente[x]);
						cobros.get(index).setAvance(Double.parseDouble(cobrosCliente[x]));
						break;
					case 4:
						System.out.println("resto " + restoCobros + ", x: " + x + ", fecha Vencimiento: " + cobrosCliente[x]);
						cobros.get(index).setFechaVencimiento(Dates.stringToDate(cobrosCliente[x], "yyyy-MM-dd"));
						break;
					}
				}
			}
			
			
			for(int x = 0; x < cobros.size(); x++){	
				cobros.get(x).setCreadoPor((Integer)session.getAttribute("idUser"));
				cobros.get(x).setFechaCreacion(Dates.fechaCreacion());
				cobros.get(x).setEstado("Pendiente");
				em.persist(cobros.get(x));
				
				//GENERAR LAS FACTURAS (PROBABLEMENTE YA NO SE USE ASI)
				/*Factura factura = new Factura();
				
				factura.setFacturaCuenta(cobros.get(x));
				factura.setSubTotal(cobros.get(x).getMonto().subtract(cobros.get(x).getMonto().multiply(Valores.IGV)));
				factura.setConIgv(cobros.get(x).getMonto());
				
				if(orden.getTipoTrabajo().equals("Obra")){
					factura.setDetraccion(4);
				}else{
					factura.setDetraccion(10);
				}
				
				factura.setMontoDetraccion(factura.getConIgv().multiply(BigDecimal.valueOf(factura.getDetraccion() * 0.01)));
				factura.setCobrarFactura(factura.getConIgv().subtract(factura.getMontoDetraccion()));
				factura.setEstado("Creado");
				factura.setEstadoDetraccion("Pendiente");
				
				factura.setTotal(factura.getConIgv());		//Por ahora porque son facturas emitidas por 1 solo concepto, cuando sean grupales se creara DetalleFactura
				factura.setTipo("Emitida");
				factura.setCreadoPor((Integer)req.getSession().getAttribute("idUser"));
				factura.setFechaCreacion(Dates.fechaCreacion());
				
				em.persist(factura);
				
				Factura facturaY = em.merge(factura);
				
				facturaY.setCodigo(String.format("%05d", factura.getIdFactura())); (PROBABLEMENTE YA NO SE USE ASI)
			}*/
			
			
			
			
			//Convierte el array de String a un array de Subcontratos, con JSON esta parte ya seria automatica
			ArrayList<Subcontrato> subContratos = new ArrayList<Subcontrato>();
			int resto;		
			System.out.println("subCont.length: " + subCont.length);
			for(int x = 0; x < subCont.length; x++){
				resto = x%6;
				if(resto == 0){
					System.out.println("resto: " + resto + "creo Proveedor");
					Subcontrato subc = new Subcontrato();
					
					Proveedor proveedor = em.find(Proveedor.class, Integer.parseInt(subCont[x]));
					
					subc.setProveedorSubcontrato(proveedor);
					subc.setOrdenSubcontrato(orden);
					
					subContratos.add(subc);
				}else{
					System.out.println("size Subcontratos: " + subContratos.size());
					int index = subContratos.size()-1;
					System.out.println("index: " + index);
					switch(resto){
					case 1:
						System.out.println("resto " + resto + ", x: " + x + ", tipo trabajo: " + subCont[x]);
						subContratos.get(index).setTipoTrabajo(subCont[x]);
						break;
					case 2:
						System.out.println("resto " + resto + ", x: " + x + ", moneda: " + subCont[x]);
						subContratos.get(index).setMoneda(subCont[x]);
						break;
					case 3:
						subContratos.get(index).setMonto(Formatos.StringToBigDecimal(subCont[x]));
						System.out.println("resto " + resto + ", x: " + x + ", monto: " + subContratos.get(index).getMonto());
						break;
					case 4:
						System.out.println("resto " + resto + ", x: " + x + ", termino: " + subCont[x]);
						subContratos.get(index).setFechaTerminoObra(Dates.stringToDate(subCont[x], "yyyy-MM-dd"));
						break;
					case 5:
						System.out.println("resto " + resto + ", x: " + x + ", estado: " + subCont[x]);
						subContratos.get(index).setEstado(subCont[x]);
						break;	
					}
				}
			}
			
			Map<Integer, Subcontrato> subcontratosMap = new HashMap<Integer, Subcontrato>();
			
			//El Array de Subcontratos se graba, con JSON esto ya seria directo aqui
			for(int x = 0; x < subContratos.size(); x++){			
				subContratos.get(x).setCreadoPor((Integer)session.getAttribute("idUser"));
				subContratos.get(x).setFechaCreacion(Dates.fechaCreacion());
				//subContratos.get(x).setEstado("enabled");
				System.out.println("Grabar Subcontrato: " + subContratos.get(x).getMonto());
				if(subContratos.get(x).getEstado().equals("enabled")){
					em.persist(subContratos.get(x));
					//
					subcontratosMap.put(subContratos.get(x).getProveedorSubcontrato().getIdProveedor(), subContratos.get(x));
				}				
			}
			
			//Grabamos las cuentas de tipo pago
			ArrayList<Cuenta> cuenta_prov = new ArrayList<Cuenta>();
			int resto2;		
			for(int x = 0; x < pagProv.length; x++){
				resto2 = x%6;				
				if(resto2 == 0){
					System.out.println("resto " + resto2 + ", creo Cuenta Proveedor e idProveedor: " + pagProv[x]);
					Cuenta cu = new Cuenta();
					
					Subcontrato sbcontrato = subcontratosMap.get(Integer.parseInt(pagProv[x]));
					
					cu.setCuentaSubcontrato(sbcontrato);
					cu.setTipo("pagar");
					cuenta_prov.add(cu);
				}else{
					System.out.println("size cuentas: " + cuenta_prov.size());
					int index = cuenta_prov.size()-1;
					System.out.println("index: " + index);
					switch(resto2){
						case 1:
							System.out.println("resto " + resto2 + ", x: " + x + ", monto: " + pagProv[x]);
							cuenta_prov.get(index).setMonto(Formatos.StringToBigDecimal(pagProv[x]));						
							break;
						case 2:
							System.out.println("resto " + resto2 + ", x: " + x + ", tipo pago: " + pagProv[x]);
							cuenta_prov.get(index).setTipoPago(pagProv[x]);						
							break;	
						case 3:
							System.out.println("resto " + resto2 + ", x: " + x + ", condicion: " + pagProv[x]);
							cuenta_prov.get(index).setEstadoTrabajo(pagProv[x]);	
							break;
						case 4:
							System.out.println("resto " + resto2 + ", x: " + x + ", avance: " + pagProv[x]);
							cuenta_prov.get(index).setAvance(Double.parseDouble(pagProv[x]));
							break;
						case 5:
							System.out.println("resto " + resto2 + ", x: " + x + ", fecha ven: " + pagProv[x]);
							cuenta_prov.get(index).setFechaVencimiento(Dates.stringToDate(pagProv[x], "yyyy-MM-dd"));
							break;
					}
				}
					
			}
				
						
			//El Array de Subcontratos se graba, con JSON esto ya seria directo aqui
			for(int x = 0; x < cuenta_prov.size(); x++){	
				cuenta_prov.get(x).setCuentaOrden(orden);
				cuenta_prov.get(x).setCreadoPor((Integer)session.getAttribute("idUser"));
				cuenta_prov.get(x).setFechaCreacion(Dates.fechaCreacion());
				cuenta_prov.get(x).setEstado("Pendiente");
				em.persist(cuenta_prov.get(x));
				
				//if(pagosprov.get(x).getEstado().equals("enabled")){
					//em.persist(pagosprov.get(x));
				//}				
			}
			
			
			idOrden = orden.getIdOrden();
		}catch(Exception e){
			e.printStackTrace();
		}
		return idOrden;
	}
	
	@SuppressWarnings("unchecked")
	public List<OrdenBean> buscarOrden(OrdenBean ordenBean, HttpServletRequest req){
		List<OrdenBean> ordenBeans = new ArrayList<OrdenBean>();
		String campos = "";
		String from = "";
		String join = "";
		String condiciones = "";
		int idClienteEmp = 0;
		
		try{
			Query p01 = em.createNativeQuery("SELECT c.idcliente FROM cliente c WHERE c.ruc = '"+ req.getSession().getAttribute("ruc") +"'");
			idClienteEmp = (Integer)p01.getSingleResult();
		}catch(NoResultException e){
			;
		}
		
		from = "FROM orden o ";
		//join = "INNER JOIN o.ordenCliente cli ";
		//join += "INNER JOIN o.ordenEmpresa empr ";
		//condiciones = "WHERE empr.idEmpresa = :idEmpresa AND cli.idCliente = :idEmpresa";
		switch(req.getSession().getAttribute("tipo").toString()){
		case "cliente":
			campos = "o.idorden, o.codigo, o.nombre, cli.nombre as CN, o.oferta, o.estado ";
			join = "INNER JOIN cliente cli ON cli.idcliente = o.idcliente ";
			join += "INNER JOIN empresa empr ON empr.idempresa = o.idempresa ";
			condiciones = "WHERE empr.idempresa = '"+ (Integer) req.getSession().getAttribute("idEmpresa") + "' OR o.idcliente = '"+ idClienteEmp +"'";
			break;
		case "empresa":
			campos = "o.idorden, o.codigo, o.nombre, o.oferta, o.estado, o.idempresa, o.idcliente ";
			join = "INNER JOIN subcontrato sc ON sc.idorden = o.idorden ";
			join += "INNER JOIN proveedor p ON p.idproveedor = sc.idproveedor ";
			condiciones = "WHERE p.ruc = '"+ req.getSession().getAttribute("ruc") +"' OR o.idempresa = '"+ (Integer) req.getSession().getAttribute("idEmpresa") +"'";
		}
		/*if(!ordenBean.getCodigo().equals("")){
			condiciones += "AND o.codigo LIKE :codigo AND o.estado != 'disable' ";
		}
		if(!ordenBean.getNombreCliente().equals("")){
			condiciones += "AND cli.nombre LIKE :nombreCliente AND cli.estado != 'disable' ";
		}
		if(ordenBean.getOfertaMinima()!=null){
			condiciones += "AND o.oferta > :ofertaMinima ";
		}
		if(ordenBean.getOfertaMaxima()!=null){
			condiciones += "AND o.oferta < :ofertaMaxima ";
		}
		if(!ordenBean.getFechaCreacionMinima().equals("")){
			condiciones += "AND o.fechaCreacion > :fechaCreacionMinima ";
		}
		if(!ordenBean.getFechaCreacionMaxima().equals("")){
			condiciones += "AND o.fechaCreacion < :fechaCreacionMaxima ";
		}*/
		
		
		
		Query q = em.createNativeQuery("SELECT " + campos + from + join + condiciones);
		System.out.println("QUERY: SELECT DISTINCT " + campos + from + join + condiciones + "--- BASIC" );
		/*Query q = em.createQuery("SELECT DISTINCT " + campos + from + join + condiciones);

		q.setParameter("idEmpresa", (Integer)session.getAttribute("idEmpresa"));
		
		if(!ordenBean.getCodigo().equals("")){
			q.setParameter("codigo", "%" + ordenBean.getCodigo() + "%");
		}
		if(!ordenBean.getNombreCliente().equals("")){
			q.setParameter("nombreCliente", "%" + ordenBean.getNombreCliente() + "%");
		}
		if(ordenBean.getOfertaMinima()!=null){
			q.setParameter("ofertaMinima", ordenBean.getOfertaMinima());
		}
		if(ordenBean.getOfertaMaxima()!=null){
			q.setParameter("ofertaMaxima", ordenBean.getOfertaMaxima());
		}
		if(!ordenBean.getFechaCreacionMinima().equals("")){
			String[] dateSearchArray = ordenBean.getFechaCreacionMinima().split("/");
			String dateSearch = dateSearchArray[2]+"-"+dateSearchArray[1]+"-"+dateSearchArray[0];
			SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
			try{
				 q.setParameter("fechaCreacionMinima", formatoFecha.parse(dateSearch));		
			}catch(Exception e){
				 
			}
		}
		if(!ordenBean.getFechaCreacionMaxima().equals("")){
			String[] dateSearchArray = ordenBean.getFechaCreacionMaxima().split("/");
			String dateSearch = dateSearchArray[2]+"-"+dateSearchArray[1]+"-"+dateSearchArray[0];
			SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
			try{
				 q.setParameter("fechaCreacionMaxima", formatoFecha.parse(dateSearch));		
			}catch(Exception e){
				 
			}
		}*/
		List<Object[]> rows = q.getResultList();
		System.out.println("SIZE: " + rows.size());
		
		switch(req.getSession().getAttribute("tipo").toString()){
		case "cliente":
			for(int x = 0; x < rows.size(); x++){
				Object[] ord = rows.get(x);
				OrdenBean ordenB = new OrdenBean();
				ordenB.setIdOrden((Integer)ord[0]);
				ordenB.setCodigo(ord[1].toString());
				ordenB.setNombre(ord[2].toString());
				ordenB.setNombreCliente(ord[3].toString());			
				ordenB.setOferta(new BigDecimal(ord[4].toString()));
				ordenB.setEstado(ord[5].toString());
				
				ordenBeans.add(ordenB);
			}
			break;
		case "empresa":
			for(int x = 0; x < rows.size(); x++){
				Object[] ord = rows.get(x);
				OrdenBean ordenB = new OrdenBean();
				ordenB.setIdOrden((Integer)ord[0]);
				ordenB.setCodigo(ord[1].toString());
				ordenB.setNombre(ord[2].toString());		
				ordenB.setOferta(new BigDecimal(ord[3].toString()));
				ordenB.setEstado(ord[4].toString());
				
				if((Integer)ord[5] != (Integer)req.getSession().getAttribute("idEmpresa")){
					Query r01 = em.createNativeQuery("SELECT e.nombre FROM empresa e WHERE e.idempresa = '"+ (Integer)ord[5] +"'");
					ordenB.setNombreCliente(r01.getSingleResult().toString());
				}else{
					Query r01 = em.createNativeQuery("SELECT c.nombre FROM cliente c WHERE c.idcliente = '"+ (Integer)ord[6] +"'");
					ordenB.setNombreCliente(r01.getSingleResult().toString());
				}
				
				
				ordenBeans.add(ordenB);
			}
			break;
		}
		
		return ordenBeans;
	}
	
	public List<OrdenBean> buscarOrderPanel(HttpServletRequest req){
		List<OrdenBean> ordenBeans = new ArrayList<OrdenBean>();
		String estado = "";
		
		Query q01, q02;
		
		for(int estados = 0; estados < 5; estados++){
			switch(estados){
			case 0:
				estado = "Sin inicio";break;
			case 1:
				estado = "Por iniciar";break;
			case 2:
				estado = "Proceso";break;
			case 3:
				estado = "Terminado";break;
			case 4:
				estado = "Aceptado";break;
			}
			
			OrdenBean ordenBean = new OrdenBean();
			
			try{
			q01 = em.createNativeQuery("SELECT COUNT(codigo)as contador, SUM(oferta) as sumOferta, moneda FROM orden WHERE estado = '" + estado + "'");
			q02 = em.createNativeQuery("SELECT SUM(subcontrato.monto) as sumMonto FROM subcontrato INNER JOIN orden ON subcontrato.idorden  =  orden.idorden "
					+ "WHERE orden.estado = '" + estado + "' AND orden.idempresa = '"+ req.getSession().getAttribute("idEmpresa") +"'");
			
			Object[] obj = (Object[])q01.getSingleResult();			
			BigDecimal rsMonto = (BigDecimal)q02.getSingleResult();
			
			
			
			if(!obj[0].toString().equals("0")){
				ordenBean.setContador(obj[0].toString());
				ordenBean.setEstado(estado);				
				
				if(obj[2].toString().equals("dolar americano")){
					ordenBean.setSumOferta(NumberFormat.getCurrencyInstance(Locale.US).format(Formatos.StringToBigDecimal(obj[1].toString())));
					ordenBean.setSumMonto(NumberFormat.getCurrencyInstance(Locale.US).format(rsMonto));
					ordenBean.setUtilidad(NumberFormat.getCurrencyInstance(Locale.US).format(Formatos.StringToBigDecimal(obj[1].toString()).subtract(rsMonto)));
				}else{
					//La conversion de usd a pen es mas compleja cuando se combinan en un OT tipos de moneda
				}
			}else{
				ordenBean.setContador(obj[0].toString());
				ordenBean.setEstado(estado);
				
				ordenBean.setSumOferta("$0.00");
				ordenBean.setSumMonto("$0.00");
				ordenBean.setUtilidad("$0.00");
			}
			
			
			}catch(NullPointerException | IllegalArgumentException e){
				//Si la empresa es nueva o no tienes ordenes entonces no hacer nada
				ordenBean.setContador("0");
				ordenBean.setEstado(estado);
				
				ordenBean.setSumOferta("$0.00");
				ordenBean.setSumMonto("$0.00");
				ordenBean.setUtilidad("$0.00");;
			}
			ordenBeans.add(ordenBean);
		}

		return ordenBeans;
	}
	
	public OrdenBean obtenerInformacionOrden(int idOrden, String tipo, HttpServletRequest req){
		Orden orden = new Orden();

		Query q = em.createQuery("SELECT o FROM Orden o WHERE o.idOrden = :idOrden AND o.estado != 'disable' ");
		q.setParameter("idOrden", idOrden);
		
		orden = (Orden)q.getSingleResult();
		
		OrdenBean ordenB = new OrdenBean();		
		
		
		if(req.getSession().getAttribute("tipo").equals("cliente")){
			Cliente cli = orden.getOrdenCliente();
			ordenB.setIdCliente(cli.getIdCliente());
			ordenB.setNombreCliente(cli.getNombre());
		}else{
			//Para el Proveedor su cliente es el creador de la Orden que lo ha escogido como Proveedor
			Empresa e = em.find(Empresa.class, orden.getOrdenEmpresa().getIdEmpresa());
			ordenB.setNombreCliente(e.getNombre());
		}
		
		ordenB.setIdOrden(orden.getIdOrden());
		ordenB.setCodigo(orden.getCodigo());
		ordenB.setNombre(orden.getNombre());
		ordenB.setTipoOrden(orden.getTipoOrden());
		ordenB.setTipoTrabajo(orden.getTipoTrabajo());
		ordenB.setLat(""+orden.getLat());
		ordenB.setLon(""+orden.getLon());
		ordenB.setCiudad(orden.getCiudad());
		ordenB.setDepartamento(orden.getDepartamento());
		ordenB.setOferta(orden.getOferta());
		ordenB.setOfertaIgv(orden.getOfertaIgv());
		ordenB.setMoneda(orden.getMoneda());
		ordenB.setFechaInicio(Dates.fechaEspaniol(orden.getFechaInicio()));
		ordenB.setFechaEntrega(Dates.fechaEspaniol(orden.getFechaEntrega()));
		
		ordenB.setEficiencia(orden.getEficiencia());
		ordenB.setUtilidadBruta(orden.getUtilidadBruta());
		ordenB.setGastosGenerales(orden.getGastosGenerales());
		ordenB.setTotal(orden.getTotal());
		
		ordenB.setDetraccion(orden.getDetraccion());
		ordenB.setGananciaProyectada(orden.getGananciaProyectada());
		ordenB.setGananciaDisponible(orden.getGananciaDisponible());
					
		ordenB.setCreadoPor(orden.getCreadoPor());
		
		ordenB.setFechaCreacion(Dates.fechaHoraEspaniol(orden.getFechaCreacion(), "l"));
		ordenB.setEstado(orden.getEstado());
		
		//Solo por ahora, cambiar a JOIN
		System.out.println("orden.getCreadoPor(): " + orden.getCreadoPor());
		Query q01 = em.createNativeQuery("SELECT primernombre, apellidopaterno FROM perfil WHERE idusuario = '"+ orden.getCreadoPor() +"' AND estado != 'disable' ");
		
		try{
			Object[] perfil = (Object[])q01.getSingleResult();
			String primerNombre = (perfil[0] != null) ? perfil[0].toString() : "";
			String apellidoPaterno = (perfil[1] != null) ? perfil[1].toString() : "";
			ordenB.setCreadoPorNombre(primerNombre + " " + apellidoPaterno);
		}catch(NullPointerException e){
			;
		}
		return ordenB;
	}

	@SuppressWarnings("unchecked")
	public List<CuentaBean> grafOrdenGeneral(int idOrden, HttpServletRequest req){
		List<CuentaBean> resultados = new ArrayList<CuentaBean>();
		
		Query q01 = em.createNativeQuery("SELECT c.idcuenta, c.estado, c.fechavencimiento, c.monto, c.tipo "
				+ "FROM cuenta c "
				+ "WHERE c.idorden = '" + idOrden + "' ORDER BY c.fechavencimiento ASC");
		
		List<Object[]> rows = q01.getResultList();
		
		boolean skip = false;
		
		for(int x = 0; x < rows.size(); x++){
			if(!skip){
				Object[] obj = rows.get(x);
				CuentaBean cb = new CuentaBean();
				if(x < rows.size() - 1){
					Object[] obj02 = rows.get(x + 1);
					
					String currentDate = obj[2].toString();
					String nextDate = obj02[2].toString();
									
					if(currentDate.equals(nextDate)){
						skip = true;
						cb.setFechaOperacion(obj[2].toString());
						
						if(obj[4].toString().equals("cobrar")){
							cb.setMontoCobrar(obj[3].toString());
							cb.setMontoPagar(obj02[03].toString());
						}else{
							cb.setMontoPagar(obj[3].toString());
							cb.setMontoCobrar(obj02[3].toString());
						}	
					}else{
						skip = false;
						cb.setFechaOperacion(obj[2].toString());
						if(obj[4].toString().equals("cobrar")){
							cb.setMontoCobrar(obj[3].toString());
							cb.setMontoPagar("");
						}else{
							cb.setMontoPagar(obj[3].toString());
							cb.setMontoCobrar("");
						}	
						
					}			
				}else{
					Object[] obj03 = rows.get(x);
					
					cb.setFechaOperacion(obj03[2].toString());
					if(obj[4].toString().equals("cobrar")){
						cb.setMontoCobrar(obj03[3].toString());
						cb.setMontoPagar("");
					}else{
						cb.setMontoPagar(obj03[3].toString());
						cb.setMontoCobrar("");
					}	
				}
				System.out.println(cb.getFechaOperacion() + ", " + cb.getMontoCobrar() + ", " + cb.getMontoPagar());
				resultados.add(cb);
			}else{
				skip = false;
			}
		}
		
		return resultados;
	}
	
}