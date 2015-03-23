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
	@ManyToOne @JoinColumn(name = "idorden", nullable = false)
	private Orden pagoOrden;
	@ManyToOne @JoinColumn(name = "idproveedor", nullable = false)
	private Proveedor pagoProveedor;
	
	//Fields
	@Column(name = "fechavencimiento", nullable = false)
	private Date fechaVencimiento;
	@Column(name = "fechapagoprogramada", nullable = true)
	private Date fechaPagoProgramada;
	@Column(name = "fechapagoreal", nullable = true)
	private Date fechaPagoReal;
	@Column(name = "tipopago", length = 30, nullable = true)
	private Integer tipoPago;
	@Column(nullable = false)
	private BigDecimal monto;
	@Column(length = 30, nullable = true)
	private Integer pagador;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
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
	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}
	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}
	public Date getFechaPagoProgramada() {
		return fechaPagoProgramada;
	}
	public void setFechaPagoProgramada(Date fechaPagoProgramada) {
		this.fechaPagoProgramada = fechaPagoProgramada;
	}
	public Date getFechaPagoReal() {
		return fechaPagoReal;
	}
	public void setFechaPagoReal(Date fechaPagoReal) {
		this.fechaPagoReal = fechaPagoReal;
	}
	public Integer getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(Integer tipoPago) {
		this.tipoPago = tipoPago;
	}
	public BigDecimal getMonto() {
		return monto;
	}
	public void setMonto(BigDecimal monto) {
		this.monto = monto;
	}
	public Integer getPagador() {
		return pagador;
	}
	public void setPagador(Integer pagador) {
		this.pagador = pagador;
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