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
	@OneToOne(cascade = CascadeType.ALL) @JoinColumn(name = "idOrden")
	private Orden facturaOrden;
	@OneToMany(mappedBy = "detalleFacturaFactura")
	private Collection<DetalleFactura> facturaDetalleFactura;
	
	//Fields
	@Column(name = "fechaemision", nullable = false)
	private Date fechaEmision;
	@Column(name = "fechacancelacion", nullable = true)
	private Date fechaCancelacion;
	@Column(length = 30, nullable = false)	//Puede ser factura emitida o recibida
	private String tipo;
	@Column(nullable = false)
	private BigDecimal subTotal;
	@Column(nullable = false)
	private BigDecimal igv;
	@Column(nullable = false)
	private BigDecimal total;
	
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
	public Orden getFacturaOrden() {
		return facturaOrden;
	}
	public void setFacturaOrden(Orden facturaOrden) {
		this.facturaOrden = facturaOrden;
	}
	public Collection<DetalleFactura> getFacturaDetalleFactura() {
		return facturaDetalleFactura;
	}
	public void setFacturaDetalleFactura(
			Collection<DetalleFactura> facturaDetalleFactura) {
		this.facturaDetalleFactura = facturaDetalleFactura;
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
	public BigDecimal getIgv() {
		return igv;
	}
	public void setIgv(BigDecimal igv) {
		this.igv = igv;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
}