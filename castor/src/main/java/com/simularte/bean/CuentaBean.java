package com.simularte.bean;

public class CuentaBean {

	private Integer idCuenta;
	private Integer idOrden;
	private Integer idSubcontrato;
	private Integer idCliente; //Tipo : Cobro Cliente
	private Integer idProveedor; //Tipo : Pagos Proveedor
	private String nombreProveedor;
	private String tipo;
	private String fechaVencimiento;
	private String fechaPagoProgramada;
	private String fechaPagoReal;
	private String tipoPago;
	
	private String monto;
	private String igv;
	private String conIgv;
	private String totalMonto;
	private String totalIgv;
	private String totalConIgv;
	
	private Integer pagador;
	private String estadoTrabajo;
	private String avance;
	
	private Integer creadoPor;
	private String fechaCreacion;
	private String estado;
	
	
	
	public String getAvance() {
		return avance;
	}
	public void setAvance(String avance) {
		this.avance = avance;
	}
	public String getEstadoTrabajo() {
		return estadoTrabajo;
	}
	public void setEstadoTrabajo(String estadoTrabajo) {
		this.estadoTrabajo = estadoTrabajo;
	}
	public String getFechaVencimiento() {
		return fechaVencimiento;
	}
	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}
	public String getFechaPagoProgramada() {
		return fechaPagoProgramada;
	}
	public void setFechaPagoProgramada(String fechaPagoProgramada) {
		this.fechaPagoProgramada = fechaPagoProgramada;
	}
	public String getFechaPagoReal() {
		return fechaPagoReal;
	}
	public void setFechaPagoReal(String fechaPagoReal) {
		this.fechaPagoReal = fechaPagoReal;
	}
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
	public String getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(String tipoPago) {
		this.tipoPago = tipoPago;
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
	public String getMonto() {
		return monto;
	}
	public void setMonto(String monto) {
		this.monto = monto;
	}
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getIgv() {
		return igv;
	}
	public void setIgv(String igv) {
		this.igv = igv;
	}
	public String getConIgv() {
		return conIgv;
	}
	public void setConIgv(String conIgv) {
		this.conIgv = conIgv;
	}
	public String getTotalConIgv() {
		return totalConIgv;
	}
	public void setTotalConIgv(String totalConIgv) {
		this.totalConIgv = totalConIgv;
	}
	public String getTotalMonto() {
		return totalMonto;
	}
	public void setTotalMonto(String totalMonto) {
		this.totalMonto = totalMonto;
	}
	public String getTotalIgv() {
		return totalIgv;
	}
	public void setTotalIgv(String totalIgv) {
		this.totalIgv = totalIgv;
	}
}