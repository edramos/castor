package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Caja {
	//Esta clase luego se tiene que reconciliar con Cuenta porque
	//ambas puden hacer lo mismo solo de un enfoque diferente
	
	@Id @GeneratedValue @Column(name = "idcaja")
	private Integer idCaja;
	
	// References
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa cajaEmpresa;
	
	//Non-Identifying Relationships
	@Column(name = "idcliente", nullable = true)
	private Integer idCliente;
	@Column(name = "idproveedor", nullable = true)
	private Integer idProveedor;
	@Column(name = "idorden", nullable = true)
	private Integer idOrden;
	@Column(name = "idempleado", nullable = true)
	private Integer idEmpleado;
	@Column(name = "idcuentabanco", nullable = false)
	private Integer idCuentaBanco;
	
	// Fields
	@Column(name = "fechaoperacion", nullable = false)
	private Date fechaOperacion;
	@Column(nullable = false)
	private BigDecimal monto;
	@Column(length = 30, nullable = false)
	private String operacion;
	@Column(name = "tipooperacion", length = 30, nullable = false)
	private String tipoOperacion;
	
	@Column(name = "cuentabancoorigen", length = 30, nullable = true)
	private String cuentaBancoOrigen;
	@Column(name = "cuentabancodestino", length = 30, nullable = true)
	private String cuentaBancoDestino;
	@Column(length = 30, nullable = true)
	private String factura;
	@Column(name = "cuentaorigen", length = 30, nullable = true)
	private String cuentaOrigen;
	@Column(name = "codigooperacion", length = 30, nullable = true)
	private String codigoOperacion;
	@Column(length = 280, nullable = true)
	private String descripcion;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Empresa getCajaEmpresa() {
		return cajaEmpresa;
	}
	public void setCajaEmpresa(Empresa cajaEmpresa) {
		this.cajaEmpresa = cajaEmpresa;
	}
	public Integer getIdCuentaBanco() {
		return idCuentaBanco;
	}
	public void setIdCuentaBanco(Integer idCuentaBanco) {
		this.idCuentaBanco = idCuentaBanco;
	}
	public String getCuentaBancoOrigen() {
		return cuentaBancoOrigen;
	}
	public void setCuentaBancoOrigen(String cuentaBancoOrigen) {
		this.cuentaBancoOrigen = cuentaBancoOrigen;
	}
	public String getCuentaBancoDestino() {
		return cuentaBancoDestino;
	}
	public void setCuentaBancoDestino(String cuentaBancoDestino) {
		this.cuentaBancoDestino = cuentaBancoDestino;
	}
	public Integer getIdCaja() {
		return idCaja;
	}
	public void setIdCaja(Integer idCaja) {
		this.idCaja = idCaja;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public Integer getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}
	public Integer getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}
	public Integer getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(Integer idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public Date getFechaOperacion() {
		return fechaOperacion;
	}
	public void setFechaOperacion(Date fechaOperacion) {
		this.fechaOperacion = fechaOperacion;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}
	public String getOperacion() {
		return operacion;
	}
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}
	public String getTipoOperacion() {
		return tipoOperacion;
	}
	public void setTipoOperacion(String tipoOperacion) {
		this.tipoOperacion = tipoOperacion;
	}
	public String getFactura() {
		return factura;
	}
	public void setFactura(String factura) {
		this.factura = factura;
	}
	public String getCuentaOrigen() {
		return cuentaOrigen;
	}
	public void setCuentaOrigen(String cuentaOrigen) {
		this.cuentaOrigen = cuentaOrigen;
	}
	public String getCodigoOperacion() {
		return codigoOperacion;
	}
	public void setCodigoOperacion(String codigoOperacion) {
		this.codigoOperacion = codigoOperacion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getCreadoPor() {
		return creadoPor;
	}
	public void setCreadoPor(Integer creadoPor) {
		this.creadoPor = creadoPor;
	}
	public Timestamp getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Timestamp fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}	
}