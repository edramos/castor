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
import javax.persistence.OneToOne;

@Entity
public class Cuenta {

	@Id @GeneratedValue @Column(name = "idcuenta")
	private Integer idCuenta;

	// References
	@ManyToOne @JoinColumn(name = "idorden", nullable = true)
	private Orden cuentaOrden;
	@ManyToOne @JoinColumn(name = "idsubcontrato", nullable = true)
	private Subcontrato cuentaSubcontrato;
	@OneToOne(mappedBy = "facturaCuenta")
	private Factura cuentaFactura; 

	// Fields
	@Column(name = "tipo", length = 30, nullable = true)
	private String tipo;
	@Column(name = "fechavencimiento", nullable = false)
	private Date fechaVencimiento;
	@Column(name = "fechapagoprogramada", nullable = true)
	private Date fechaPagoProgramada;
	@Column(name = "fechapagoreal", nullable = true)
	private Date fechaPagoReal;
	@Column(name = "tipopago", length = 30, nullable = true)
	private String tipoPago;
	@Column(nullable = false)
	private BigDecimal monto;
	@Column(length = 30, nullable = true)
	private Integer pagador;
	@Column(name = "estadotrabajo", length = 30, nullable = true)
	private String estadoTrabajo;
	@Column(nullable = true)
	private double avance;

	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(Integer idCuenta) {
		this.idCuenta = idCuenta;
	}
	public Orden getCuentaOrden() {
		return cuentaOrden;
	}
	public void setCuentaOrden(Orden cuentaOrden) {
		this.cuentaOrden = cuentaOrden;
	}
	public Subcontrato getCuentaSubcontrato() {
		return cuentaSubcontrato;
	}
	public void setCuentaSubcontrato(Subcontrato cuentaSubcontrato) {
		this.cuentaSubcontrato = cuentaSubcontrato;
	}
	public Factura getCuentaFactura() {
		return cuentaFactura;
	}
	public void setCuentaFactura(Factura cuentaFactura) {
		this.cuentaFactura = cuentaFactura;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
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
	public String getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(String tipoPago) {
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
	public String getEstadoTrabajo() {
		return estadoTrabajo;
	}
	public void setEstadoTrabajo(String estadoTrabajo) {
		this.estadoTrabajo = estadoTrabajo;
	}
	public double getAvance() {
		return avance;
	}
	public void setAvance(double avance) {
		this.avance = avance;
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