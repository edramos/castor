package com.simularte.model;

import java.math.BigDecimal;
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
	private Collection<Subcrontrato> subcontratos;
	@ManyToOne @JoinColumn(name = "idempresa", nullable = false)
	private Empresa ordenEmpresa;
	@OneToMany(mappedBy = "cobroOrden")
	private Collection<Cobro> cobrosOrd;
	
	@OneToMany(mappedBy = "pagoOrden")
	private Collection<Pago> pagosOrd;
	
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
	@Column(nullable = false)
	private BigDecimal oferta;
	@Column(length = 30, nullable = false)
	private String moneda;
	/*Se registraran cuando la Orden ya ese finalizada*/
	@Column(nullable = true)
	private float eficiencia;
	@Column(name = "utilidadbruta", nullable = true) 
	private BigDecimal utilidadBruta;
	@Column(name = "subtotal", nullable = true)
	private BigDecimal subTotal;
	@Column(name = "gastosgenerales", nullable = true)
	private BigDecimal gastosGenerales;
	@Column(name = "total", nullable = true)
	private BigDecimal total;
	/**/
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
	public Collection<Subcrontrato> getSubcontratos() {
		return subcontratos;
	}
	public void setSubcontratos(Collection<Subcrontrato> subcontratos) {
		this.subcontratos = subcontratos;
	}
	public Empresa getOrdenEmpresa() {
		return ordenEmpresa;
	}
	public void setOrdenEmpresa(Empresa ordenEmpresa) {
		this.ordenEmpresa = ordenEmpresa;
	}
	public Collection<Cobro> getCobrosOrd() {
		return cobrosOrd;
	}
	public void setCobrosOrd(Collection<Cobro> cobrosOrd) {
		this.cobrosOrd = cobrosOrd;
	}
	public Collection<Pago> getPagosOrd() {
		return pagosOrd;
	}
	public void setPagosOrd(Collection<Pago> pagosOrd) {
		this.pagosOrd = pagosOrd;
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
	public float getEficiencia() {
		return eficiencia;
	}
	public void setEficiencia(float eficiencia) {
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