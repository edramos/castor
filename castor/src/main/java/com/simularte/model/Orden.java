package com.simularte.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Orden {

	@Id @GeneratedValue @Column(name = "idorden")
	private Integer idOrden;	
	
	//References		
	@OneToOne(cascade = CascadeType.ALL) @JoinColumn(name = "idcliente", nullable = false)
	private Cliente ordenCliente;
	@OneToMany(mappedBy = "ordenSubcontrato")
	private Collection<Subcontrato> subcontratos;
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa ordenEmpresa;
	@OneToMany(mappedBy = "cuentaOrden")
	private Collection<Cuenta> cuentasOrd;
	
	//Fields
	@Column(length = 30, nullable = false)
	private String codigo;
	@Column(length = 180, nullable = false)
	private String nombre;
	@Column(name = "tipoorden", length = 60, nullable = false)
	private String tipoOrden;
	@Column(name = "tipotrabajo", length = 60, nullable = false)
	private String tipoTrabajo;
	@Column(nullable = true)
	private double lat;
	@Column(nullable = true)
	private double lon;
	@Column(length = 60, nullable = true)
	private String ciudad;
	@Column(length = 60, nullable = true)
	private String departamento;
	@Column(nullable = false)					//Tambien se le llama SubTotal
	private BigDecimal oferta;		
	@Column(name = "ofertaigv", nullable = true)
	private BigDecimal ofertaIgv;
	@Column(length = 30, nullable = false)
	private String moneda;
	@Column(name = "fechainicio", nullable = true)
	private Date fechaInicio;
	@Column(name = "fechaentrega", nullable = true)
	private Date fechaEntrega;
	@Column(nullable = true)
	private double eficiencia;
	@Column(name = "utilidadbruta", nullable = true) 
	private BigDecimal utilidadBruta;
	@Column(name = "gastosgenerales", nullable = true)
	private BigDecimal gastosGenerales;
	@Column(nullable = true)				//Oferta + IGV
	private BigDecimal total;
	@Column(nullable = true)
	private BigDecimal detraccion;
	@Column(name = "gananciaproyectada", nullable = true)
	private BigDecimal gananciaProyectada;
	@Column(name = "gananciadisponible", nullable = true)
	private BigDecimal gananciaDisponible;
	
	@Column(name = "creadopor", nullable = false)
	private Integer creadoPor;
	@Column(name = "fechacreacion", nullable = false)
	private Timestamp fechaCreacion;
	@Column(length = 30, nullable = false)
	private String estado;
	
	
	
	public Integer getIdOrden() {
		return idOrden;
	}
	public void setIdOrden(Integer idOrden) {
		this.idOrden = idOrden;
	}
	public Cliente getOrdenCliente() {
		return ordenCliente;
	}
	public void setOrdenCliente(Cliente ordenCliente) {
		this.ordenCliente = ordenCliente;
	}
	public Collection<Subcontrato> getSubcontratos() {
		return subcontratos;
	}
	public void setSubcontratos(Collection<Subcontrato> subcontratos) {
		this.subcontratos = subcontratos;
	}
	public Empresa getOrdenEmpresa() {
		return ordenEmpresa;
	}
	public void setOrdenEmpresa(Empresa ordenEmpresa) {
		this.ordenEmpresa = ordenEmpresa;
	}
	public Collection<Cuenta> getCuentasOrd() {
		return cuentasOrd;
	}
	public void setCuentasOrd(Collection<Cuenta> cuentasOrd) {
		this.cuentasOrd = cuentasOrd;
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
	public BigDecimal getOfertaIgv() {
		return ofertaIgv;
	}
	public void setOfertaIgv(BigDecimal ofertaIgv) {
		this.ofertaIgv = ofertaIgv;
	}
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public Date getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
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
	public BigDecimal getDetraccion() {
		return detraccion;
	}
	public void setDetraccion(BigDecimal detraccion) {
		this.detraccion = detraccion;
	}
	public BigDecimal getGananciaProyectada() {
		return gananciaProyectada;
	}
	public void setGananciaProyectada(BigDecimal gananciaProyectada) {
		this.gananciaProyectada = gananciaProyectada;
	}
	public BigDecimal getGananciaDisponible() {
		return gananciaDisponible;
	}
	public void setGananciaDisponible(BigDecimal gananciaDisponible) {
		this.gananciaDisponible = gananciaDisponible;
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
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}	
}