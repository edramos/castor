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
public class Pago {

	@Id @GeneratedValue @Column(name = "idpago")
	private Integer idPago;
	
	//References
	/*1 Proveedor puede recibir 1-n pagos para el mismo proyecto, esta tabla debe tener estas Keys:
	 * idPago(PK), idOrden(FK), idProveedor(FK) el idProveedor se saca de ProyectoDetalle*/
	
	@ManyToOne 
	@JoinColumn(name = "idorden", nullable = false)
	private Orden pagoOrden;
	
	@ManyToOne 
	@JoinColumn(name = "idproveedor", nullable = false)
	private Proveedor pagoProveedor;
	
	@Column(name = "fechapago", nullable = false)
	private Date fechaPago;
	@Column(nullable = false)
	private BigDecimal monto;
	
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdPago() {
		return idPago;
	}
	public void setIdPago(Integer idPago) {
		this.idPago = idPago;
	}
	public Date getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
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
	public Orden getPagoOrden() {
		return pagoOrden;
	}
	public void setPagoOrden(Orden pagoOrden) {
		this.pagoOrden = pagoOrden;
	}
	public Proveedor getPagoProveedor() {
		return pagoProveedor;
	}
	public void setPagoProveedor(Proveedor pagoProveedor) {
		this.pagoProveedor = pagoProveedor;
	}
}