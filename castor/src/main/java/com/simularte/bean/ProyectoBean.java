package com.simularte.bean;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ProyectoBean {
	private Integer idProyecto;
	private Integer idCliente;
	private Integer idEmpresa;
	
	private String codigo;
	private String nombre;
	private String tipo;
	private String direccion;
	private String distrito;
	private String ciudad;
	private String departamento;
	private Integer creadoPor;
	private Timestamp fechaCreacion;
	
	private String estado;
	
	private BigDecimal oferta;
	private Double eficiencia;
	private BigDecimal utilidadBruta;
	
	private BigDecimal subTotal;
	private BigDecimal gastosGenerales;
	private BigDecimal total;

	private Integer idOrden;

	public Integer getIdProyecto() {
		return idProyecto;
	}

	public void setIdProyecto(Integer idProyecto) {
		this.idProyecto = idProyecto;
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

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
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

	public BigDecimal getOferta() {
		return oferta;
	}

	public void setOferta(BigDecimal oferta) {
		this.oferta = oferta;
	}

	public Double getEficiencia() {
		return eficiencia;
	}

	public void setEficiencia(Double eficiencia) {
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

	public Integer getIdOrden() {
		return idOrden;
	}

	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}
}
