package com.simularte.bean;

public class FacturaBean {

	private int idFactura;
	private int idCuenta;
	private int idProveedor;
	private int idCliente;
	
	private String tipo;
	private String cobrarFactura;
	private String subTotal;
	private String igv;
	private String conIgv;
	private String total;
	private String codigo;
	
	private String totalMonto;
	private String totalIgv;
	private String totalConIgv;
	private String totalDetraccion;
	private String totalCobrar;
	
	private String detraccion; 
	private String montoDetraccion; 
	private String estadoDetraccion; 
	private String fechaCancelacionDetraccion;
	
	private String fechaEmision;
	private String fechaCancelacion;
	
	private String nombreCreadoPor;
	private String fechaCreacion;
	private String estado;
	
	private String nombreOrden;
	private int idOrden;
	private String nombreProveedor;
	private String condicionPago;
	private String sinDetraccion;
	
	
	
	public int getIdFactura() {
		return idFactura;
	}
	public void setIdFactura(int idFactura) {
		this.idFactura = idFactura;
	}
	public int getIdCuenta() {
		return idCuenta;
	}
	public void setIdCuenta(int idCuenta) {
		this.idCuenta = idCuenta;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getCobrarFactura() {
		return cobrarFactura;
	}
	public void setCobrarFactura(String cobrarFactura) {
		this.cobrarFactura = cobrarFactura;
	}
	public String getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}
	public String getConIgv() {
		return conIgv;
	}
	public void setConIgv(String conIgv) {
		this.conIgv = conIgv;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDetraccion() {
		return detraccion;
	}
	public void setDetraccion(String detraccion) {
		this.detraccion = detraccion;
	}
	public String getMontoDetraccion() {
		return montoDetraccion;
	}
	public void setMontoDetraccion(String montoDetraccion) {
		this.montoDetraccion = montoDetraccion;
	}
	public String getEstadoDetraccion() {
		return estadoDetraccion;
	}
	public void setEstadoDetraccion(String estadoDetraccion) {
		this.estadoDetraccion = estadoDetraccion;
	}
	public String getFechaCancelacionDetraccion() {
		return fechaCancelacionDetraccion;
	}
	public void setFechaCancelacionDetraccion(String fechaCancelacionDetraccion) {
		this.fechaCancelacionDetraccion = fechaCancelacionDetraccion;
	}
	public String getFechaEmision() {
		return fechaEmision;
	}
	public void setFechaEmision(String fechaEmision) {
		this.fechaEmision = fechaEmision;
	}
	public String getFechaCancelacion() {
		return fechaCancelacion;
	}
	public void setFechaCancelacion(String fechaCancelacion) {
		this.fechaCancelacion = fechaCancelacion;
	}
	public String getNombreCreadoPor() {
		return nombreCreadoPor;
	}
	public void setNombreCreadoPor(String nombreCreadoPor) {
		this.nombreCreadoPor = nombreCreadoPor;
	}
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
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
	public String getTotalConIgv() {
		return totalConIgv;
	}
	public void setTotalConIgv(String totalConIgv) {
		this.totalConIgv = totalConIgv;
	}
	public String getIgv() {
		return igv;
	}
	public void setIgv(String igv) {
		this.igv = igv;
	}
	public String getTotalDetraccion() {
		return totalDetraccion;
	}
	public void setTotalDetraccion(String totalDetraccion) {
		this.totalDetraccion = totalDetraccion;
	}
	public String getTotalCobrar() {
		return totalCobrar;
	}
	public void setTotalCobrar(String totalCobrar) {
		this.totalCobrar = totalCobrar;
	}
	public int getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNombreOrden() {
		return nombreOrden;
	}
	public void setNombreOrden(String nombreOrden) {
		this.nombreOrden = nombreOrden;
	}
	public int getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(int idOrden) {
		this.idOrden = idOrden;
	}
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	public String getCondicionPago() {
		return condicionPago;
	}
	public void setCondicionPago(String condicionPago) {
		this.condicionPago = condicionPago;
	}
	public String getSinDetraccion() {
		return sinDetraccion;
	}
	public void setSinDetraccion(String sinDetraccion) {
		this.sinDetraccion = sinDetraccion;
	}	
}