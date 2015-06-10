package com.simularte.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simularte.bean.CuentaBean;
import com.simularte.model.Cuenta;
import com.simularte.model.Orden;
import com.simularte.util.Dates;
import com.simularte.util.Formatos;
import com.simularte.util.Valores;

@Service
public class CuentaServiceImpl implements CuentaService {

	@PersistenceContext 
	EntityManager em;	

	
	public CuentaBean listarDetalleCuenta(String tipo, int idCuenta, HttpServletRequest req){
		CuentaBean  cb = new CuentaBean();
		
		Query q01 = em.createQuery("SELECT c FROM Cuenta c WHERE c.idCuenta = :idCuenta AND c.estado != 'disable'");
		q01.setParameter("idCuenta", idCuenta);
		
		Cuenta cuenta = (Cuenta)q01.getSingleResult();
		
		BigDecimal monto = cuenta.getMonto();
		BigDecimal montoIgv = monto.multiply(Valores.IGV).setScale(2, RoundingMode.HALF_UP);
		BigDecimal total = cuenta.getMonto().add(montoIgv).setScale(2, RoundingMode.HALF_UP);
		
		cb.setMonto(Formatos.BigBecimalToString(monto));
		cb.setIgv(Formatos.BigBecimalToString(montoIgv));
		cb.setConIgv(Formatos.BigBecimalToString(total));
		
		if(tipo.equals("pagar")){
			cb.setIdSubcontrato(cuenta.getCuentaSubcontrato().getIdSubcontrato());
			
			Query q03 = em.createNativeQuery("SELECT sc.idsubcontrato, sc.tipotrabajo, p.nombre FROM subcontrato sc "
					+ "INNER JOIN proveedor p "
					+ " ON sc.idproveedor = p.idproveedor WHERE sc.idsubcontrato = '" + cuenta.getCuentaSubcontrato().getIdSubcontrato() + "'");
			
			Object obj[] = (Object[])q03.getSingleResult();
			
			cb.setScTipoTrabajo(obj[1].toString());
			cb.setNombreProveedor(obj[2].toString());
		}
		
		Orden orden = em.find(Orden.class, cuenta.getCuentaOrden().getIdOrden());
		
		Query q02 = em.createNativeQuery("SELECT p.primernombre, p.apellidopaterno FROM perfil p "
				+ "INNER JOIN usuario u ON p.idusuario = u.idusuario WHERE u.idusuario = '" + cuenta.getCreadoPor() + "'");
		
		Object[] us = (Object[])q02.getSingleResult();
		cb.setNombreCreador(us[0].toString() + " " + us[1].toString());
		
		if(tipo.equals("cobrar")){
			if(orden.getTipoTrabajo().equals("Estudio")){
				BigDecimal montoDetraccion = total.multiply(BigDecimal.valueOf(0.1));
				
				cb.setMontoDetraccion(Formatos.BigBecimalToString(montoDetraccion) + "  (10%)");
				cb.setCobrar(Formatos.BigBecimalToString(total.subtract(montoDetraccion)));
			}else{
				BigDecimal montoDetraccion = total.multiply(BigDecimal.valueOf(0.04));
				
				cb.setMontoDetraccion(Formatos.BigBecimalToString(montoDetraccion) + "  (4%)");
				cb.setCobrar(Formatos.BigBecimalToString(total.subtract(montoDetraccion)));
			}
		}else{
			if(cb.getScTipoTrabajo().equals("Estudio")){
				BigDecimal montoDetraccion = total.multiply(BigDecimal.valueOf(0.1));
				
				cb.setMontoDetraccion(Formatos.BigBecimalToString(montoDetraccion) + "  (10%)");
				cb.setCobrar(Formatos.BigBecimalToString(total.subtract(montoDetraccion)));
			}else{
				BigDecimal montoDetraccion = total.multiply(BigDecimal.valueOf(0.04));
				System.out.println("total: " + total + "montoDetraccion: " + montoDetraccion);
				cb.setMontoDetraccion(Formatos.BigBecimalToString(montoDetraccion) + "  (4%)");
				cb.setCobrar(Formatos.BigBecimalToString(total.subtract(montoDetraccion)));
			}
		}
		cb.setFechaVencimiento(Dates.fechaCorta(cuenta.getFechaVencimiento()));
		cb.setFechaCreacion(Dates.fechaHoraEspaniol(cuenta.getFechaCreacion(), ""));
		
		return cb;
	}
	
	@SuppressWarnings("unchecked")
	public List<CuentaBean> listarCuentasFactura(int idOrden, String tipo, HttpServletRequest req) {
		List<CuentaBean> lcb = new ArrayList<CuentaBean>();
		Query q01 = null;
		
		switch(req.getSession().getAttribute("tipo").toString()){
		case "empresa":
			tipo = (tipo.equals("cobrar"))?"pagar":"cobrar";	//Solo por ahora hasta definir bien lo que el Proveedor
			
			q01 = em.createQuery("SELECT c FROM Cuenta c WHERE idOrden = :idOrden AND tipo = :tipo AND estado = 'Pendiente'", Cuenta.class);
			q01.setParameter("idOrden", idOrden);
			q01.setParameter("tipo", tipo);
			break;
		case "cliente":
			//Por ahora es el mismo query que empresa
			q01 = em.createQuery("SELECT c FROM Cuenta c WHERE idOrden = :idOrden AND tipo = :tipo AND estado = 'Pendiente'", Cuenta.class);
			q01.setParameter("idOrden", idOrden);
			q01.setParameter("tipo", tipo);
			break;
		}
		
		
		
		List<Cuenta> cuentas = q01.getResultList();
		
		for(int i = 0; i < cuentas.size(); i++){
			Cuenta c = cuentas.get(i);
			CuentaBean cb = new CuentaBean();
			
			cb.setIdCuenta(c.getIdCuenta());
			cb.setMonto(Formatos.BigBecimalToString(c.getMonto()));
			cb.setFechaVencimiento(Dates.fechaCorta(c.getFechaVencimiento()));
			System.out.println(cb.getFechaVencimiento());
			lcb.add(cb);
		}
		
		return lcb;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<CuentaBean> listarCuentas(String tipo, Integer idOrden, HttpServletRequest req) {
		List<CuentaBean> lcueBean = new ArrayList<CuentaBean>();
		double totalConIgv = 0;
		
		try{
			Query q01 = em.createNativeQuery("SELECT c.idcuenta, c.avance, c.creadopor, c.estado, c.estadotrabajo, c.fechacreacion, c.fechapagoprogramada, c.fechapagoreal, "
					+ "c.fechavencimiento, c.monto, c.pagador, c.tipo, c.tipopago, c.idorden, c.idsubcontrato, f.codigo, sc.tipotrabajo "
					+ "FROM cuenta c "
					+ "LEFT JOIN factura f ON c.idcuenta = f.idcuenta INNER JOIN subcontrato sc ON sc.idorden = c.idorden "
					+ "WHERE c.idorden = " + idOrden + " AND c.tipo = '" + tipo + "'");
			
			
			List<Object[]> rows = q01.getResultList();
			for(int x = 0; x < rows.size(); x++){
				Object[] obj = rows.get(x);
				CuentaBean cb = new CuentaBean();
				
				cb.setIdCuenta((Integer)obj[0]);
				
				if(obj[13] != null){
					cb.setIdOrden((Integer)obj[13]);
				}
				if(obj[14] != null){
					cb.setIdSubcontrato((Integer)obj[14]);
					
					Query q02 = em.createNativeQuery("SELECT p.idproveedor, p.nombre FROM subcontrato sc "
							+ "INNER JOIN proveedor p ON sc.idproveedor = p.idproveedor WHERE sc.idsubcontrato = '" + cb.getIdSubcontrato() + "'");
					Object[] obj02 = (Object[])q02.getSingleResult();
					
					cb.setIdProveedor((Integer)obj02[0]);
					cb.setNombreProveedor(obj02[1].toString());
				}				
				cb.setTipo(obj[11].toString());
				cb.setTipoPago(obj[12].toString());
				if(obj[6] != null) cb.setFechaPagoProgramada(Dates.stringToStringFechaCorta(obj[6].toString()));
				if(obj[7] != null) cb.setFechaPagoReal(Dates.stringToStringFechaCorta(obj[7].toString()));
				if(obj[8] != null) cb.setFechaVencimiento(Dates.stringToStringFechaCorta(obj[8].toString()));
				
				BigDecimal monto = Formatos.StringToBigDecimal(obj[9].toString());
				BigDecimal igv = Formatos.StringToBigDecimal(obj[9].toString()).multiply(Valores.IGV);
				BigDecimal montoDetraccion = (obj[16].toString().equals("Estudio"))?(monto.add(igv)).multiply(BigDecimal.valueOf(0.1)):(monto.add(igv)).multiply(BigDecimal.valueOf(0.04));
				
				cb.setMonto(Formatos.BigBecimalToString(monto));
				cb.setIgv(Formatos.BigBecimalToString(igv));
				cb.setConIgv(Formatos.BigBecimalToString(monto.add(igv)));
				cb.setMontoDetraccion(Formatos.BigBecimalToString(montoDetraccion));
				
				totalConIgv += Formatos.StringToBigDecimal(obj[9].toString()).doubleValue();
				cb.setTotalConIgv((Formatos.BigBecimalToString(BigDecimal.valueOf(totalConIgv))));
				
				if(obj[4] != null){
					cb.setEstadoTrabajo(obj[4].toString());	//Ahora puede ser null porque en CtasPagar no se ha puesto aun el estado de trabajo
					if(obj[4].toString().equals("Proceso")){
						cb.setAvance("(" + obj[1].toString() + "%)");
					}else{
						cb.setAvance("");
					}
				}

				cb.setEstado(obj[3].toString());
				if(obj[15] != null) cb.setCodigo(obj[15].toString());
				
				lcueBean.add(cb);
			}
			
			
			/*Query query;

			String Squery = "SELECT c FROM Cuenta c WHERE c.estado != 'disable' ";
			
			if(tipo.equals("pago")){// Tipo: Pagos Proveedores
				Squery += "AND c.cuentaSubcontrato.ordenSubcontrato.idOrden =:idOrden AND c.tipo =:tipo ";
			}else{//Tipo: Cobro Cliente
				Squery += "AND c.cuentaOrden.idOrden =:idOrden AND c.tipo =:tipo ";
			}
			
			query = em.createQuery(Squery);
			query.setParameter("idOrden", idOrder);
			query.setParameter("tipo", tipo);

			List<Cuenta> Cuentas = query.getResultList();
			
			for(int i = 0; i < Cuentas.size(); i++){
				Cuenta c = Cuentas.get(i);
				CuentaBean cb = new CuentaBean();
				
				cb.setIdCuenta(c.getIdCuenta());
				if(c.getCuentaOrden() != null){
					cb.setIdOrden(c.getCuentaOrden().getIdOrden());
					cb.setIdCliente(c.getCuentaOrden().getOrdenCliente().getIdCliente());
				}
				if(c.getCuentaSubcontrato() != null){
					cb.setIdSubcontrato(c.getCuentaSubcontrato().getIdSubcontrato());
					Proveedor prov = c.getCuentaSubcontrato().getProveedorSubcontrato();
					cb.setIdProveedor(prov.getIdProveedor());
					cb.setNombreProveedor(prov.getNombre());
				}				
				cb.setTipo(c.getTipo());
				cb.setTipoPago(c.getTipoPago());
				
				cb.setFechaVencimiento(Dates.fechaCorta(c.getFechaVencimiento()));
				cb.setFechaPagoProgramada(Dates.fechaCorta(c.getFechaPagoProgramada()));
				cb.setFechaPagoReal(Dates.fechaCorta(c.getFechaPagoReal()));
				
				//cb.setMonto(Formatos.BigBecimalToString(c.getMonto().subtract(c.getMonto().multiply(Valores.IGV))));
				//cb.setIgv(Formatos.BigBecimalToString(c.getMonto().multiply(Valores.IGV)));
				cb.setConIgv(Formatos.BigBecimalToString(c.getMonto()));
				
				totalMonto += c.getMonto().subtract(c.getMonto().multiply(Valores.IGV)).doubleValue();
				cb.setTotalMonto(Formatos.BigBecimalToString(BigDecimal.valueOf(totalMonto)));
				
				totalIgv += c.getMonto().multiply(Valores.IGV).doubleValue();
				cb.setTotalIgv(Formatos.BigBecimalToString(BigDecimal.valueOf(totalIgv)));
				
				totalConIgv += c.getMonto().doubleValue();
				cb.setTotalConIgv((Formatos.BigBecimalToString(BigDecimal.valueOf(totalConIgv))));
				
				cb.setPagador(c.getPagador());
				cb.setEstadoTrabajo(c.getEstadoTrabajo());
				if(c.getEstadoTrabajo() != null){
					if(c.getEstadoTrabajo().equals("Proceso")){
						cb.setAvance("(" + Double.toString(c.getAvance()) + "%)");
					}else{
						cb.setAvance("");
					}
				}
				cb.setCreadoPor(c.getCreadoPor());
				cb.setFechaCreacion(Dates.fechaHoraEspaniol(c.getFechaCreacion(), ""));
				cb.setEstado(c.getEstado());
				
				lcueBean.add(cb);
			}*/
			
		} catch(IllegalArgumentException e){
			lcueBean = null;
		}
		
		return lcueBean;
	}

}
