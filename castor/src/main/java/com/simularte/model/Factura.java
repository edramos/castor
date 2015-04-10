package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Factura {

	@Id @GeneratedValue @Column(name = "idfactura")
	private Integer idFactura;	
	
	//References
	@OneToOne(cascade = CascadeType.ALL)@JoinColumn(name = "idcuenta")
	private Cuenta facturaCuenta;
	@OneToMany(mappedBy = "detalleFacturaFactura")
	private Collection<DetalleFactura> facturaDetalleFactura;
	
	//Fields
	@Column(length = 30, nullable = false)	//Puede ser factura emitida o recibida
	private String tipo;
	@Column(name = "cobrarfactura", nullable = false)
	private BigDecimal cobrarFactura;
	@Column(name = "subtotal", nullable = false)
	private BigDecimal subTotal;
	@Column(name = "conigv", nullable = false)
	private BigDecimal conIgv;
	@Column(nullable = false)
	private BigDecimal total;
	@Column(length = 30)
	private String codigo;
	@Column(name = "fechaemision")
	private Date fechaEmision;
	@Column(name = "fechacancelacion")
	private Date fechaCancelacion;
	//La Detraccion quizas se tenga que pasar a una Entidad propia
	@Column(nullable = false)
	private double detraccion;
	@Column(name = "montodetraccion", nullable = false)
	private BigDecimal montoDetraccion;
	@Column(name = "estadodetraccion", length = 30, nullable = false)	
	private String estadoDetraccion;
	@Column(name = "fechacancelaciondetraccion")
	private Date fechaCancelacionDetraccion;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdFactura() {
		return idFactura;
	}
	public void setIdFactura(Integer idFactura) {
		this.idFactura = idFactura;
	}
	public Cuenta getFacturaCuenta() {
		return facturaCuenta;
	}
	public void setFacturaCuenta(Cuenta facturaCuenta) {
		this.facturaCuenta = facturaCuenta;
	}
	public Collection<DetalleFactura> getFacturaDetalleFactura() {
		return facturaDetalleFactura;
	}
	public void setFacturaDetalleFactura(
			Collection<DetalleFactura> facturaDetalleFactura) {
		this.facturaDetalleFactura = facturaDetalleFactura;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public BigDecimal getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public Date getFechaEmision() {
		return fechaEmision;
	}
	public void setFechaEmision(Date fechaEmision) {
		this.fechaEmision = fechaEmision;
	}
	public Date getFechaCancelacion() {
		return fechaCancelacion;
	}
	public void setFechaCancelacion(Date fechaCancelacion) {
		this.fechaCancelacion = fechaCancelacion;
	}
	public double getDetraccion() {
		return detraccion;
	}
	public void setDetraccion(double detraccion) {
		this.detraccion = detraccion;
	}
	public BigDecimal getMontoDetraccion() {
		return montoDetraccion;
	}
	public void setMontoDetraccion(BigDecimal montoDetraccion) {
		this.montoDetraccion = montoDetraccion;
	}
	public String getEstadoDetraccion() {
		return estadoDetraccion;
	}
	public void setEstadoDetraccion(String estadoDetraccion) {
		this.estadoDetraccion = estadoDetraccion;
	}
	public Date getFechaCancelacionDetraccion() {
		return fechaCancelacionDetraccion;
	}
	public void setFechaCancelacionDetraccion(Date fechaCancelacionDetraccion) {
		this.fechaCancelacionDetraccion = fechaCancelacionDetraccion;
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
	public BigDecimal getCobrarFactura() {
		return cobrarFactura;
	}
	public void setCobrarFactura(BigDecimal cobrarFactura) {
		this.cobrarFactura = cobrarFactura;
	}
	public BigDecimal getConIgv() {
		return conIgv;
	}
	public void setConIgv(BigDecimal conIgv) {
		this.conIgv = conIgv;
	}
}