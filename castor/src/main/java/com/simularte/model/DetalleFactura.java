package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name = "detallefactura")
public class DetalleFactura {

	@Id @GeneratedValue @Column(name = "iddetallefactura")
	private Integer idDetalleFactura;
	
	//References
	@OneToOne(cascade = CascadeType.ALL) @JoinColumn(name = "idFactura")
	private Factura detalleFacturaFactura;
	
	//Fields
	@Column(length = 260, nullable = false)
	private String descripcion;
	@Column(nullable = true)
	private Integer cantidad;
	@Column(name = "preciounitario", nullable = true)
	private BigDecimal precioUnitario;
	@Column(nullable = true)
	private BigDecimal importe;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdDetalleFactura() {
		return idDetalleFactura;
	}
	public void setIdDetalleFactura(Integer idDetalleFactura) {
		this.idDetalleFactura = idDetalleFactura;
	}
	public Factura getDetalleFacturaFactura() {
		return detalleFacturaFactura;
	}
	public void setDetalleFacturaFactura(Factura detalleFacturaFactura) {
		this.detalleFacturaFactura = detalleFacturaFactura;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public BigDecimal getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(BigDecimal precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public BigDecimal getImporte() {
		return importe;
	}
	public void setImporte(BigDecimal importe) {
		this.importe = importe;
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