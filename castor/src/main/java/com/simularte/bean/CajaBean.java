package com.simularte.bean;

public class CajaBean {

	private Integer idCaja;
	private Integer idCliente;
	private Integer idProveedor;
	private Integer idOrden;
	private Integer idEmpleado;
	private Integer idCuentaBanco;
	
	private String cuentaBancoOrigen;
	private String cuentaBancoDestino;
	private String fechaOperacion;
	private String monto;
	private String operacion;
	private String tipoOperacion;
	private String factura;
	private String cuentaOrigen;
	private String codigoOperacion;
	private String descripcion;
	
	private Integer creadoPor;
	private String fechaCreacion;
	private String estado;
	
	//Fancy
	private String Ingreso;
	private String Egreso;
	private String Saldo;
	
	
	
	public Integer getIdCuentaBanco() {
		return idCuentaBanco;
	}
	public void setIdCuentaBanco(Integer idCuentaBanco) {
		this.idCuentaBanco = idCuentaBanco;
	}
	public String getIngreso() {
		return Ingreso;
	}
	public void setIngreso(String ingreso) {
		Ingreso = ingreso;
	}
	public String getEgreso() {
		return Egreso;
	}
	public void setEgreso(String egreso) {
		Egreso = egreso;
	}
	public String getSaldo() {
		return Saldo;
	}
	public void setSaldo(String saldo) {
		Saldo = saldo;
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
	public String getFechaOperacion() {
		return fechaOperacion;
	}
	public void setFechaOperacion(String fechaOperacion) {
		this.fechaOperacion = fechaOperacion;
	}
	public String getMonto() {
		return monto;
	}
	public void setMonto(String monto) {
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
}
