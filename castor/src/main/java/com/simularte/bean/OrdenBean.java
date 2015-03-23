package com.simularte.bean;

import java.math.BigDecimal;

public class OrdenBean {
	private Integer idOrden;
	private Integer idCliente;
	private Integer idEmpresa;
	
	private String codigo;
	private String nombre;
	private String tipoOrden;
	private String tipoTrabajo;
	private double lat;
	private double lon;
	private String ciudad;
	private String departamento;
	private BigDecimal oferta;
	private String moneda;
	
	private double eficiencia;
	private BigDecimal utilidadBruta;
	private BigDecimal subTotal;
	private BigDecimal gastosGenerales;
	private BigDecimal total;
	private String fechaEntrega;
	
	private String busqueda;
	private String campo;
		
	private Integer creadoPor;
	private String creadoPorNombre;
	private String fechaCreacion;	
	private String estado;		
	
	//CLIENTE
	private String nombreCliente;
	
	//FILTROS PARA BUSQUEDA BASICA
	private String fechaCreacionMinima;
	private String fechaCreacionMaxima;
	private BigDecimal ofertaMinima;
	private BigDecimal ofertaMaxima;
	
	//PANEL
	private String contador;
	private String sumOferta;
	private String sumMonto;
	private String utilidad;
	
	
	
	public String getCreadoPorNombre() {
		return creadoPorNombre;
	}
	public void setCreadoPorNombre(String creadoPorNombre) {
		this.creadoPorNombre = creadoPorNombre;
	}
	public String getSumOferta() {
		return sumOferta;
	}
	public void setSumOferta(String sumOferta) {
		this.sumOferta = sumOferta;
	}
	public String getSumMonto() {
		return sumMonto;
	}
	public void setSumMonto(String sumMonto) {
		this.sumMonto = sumMonto;
	}
	public String getUtilidad() {
		return utilidad;
	}
	public void setUtilidad(String utilidad) {
		this.utilidad = utilidad;
	}
	public String getContador() {
		return contador;
	}
	public void setContador(String contador) {
		this.contador = contador;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public String getCampo() {
		return campo;
	}
	public void setCampo(String campo) {
		this.campo = campo;
	}
	public String getBusqueda() {
		return busqueda;
	}
	public void setBusqueda(String busqueda) {
		this.busqueda = busqueda;
	}
	public Integer getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}
	public Integer getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}
	public Integer getIdEmpresa() {
		return idEmpresa;
	}
	public void setIdEmpresa(Integer idEmpresa) {
		this.idEmpresa = idEmpresa;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTipoOrden() {
		return tipoOrden;
	}
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}
	public String getTipoTrabajo() {
		return tipoTrabajo;
	}
	public void setTipoTrabajo(String tipoTrabajo) {
		this.tipoTrabajo = tipoTrabajo;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public BigDecimal getOferta() {
		return oferta;
	}
	public void setOferta(BigDecimal oferta) {
		this.oferta = oferta;
	}
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public double getEficiencia() {
		return eficiencia;
	}
	public void setEficiencia(double eficiencia) {
		this.eficiencia = eficiencia;
	}
	public BigDecimal getUtilidadBruta() {
		return utilidadBruta;
	}
	public void setUtilidadBruta(BigDecimal utilidadBruta) {
		this.utilidadBruta = utilidadBruta;
	}
	public BigDecimal getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}
	public BigDecimal getGastosGenerales() {
		return gastosGenerales;
	}
	public void setGastosGenerales(BigDecimal gastosGenerales) {
		this.gastosGenerales = gastosGenerales;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
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
	public String getNombreCliente() {
		return nombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	public String getFechaCreacionMinima() {
		return fechaCreacionMinima;
	}
	public void setFechaCreacionMinima(String fechaCreacionMinima) {
		this.fechaCreacionMinima = fechaCreacionMinima;
	}
	public String getFechaCreacionMaxima() {
		return fechaCreacionMaxima;
	}
	public void setFechaCreacionMaxima(String fechaCreacionMaxima) {
		this.fechaCreacionMaxima = fechaCreacionMaxima;
	}
	public BigDecimal getOfertaMinima() {
		return ofertaMinima;
	}
	public void setOfertaMinima(BigDecimal ofertaMinima) {
		this.ofertaMinima = ofertaMinima;
	}
	public BigDecimal getOfertaMaxima() {
		return ofertaMaxima;
	}
	public void setOfertaMaxima(BigDecimal ofertaMaxima) {
		this.ofertaMaxima = ofertaMaxima;
	}
}