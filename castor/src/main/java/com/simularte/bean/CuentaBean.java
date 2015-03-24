package com.simularte.bean;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class CuentaBean {

	private Integer idCuenta;
	private Integer idOrden;
	private Integer idSubcontrato;
	private Integer idCliente; //Tipo : Cobro Cliente
	private Integer idProveedor; //Tipo : Pagos Proveedor
	private String nombreProveedor;
	private String tipo;
	private Date fechaVencimiento;
	private Date fechaPagoProgramada;
	private Date fechaPagoReal;
	private String tipoPago;
	private BigDecimal monto;
	private Integer pagador;
	private Integer creadoPor;
	private Timestamp fechaCreacion;
	private String estado;
	
	public Integer getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(Integer idCuenta) {
		this.idCuenta = idCuenta;
	}
	public Integer getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}
	public Integer getIdSubcontrato() {
		return idSubcontrato;
	}
	public void setIdSubcontrato(Integer idSubcontrato) {
		this.idSubcontrato = idSubcontrato;
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
	public Integer getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(Integer idProveedor) {
		this.idProveedor = idProveedor;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	
}
